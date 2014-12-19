package App::SCS::Plugin::Blog::PagePlugin::Archive;

use Moo;
use Data::Dumper;

with 'App::SCS::Role::PagePlugin';

sub _selector { '.BlogList' }

sub filter_content_zoom {
  my ( $self, $zoom ) = @_;

  $zoom->collect( $self->_selector, {
    filter => sub { print Dumper $_; return $_ },
    passthrough => 1,
  });
}

1;
