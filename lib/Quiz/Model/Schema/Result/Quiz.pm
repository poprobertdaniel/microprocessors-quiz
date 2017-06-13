use utf8;
package Quiz::Model::Schema::Result::Quiz;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Quiz::Model::Schema::Result::Quiz

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<quiz>

=cut

__PACKAGE__->table("quiz");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 user_quizzes

Type: has_many

Related object: L<Quiz::Model::Schema::Result::UserQuiz>

=cut

__PACKAGE__->has_many(
  "user_quizzes",
  "Quiz::Model::Schema::Result::UserQuiz",
  { "foreign.quiz_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-06-13 17:41:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bnGZSC6fkXNRamX57STMzw


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
