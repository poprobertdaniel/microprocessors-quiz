use utf8;
package Quiz::Model::Schema::Result::Answer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Quiz::Model::Schema::Result::Answer

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<answers>

=cut

__PACKAGE__->table("answers");

=head1 ACCESSORS

=head2 answer_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 question_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 answer_text

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 is_correct

  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "answer_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "question_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "answer_text",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "is_correct",
  { data_type => "integer", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</answer_id>

=back

=cut

__PACKAGE__->set_primary_key("answer_id");

=head1 RELATIONS

=head2 question

Type: belongs_to

Related object: L<Quiz::Model::Schema::Result::Question>

=cut

__PACKAGE__->belongs_to(
  "question",
  "Quiz::Model::Schema::Result::Question",
  { question_id => "question_id" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-06-14 11:19:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:T2Z2gAu/HsF3sO/QYNJI3g


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
