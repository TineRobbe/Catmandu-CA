package Catmandu::CA;

use Catmandu::Sane;

our $VERSION = '0.06';

use Moo;

1;
__END__

=encoding utf-8

=head1 NAME

Catmandu::CA - Catmandu interface to L<CollectiveAccess|http://collectiveaccess.org/>

=head1 SYNOPSIS

    # From the command line
    catmandu export CA to YAML --id 1234 --username demo --password demo --url http://demo.collectiveaccess.org

    # From a Catmandu Fix
    lookup_in_store(
      object_id,
      CA,
      url: http://demo.collectiveaccess.org,
      username: demo,
      password: demo
    )

=head1 MODULES

=over

=item * L<Catmandu::Store::CA>

=item * L<Catmandu::Store::VKC>

=item * L<Catmandu::CA::API>

=back

=head1 AUTHOR

Pieter De Praetere E<lt>pieter at packed.beE<gt>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by PACKED, vzw, Vlaamse Kunstcollectie, vzw.
This is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License, Version 3, June 2007.

=head1 SEE ALSO

L<Catmandu>
L<Catmandu::Store::CA>
L<Catmandu::Store::VKC>
L<Catmandu::CA::API>

=cut
