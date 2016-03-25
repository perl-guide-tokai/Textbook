#!/usr/bin/env perl

use strict;
use warnings;

my @names = ("fred", "betty", "dino", "wilma", "pebbles", "bamm-bamm");

my @indices;
while (defined(my $n = <STDIN>)) {
    chomp($n);
    push(@indices, $n - 1);
}

foreach my $index (@indices) {
    print $names[$index], "\n"; # 添字とズレているので注意
}
