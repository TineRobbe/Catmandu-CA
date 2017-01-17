package Catmandu::Store::CA::Bag;

use strict;
use warnings;

use Moo;
use Catmandu::Sane;

use Catmandu::CA::API;

with 'Catmandu::Bag';

sub generator {
    my $self = shift;
    Catmandu::NotImplemented->throw(
        message => 'Iterating over items not supported.'
    );
}

sub get {
    my ($self, $id) = @_;
    my $field_list = $self->store->_field_list;
    my $api = Catmandu::CA::API->new(
        url        => $self->store->url,
        username   => $self->store->username,
        password   => $self->store->password,
        lang       => $self->store->lang
    );
    return $api->id($id, $field_list);
}

sub add {
    my ($self, $data) = @_;
    my $api = Catmandu::CA::API->new(
        url        => $self->store->url,
        username   => $self->store->username,
        password   => $self->store->password,
        lang       => $self->store->lang
    );
    return $api->add($data);
}

sub update {
    my ($self, $id, $data) = @_;
    my $api = Catmandu::CA::API->new(
        url        => $self->store->url,
        username   => $self->store->username,
        password   => $self->store->password,
        lang       => $self->store->lang
    );
    return $api->update($id, $data);
}

sub delete {
    my ($self, $id) = @_;
    my $api = Catmandu::CA::API->new(
        url        => $self->store->url,
        username   => $self->store->username,
        password   => $self->store->password,
        lang       => $self->store->lang
    );
    return $api->delete($id);
}

sub delete_all {
    my $self = shift;
    Catmandu::NotImplemented->throw(
        message => 'Deleting items from store not supported.'
    );
}

1;
__END__