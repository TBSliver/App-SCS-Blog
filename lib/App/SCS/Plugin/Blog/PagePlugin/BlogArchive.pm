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

has sub_dir => (
  is => 'ro',
  default => undef,
);

sub _selector { '.BlogList' }

sub filter_content_zoom {
  my ( $self, $zoom ) = @_;

  $zoom->collect( $self->_selector, {
    filter => $self->_filter_callback( $self->page ),
    passthrough => 1,
  });
}

sub _filter_callback {
  my ( $self, $page ) = @_;
  sub {
    my $stream = shift;

    my %args = (
      min_depth => $self->min_depth,
      max_depth => $self->max_depth,
    );

    if ( defined $self->sub_dir ) {
      $args{base_dir} = $page->_my_path->catdir( $self->sub_dir );
    }

    $stream->select($self->_selector)->repeat_content(
      $page->children(%args)->latest()->map(
        sub {
          my $o = shift;
          sub {
            $_->select('.entry.title')->replace_content($o->title)
              ->select('.entry.subtitle')->replace_content($o->subtitle)
              ->select('.entry.description')->replace_content($o->description)
              ->select('.entry.published_at')->replace_content($o->published_at)
              ->select('.entry.link')->set_attribute(href => $o->path);
          }
        }
      )
    );
  };
}

1;
