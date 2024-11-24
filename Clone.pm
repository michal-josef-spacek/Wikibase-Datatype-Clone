package Wikibase::Datatype::Clone;

use strict;
use warnings;

use Class::Inspector;
use Class::Utils qw(set_params);
use Error::Pure qw(err);
use List::Util qw(any);
use Readonly;
use Scalar::Util qw(blessed);

Readonly::Array our @SKIP_METHODS => qw(BUILD decode_utf8 err extends has new);

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

	my $base_class = $self->_base_class($obj);
	if (! defined $obj
		|| ! blessed($obj)
		|| $base_class !~ m/^Wikibase::Datatype/ms) {

		err "Data object must be a 'Wikibase::Datatype::*' instance.";
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

	return $parents[0];
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
