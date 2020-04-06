#!/usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

use IO::File;

# Count the lines in a file
my $filename = "../.gitattributes";

# Reads line by line - works pretty well in case of large files, as you cannot read the entire file in memory.

my $fh = IO::File->new( $filename, "r" );
if ( !$fh ) {
    say "Unable to open file $filename";
    exit;
}

my $numLines = 0;
while ( $fh->getline ) {
    $numLines++;
}

$fh->close;
say "There are $numLines lines in $filename";
