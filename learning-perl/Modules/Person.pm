# Modules::Person.pm

# Name the modules to follow directory structure.
# This is similar in convention used in .NET namespaces.
package Modules::Person;

# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

our $VERSION = "1.0";

# It is just a convention that the constructor is called new
# There is no mandate! However just follow conventions, so that
# developers break their head trying to understand your code!

# It makes sense to hold the object's data in a hash!
sub new {

    # First call shift to get the type!
    my $type = shift;

    # say $type; # This prints Module::Person

# Use the ref function to get a reference to the type or the name of the type itself
    my $class = ref($type) || $type;

    # This hash will hold the members of the class
    my $self = {};

# This function tells the thingy referenced by REF that it is now an object in the CLASSNAME package.
# If CLASSNAME is an empty string, it is interpreted as referring to the main package.
# If CLASSNAME is omitted, the current package is used. Because a bless is often the last thing
# in a constructor, it returns the reference for convenience.
# Always use the two-argument version if a derived class might inherit the method
# doing the blessing. See perlobj for more about the blessing (and blessings) of objects.
# https://perldoc.perl.org/functions/bless.html

    # bless maps the class to this hash
    bless( $self, $class );

    # Call shift and assign the objects to members in the hash.
    $self->{firstName} = shift || "";
    $self->{lastName}  = shift || "";

    # Return the instance
    return $self;
}

sub getFirstName {
    my $self = shift;

    # say $self; # First argument of the function is the hash!
    return $self->{firstName};
}

sub getLastName {
    my $self = shift;

    # say $self; # First argument of the function is the hash!
    return $self->{lastName};
}

sub wish {
    my $self = shift;

    # Second argument is the function parameter.
    my $wish = shift || "You didn't wish for anything!";
    return "You wished for : $wish";
}

sub version {
    shift;
    return $VERSION;
}

# end the module with a true value. 1; is traditional and it is for backward compatibility.
1;
