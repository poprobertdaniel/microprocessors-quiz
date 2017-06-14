#dbicdump -o dump_directory=../lib/ ThePearlBee::Model::Schema dbi:mysql:ThePearlBee root dev
BEGIN {
	$ENV{CAG_ILLEGAL_ACCESSOR_NAME_OK} = 'DO_NOT_WARN';
}

use DBIx::Class::Schema::Loader qw/ make_schema_at rescan /;
make_schema_at(
	'Quiz::Model::Schema',
	{ 	debug => 0,
		dump_directory => '.',
		overwrite_modifications => 1,
	},
	[
		'dbi:mysql:quiz;host=172.17.0.1;', 'root', 'dev',
	],
);
