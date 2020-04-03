#!usr/bin/perl
# The pragmas below helps us write 'clean code' in Perl
use strict;
use warnings;
use diagnostics;
use 5.18.0;
use feature 'say';

my $separator =
"-------------------------------------------------------------------------------------";

say "Hash are also known as associative arrays!";

my %hash = (
    one   => 1,
    two   => 2,
    three => 3,
    four  => 4,
    five  => 5,
    six   => 6
);

say "Calling say %hash";
say %hash;
say $separator;

say
"Iterating the hash using a while each produces different order of keys / values. Run again to see a different order of keys.";
while ( my ( $key, $value ) = each %hash ) {
    say "$key -> $value";
}
say $separator;

say
"Adding elements to the hash - note the use of \$ as we are operating on an element in the hash";
$hash{seven} = 7;
$hash{eight} = 8;
while ( my ( $key, $value ) = each %hash ) {
    say "$key -> $value";
}
say $separator;

say "Updating the existing elements";
$hash{seven} = "SEVEN";
$hash{eight} = "EIGHT";
while ( my ( $key, $value ) = each %hash ) {
    say "$key -> $value";
}
say $separator;

say "Use 'delete' to delete an element";
delete $hash{eight};
while ( my ( $key, $value ) = each %hash ) {
    say "$key -> $value";
}
say $separator;

foreach my $key ( sort ( keys %hash ) ) {
    my $value = $hash{$key};
    say "$key -> $value";
}
