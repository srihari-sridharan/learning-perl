#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

my @array = qw( 1 2 3 4 5);
my $separator =
"-------------------------------------------------------------------------------------";

say "while loop";
while (@array) {
    say shift @array;
}
say $separator;

say "do-while loop";
@array = qw( 1 2 3 4 5);
do {
    say shift @array;
} while (@array);
say $separator;

say "while postfix";
@array = qw( 1 2 3 4 5);
say shift @array while (@array);
say $separator;

say "until loop";
@array = qw( 1 2 3 4 5);
my $count = scalar @array;
until ( $count == 0 ) {
    say $count;
    $count--;
}
say $separator;

say "do-until loop";
@array = qw( 1 2 3 4 5);
$count = scalar @array;
do {
    say $count;
    $count--;
} until ( $count == 0 );
say $separator;

say "until postfix";
say shift @array until ( scalar @array == 0 );
say $separator;
