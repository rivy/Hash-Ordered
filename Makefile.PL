use strict;
use warnings;

use 5.008;

use ExtUtils::MakeMaker 6.17;

my %WriteMakefileArgs = (
  "ABSTRACT" => "A fast, pure-Perl ordered hash class",
  "AUTHOR" => "David Golden <dagolden\@cpan.org>",
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.17"
  },
  "DISTNAME" => "Hash-Ordered",
  "LICENSE" => "apache",
  "MIN_PERL_VERSION" => "5.008",
  "NAME" => "Hash::Ordered",
  "PREREQ_PM" => {
    "Carp" => 0,
    "constant" => 0,
    "overload" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "ExtUtils::MakeMaker" => 0,
    "File::Spec" => 0,
    "List::Util" => 0,
    "Test::Deep" => 0,
    "Test::FailWarnings" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "0.96"
  },
  "VERSION" => "0.011",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "ExtUtils::MakeMaker" => 0,
  "File::Spec" => 0,
  "List::Util" => 0,
  "Test::Deep" => 0,
  "Test::FailWarnings" => 0,
  "Test::Fatal" => 0,
  "Test::More" => "0.96",
  "constant" => 0,
  "overload" => 0,
  "strict" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);
