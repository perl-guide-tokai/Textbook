#!/usr/bin/env perl

use strict;
use warnings;

my $r = <STDIN>;
chomp($r);
if ($r < 0) {
    $r = 0;
}

my $pi = 3.14;
print(2 * $pi * $r, "\n");
