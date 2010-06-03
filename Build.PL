#!/usr/bin/env perl
use Module::Build;

my $wtfpl = <<'EOF';
# Apparently WTFPL isn't a valid license, well, this is an Acme module, so...
use PadWalker;
PadWalker::peek_sub(Module::Build->can("valid_licenses"))->{'%licenses'}->{wtfpl} = 2;
# ...it is now.
EOF
eval $wtfpl;

Module::Build->subclass(
  class => 'My::Builder',
  code  => $wtfpl,
)->new(
  dist_version   => 1337,
  dist_abstract  => "Turn your perl upside down",
  module_name    => 'Acme::ǝmɔA',
  license        => 'wtfpl',
  requires       => {
                      'perl'             => '5.8.1',
                      'Filter::Simple'   => 0,
                      'Text::UpsideDown' => 0,
                    },
  build_requires => {
                      'PadWalker'        => 0,
                    },
)->create_build_script;
