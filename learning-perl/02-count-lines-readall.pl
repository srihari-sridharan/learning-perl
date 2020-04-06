#!/usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

# Count the lines in a file
my $filename = "../.gitattributes";

# Read the files all at once!
open( FH, $filename );
my @lines = <FH>;
print("File $filename opened successfully!\n");

close(FH);
my $count = scalar @lines;
say "There are $count lines in $filename";
