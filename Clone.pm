package Wikibase::Datatype::Clone;

use strict;
use warnings;

use Class::Inspector;
use Class::Utils qw(set_params);
use Error::Pure qw(err);
use List::Util qw(any);
use Readonly;
use Scalar::Util qw(blessed);

Readonly::Array our @SKIP_METHODS => qw(BUILD Readonly decode_utf8 err extends has new none);
Readonly::Scalar our $BASE_CLASS => 'Wikibase::Datatype';

our $VERSION = 0.01;

sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# Process parameters.
	set_params($self, @params);

	return $self;
}

sub clone {
	my ($self, $obj) = @_;

	if (! defined $obj
		|| ! blessed($obj)) {

		err "Data object must be a '".$BASE_CLASS."::*' instance.";
	}
	my $base_class = $self->_base_class($obj);
	if ($base_class !~ m/^Wikibase::Datatype/ms) {
		err "Data object must be a '".$BASE_CLASS."::*' instance.";
	}

	# List of methods.
	my @methods = $self->_methods($obj);

	my %params = ();
	foreach my $method (@methods) {
		$params{$method} = $obj->$method;
	}
	my $cloned = $base_class->new(
		%params,
	);

	return $cloned;
}

sub _base_class {
	my ($self, $obj) = @_;

	my $class = blessed($obj);
	my @parents = do { no strict 'refs'; @{"${class}::ISA"} };
	while (@parents) {
		if ($parents[0] =~ m/^$BASE_CLASS/ms) {
			$class = $parents[0];
			@parents = do { no strict 'refs'; @{"${class}::ISA"} };
		} else {
			@parents = ();
		}
	}

	return $class;
}

sub _methods {
	my ($self, $obj) = @_;

	my $raw_methods = Class::Inspector->methods(ref $obj);
	my @methods;
	foreach my $raw_method (@{$raw_methods}) {

		# Skip check_* Mo::utils subroutines.
		if ($raw_method =~ m/^check_/ms) {
			next;
		}

		# Explicit names to skip.
		if (any { $raw_method eq $_ } @SKIP_METHODS) {
			next;
		}

		push @methods, $raw_method;
	}

	return @methods;
}

1;

__END__
