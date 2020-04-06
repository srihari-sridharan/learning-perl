#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

say "Perl doesn't have constants, but it gives us a pragma that we can use.";

use constant PI    => 3.14285714286;
use constant TRUE  => 1;
use constant FALSE => 0;

# Another way to define constants is to use {};
# The last comma is not mandatory, but helps as you add more items.
use constant {
    MAX_NUMBER_OF_FILES        => 6,
    MAX_DEGREES_OF_PARALLELISM => 4,
    MIN_NUMBER_OF_THREADS      => 2,
};    # <---- This semicolon is important as constant is a pragma!
#

say PI;
say TRUE;
say FALSE;
say MAX_NUMBER_OF_FILES;
say MAX_DEGREES_OF_PARALLELISM;
say MIN_NUMBER_OF_THREADS;

# An alternative to constant is the use sub to directly return the value.

sub MAX_ITEM_COUNT { 25 }

say MAX_ITEM_COUNT
  ; # Some developers do this instead of constants. The use constants pragma internally does this.
