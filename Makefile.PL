use strict;
use warnings FATAL => 'all';
use ExtUtils::MakeMaker;

writeMakefile(
  NAME => 'App-SCS-Blog',
  Version => 0,
  PREREQ_PM => {
    'App::SCS' => 0,
  }
);
