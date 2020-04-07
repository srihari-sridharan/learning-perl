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

# Files and Streams
# Streams (Disk file, Network data, Console data)
# A file may be network data, disk file, OS pipe, error stream, text console, keyboard, web browser, and web server.

my $filename = "linesfile.txt";
say "Reading data from $filename";

# "<"  - Open the file for read
# ">"  - Open the file for write, create if it doesn't exist clear all the contents and write to the file.
# ">>" - Append mode
# "+<" - Open a file for read and write
# "+>" - Open a file for read and write, creates new file if it doesn't exist, truncates the file content.
# When unable to open, the program exits.
open( my $fh1, "<", $filename ) or die "Cannot open $filename";
print while <$fh1>;
close $fh1;
say $separator;

# "<", $filename can be combined in a single string
open( my $fh2, "< $filename" ) or die "Cannot open $filename";
print
  while <$fh2>
  ;   # We use print as the \r\n is returned as part of the line read from file.
close $fh2;
say $separator;

# chomp safetly removes line ending character based on the OS. E.g. Windows has \r\n
say "chomp demo";
open( my $fh3, "< $filename" ) or die "Cannot open $filename";
while ( my $line = <$fh3> ) {
    chomp $line;
    say $line;
}
close $fh3;
say $separator;

my $text = "This is a line with new line character at the end.\n";
say $text;
say $separator;
chomp $text;
say "Calling chomp!";
say $text;
say $separator;

# You can use the global FH file handle, this is only for backwards compatibility.
# Always consider using a variable for file handle.
say "Reading using FH file handle";
open( FH, "< $filename" ) or die "Cannot open file $filename for write";
print while <FH>;
close FH;
say $separator;

say "Copying data from one file to another.";
my $inputfile  = "linesfile.txt";
my $outputfile = "newfile.txt";
open( my $fh4, "< $inputfile" )  or die "Cannot open file $inputfile";
open( my $fh5, "> $outputfile" ) or die "Cannot open file $outputfile";
while ( my $line = <$fh4> ) {
    print $fh5 $line;
}
close $fh5;
close $fh4;
say "Copied data from $inputfile to $outputfile!";
say $separator;

say "File IO Object Oriented Interface";
my $file = IO::File->new("< $filename") or die "Cannot open file $filename $!";
print while <$file>;
$file->close();    # this close is not technically needed.

# the OO interface for file handling closes the file when the object goes out of scope.
# Comment out the $file->close() and it should work!
say $separator;

say "Copying contents using file interface";
my $source = IO::File->new("< $inputfile")
  or die "Cannot open file $inputfile $!";
my $destination = IO::File->new("> $outputfile")
  or die "Cannot open file $inputfile $!";
while ( my $line = $source->getline() ) {
    $destination->print($line);
}

undef $source;    # undef will undefine and will in turn close a file.
$destination->close();

say "Finished copying using file interface";
say $separator;

say
"Refer https://perldoc.perl.org/5.30.0/IO/File.html and https://perldoc.perl.org/5.30.0/IO/Handle.html";

say "Binary file handling";

my $sourceImage      = "learning-perl.png";
my $destinationImage = "learning-perl-copy.png";

my $sourceImageFile = IO::File->new("< $sourceImage")
  or die "Unable to open file $sourceImage $!";
my $destinationImageFile = IO::File->new("> $destinationImage")
  or die "Unable to open file $destinationImage";

# Without the next two calls to binmode() the file might not get copied - specific to Windows(they default to text mode),
# it should work in unix based OSs without this call to binmode()!
$sourceImageFile->binmode;    # Note methods can be called without ()
$destinationImageFile->binmode();

my $buffer;
while ( my $length = $sourceImageFile->read( $buffer, 1024 ) ) {
    $destinationImageFile->print($buffer);
}

say "Completed copying image file.";
