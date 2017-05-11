use utf8;
package Quiz::Model::Schema::Result::Person;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Quiz::Model::Schema::Result::Person

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 TABLE: C<Persons>

=cut

__PACKAGE__->table("Persons");

=head1 ACCESSORS

=head2 personid

  data_type: 'integer'
  is_nullable: 1

=head2 lastname

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 firstname

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 address

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 city

  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "personid",
  { data_type => "integer", is_nullable => 1 },
  "lastname",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "firstname",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "address",
  { data_type => "varchar", is_nullable => 1, size => 255 },
  "city",
  { data_type => "varchar", is_nullable => 1, size => 255 },
);


# Created by DBIx::Class::Schema::Loader v0.07046 @ 2017-05-11 17:03:34
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FdWaUF1MxmAO3cm4wc4Mpg


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
