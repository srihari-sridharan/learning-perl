#!/usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';
use IO::File;

main(@ARGV);

sub main {
    my $filename = shift() || 'linesfile.txt';
    my $count    = countlines($filename);
    say "There are $count lines in $filename";
}

sub countlines {
    my $filename = shift();
    error("Filename is not set!") unless $filename;

    my $fh = IO::File->new( $filename, "r" )
      or error("Unable to open file $filename.");

    my $count = 0;
    $count++ while ( $fh->getline() );

    $fh->close();

    return $count;
}

sub error {
    my $message = shift() || "unknown error";
    say "$0: $message";
    exit 0;
}
