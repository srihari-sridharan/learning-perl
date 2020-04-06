#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

my $val1 = 1;
my $val2 = 2;

if ( $val1 == $val2 ) {
    say "$val1 is equal to $val2";
}
else {
    say "$val1 is not equal to $val2";
}

# Another way of doing this is using the POSTFIX notation
# This is good for cases where you just have one line of code in the if block.
say "$val1 is not equal to $val2" if ( $val1 != !$val2 );

# POSTFIX
# Only for one line statements inside the if block.
# You may not use else or else if
# For more than one line use the traditional if block.

# else and elsif
my $numOfThreads = 4;

sub printMessage {
    my $numOfThreads = shift || 0;
    if ( $numOfThreads < 2 ) {
        say "Less than optimal...";
    }
    elsif ( $numOfThreads >= 2 && $numOfThreads <= 5 ) {
        say "Optimal...";
    }
    else {
        say "Performance bottleneck...";
    }
}

my $numOfThreads1 = 0;
printMessage($numOfThreads1);    #Less than optimal...

my $numOfThreads2 = 4;
printMessage($numOfThreads2);    #Optimal...

my $numOfThreads3 = 10;
printMessage($numOfThreads3);    #Performance bottleneck...

# unless - negative conditional
my $x = 1;
my $y = 2;
unless ( $x == $y ) {
    say 'true';
}
else {
    say 'false';
}

# unless shines the best in postfix notation.
say 'true' unless ( $x == $y );

# From the source I learnt this - avoid using given and when (switch case kinda..) in production code - need to validate this claim.

my $v1 = 1;
my $v2 = 2;
my $v3 = 3;

my $v = $v1;

given ($v) {
    when ($v1) {
        say 'v1';
    }
    when ($v2) {
        say 'v2';
    }
    when ($v3) {
        say 'v3';
    }
    default { say 'DEFAULT'; }
}

$v = $v2;

#POSTFIX notation
given ($v) {

    say 'v1' when $v1;
    say 'v2' when $v2;
    say 'v3' when $v3;
    default { say 'DEFAULT'; }
}

$v = $v3;

# Use of a hash instead of switch case - (have used this technique in JavaScript often!)
my %valueHash = (
    $v1 => 'v1',
    $v2 => 'v2',
    $v3 => 'v3'
);

if ( $valueHash{$v} ) {
    say $valueHash{$v};
}
else {
    say 'DEFAULT';
}

# Ternary operator
my $a = 1;
my $b = 2;
say $a < $b ? 'b' : 'a';    # b

$a = 1;
$b = 1;
say $a == $b ? 'equal' : ( $a < $b ? 'b' : 'a' );    # equal

$a = 2;
$b = 1;
say $a == $b ? 'equal' : ( $a < $b ? 'b' : 'a' );    # a
