use utf8;
package Quiz::Model::Schema::Result::UserQuiz;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Quiz::Model::Schema::Result::UserQuiz

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<user_quiz>

=cut

__PACKAGE__->table("user_quiz");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 user_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 quiz_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 score

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "user_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "quiz_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "score",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 quiz

Type: belongs_to

Related object: L<Quiz::Model::Schema::Result::Quiz>

=cut

__PACKAGE__->belongs_to(
  "quiz",
  "Quiz::Model::Schema::Result::Quiz",
  { id => "quiz_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 user

Type: belongs_to

Related object: L<Quiz::Model::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "user",
  "Quiz::Model::Schema::Result::User",
  { id => "user_id" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-06-13 17:41:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:a5GHhLvG2Wcmk6RGTqzqsQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
