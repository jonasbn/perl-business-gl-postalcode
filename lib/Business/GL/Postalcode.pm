package Business::GL::Postalcode;

use strict;
use warnings;

use Class::Business::GL::Postalcode;

require Exporter;

our @ISA = qw(Exporter);
our @EXPORT_OK = qw(get_all_data get_all_postalcodes get_all_cities get_postalcode_from_city get_city_from_postalcode validate_postalcode validate);

our $VERSION = '0.01';

sub get_all_data {
    my $validator = Class::Business::GL::Postalcode->new();

    return $validator->postal_data();
}

sub get_all_postalcodes {
    my $validator = Class::Business::GL::Postalcode->new();

    return $validator->get_all_postalcodes();
}

sub get_all_cities {
    my $validator = Class::Business::GL::Postalcode->new();

    return $validator->get_all_cities();
}

sub get_city_from_postalcode {
    my $validator = Class::Business::GL::Postalcode->new();

    return $validator->get_city_from_postalcode( $_[0] );
}

sub get_postalcode_from_city {
    my $validator = Class::Business::GL::Postalcode->new();

    return $validator->get_postalcode_from_city( $_[0] );
}

sub validate {
    return validate_postalcode( $_[0] );
}

sub validate_postalcode {
    my $validator = Class::Business::GL::Postalcode->new();

    return $validator->validate( $_[0] );
}

1;

=pod

=head1 NAME

Business::GL::Postalcode - validation and listing of Greenland postal codes

=head1 VERSION

This documentation describes version 0.01

=head1 SYNOPSIS

    # basic validation of string
    use Business::GL::Postalcode qw(validate);

    if (validate($postalcode)) {
        print "We have a valid Greenland postal code\n";
    } else {
        warn "Not a valid Greenland postal code\n";
    }


    # basic validation of string, using less intrusive subroutine
    use Business::GL::Postalcode qw(validate_postalcode);

    if (validate_postalcode($postalcode)) {
        print "We have a valid Greenland postal code\n";
    } else {
        warn "Not a valid Greenland postal code\n";
    }


    # using the untainted return value
    use Business::GL::Postalcode qw(validate_postalcode);

    if (my $untainted = validate_postalcode($postalcode)) {
        print "We have a valid Greenland postal code: $untainted\n";
    } else {
        warn "Not a valid Greenland postal code\n";
    }


    # All postal codes for use outside this module
    use Business::GL::Postalcode qw(get_all_postalcodes);

    my @postalcodes = @{get_all_postalcodes()};


    # All postal codes and data for use outside this module
    use Business::GL::Postalcode qw(get_all_data);

    my $postalcodes = get_all_data();

    foreach (@{postalcodes}) {
        printf
            'postal code: %s city: %s street/desc: %s company: %s province: %d country: %d', split /;/, $_, 6;
    }

=head1 FEATURES

=over

=item * Providing list of Greenland postal codes and related area names

=item * Look up methods for Greenland postal codes for web applications and the like

=back

=head1 DESCRIPTION

=head1 BUGS

Please report issues via CPAN RT:

  http://rt.cpan.org/NoAuth/Bugs.html?Dist=Business-GL-Postalcode

or by sending mail to

  bug-Business-GL-Postalcode@rt.cpan.org

=head1 SEE ALSO

=over

=item L<Business::DK::Postalcode>

=item L<Business::FO::Postalcode>

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
