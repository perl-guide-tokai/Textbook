#!/usr/bin/env perl

use strict;
use warnings;

my $input = <STDIN>;
chomp($input);
while ($input ne "quit") {
    $input = <STDIN>;
    chomp($input);
}
print("end...", "\n");
