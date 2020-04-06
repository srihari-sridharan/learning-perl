#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

my $separator =
"-------------------------------------------------------------------------------------";

# Standard definition in Perl
use constant { TRUE => 1, FALSE => '' };

say "Introduction to operators";
say "Refer to https://perldoc.perl.org/perlop.html";

my $x = 47;
my $y = 4;

say "Addition: " .       ( $x + $y );
say "Subtraction: " .    ( $x - $y );
say "Multiplication: " . ( $x * $y );
say "Division: " .       ( $x / $y );
say "Modulo: " .         ( $x % $y );
say "Bitwise AND: " .    ( $x & $y );
say "Bitwise OR: " .     ( $x | $y );
say "Integer int(): ", ( int( $x / $y ) );

my $amount = 1 + 10 / 100;    # one dollar and 10 cents
say "amount is $amount";
printf( "Converting to 30 decimals - is not exactly 1.10: %.30f\n", $amount );

my ( $dollars, $cents ) = getExactDollarsAndCents($amount);

printf( "Exact: dollars: %.30f cents: %.30f\n", $dollars, $cents );

printf( "Exact price is %d\.%02d\n", $dollars, $cents );

# getExactDollarsAndCents( $value )
# takes one scalar number, returns a list of two values
sub getExactDollarsAndCents {
    my $value   = shift || 0;
    my $dollars = int( $value *= 100 );    # total num of cents
    my $cents   = int( $value % 100 );     # cents part only
    $dollars = int( $dollars / 100 );      # dollars part only
    return ( $dollars, $cents );
}

# Compound assignment operators
say "Compund assignment operators:";
my $val = 9;
say "$val += 2 gives " . ( $val += 2 );
say "$val -= 2 gives " . ( $val -= 2 );
say "$val *= 2 gives " . ( $val *= 2 );
say "$val /= 2 gives " . ( $val /= 2 );
say "$val %= 2 gives " . ( $val %= 2 );
say $separator;

# Logical operators
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
  ; # true - Strings can also use '' instead of "" as in JS. But interpolation doesn't work on '' and works only on "".
evaluate("Some String");    # true
my @arr = ();
evaluate(@arr);             # false
@arr = (1);
evaluate(@arr);             # true
say $separator;

say("Conditional operators for numbers include ==, !=, <, >, <=, >=");
say("Conditional operators for strings include eq, ne, lt, gt, le, ge");
say $separator;

say "Logical operators";
say "Lower precedence operators.";
say "and";
say( TRUE  and TRUE );      # 1
say( TRUE  and FALSE );     # ''
say( FALSE and TRUE );      # ''
say( FALSE and FALSE );     # ''
say $separator;

say "or";
say( TRUE  or TRUE );       # 1
say( TRUE  or FALSE );      # 1
say( FALSE or TRUE );       # 1
say( FALSE or FALSE );      # ''
say $separator;

say "not";
say( not TRUE or FALSE );        #''
say( not TRUE or not FALSE );    #1
say( not FALSE );                # 1
say( not TRUE );                 #''
say $separator;

say "xor";
say( TRUE xor TRUE );            # ''
say( TRUE xor FALSE );           # 1
say( FALSE xor TRUE );           # 1
say( FALSE xor FALSE );          # ''
say $separator;

# Difference between or and ||
say "Difference between or and ||";
say TRUE  or FALSE;              # returns 1  - Note there is no parenthesis
say FALSE or TRUE;               # returns '' - Note there is no parenthesis
say $separator;

say "Higher precedence operators. - Short circuiting expressions...";
say "||";
say TRUE  || FALSE;              # returns 1 - as expected.
say FALSE || TRUE;               # returns 1 - as expected.
say TRUE  || TRUE;               # returns 1 - as expected.
say FALSE || FALSE;              # returns '' - as expected.
say $separator;

say "&&";
say TRUE  && TRUE;               # return 1
say TRUE  && FALSE;              # returns ''
say FALSE && TRUE;               # returns ''
say FALSE && FALSE;              # returns ''
say $separator;

say
"Another use of || in assignment / short-circuit! This is similar to how JavaScript || works!";
my $a = 0;
my $b = $a || 2;
say $b;                          # Prints 2
my $c = $b || 3;
say $c;                          # Prints 2
$b = 0;
$c = $b || 3;
say $c;                          # Prints 3

say $separator;
say "NOTE: Always use parenthesis and refer to operator precedence chart!";
say $separator;

my $filename = "12 operators.pl";

# File test operators
say "-e file test operator tests if file exists.";
if ( -e $filename ) {
    say "File test operator found file [$filename].";
}
elsif ($!) {
    say $!;
}
else {
    say "File test operator returned false.";
}
say $separator;

say "-e tests if file exists.";
say "-r tests if file is readable.";
say "-w tests if the file is writable.";
say "-z tests if the file is zero size.";
say "-s tests if the file has content.";
say "-f tests if the it is a file.";
say "-d tests if it is directory.";
say "$filename - exists"                  if ( -e $filename );
say "$filename - readable"                if ( -r $filename );
say "$filename - writable"                if ( -w $filename );
say "$filename - is non zero size - ! -z" if ( !-z $filename );
say "$filename - has content"             if ( -s $filename );
say "$filename - is a file"               if ( -f $filename );
my $directory = "../learning-perl";
say "$directory - is a directory" if ( -d $directory );
say $separator;

# See - https://perldoc.perl.org/functions/-X.html
say
"Complete list of file test operators from - https://perldoc.perl.org/functions/-X.html";
say "   -r  File is readable by effective uid/gid.
        -w  File is writable by effective uid/gid.
        -x  File is executable by effective uid/gid.
        -o  File is owned by effective uid.
        -R  File is readable by real uid/gid.
        -W  File is writable by real uid/gid.
        -X  File is executable by real uid/gid.
        -O  File is owned by real uid.
        -e  File exists.
        -z  File has zero size (is empty).
        -s  File has nonzero size (returns size in bytes).
        -f  File is a plain file.
        -d  File is a directory.
        -l  File is a symbolic link (false if symlinks aren't
            supported by the file system).
        -p  File is a named pipe (FIFO), or Filehandle is a pipe.
        -S  File is a socket.
        -b  File is a block special file.
        -c  File is a character special file.
        -t  Filehandle is opened to a tty.
        -u  File has setuid bit set.
        -g  File has setgid bit set.
        -k  File has sticky bit set.
        -T  File is an ASCII or UTF-8 text file (heuristic guess).
        -B  File is a \"binary\" file (opposite of -T).
        -M  Script start time minus file modification time, in days.
        -A  Same for access time.
        -C  Same for inode change time (Unix, may differ for other platforms)";
say $separator;

# Range operator ..
say "Saying hello for 5 times using the range operator ..";
foreach my $i ( 1 .. 5 ) {
    say "Hello $i";
}
say $separator;

say "Range operator can work with letters too!";
foreach my $letter ( 'a' .. 'z' ) {
    print "$letter ";
}
say "";
say $separator;

say "Numbers formatted like 01, 001, etc.";
say foreach ( '01' .. '99' );
say $separator;

say
"You can do a combination of numbers and letters - e.g. printing hexadecimal values";
say foreach ( 0 .. 9, 'a' .. 'f' );
say $separator;

say "We can use range operator to initialize an array";
my $lower   = 0;
my $upper   = 9;
my @numbers = ( $lower .. $upper );
print "Decimals: ";
print foreach (@numbers);
say "";

$lower   = 0;
$upper   = 9;
@numbers = ( $lower .. $upper, 'a' .. 'f' );
print "Hexadecimals: ";
print foreach (@numbers);
say "";
say $separator;

# String concatenation operator
say "String concatenation";
my $firstname = "Srihari";
my $lastname  = "Sridharan";
my $name      = $firstname . ' ' . $lastname;
say "Name: $name";
say $separator;

# Quote operators
say "q - quote operator for strings";
say q(Hello world!);    # Prints Hello world!
say q(Hello "Srihari")
  ;    # Prints Hello "Srihari" (note: no need for escape sequence \);
say q(Hello\n"Srihari")
  ;    # Prints Hello\n"Srihari" - doesn't interpolate. Use qq() double quote
say
"qq - double quote operator for strings - respects escape sequence in the string";
say qq(Hello\n"Srihari")
  ;    # Prints Hello in first line and "Srihari" in the next line.
say "You can use {}, [], and || instead of () with qq.";
say qq{Hello world!};
say qq[Hello world!];
say qq|Hello world!|;
say "qw - helps define list of words";
my @daysOfWeek = qw(Sunday Monday Tuesday Wednesday Thursday Friday Saturday);

foreach my $dayOfWeek (@daysOfWeek) {
    say $dayOfWeek;
}

say $separator;
