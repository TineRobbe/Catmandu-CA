# NAME

Catmandu::CA - Catmandu interface to [CollectiveAccess](http://collectiveaccess.org/)

# SYNOPSIS

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

# MODULES

- [Catmandu::Store::CA](https://metacpan.org/pod/Catmandu::Store::CA)
- [Catmandu::Store::VKC](https://metacpan.org/pod/Catmandu::Store::VKC)
- [Catmandu::CA::API](https://metacpan.org/pod/Catmandu::CA::API)

# AUTHOR

Pieter De Praetere &lt;pieter at packed.be>

# COPYRIGHT

Copyright 2017- PACKED vzw

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[Catmandu](https://metacpan.org/pod/Catmandu)
[Catmandu::Store::CA](https://metacpan.org/pod/Catmandu::Store::CA)
[Catmandu::Store::VKC](https://metacpan.org/pod/Catmandu::Store::VKC)
[Catmandu::CA::API](https://metacpan.org/pod/Catmandu::CA::API)
