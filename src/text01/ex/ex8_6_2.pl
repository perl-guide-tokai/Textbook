#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

my $input;
while (!defined($input) or $input ne "quit") {
    $input = <STDIN>;
    chomp($input);
}
print("end...", "\n");
