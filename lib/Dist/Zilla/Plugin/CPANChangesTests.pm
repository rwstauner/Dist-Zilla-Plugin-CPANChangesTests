package Dist::Zilla::Plugin::CPANChangesTests;
# ABSTRACT: Add release tests using Test::CPAN::Changes

=head1 SYNOPSIS

  # dist.ini
  [CPANChangesTests]

=cut

use strict;
use warnings;
use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';

__PACKAGE__->meta->make_immutable;
no Moose;

1;

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following files:

  xt/release/cpan-changes.t - a standard Test::CPAN::Changes test

=head1 SEE ALSO

=for :list
* L<CPAN::Changes>
* L<Test::CPAN::Changes>

=cut

__DATA__
___[ xt/release/cpan-changes.t ]___
#!perl

use Test::More;
eval 'use Test::CPAN::Changes';
plan skip_all => 'Test::CPAN::Changes required for this test' if $@;
changes_ok();
