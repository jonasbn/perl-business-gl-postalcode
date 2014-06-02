package Class::Business::GL::Postalcode;

use strict;
use warnings;
use utf8;

use constant NUM_OF_DIGITS_IN_POSTALCODE => 4;
use constant NUM_OF_DATA_ELEMENTS => 6;

our $VERSION = '0.01';

sub new {
    my $class = shift;

    my $self = bless ({}, $class);

    my @postal_data = <DATA>;

    $self->{postal_data} = \@postal_data;

    return $self;
}

sub postal_data {
    my $self = shift;

    return $self->{postal_data};
}

sub get_all_postalcodes {
    my ($self, $parameter_data) = @_;
    my @postalcodes = ();

    if ( not $parameter_data ) {
        @{$parameter_data} = $self->{postal_data};
    }

    foreach my $zipcode ( @{$parameter_data} ) {
        $self->_retrieve_postalcode( \@postalcodes, $zipcode );
    }

    return \@postalcodes;
}

sub _retrieve_postalcode {
    my ( $self, $postalcodes, $string ) = @_;

    ## no critic qw(RegularExpressions::RequireLineBoundaryMatching RegularExpressions::RequireExtendedFormatting RegularExpressions::RequireDotMatchAnything)
    my @entries = split /;/x, $string, NUM_OF_DATA_ELEMENTS;

    if ($entries[0] =~ m{
        ^ #beginning of string
        \d{${\NUM_OF_DIGITS_IN_POSTALCODE}} #digits in postalcode
        $ #end of string
        }xsm
        )
    {
        push @{$postalcodes}, $entries[0];
    }

    return;
}

1;

__DATA__
2412;Santa Claus/Julemanden;;;False;2
3900;Nuuk;;;False;2
3905;Nuussuaq;;;False;2
3910;Kangerlussuaq;;;False;2
3911;Sisimiut;;;False;2
3912;Maniitsoq;;;False;2
3913;Tasiilaq;;;False;2
3915;Kulusuk;;;False;2
3919;Alluitsup Paa;;;False;2
3920;Qaqortoq;;;False;2
3921;Narsaq;;;False;2
3922;Nanortalik;;;False;2
3923;Narsarsuaq;;;False;2
3924;Ikerasassuaq;;;False;2
3930;Kangilinnguit;;;False;2
3932;Arsuk;;;False;2
3940;Paamiut;;;False;2
3950;Aasiaat;;;False;2
3951;Qasigiannguit;;;False;2
3952;Ilulissat;;;False;2
3953;Qeqertarsuaq;;;False;2
3955;Kangaatsiaq;;;False;2
3961;Uummannaq;;;False;2
3962;Upernavik;;;False;2
3964;Qaarsut;;;False;2
3970;Pituffik;;;False;2
3971;Qaanaaq;;;False;2
3972;Station Nord;;;False;2
3980;Ittoqqortoormiit;;;False;2
3982;Mestersvig;;;False;2
3984;Danmarkshavn;;;False;2
3985;Constable Pynt;;;False;2
3992;Slædepatrulje Sirius;;;False;2
