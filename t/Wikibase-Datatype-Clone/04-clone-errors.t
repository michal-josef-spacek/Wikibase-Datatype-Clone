use strict;
use warnings;

use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;
use Test::MockObject;
use Wikibase::Datatype::Clone;

# Test.
my $obj = Wikibase::Datatype::Clone->new;
eval {
	$obj->clone('bad');
};
is($EVAL_ERROR, "Data object must be a 'Wikibase::Datatype::*' instance.\n",
	"Data object must be a 'Wikibase::Datatype::*' instance (string).");
clean();

# Test.
$obj = Wikibase::Datatype::Clone->new;
eval {
	$obj->clone;
};
is($EVAL_ERROR, "Data object must be a 'Wikibase::Datatype::*' instance.\n",
	"Data object must be a 'Wikibase::Datatype::*' instance (undef).");
clean();

# Test.
$obj = Wikibase::Datatype::Clone->new;
my $mock = Test::MockObject->new;
eval {
	$obj->clone($mock);
};
is($EVAL_ERROR, "Data object must be a 'Wikibase::Datatype::*' instance.\n",
	"Data object must be a 'Wikibase::Datatype::*' instance (other object).");
clean();
