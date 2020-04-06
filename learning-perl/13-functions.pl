#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';
use feature 'state';

# Predeclared functions
# The use subs pragma takes the names of the functions that you want to call without ().
# However, in perl V 5.30 - user defined functions just work fine even when called without parenthesis.
use subs qw ( sum );

my $separator =
"-------------------------------------------------------------------------------------";

say $separator;
say "Functions a.k.a subroutines";
say $separator;

sub hello {
    say "hello - demo of a simple function";
    say $separator;
}

hello();

say "Parameters are passed in the default \@_ variable";

sub sum {
    my $total = 0;
    say "Sum of @_";
    while (@_) {
        $total += shift;
    }

    return $total;
}

# inside functions perl's @_ is similar to JavaScript's arguments.

say "Note: we are passing in 5 numbers 1, 2, 3, 4, 5 ";
say "and then an array of numbers (6, 7, 8, 9, 10)";
say "all of them get added the default array \@_";
my $result = sum( 1, 2, 3, 4, 5, ( 6, 7, 8, 9, 10 ) );
say $result;
say $separator;

sub sumOfTwoNumbers {

# First argument goes into first variable and second one goes into the second variable.
    my ( $num1, $num2 ) = @_;
    return $num1 + $num2;
}

$result = sumOfTwoNumbers( 1234, 5678 );
say "Sum of 2 numbers (1234 and 5678) = $result";

# Function can be called without parenthesis.
$result = sumOfTwoNumbers 1234, 5678;
say "Sum of 2 numbers 1234 and 5678 = $result";
say $separator;

say "Variables created inside the function are locally scoped";

sub printResult {
    my $result = 100;
    say "Result inside the function = $result";

    # There is a result that is set in line 51. The print statement in line 58
    # will refer to the local variable within the function.
}

printResult();
say $separator;

say "Result outside the function = $result";
say $separator;

say "Functions can return a list of values";

sub getList {
    return ( 100, 99, 98, 97, 96 );
}

my @result = getList();
say "@result";

sub getRange {
    return ( 1 .. 20 );
}

@result = getRange();
say "@result";
say $separator;

say "Persistent or Static Variable within a function";

sub persistentValue {

    # value of $n is persistent across calls.
    state $n = 0;
    say ++$n;
}

persistentValue();
persistentValue();
persistentValue();
persistentValue();
persistentValue;    # Function can be called without parenthesis.
say $separator;
