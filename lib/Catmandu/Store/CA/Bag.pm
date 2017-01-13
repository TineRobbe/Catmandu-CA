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
    my $field_list = [
        'ca_objects.object_id',
        'ca_objects.preferred_labels',
        'ca_objects.description',
        'ca_objects.subtitle',
        'ca_objects.geonames',
        'ca_objects.lcsh_terms',
        'ca_objects.colour',
        'ca_objects.contentActivity',
        'ca_objects.contentConcept',
        'ca_objects.contentDescription',
        'ca_objects.dimensions.dimensions_width',
        'ca_objects.dimensions.dimensions_height',
        'ca_objects.dimensions.dimensions_depth',
        'ca_objects.dimensions.circumference',
        'ca_objects.dimensions.dimensions_type',
        'ca_objects.materialInfo.materialInfostyle',
        'ca_objects.objectProductionDate',
        'ca_objects.techniqueInfo.techniqueInfodatePeriod',
        'ca_objects.dateText',
        'ca_objects.objectName.objectObjectName',
        'ca_objects.objectWorkPid.objectWorkPidDomain',
        'ca_objects.objectWorkPid.objectWorkPidID',
        'ca_objects.objectRecordPid.objectRecordPidDomain',
        'ca_objects.objectRecordPid.objectRecordPidID',
        'ca_entities.entity_id',
        'ca_entities.relationship_type_code'
    ];
    my $api = Catmandu::CA::API->new(
        term       => $id,
        field_list => $field_list,
        url        => $self->store->url,
        username   => $self->store->username,
        password   => $self->store->password
    );
    return $api->simple();
}

sub add {
    my ($self, $data) = @_;
    Catmandu::NotImplemented->throw(
        message => 'Adding item to store not supported.'
    );
}

sub update {
    my ($self, $id, $data) = @_;
    Catmandu::NotImplemented->throw(
        message => 'Updating item in store not supported.'
    );
}

sub delete {
    my ($self, $id) = @_;
    Catmandu::NotImplemented->throw(
        message => 'Deleting item from store not supported.'
    );
}

sub delete_all {
    my $self = shift;
    Catmandu::NotImplemented->throw(
        message => 'Deleting items from store not supported.'
    );
}

1;
__END__