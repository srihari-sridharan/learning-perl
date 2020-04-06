#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

# Reference is a scalar that refers to a value. The target value may be a scalar, array, hash or a function.
# We create a reference with the \ - reference operator
# my $rs = \$scalar;
# my $ra = \@array;
# my $rh = \%hash;
# my $rf = \&function;

# We can then access the target value by dereferencing.
# ${$rs};
# @{$ra};
# %{$rh};
# &{$rf};

# Dereference using -> arrow operator
# $ra->[i] (access element at index i)
# $rh->{key} (access value stored for key)
# $rf->() (call the function)

# Anonymous structures
# $ra = [1, 2, 3];
# $rh = { a => 1, b => 2, c => 3 };
# $rf = sub {say "Hello"};

# Handy in creating complex data strucures.

# ref function returns the type of the reference value.
my $separator =
"-------------------------------------------------------------------------------------";

# Array References
say "Array reference";
my @array = ( 1, 2, 3, 4, 5 );
my $ra    = \@array;             # Creating an array reference
say
  "$ra"; # Prints the address / reference - something like this ARRAY(0x2713bd8)
say foreach @{$ra};    # Dereferencing and accessing an array
say $separator;
say foreach @$ra
  ; # Dereferencing works even without the curly braces, it makes it hard to understand the code. Use @{}.
say $separator;

# Anonymous array is initialized inside of a []
say "Anonymous array";
my $refArray = [qw(one two three four five)];
say foreach @{$refArray};
say $separator;

# Note you cannot use anonymous lists (1,2,3) instead of array [1,2,3].
# List is a literal object and it doesn't have an address.

# You can access individual elements using the subscript[]
say "Array subscript \${\$refArray}[0]";
${$refArray}[0] = 1;
say foreach @{$refArray};
say $separator;

# easy way is using the -> operator;
say "Accessing array elements using arrow operator -> \$refArray->[0]";
$refArray->[0] = "one";
say foreach @{$refArray};
say $separator;

# Hash references
my %hash = (
    one   => 1,
    two   => 2,
    three => 3
);

my $refHash = \%hash;

# Anonymous hash is initialized inside of a {}
# Another way to initialize a hash reference
$refHash = {
    one   => 1,
    two   => 2,
    three => 3
};

say "Dereferencing a hash: \${\$refHash}{\$k}";
foreach my $k ( sort keys %{$refHash} ) {
    say "$k ${$refHash}{$k}";
}
say $separator;

say "Dereferencing a hash using the -> arrow operator: \$refHash->{\$k}";
foreach my $k ( sort keys %{$refHash} ) {
    say "$k $refHash->{$k}";
}
say $separator;

say "Setting values using \${\$refHash}{\$k}";
${$refHash}{one}   = "ONE";
${$refHash}{two}   = "TWO";
${$refHash}{three} = "THREE";
foreach my $k ( sort keys %{$refHash} ) {
    say "$k ${$refHash}{$k}";
}
say $separator;

say "Setting values using \$refHash->{\$k}";
$refHash->{one}   = 1;
$refHash->{two}   = 2;
$refHash->{three} = 3;
foreach my $k ( sort keys %{$refHash} ) {
    say "$k $refHash->{$k}";
}
say $separator;

say "Function References";

my $refMyFunction = \&myFunction;
say $refMyFunction;    # CODE(0x28d72d8);

sub myFunction {
    say "This is inside myFunction";
    say $separator;    # Variable in file scope referred here.
}

say "Calling using function reference \$refMyFunction - $refMyFunction.";
&{$refMyFunction}();

say "Calling a function using -> arrow operator \$refMyFunction->().";
$refMyFunction->();

# Anonymous functions
say "Anonymous functions";
my $refAnonymousFunction = sub {
    say "This is an anonymous function.";
    say $separator;    # Variable in file scope referred here.
};
$refAnonymousFunction->();

# Returning function from function
say "Returning function from function";

sub higherOrderFunction {
    say "Returning an anonymous function!";

    return sub {
        say "This is a function returned from a function.";
        say $separator;    # Variable in file scope referred here.
    };
}

my $returnedFunction = higherOrderFunction();
$returnedFunction->();

# Returning a function that uses a variable local to the parent function.
say "Returning a function that uses a variable local to the parent function.";

sub getFunction {
    my $local = "This is local to getFunction()";
    return sub {
        say $local;
        say $separator;    # Variable in file scope referred here.
    };
}

my $func = getFunction();
$func->();                 # prints - "This is local to getFunction()"

# Closures are powerful and they can help us in a great way!
say "Closures in action:";

sub counter {
    my $counter = shift || 1;
    return sub {
        say $counter++;
    }
}

# Even though we call the same function, there are two separate closures getting created!
my $countFrom1   = counter();
my $countFrom100 = counter(100);

$countFrom1->();    # 1
$countFrom1->();    # 2
$countFrom1->();    # 3
$countFrom1->();    # 4
$countFrom1->();    # 5

$countFrom100->();  #100
$countFrom100->();  #101
$countFrom100->();  #102
$countFrom100->();  #103
$countFrom100->();  #104

$countFrom1->();    #6
$countFrom100->();  #105
$countFrom1->();    #7
$countFrom100->();  #106
$countFrom1->();    #8
$countFrom100->();  #107
$countFrom1->();    #9
$countFrom100->();  #108
$countFrom1->();    #10
$countFrom100->();  #109
$countFrom100->();  #110
say $separator;

say "Determine type of reference...";
determineReference( [ 1, 2, 3 ] );    #ARRAY
determineReference( { one => 1, two => 2, three => 3 } );    #HASH
determineReference( sub { say "Hello"; } );                  #CODE
determineReference();

sub determineReference {
    my $ref = shift;
    if ($ref) {
        say ref($ref);
    }
    else {
        say "Please pass in a valid reference.";
    }
}
say $separator;

say "Mixed data structures";

# Array of hashes
my $instruments = [];
push @{$instruments}, { name => 'Tabla' };
push @{$instruments}, { name => 'Violin' };
push @{$instruments}, { name => 'Keyboard' };

# Value of a hash is an array!
push @{$instruments}, { name => [ 'Harp', 'Sitar' ] };

foreach my $instrument ( @{$instruments} ) {

    # Destructure the array from the hash when the type of ref is ARRAY
    # Join using ", "
    my $instrumentName =
      ( ref( $instrument->{name} ) eq 'ARRAY' )
      ? join( ', ', @{ $instrument->{name} } )
      : $instrument->{name};
    say "$instrumentName";
}

say $separator;

