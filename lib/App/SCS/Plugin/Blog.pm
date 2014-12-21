package App::SCS::Plugin::Blog;

use Moo;

with 'App::SCS::Role::Plugin';

sub page_plugins {
  my $self = shift;
  BlogArchive => 'App::SCS::Plugin::Blog::PagePlugin::BlogArchive',
}

sub default_page_plugins {
  my $self = shift;
  BlogArchive => {},
}

1;
