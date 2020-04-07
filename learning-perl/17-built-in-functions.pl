#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';
use IO::File;

my $separator =
"-------------------------------------------------------------------------------------";

# print and say are used to write content to file and streams
# say adds new line at the end. \n
say "print and say";
say "say is available from Perl 5.10";
say "Hello";
print "Hello \n";
say $separator;

say "Use \$, to set a default separator";
my @array = ( 1, 2, 3 );
say @array;    # Prints 123

# $, = ", ";
# say @array;    # After settings \$, prints 1, 2, 3
# Setting $, has a side effect, it is a global change and affects all the say/print calls after that.
say $separator;

# Use join function to achieve this.
my %hash = ( a => 1, b => 2, c => 3 );
say @array, %hash
  ;    #123a1c3b2 (note: the part that prints the hash might vary for each run)
say join ", ", @array, %hash;    # 1, 2, 3, a, 1, c, 3, b, 2

# You can specify a file handle.
say STDOUT "Hello...";
say STDERR "Hello...";
my $file = IO::File->new("> say-demo.txt")
  or die "Unable to open file for write. $!"
  ; # die function is used for error handling - it prints the message and exits the script.
say $file "This is a line of text written to file using say function.";
say $separator;

# String functions
say "String functions";
my $inputString = "This is a sample string.";
print "Length of [$inputString] ";
say length($inputString);    # can also be called as length $inputString
say $separator;

# chomp removes line endings
my $text = "This is a line with new line character at the end.\n";
say $text;
say $separator;
chomp $text;
say "Calling chomp!";
say $text;
say $separator;

say "substr - gets substring";
say substr $inputString, 5;       # Starts at 5 - returns rest of string.
say substr $inputString, 5, 2;    # Starts at 5 - returns 2 characters.
say $separator;

say "Find replace using substr";
substr( $inputString, 5, 2, "IS" );
say $inputString;
say $separator;

say "index returns index of a string";
say $inputString;
print index $inputString, "is";
print " is the index of 'is'\n";
say $separator;
print index $inputString, "IS", 4;    # start searching from position.
print " is the index of 'IS' after 4\n";
say $separator;
print index $inputString, "SRIHARI";    # Prints -1 if not found.
print " string not found.\n";
say $separator;
say
"rindex function starts from the right and looks towards the left! Try it on your own.";

say "reverse in scalar context - reverses the string";
say scalar reverse $inputString;
say $separator;

say "reverse a list";
say reverse @array;
say $separator;

substr( $inputString, 5, 2, "is" );
say "lowercase";
say lc $inputString;
say "uppercase";
say uc $inputString;
say "uppercase first";
say ucfirst $inputString;
say $separator;
say
  "See https://perldoc.perl.org/index-functions-by-cat.html for more details.";
say $separator;

say "Numeric functions";
say abs(-100);    # 100
say $separator;
say atan2( 1, 1 ) * 4;
say $separator;
say sqrt(9);
say $separator;
say 3**3;         # ** power operator
say $separator;
say "Converting between bases";
say hex 'FF';
say oct '377';
say $separator;
say "Random number without seeding.";
say rand;         # Generates random number between 0 and 1;
say rand;
say rand;
say rand;
say rand;
say "rand(100) gives a random number less than 100";
say rand(100);
say rand(100);
say rand(100);
say rand(100);
say rand(100);
say "srand seeds a random number generator. (differs across runs)";
srand(12345);
say "Random number with seeding. (same on each run)";
say rand;
say rand;
say rand;
say rand;
say rand;
say rand(100);
say rand(100);
say rand(100);
say rand(100);
say rand(100);
say $separator;
say
  "See https://perldoc.perl.org/index-functions-by-cat.html for more details.";
say $separator;

# List and array functions - (push, pop, shift, unshift) - Few more here.
say "grep";
my @numbers = qw(one two three four five);
say foreach grep /t/, @numbers;    # Matching
say $separator;
say foreach grep !/t/, @numbers;    # Not matching
say $separator;
say foreach grep { /t/ } @numbers;    # Alternate syntax
say $separator;

say "map";
@numbers = ( 1, 2, 3, 4, 5 );
say foreach map { $_ * 2 } @numbers;
say $separator;
say foreach map( $_ * 2, @numbers );    #Alternate syntax
say $separator;

say "join and split";
say join ", ", @numbers;
@array = split " ", "This is a string to split";
say foreach @array;
say $separator;
say
  "See https://perldoc.perl.org/index-functions-by-cat.html for more details.";
say $separator;

say "defined vs undefined!";
my $x;
say "\$x is undefined" if !defined $x;
$x = 24;
say "\$x is defined $x" if defined $x;
undef $x;
say "\$x is undefined" if !defined $x;
$x = 24;
say "\$x is defined $x" if defined $x;
$x = undef;    # Alternate approach
say "\$x is undefined" if !defined $x;
say $separator;

say "Time functions";
my $t = time();
say $t;
my $timeString = localtime($t);
say $timeString;
say "GMT";
$timeString = gmtime($t);
say $timeString;
say $separator;

say "Add 4 years 60s * 60m * 24h * 365d * 4 years + one day (60s * 60m * 24h)";
$t += 60 * 60 * 24 * 365 * 4 + ( 60 * 60 * 24 );
say $t;
$timeString = localtime($t);
say $timeString;
say $separator;
$t -= 60 * 60 * 24 * 365 * 4 + ( 60 * 60 * 24 );
say "Custom formatting";
my ( $sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst ) =
  localtime($t);
$mon++;    # Add one the month (0 based index)
$year += 1900;    # Add 1900 to year

# Add leading 0s to single digit numbers
foreach ( $mon, $mday, $hour, $min, $sec ) {
    $_ = "0$_" if $_ < 10;
}
say "$year-$mon-$mday $hour:$min:$sec";
say $separator;

say "See - http://man7.org/linux/man-pages/man3/strftime.3.html - strftime";
use POSIX qw(strftime);
my $now = strftime( "%A, %B %d, %Y, %H:%M:%S", localtime($t) );
say $now;
say $separator;
