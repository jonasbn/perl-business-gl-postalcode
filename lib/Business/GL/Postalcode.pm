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
    my $validator = Class::Business::GL::Postalcode->new();

    return $validator->postal_data;
}

sub get_all_postalcodes {
    my $validator = Class::Business::GL::Postalcode->new();

    return $validator->get_all_postalcodes;
}

sub validate {
    return validate_postalcode( $_[0] );
}

sub validate_postalcode {
    my $number = shift;

    my $validator = Class::Business::GL::Postalcode->new();

    return $validator->validate($number);
}

1;

=pod

=head1 NAME

Business::GL::Postalcode - interface to validation and listing of Greenland postalcodes

=head1 VERSION

This documentation describes version 0.01

=head1 SYNOPSIS

    use Business::GL::Postalcode qw(get_all_postalcodes);

    my @postalcodes = get_all_postalcodes();

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

=head1 MOTIVATION

Postdanmark the largest danish postal and formerly stateowned postal service, maintain the 
postalcode mapping for Greenland and the Faroe Islands. Since I am using this resource to 
maintain the danish postalcodes I decided to release distributions of these two other countries.

=head1 AUTHOR

Jonas B. Nielsen, (jonasbn) - C<< <jonasbn@cpan.org> >>

=head1 COPYRIGHT

Business-GL-Postalcode is (C) by Jonas B. Nielsen, (jonasbn) 2014

Business-GL-Postalcode is released under the artistic license 2.0

=cut
