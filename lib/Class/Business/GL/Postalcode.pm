package Class::Business::GL::Postalcode;

use strict;
use warnings;

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

1;

__DATA__
3900    Nuuk            FALSE   2
3905    Nuussuaq            FALSE   2
3910    Kangerlussuaq           FALSE   2
3911    Sisimiut            FALSE   2
3912    Maniitsoq           FALSE   2
3913    Tasiilaq            FALSE   2
3915    Kulusuk         FALSE   2
3919    Alluitsup Paa           FALSE   2
3920    Qaqortoq            FALSE   2
3921    Narsaq          FALSE   2
3922    Nanortalik          FALSE   2
3923    Narsarsuaq          FALSE   2
3924    Ikerasassuaq            FALSE   2
3930    Kangilinnguit           FALSE   2
3932    Arsuk           FALSE   2
3940    Paamiut         FALSE   2
3950    Aasiaat         FALSE   2
3951    Qasigiannguit           FALSE   2
3952    Ilulissat           FALSE   2
3953    Qeqertarsuaq            FALSE   2
3955    Kangaatsiaq         FALSE   2
3961    Uummannaq           FALSE   2
3962    Upernavik           FALSE   2
3964    Qaarsut         FALSE   2
3970    Pituffik            FALSE   2
3971    Qaanaaq         FALSE   2
3980    Ittoqqortoormiit            FALSE   2
3984    Danmarkshavn            FALSE   2
3985    Constable Pynt          FALSE   2