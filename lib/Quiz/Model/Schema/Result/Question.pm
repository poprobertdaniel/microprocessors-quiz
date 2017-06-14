use utf8;
package Quiz::Model::Schema::Result::Question;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Quiz::Model::Schema::Result::Question

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<questions>

=cut

__PACKAGE__->table("questions");

=head1 ACCESSORS

=head2 question_id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 question_text

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 score

  data_type: 'integer'
  is_nullable: 0

=head2 chapter

  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "question_id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "question_text",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "score",
  { data_type => "integer", is_nullable => 0 },
  "chapter",
  { data_type => "integer", is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</question_id>

=back

=cut

__PACKAGE__->set_primary_key("question_id");

=head1 RELATIONS

=head2 answers

Type: has_many

Related object: L<Quiz::Model::Schema::Result::Answer>

=cut

__PACKAGE__->has_many(
  "answers",
  "Quiz::Model::Schema::Result::Answer",
  { "foreign.question_id" => "self.question_id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-06-14 11:20:36
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s0ELFBg00DQfyHtuPwlYMA


# You can replace this text with custom code or comments, and it will be preserved on regeneration


sub to_hash {

    my $self = shift;
    return {
        question_id => $self->question_id,
        question_text => $self->question_text,
        score => $self->score,
        chapter => $self->chapter,
    }
}
1;
