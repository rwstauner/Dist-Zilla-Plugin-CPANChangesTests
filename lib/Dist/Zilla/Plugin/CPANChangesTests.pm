package Dist::Zilla::Plugin::CPANChangesTests;
# ABSTRACT: Deprecated

=head1 SYNOPSIS

This module is B<deprecated> in favor of the more configurable and better named
L<Dist::Zilla::Plugin::Test::CPAN::Changes>.

  # dist.ini
  [Test::CPAN::Changes]

=cut

use strict;
use warnings;
use Moose;
extends 'Dist::Zilla::Plugin::InlineFiles';

before gather_files => sub {
	my ($self) = @_;
	$self->log($_) for (
		'!',
		__PACKAGE__ . ' is deprecated.',
		'Please use Dist::Zilla::Plugin::Test::CPAN::Changes.',
		'!',
	);
};

__PACKAGE__->meta->make_immutable;
no Moose;

1;

=head1 DESCRIPTION

This is an extension of L<Dist::Zilla::Plugin::InlineFiles>, providing the
following files:

  xt/release/cpan-changes.t - a standard Test::CPAN::Changes test

=head1 SEE ALSO

=for :list
* L<Dist::Zilla::Plugin::Test::CPAN::Changes>

=cut

__DATA__
___[ xt/release/cpan-changes.t ]___
#!perl

use Test::More;
eval 'use Test::CPAN::Changes';
plan skip_all => 'Test::CPAN::Changes required for this test' if $@;
changes_ok();
