# NAME

Catmandu::CA - Catmandu interface to [CollectiveAccess](http://collectiveaccess.org/)

# SYNOPSIS

    # From the command line
    catmandu export CA --id 1234 --username demo --password demo --url http://demo.collectiveaccess.org to YAML

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

# COPYRIGHT AND LICENSE

This software is copyright (c) 2017 by PACKED, vzw, Vlaamse Kunstcollectie, vzw.
This is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License, Version 3, June 2007.

# SEE ALSO

[Catmandu](https://metacpan.org/pod/Catmandu)
[Catmandu::Store::CA](https://metacpan.org/pod/Catmandu::Store::CA)
[Catmandu::Store::VKC](https://metacpan.org/pod/Catmandu::Store::VKC)
[Catmandu::CA::API](https://metacpan.org/pod/Catmandu::CA::API)
