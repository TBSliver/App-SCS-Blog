use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

WriteMakefile(
  NAME => 'App-SCS-Blog',
  Version => 0,
  PREREQ_PM => {
    'App::SCS' => 0,
  }
);
