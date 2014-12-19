package App::SCS::Plugin::Blog;

use Moo;

with 'App::SCS::Role::Plugin';

sub page_plugins {
  BlogArchive => 'App::SCS::Plugin::Blog::PagePlugin::Archive',
}

sub default_page_plugins {
  BlogArchive => {},
}

1;
