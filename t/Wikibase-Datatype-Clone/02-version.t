use strict;
use warnings;

use Test::More 'tests' => 2;
use Test::NoWarnings;
use Wikibase::Datatype::Clone;

# Test.
is($Wikibase::Datatype::Clone::VERSION, 0.01, 'Version.');
