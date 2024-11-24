use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Test::Shared::Fixture::Wikibase::Datatype::Reference::Wikidata::ReferenceURL;
use Wikibase::Datatype::Clone;

# Test.
my $obj = Wikibase::Datatype::Clone->new;
my $source = Test::Shared::Fixture::Wikibase::Datatype::Reference::Wikidata::ReferenceURL->new;
my $clone = $obj->clone($source);
isa_ok($clone, 'Wikibase::Datatype::Reference');
