package Test::Class::Class::Business::GL::Postalcode;

use strict;
use warnings;
use base qw(Test::Class);
use Test::More;
use Tree::Simple;
use Test::Exception;
use Env qw($TEST_VERBOSE);

sub startup : Test(startup => 4) {
    my $t = shift;

    use_ok( 'Class::Business::GL::Postalcode' );

    ok(my $validator = Class::Business::GL::Postalcode->new(), 'calling new');

    is(scalar(@{$validator->{postal_data}}), 33, 'asserting number of postalcodes');

    $t->{validator} = $validator;
};

sub test_postal_data : Test(1) {
    my $t = shift;

    my $validator = $t->{validator};

    is(scalar(@{$t->{validator}->postal_data()}), 33, 'asserting number of postalcodes');
}

sub test_get_all_postalcodes : Test(2) {
    my $t = shift;

    my $validator = $t->{validator};

    ok(my $postalcodes_ref = $validator->get_all_postalcodes(), 'calling get all postalcodes');
    is(scalar(@{$postalcodes_ref}), 33), 'asserting number of postalcodes';
}

sub test_get_all_data : Test(2) {
    my $t = shift;

    my $validator = $t->{validator};

    ok(my $postalcodes_ref = $validator->get_all_data(), 'calling get_all_data');

    is(scalar(@{$postalcodes_ref}), 33, 'asserting number of postalcodes');
}

sub test_validate : Test(2) {
    my $t = shift;

    my $validator = $t->{validator};

    my @invalids = qw();
    my @valids = qw();

    foreach (0 .. 9999) {
        my $number = sprintf '%04d', $_;
        if (not $validator->validate($number)) {
            push @invalids, $number;
        } else {
            push @valids, $number;
        }
    }

    is(scalar @invalids, 9967, 'asserting number of invalids for validate');
    is(scalar @valids, 33, 'asserting number of valids for validate');
}

1;
