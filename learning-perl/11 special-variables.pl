#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

my $separator =
"-------------------------------------------------------------------------------------";
say "Special variable \$_ in action...";
my @array = qw (ONE TWO THREE FOUR FIVE);
say foreach @array;       # Here value in $_ is the input to say.
say $_ foreach @array;    # Has the same effect as line #13
say $separator;

say "foreach with a variable \$v:";
foreach my $v (@array) {
    say $v;
}
say $separator;

say "foreach with \$_:";
foreach $_ (@array) {
    say $_;
}
say $separator;

say "foreach with implicit \$_:";
foreach (@array) {
    say;
}

say $separator;

# Special variables are documented @https://perldoc.perl.org/perlvar.html
say "See https://perldoc.perl.org/perlvar.html";
say $separator;

# Default function arguments
# $_ is the default scalar variable @_ is the default array variable.
# Especially function arguments are passed into this @_ array.

sub func {
    say "this is func";
    say "\@_ = [@_]";    # this prints @_ = [ONE TWO THREE]
    say "@_";            # this prints ONE TWO THREE - Interesting!
    say @_;              # this prints ONETWOTHREE - Interesting!
    say foreach @_;

    # Similar to desctructuring in JavaScript - you can do this.
    my ( $one, $two, $three ) = @_;
    say "$one $two $three";    # this prints ONE TWO THREE - Interesting!

    say "Using shift - shift by default uses the @_ default array";
    $one   = shift;
    $two   = shift;
    $three = shift;
    say "$one $two $three";    # this prints ONE TWO THREE!
    say "Default array after shifting values : \@_ = [@_]";
    say "Note that the functions 'push', 'pop', 'shift', and 'unshift'";
    say "all use the default array variable!";
    say $separator;
}

func( "ONE", "TWO", "THREE" );

# Autoflush variable $| and it is a setting. This flushses the buffer as soon as a write operation happens.
autoFlushDemo();

sub autoFlushDemo {
    say "\$| = $|";
    print('What is your favorite number? ')
      ; # Note you can use '' for strings! Using a single quote in strings doesn't handle interpolation.
        # Without the autoflush setting turned on there is possibility that
        # the print statement gets printed after the standard input.
    my $num = <STDIN>;    # This is how you get user input.
    $| = 1;
    say "\$| = $|";
    print("Your favorite number is $num");
    say $separator;
    say "The buffering problem manifests in many ways:";
    say "Output may come in the wrong order.";
    say "Webpage headers may not go out before content.";
    say "Output may be incomplete if a script ends due to an error.";
    say "If you experience any of these conditions, you may want to try";
    say "turning on autoflush using the autoflush variable and see if ";
    say "that solves the problem.";
    say $separator;
}

say "System error variable \$!";
my $filename = "file_not_exists.txt";
if ( -e $filename ) {
    say 'found';
}
else {
    my $errorString = $!;    # error is in string context.
    my $errorNumber =
      $! + 0;    # forces the error from string context to numeric context.
    say "error: $filename - $!"
      ;   # $| is the error variable. Prints "error: No such file or directory".
    say "error string: $errorString";  # error string: No such file or directory
    say "error number: $errorNumber";  # error number: 2
}
say $separator;

# System Environment Variables - %ENV
say "Printing System Environment Variables:";
say $separator;
foreach my $key ( sort keys %ENV )
{ # Remember % indicates a hash and 'sort keys %ENV' sorts the keys alphabetically.
    say "$key = $ENV{$key}";    # We use $ENV to access a scalar in a hash.
    say $separator;
}
say "Completed Printing System Environment Variables.";
say $separator;

say "\$0 gives the name of this perl script.";
say $0; # In mac this printed the full path, whereas in windows it prints the filename.
say $separator;

say "\$^O (letter O) prints Operating System";
say $^O;
say $separator;

say "\$^V prints version of Perl";
say $^V;
say $separator;
say $UID;

# Remember: Special variables are documented @https://perldoc.perl.org/perlvar.html
say "Remember --> See https://perldoc.perl.org/perlvar.html";
say $separator;
