# Learning Perl

This repository helps anyone learn Perl from scratch.

To run the code in a file, use the Perl interpreter from command line:

e.g. `perl .\01-hello-world.pl`

## Files

```
learning-perl
│ 01-hello-world.pl
│ 02-count-lines-readall.pl
│ 03-count-lines-readline.pl
│ 04-count-lines-subs.pl
│ 05-basic-syntax.pl
│ 06-lists-and-arrays.pl
│ 07-hashes.pl
│ 08-constants.pl
│ 09-conditionals.pl
│ 10-loops.pl
│ 11-special-variables.pl
│ 12-operators.pl
│ 13-functions.pl
│ 14-references.pl
│ 15-modules.pl
│ 16-file-i-o.pl
│ 17-built-in-functions.pl
│ 18-regular-expressions.pl
│ best-practices.pl
│ learning-perl-copy.png
│ learning-perl.png
│ linesfile.txt
│ newfile.txt
│ say-demo.txt
│
└───Modules
Person.pm
```

## Helpful Practices

- Consistency - There is more than one way to do something in Perl. Be consistent in what you/your team does.
- ; semicolons - Always use semi-colons as line terminating character. Perl treats ; as a separator.
- {} blocks of code - Clearly demarcate blocks of code with {}
- Variable names : `my $variable_name`; - Always use the `my` keyword to declare variables and name them all lowercase separated by `_`.
- Package: `Modules::Person` - Packages should be named in PascalCase!
- Objects: `my $person = Module::Person;` - Name object references in camelCase.
- Constants: `CONSTANT_NAME` - Declare constants in `ALL_CAPS` with `_` separator. Try explaining constant, e.g. `MAX_THREAD_COUNT`, a comment explaining what it means, will help readers understand the intent.
- Functions: `sub function_name{}` - Name functions in all lowercase separated by `_`.
- Follow practices for writing highly maintainable code.
- Spaces (Vertical and Horizontal), Comments, Naming Conventions, etc.
- Follow 30s rule
- JavaDoc style description for methods
- use strict and use warnings (e.g. using `@array[index]` instead of `$array[index]` is wrong - this is thrown as a warning)
- The pragmas below helps us write 'Clean Perl'.

```Perl
use strict;
use warnings;
use diagnostics;
```
