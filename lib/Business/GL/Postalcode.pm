package Business::GL::Postalcode;

use strict;
use warnings;
use Class::Business::GL::Postalcode;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(get_all_data get_all_postalcodes validate_postalcode validate);

our $VERSION = '0.01';

use constant DEBUG                       => 0;
use constant TRUE                        => 1;
use constant FALSE                       => 0;
use constant NUM_OF_DATA_ELEMENTS        => 6;
use constant NUM_OF_DIGITS_IN_POSTALCODE => 4;

sub get_all_data {
    my $self = Class::Business::GL::Postalcode->new();

    return $self->postal_data;
}

sub get_all_postalcodes {
    my $self = Class::Business::GL::Postalcode->new();

    return $self->postal_data;
}

1;

=pod

=cut
