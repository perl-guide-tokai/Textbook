#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

my $input = <STDIN>;
chomp($input);
while ($input ne "quit") {
    $input = <STDIN>;
    chomp($input);
}
print("end...", "\n");
