#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';
use Carp;    # Powerful error reporting tool.
my $separator =
"-------------------------------------------------------------------------------------";

# Modules are containers for code! Perl modules can contain functions, data and classes.
# CPAN - Comprehensice Perl Archive Network - similar to NPM for Node.js and Nuget for .NET
# Module help in reusablility

#use Modules::Person;
require './Modules/Person.pm';

my $person    = Modules::Person->new( "Srihari", "Sridharan" );
my $firstName = $person->getFirstName();
my $lastName  = $person->getLastName();
my $wish      = $person->wish("happiness");
say "First Name: $firstName";
say "Last Name: $lastName";
say "$wish";
say $person;    # Name of the class and hash! Modules::Person=HASH(0xf7c838)

sub carpDemo {
    carp "This is an error scenario!";
}

# carp shows the error with a stack trace!
carpDemo();

# Instead of  carp try the following die, croak, confess: Exercise.

# warn user (from perspective of caller)
carp "string trimmed to 80 chars";

# cluck, longmess and shortmess not exported by default
use Carp qw(cluck longmess shortmess);
cluck "This is how we got here!";    # warn with stack backtrace
my $long_message  = longmess("message from cluck() or confess()");
my $short_message = shortmess("message from carp() or croak()");

say $separator;

# die of errors (from perspective of caller)
croak "We're outta here!";

# die of errors with stack backtrace
confess "not implemented";
