#!/usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

say "Hello World";      # Prints with a new line character
print "Hello World";    # Does not print with a new line character
print "\n";
say "Perl Version $^V";

# Count the lines in a file
my $filename = "../.gitattributes";

# Read the files all at once!
open( FH, $filename );
my @lines = <FH>;
print("File $filename opened successfully!\n");

close(FH);
my $count = scalar @lines;
say "There are $count lines in $filename";

# Reads line by line - works pretty well in case of large files, as you cannot read the entire file in memory.

use IO::File;

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
