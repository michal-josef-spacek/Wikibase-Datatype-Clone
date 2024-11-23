use strict;
use warnings;

use Test::More 'tests' => 3;
use Test::NoWarnings;

BEGIN {

	# Test.
	use_ok('Wikibase::Datatype::Clone');
}

# Test.
require_ok('Wikibase::Datatype::Clone');
