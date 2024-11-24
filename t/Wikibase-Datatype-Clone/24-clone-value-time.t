use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikibase::Datatype::Clone;
use Wikibase::Datatype::Value::Time;

# Test.
my $obj = Wikibase::Datatype::Clone->new;
my $source = Wikibase::Datatype::Value::Time->new(
	'value' => '+2020-09-01T00:00:00Z',
);
my $clone = $obj->clone($source);
isa_ok($clone, 'Wikibase::Datatype::Value');
is(ref $clone, 'Wikibase::Datatype::Value', 'Check base class.');
