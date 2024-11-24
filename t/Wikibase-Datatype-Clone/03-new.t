use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Datatype::Clone;

# Test.
my $obj = Wikibase::Datatype::Clone->new;
isa_ok($obj, 'Wikibase::Datatype::Clone');
