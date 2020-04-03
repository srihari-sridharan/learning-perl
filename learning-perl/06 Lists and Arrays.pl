#!/usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;    # similar to JS use strict
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

my $separator =
"-------------------------------------------------------------------------------------";

# Lists and Arrays

# Direclty defining something within () means a list.
say "Printing a list of numnbers (entire list as argument to 'say'):";
say( 1, 2, 3 );
say $separator;

say "Printing a list of numbers using foreach:";
say foreach ( 1, 2, 3 )
  ;  # Calls say once for each item in the list. Prints 1 2 3 on separate lines.
say $separator;

say "Printing a list of strings using foreach:";
say foreach ( "one", "two", "three" );    #foreach over a list of strings.
say $separator;

say "Using qw to create a list:";
say foreach qw(ONE TWO THREE FOUR)
  ; # qw - quote word operator. Do not use quote marks and use spaces to separte.
say $separator;

say "Using subscript operator []:";

#Subscript operator (Similar to array index in JS) 0 based indexing!
say qw(ONE TWO THREE FOUR) [1];    # Prints TWO.
say $separator;

say "Printing an array:";

# When assigned to a variable staritng with @ it means an array.
my @listOfNumbers =
  ( 1, 2, 3 );    #Creates an array and initializes the array from a list.

say @listOfNumbers;
say $separator;

say "Printing an array using foreach:";
say foreach @listOfNumbers;
say $separator;

# Arrays can contains any scalar values. You can create array using qw - quote word operator.
say "Creating an array using quote word (qw):";
my @listOfStrings = qw(ONE TWO THREE FOUR);
say foreach @listOfStrings;
say $separator;

say
"Subscript using @ symbol will return a list with one value. Look at the warning.";
say @listOfStrings[0]
  ; # ONE - Note that using the @ symbol will return a list with one value and it is misleading. Though it works, it will throw a warning.
    # Note the warning- Scalar value @listOfStrings[0] better written as $listOfStrings[0] at .\06 Lists and Arrays.pl line 49 (#1)
say $separator;

say "Subscript using \$ symbol to access array element as scalar"
  ;    # To print a $ use escape sequence \.
say $listOfStrings[0];    # ONE - Note the $ symbol it returns a scalar.
say $separator;

# Important distinction between a list and an array is that - array is mutable where as a list isn't
say "Array is mutable and list is immutable:";
$listOfStrings[0] = "one";
say $listOfStrings[0];    # one instead of ONE
say $separator;

# say $listOfStrings[4];    # Throws an error - Use of uninitialized value in say at .\06 Lists and Arrays.pl line 45 (#2)
# You can assign and the use the subscript operator.
say "Assign value using subscript operator \$listOfStrings[4] = \"FIVE\"; :";
$listOfStrings[4] = "FIVE";
say $listOfStrings[4];    # prints FIVE
say $separator;

# Note we never assigned the index 5, we are directly assigning index 6 - which is perfectly fine with Perl!
say
"Assign value using subscript operator \$listOfStrings[6] = \"SEVEN\"; Note we never used index [5]:";
$listOfStrings[6] = "SEVEN";
say $listOfStrings[6];    # prints SEVEN
say $separator;

# to push elements into an array use push!
say "push - adds items to the end of an array";
push @listOfNumbers, ( 4, 5, 6, 7 );
say foreach @listOfNumbers;    # prints 1 to 7 - one number per line.
say $separator;

# to remove an element from end of an array use pop
say "pop - removes an item from the end of an array";
my $removedNumber = pop @listOfNumbers;
say "Popped value $removedNumber";
say $removedNumber;            # Prints 7
say $separator;
say "Rest of the array";
say foreach @listOfNumbers;    # Prints 1 to 6 - one number per line.
say $separator;

# shift does the same as pop but it removes from the front of the array.
say "shift - removes an item from the front of an array";
my $shiftedValue = shift @listOfNumbers;
say "Shifted value $shiftedValue";
say $separator;
say "Rest of the array";
say foreach @listOfNumbers;
say $separator;

#unshift adds the items to the front of the array
say "unshift - adds the items to the front of the array (0,1)";
unshift @listOfNumbers, ( 0, 1 );
say "Array after unshift!";
say foreach @listOfNumbers;
say $separator;

my $count = @listOfNumbers;
say "The array @listOfNumbers has $count elements.";
say $separator;

# Slicing an array
my @arrOfNumbers = qw(zero one two three four five six seven eight nine ten);
say "Data in array [@arrOfNumbers]";
my @subset1 = @arrOfNumbers[ 0, 1, 2, 3, 4 ];
say
  "Accessing elements at given index \@arrOfNumbers[ 0, 1, 2, 3, 4 ] @subset1";
say $separator;

my @subset2 = @arrOfNumbers[ 10, 1, 2, 3, 0, 9, 5 ];
say
"Accessing elements at given index \@arrOfNumbers[ 10, 1, 2, 3, 0, 9, 5 ] = [@subset2]";
say "The new sliced array was formed by picking elements at the given index!";
say $separator;

# Range operator [fromIndex..toIndex]
say "Range operator [fromIndex..toIndex]: e.g. \@arrOfNumbers[ 0..5 ]";
my @subset3 = @arrOfNumbers[ 0 .. 5 ];
say foreach @subset3;
say $separator;
