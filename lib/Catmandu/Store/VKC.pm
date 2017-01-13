package Catmandu::Store::VKC;

use strict;
use warnings;

use Moo;
use Catmandu::Sane;

use Catmandu::Store::VKC::Bag;

with 'Catmandu::Store';

has username => (is => 'ro', required => 1);
has password => (is => 'ro', required => 1);

1;
__END__