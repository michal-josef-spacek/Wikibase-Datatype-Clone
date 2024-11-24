use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;
use Wikibase::Datatype::Clone;
use Wikibase::Datatype::Value::Sense;

# Test.
my $obj = Wikibase::Datatype::Clone->new;
my $source = Wikibase::Datatype::Value::Sense->new(
	'value' => 'L34727-S1',
);
my $clone = $obj->clone($source);
isa_ok($clone, 'Wikibase::Datatype::Value');
is(ref $clone, 'Wikibase::Datatype::Value', 'Check base class.');
