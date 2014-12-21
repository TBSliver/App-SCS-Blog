package App::SCS::Plugin::Blog::PagePlugin::BlogArchive;

use Moo;
use Data::Dumper;

with 'App::SCS::Role::PagePlugin';

has max_depth => (
  is => 'ro',
  default => 1,
);

has min_depth => (
  is => 'ro',
  default => 1,
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
  print Dumper $self->max_depth;
  print Dumper $self->min_depth;

}

1;
