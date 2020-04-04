#!/usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

my @array = ( 1, 2, 3, 4, 5 );
say foreach @array;

say("Hello");    # Hello - Calling say with a ().
say "Hello",
  " World";  #Hello World - Calling say with more than one parameter without ().
say( "This ", "is ", "cool!" );    # This is cool

my $count = @array;                # get the number of elements in that array.
say "There are $count elements in the array. (@array)"
  ;    # There are 5 elements in the array. (1 2 3 4 5)

say "There are ${count} elements in the array. (@{array})"
  ; # Another way of string interpolation. Use $count (variable name) or ${count} for interpolation.

# assign a list of values to a list of scalaras like this.
# similar to JS - destructuring
my ( $a, $b, $c ) = ( 1, 2, 3 );
say $a;    #1
say $b;    #2
say $c;    #3

my $x = "x";
my $y = "y";
my $z = "z";

func();

sub func {
    my $y = 'func-y';    # overrides function level $y
                         # my behaves like JavaScript let.
    foreach my $var ( $x, $y, $z ) {
        say $var;
    }
}

my $n = 42;
$n = $n
  . " is an integer"
  ;    #Here $n becomes a string as . is the string concatenation operator.

say $n;

my $h = "HELLO WORLD!";
$h .= " This is a string."
  ;    # You can use .= as compound string concatenation operator.
say "String is [$h] - Escape sequence \\ \' \"";  # Strings with escape sequence
say qq(String is [$h] - Escape sequence \ ' ")
  ;    # qq - interpolation quote operator - but doesn't work for \ :-0

my $first  = 1;
my $second = 1;
say( $first == $second );    # Prints 1.
$second = 2;
say( ( $first == $second ) );    # Prints blank - need to what that is!

# 0 is false and non zero is true.
# "" empty string is false and non empty string is true.
# empty array is false and non empty array is true.

sub evaluate {
    my $val = shift() || 0;
    if ($val) {
        say 'true';
    }
    else {
        say 'false';
    }
}

evaluate(0);     # false
evaluate(1);     # true
evaluate("");    # false
evaluate('Some other string')
  ;              # true - Strings can also use '' instead of "" as in JS
evaluate("Some String");    # true
my @arr = ();
evaluate(@arr);             # false
@arr = (1);
evaluate(@arr);             # true
