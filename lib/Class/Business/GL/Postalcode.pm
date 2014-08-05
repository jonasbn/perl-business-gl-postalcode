package Class::Business::GL::Postalcode;

use strict;
use warnings;
use utf8;
use Data::Handle;
use List::Util qw(first);

use constant NUM_OF_DIGITS_IN_POSTALCODE => 4;
use constant NUM_OF_DATA_ELEMENTS        => 6;
use constant TRUE                        => 1;
use constant FALSE                       => 0;

our $VERSION = '0.01';

sub new {
    my $class = shift;

    my $self = bless ({}, $class);

    #seek DATA, 0, 0;
    #my @postal_data = <DATA>;

    my $handle = Data::Handle->new( __PACKAGE__ );
    my @postal_data = $handle->getlines();

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
        $parameter_data = $self->postal_data;
    }

    foreach my $line ( @{$parameter_data} ) {
        $self->_retrieve_postalcode( \@postalcodes, $line );
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

sub validate {
    my ($self, $number) = @_;

    my $postalcodes = $self->get_all_postalcodes();

    if (first { $number == $_ } @{$postalcodes}) {
        return TRUE;
    } else {
        return FALSE;
    }
}

sub get_city_from_postalcode {
    my ($self, $postalcode) = @_;

    #validate( @_, {
    #    zipcode => { type => SCALAR, regex => qr/^\d+$/, }, });

    my $postaldata = get_all_data();

    my $city = '';
    foreach my $line (@{$postaldata}) {
        my @entries = split /\t/x, $line, NUM_OF_DATA_ELEMENTS;

        if ($entries[0] eq $postalcode) {
            $city = $entries[1];
            last;
        }
    }

    return $city;
}

sub get_postalcode_from_city {
    my ($self, $city) = @_;

    #validate( @_, {
    #    city => { type => SCALAR, regex => qr/^[\w ]+$/, }, });

    my $postaldata = get_all_data();

    my @postalcodes;
    foreach my $line (@{$postaldata}) {
        my @entries = split /\t/x, $line, NUM_OF_DATA_ELEMENTS;

        if ($entries[1] =~ m/$city$/i) {
            push @postalcodes, $entries[0];
        }
    }

    return @postalcodes;
}

1;

=pod

=head1 NAME

Class::Business::GL::Postalcode - OOP interface to validation and listing of Greenland postalcodes

=head1 VERSION

This documentation describes version 0.01

=head1 SYNOPSIS



=head1 DESCRIPTION

=head1 BUGS

Please report issues via CPAN RT:

  http://rt.cpan.org/NoAuth/Bugs.html?Dist=Business-GL-Postalcode

or by sending mail to

  bug-Business-GL-Postalcode@rt.cpan.org

=head1 SEE ALSO

=over

=item L<Business::DK::Postalcode>

=back

=head1 AUTHOR

Jonas B. Nielsen, (jonasbn) - C<< <jonasbn@cpan.org> >>

=head1 COPYRIGHT

Business-GL-Postalcode is (C) by Jonas B. Nielsen, (jonasbn) 2014

Business-GL-Postalcode is released under the artistic license 2.0

=cut

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
