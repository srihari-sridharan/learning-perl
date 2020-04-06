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

# This while loop works as long as there are elements in the array.
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

# for loop - work when index is < 10
say "Traditional for loop for 10 items (0 to 9):";
for ( my $i = 0 ; $i < 10 ; $i++ ) {
    say $i;

}
say $separator;

# for loop that iterates over the @array and works as long as $array[$i] has value.
# Note the condition is based on $array[$i] not being undefined.
@array = qw( one two three four five);
say "for loop that works when \$array[\$i] has value:";
for ( my $i = 0 ; $array[$i] ; $i++ ) {
    say $array[$i];
}
say $separator;

# foreach loop
say "foreach loop in action";
foreach my $item (@array) {
    say $item;
}
say $separator;

#foreach is an alias for the 'for' keyword.
for my $item (@array) {
    say $item;
}
say $separator;

# default variable $_
say "Demonstrating \$_ default variable";
foreach (@array) {
    say $_;
    say;    # Even without printing anything it prints the default value - $_
}
say $separator;

#POSTFIX notation foreach
say "POSTFIX foreach demo:";
say $_ foreach (@array);
say $_ foreach @array;     # Parenthesis is optional in this POSTFIX version!
say    foreach (@array);
say $separator;

# Modifying elements in an array
say "Changing the elements in the array...";
my $counter = 1;
for my $s (@array) {
    $s = "$counter -- $s";
    $counter++;
}

say foreach @array;
say $separator;

# Loop control statements
my $valToSkip = "Three";
say
"'next' loop control statements - skips '$valToSkip' and moves past that item to the next one";
my @nums = qw( One Two Three Four Five );
while (@nums) {
    my $item = shift @nums;

    # Note == is used for numbers, where are eq is used for strings.
    next if $item eq $valToSkip;

    say $item;
}
say $separator;

say
"'last' loop control statements - exits the loop when it encounters '$valToSkip'";
@nums = qw( One Two Three Four Five );
while (@nums) {
    my $item = shift @nums;
    last if $item eq $valToSkip;
    say $item;
}
say $separator;

# continue - this is not so common!
say "'continue' loop control statements - continue block demo";
@nums = qw( One Two Three Four Five );
my $count = 0;
while ( $nums[$count] ) {
    say "$count : $nums[$count]";
}
continue {
    ++$count;
}
say $separator;

# continue can be achieved with a simple for loop!
for ( my $counter = 0 ; $nums[$counter] ; ++$counter ) {
    say "$counter: $nums[$counter]";
}
say $separator;

say
"My 2 cents: using the for is better than using the while-continue combination.";

