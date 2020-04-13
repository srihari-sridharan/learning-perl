#!/usr/bin/perl
# The pragmas below helps us write 'Clean Code' in Perl.
use strict;
use 5.18.0;
use warnings;
use diagnostics;
use feature 'say';
use IO::File;
use Perl::Critic;

main(@ARGV);

sub main {
	my $filename = shift || die "Please provide a valid perl file.";
	my $critic = Perl::Critic->new();
	my @violations = $critic->critique($filename);
	print @violations;
}