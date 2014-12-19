package App::SCS::Plugin::Blog;

use Moo;

with 'App::SCS::Role::Plugin';

has archive => (
  is => 'lazy',
);

sub _build_archive {
  my $self = shift;
  my $archive_settings = $self->config->{archive};
  $archive_settings ||= {
    max_depth => 1,
    min_depth => 0,
  };
  return $archive_settings;
}

sub page_plugins {
  BlogArchive => 'App::SCS::Plugin::Blog::PagePlugin::Archive',
}

sub default_page_plugins {
  my $self = shift;
  BlogArchive => {config => $self->archive},
}

1;
