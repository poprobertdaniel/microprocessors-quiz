use utf8;
package Quiz::Model::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Quiz::Model::Schema::Result::User

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<users>

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_nullable: 0

=head2 username

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 passwd

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 first_name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 last_name

  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 is_admin

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_nullable => 0 },
  "username",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "passwd",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "first_name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "last_name",
  { data_type => "varchar", is_nullable => 1, size => 45 },
  "is_admin",
  { data_type => "integer", default_value => 0, is_nullable => 0 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 UNIQUE CONSTRAINTS

=head2 C<username_UNIQUE>

=over 4

=item * L</username>

=back

=cut

__PACKAGE__->add_unique_constraint("username_UNIQUE", ["username"]);

=head1 RELATIONS

=head2 user_quizzes

Type: has_many

Related object: L<Quiz::Model::Schema::Result::UserQuiz>

=cut

__PACKAGE__->has_many(
  "user_quizzes",
  "Quiz::Model::Schema::Result::UserQuiz",
  { "foreign.user_id" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-06-14 11:03:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:quYZlC1i1QM5Cy9VebOXEw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

sub to_hash {

    my $self = shift;
    return {
        id => $self->id,
        first_name => $self->first_name,
        last_name => $self->last_name,
        username => $self->username,
        passwd => $self->passwd,
    }
}

1;
