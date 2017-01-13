package Catmandu::CA::API::Request;

our $VERSION = '0.01';

use strict;
use warnings;

use Moo;
use Catmandu::Sane;

use Data::Dumper qw(Dumper);

use LWP::UserAgent;
use JSON;

use Catmandu::CA::API::Login;

has url       => (is => 'ro', required => 1);
has query     => (is => 'ro', required => 1);
has url_query => (is => 'ro', required => 1);

has username => (is => 'ro', required => 1);
has password => (is => 'ro', required => 1);

has token   => (is => 'lazy');
has ua      => (is => 'lazy');
has results => (is => 'lazy');

sub _build_token {
    my $self = shift;
    my $login = Catmandu::CA::API::Login->new(username => $self->username, password => $self->password, url => $self->url);
    return $login->token();
}

sub _build_ua {
    my $self = shift;
    my $ua = LWP::UserAgent->new(
        agent => sprintf('catmandu-ca/%s', $VERSION)
    );
    return $ua;
}

sub _build_results {
    my $self = shift;
    return $self->request();
}

sub request {
    my $self = shift;
    my $url = sprintf('%s/%s?source=%s&authToken=%s',
        $self->url,
        $self->url_query,
        $self->query,
        $self->token
    );
    my $response = $self->ua->get($url);
    if ($response->is_success) {
        return decode_json($response->decoded_content);
    } elsif ($response->code == 404) {
        return {};
    } else {
        Catmandu::HTTPError->throw({
                code             => $response->code,
                message          => $response->status_line,
                url              => $response->request->uri,
                method           => $response->request->method,
                request_headers  => [],
                request_body     => $response->request->decoded_content,
                response_headers => [],
                response_body    => $response->decoded_content,
        });
        return {};
    }
}

1;
__END__