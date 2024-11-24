use strict;
use warnings;

use Test::More 'tests' => 5;
use Test::NoWarnings;
use Test::Shared::Fixture::Wikibase::Datatype::Value::Item::Wikidata::Dog;
use Wikibase::Datatype::Clone;
use Wikibase::Datatype::Value::Item;

# Test.
my $obj = Wikibase::Datatype::Clone->new;
my $source = Test::Shared::Fixture::Wikibase::Datatype::Value::Item::Wikidata::Dog->new;
my $clone = $obj->clone($source);
isa_ok($clone, 'Wikibase::Datatype::Value');
is(ref $clone, 'Wikibase::Datatype::Value', 'Check base class.');

# Test.
$obj = Wikibase::Datatype::Clone->new;
$source = Wikibase::Datatype::Value::Item->new(
	'value' => 'Q123',
);
$clone = $obj->clone($source);
isa_ok($clone, 'Wikibase::Datatype::Value');
is(ref $clone, 'Wikibase::Datatype::Value', 'Check base class.');
