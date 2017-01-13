package Catmandu::Store::CA;

use strict;
use warnings;

use Moo;
use Catmandu::Sane;

use Catmandu::Store::CA::Bag;

with 'Catmandu::Store';

has url      => (is => 'ro', required => 1);
has username => (is => 'ro', required => 1);
has password => (is => 'ro', required => 1);
has model    => (is => 'ro', default => 'ca_objects');


1;
__END__
=encoding utf-8

=head1 NAME

Catmandu::Store::CA - Retrieve items from a L<CollectiveAccess|http://collectiveaccess.org/> instance

=head1 SYNOPSIS

    # From the command line
    catmandu export CA to YAML --id 1234 --username demo --password demo --url http://demo.collectiveaccess.org --model ca_objects

    # From a Catmandu Fix
    lookup_in_store(
      object_id,
      CA,
      url: http://demo.collectiveaccess.org,
      username: demo,
      password: demo,
      model: ca_objects
    )

    # From Perl code
    use Catmandu;

    my $store = Catmandu->store('CA',
        username => 'demo',
        password => 'demo',
        url      => 'http://demo.collectiveaccess.org',
        model    => 'ca_objects'
    )->bag;

    my $item = $store->get('1234');


=head1 DESCRIPTION

A Catmandu::Store::CA is Perl package that can query a L<CollectiveAccess|http://collectiveaccess.org> instance.


=head1 CONFIGURATION

=head2 url

C<url> of the CA instance (e.g. I<http://demo.collectiveaccess.org>).

=head2 username

Name of a user that can be used to query the API. If you want to store
items in the CA instance, it must have the necessary rights.

=head2 password

Password for the user.

=head2 model

The API can access several tables from the CA instance, called I<model> in this module.
The model is by default C<ca_objects>, but the following are also supported:

=over

=item C<ca_objects>

=item C<ca_object_lots>

=item C<ca_entities>

=item C<ca_places>

=item C<ca_occurrences>

=item C<ca_collections>

=item C<ca_storage_locations>

=item C<ca_loans>

=item C<ca_movements>

=back

=head1 METHODS

=head2 new(%configuration)

Create a new Catmandu::Store::CA

=head2 get($id)

Retrieve a CA record given an identifier. This returns whatever
the CA administrator designated as the "summary" of the record.

=head2 add($data)

Create a new CA record. See L<here|http://docs.collectiveaccess.org/wiki/Web_Service_API#Creating_new_records> to
see what data you must provide to create a record.

=head2 update($id, $data)

Update a new CA record. See L<here|http://docs.collectiveaccess.org/wiki/Web_Service_API#Creating_new_records> to
see what data you must provide to create a record.

=head2 delete($id)

Delete (I<soft delete>) a record.

=head2 each()

Not supported

=head1 AUTHOR

Pieter De Praetere E<lt>pieter at packed.beE<gt>

=head1 COPYRIGHT

Copyright 2017- PACKED vzw

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Catmandu>
L<Catmandu::Store::VKC>
L<Catmandu::CA::API>

=cut
