#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

my $separator =
"-------------------------------------------------------------------------------------";

say "Regular expressions in Perl.";
say "Matching text";

sub EvaluateRegex {
    my $text  = shift;
    my $regex = shift;
    if ( !$regex || !$text ) {
        say "Provide a text and regular expression as arguments.";
        return;
    }

    # =~ is the match operator
    say $text =~ $regex ? 'True' : 'False';
}

my $text = "This is a line of text";
EvaluateRegex( $text, qr/line/ );    # True - Exact match
EvaluateRegex( $text, qr/l*ne/ );    # True - * wild card - 0 or more characters
EvaluateRegex( $text, qr/l.ne/ );    # True - . one character
EvaluateRegex( $text, qr/LINE/ );    # False
EvaluateRegex( $text, qr/LINE/i );   # True - Ignore case

say foreach $text =~ /i/;            # Prints 1 - First match
say foreach $text =~ /i/g;           # global switch - all matches
say $separator;

$text = "This is a line\nwith more than one line\n";
EvaluateRegex( $text, qr/e.w/ )
  ;    # False - as the \n character between e and w is treated as two lines
EvaluateRegex( $text, qr/e.w/s )
  ;    # True - as the \n character between e and w is treated as single line
EvaluateRegex( $text, qr/^w/ )
  ;    # False - note this is the first character in the second line
EvaluateRegex( $text, qr/^w/s )
  ;    # False - note this is the first character in the second line
EvaluateRegex( $text, qr/^w/m )
  ;    # True - m switch treats the string as multiple lines
EvaluateRegex(
    $text, qr/
    ^w
    .*
    line
    $
    /mx
);     # False - without the x switch.
EvaluateRegex(
    $text, qr/
    ^w
    .*
    line
    $
    /mx
  )
  ; # x switch lets you write the regex in multiple lines - readable or not depends on personal choice.

say "See https://perldoc.perl.org/perlre.html#Modifiers";
say $separator;

sub ExtractMatch {
    my $text  = shift;
    my $regex = shift;

    if ( !$regex || !$text ) {
        say "Provide a text and regular expression as arguments.";
        return;
    }

    # =~ is the match operator
    if ( $text =~ $regex ) {
        say "Match #1 is '$1'" if $1;
        say "Match #2 is '$2'" if $2;
        say "Match #3 is '$3'" if $3;
    }
    else { say "No match"; }
}

$text = "This is a line of text";
ExtractMatch( $text, qr/(line)/ );               # Match #1 is 'line'
ExtractMatch( $text, qr/(..is)/ );               # Match #1 is 'This'
ExtractMatch( $text, qr/(..is).*(..ne).(..)/ )
  ;    # Match #1 is 'This' \n Match #2 is 'line' \n Match #3 is 'of'

say $separator;

say "List of matches";

my @array =
  $text =~ /i(.)/g;    # Here we return a list of matching elements. /g global!

# The return value is based on what is inside the parenthesis (.) in this case the
# character next to letter 'i'.

say foreach @array;

# Or can be written as
say foreach $text =~ /i(.)/g;
say $separator;

$text = "This is a line of text";
say "^ matches beginning of string";
EvaluateRegex( $text, qr/^T/ );    #True
EvaluateRegex( $text, qr/^i/ );    #False

say "\$ matches end of string";
EvaluateRegex( $text, qr/t$/ );    #True
EvaluateRegex( $text, qr/i$/ );    #False

say "'n' characters in a row char{n}";
$text = "AAA is American Automobiles Association";
EvaluateRegex( $text, qr/A{3}/ );

say "'n,m' between n and m characters in a row char{n,m}";
EvaluateRegex( $text, qr/A{3,5}/ );    # True
EvaluateRegex( $text, qr/A{4,6}/ );    # False
say foreach $text =~ qr/(A{3,5})/;
say foreach $text =~ qr/(A{4,6})/;
say $separator;

$text = "This is a line of text";
say "Matching wildcards";
ExtractMatch( $text, qr/(t.xt)/ );     # . wildcard for  single character.
ExtractMatch( $text, qr/(t.xt.)/ )
  ; # No match as you cannot match past the end of string 'text' is the end of string, no characters after that.
ExtractMatch( $text, qr/(t+)/ );   # + is more or more of the matching character
$text = "This is a line of tttttttext";
ExtractMatch( $text, qr/(t+)/ );    # Prints Match #1 is 'ttttttt'
$text = "This is a line of text";
ExtractMatch( $text, qr/(lin*)/ )
  ;    # Matches 0 or more instances of a character. Match #1 is 'lin'
$text = "This is a linnnnne of text";
ExtractMatch( $text, qr/(lin*)/ );    # Match #1 is 'linnnnn'
$text = "This is a line of text";
ExtractMatch( $text, qr/line (.*)/ )
  ; # Matches 'line ' and gets all characters till end of string. Match #1 is 'of text'
ExtractMatch( $text, qr/(l.*e)/ )
  ; # Matches everything from first 'l' and last 'e' - includes all character in between.

# Wildcard includes as may characters as possible - Output is : Match #1 is 'line of te'
# If we put a ? before e like qr/(l.*?e)/, then it gets till the first occurence of 'e'.
ExtractMatch( $text, qr/(l.*?e)/ );    # Match #1 is 'line'

# ? has a different meaning when used next to a letter instead of wildcard.
ExtractMatch( $text, qr/(lin?e)/ )
  ; # Matches when there is 0 or more occurence of n - n is optional . Match #1 is 'line'
$text = "This is a lie of text";
ExtractMatch( $text, qr/(lin?e)/ );    # Match #1 is 'lie'
say $separator;

say "Matching classes of characters";
say 'White spaces...';
$text = "This is a line of text";
ExtractMatch( $text, qr/(\s)/ );       # \s matches space. Match #1 is ' '
$text = "ThisIsALineOfTextWithoutSpaces";
ExtractMatch( $text, qr/(\s)/ );       # No match
$text = "This is a line of text";
ExtractMatch( $text, qr/(\S)/ );       #  \S matches non space. Match #1 is 'T'
say $separator;

say 'Non white space characters / words';
say foreach $text =~ /(\S)/g;    # Prints all the characters except spaces.
say foreach $text =~ /(\S+)/g
  ;    # + groups the non-while space characters together - now we get words.
say $separator;

# d - digits and D - non digits
$text = "12345678 is a sequence of numbers.";
say foreach $text =~ /(\d)/g;    # Prints all the digits.
say $separator;

say foreach $text =~ /(\D)/g;    # Prints all non digits
say $separator;

say foreach $text =~ /(\D+)/g;    # Prints all non digits as words
say $separator;

say foreach $text =~ /(\w+)/g;    # Words numbers and characters.
say $separator;

say "[$_]"
  foreach $text =~
  /(\W+)/g;    # Non word characters (spaces) - printed inside a []
say $separator;

say foreach $text =~ /([1234567890]+)/g
  ;    # Will get all the digits. [] lets us define custom class of characters
say foreach $text =~ /([0-9]+)/g;  # Alternate syntax [0-9] - defines the range.
say $separator;

say foreach $text =~ /([^0-9]+)/g;    # [^0-9] - everything that is not digits.
$text = "12345678 is a sequence of Numbers";
say $separator;

say foreach $text =~ /([a-z]+)/g;     # All lowercase letters are obtained.
say $separator;

say foreach $text =~
  /([a-zA-Z]+)/g;    # All lowercase and UPPERCASE letters are obtained.
say $separator;

say foreach $text =~ /([0-9a-zA-Z]+)/g
  ;    # All numbers, lowercase and UPPERCASE letters are obtained.
say $separator;

say
"Matching meta characters () - as these are used to return the matched expression. Use \( to search for matching (";
$text = "This is a (line of text)";
say foreach $text =~ /(\(.*\))/g;    #Prints (line of text)
say "Use \\ escape sequence in regex for { } [ ] ( ) ^ \$ . | * + ? \\";
say $separator;

$text = "This is a line of text";
$text =~ s/This is/Is/;              # Find and replace
say $text;                           # Is a line of text
say $separator;

$text = "This is a line of text";
$text =~ s/[is]/e/;                  # First occurence of i or s
say $text;
say $separator;

$text =~ s/[is]/e/g;                 # All occurences of i or s global switch g.
say $text;                           # Thee ee a lene of text
say $separator;

$text = "This is a line of text";
$text =~ s/(l\w+)/$1 $1 $1/
  ; # find the word starting with l and w+ is take all characters till the end of the word.

# $1 is the first match and we repeat it thrice.
say $text;
say $separator;

$text = "This is a line of text";
$text =~ s/(l\w+)\s+(\w+)/$1 $1 $1 $2 $2/; # 2 words \w+
say $text;                                 # This is a line line line of of text
say $separator;

# Practical example of adding , to numbers in 1000s, million, etc.
my $n = 9876543210;
while ( $n =~ s/^(-?\d+)(\d{3})/$1,$2/ ) {

    # say $n; # Uncomment this line to see this in action!
}
say $n;
say $separator;

say "Split string";
$text = "This is a line of text";

my @a = split( /\s+/, $text );
say foreach @a;
say $separator;

$text = "This.is,a.line.of.text";
say "Split by . and ,";
say foreach split( /[,.]\s*/, $text );
say $separator;
