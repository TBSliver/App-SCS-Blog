package App::SCS::Plugin::Blog::PagePlugin::Archive;

use Moo;
use Data::Dumper;

with 'App::SCS::Role::PagePlugin';

has config => (
  is => 'ro',
  required => 1,
);

sub _selector { '.BlogList' }

sub filter_content_zoom {
  my ( $self, $zoom ) = @_;

  $zoom->collect( $self->_selector, {
    filter => sub { return $_ },
    passthrough => 1,
  });
}

sub BUILD {
  my $self = shift;
  print Dumper $self->config;

}

1;
