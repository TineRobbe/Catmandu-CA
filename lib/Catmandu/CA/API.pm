package Catmandu::CA::API;

use strict;
use warnings;

use Catmandu::Sane;
use Moo;

use Data::Dumper qw(Dumper);

use Catmandu::CA::API::QueryBuilder;
use Catmandu::CA::API::Request;

has term       => (is => 'ro', required => 1);
has field_list => (is => 'rw', default => sub {return []});
has username   => (is => 'ro', required => 1);
has password   => (is => 'ro', required => 1);
has url        => (is => 'ro', required => 1);

sub id {
    my $self = shift;
    my $q = Catmandu::CA::API::QueryBuilder->new(field_list => $self->field_list);
    my $r = Catmandu::CA::API::Request->new(
        url       => $self->url,
        url_query => sprintf('service.php/item/ca_objects/id/%s', $self->term),
        query     => $q->query,
        username  => $self->username,
        password  => $self->password
    );
    return $r->results;
}

sub simple {
    my $self = shift;
    my $r = Catmandu::CA::API::Request->new(
        url       => $self->url,
        url_query => sprintf('service.php/item/ca_objects/id/%s', $self->term),
        query     => '{}',
        username  => $self->username,
        password  => $self->password
    );
    return $r->results;
}

1;
__END__