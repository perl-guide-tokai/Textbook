#!/usr/bin/env perl

use strict;
use warnings;

my $input;
while (!defined($input) or $input ne "quit") {
    $input = <STDIN>;
    chomp($input);
}
print("end...", "\n");
