#!/usr/bin/env perl

use strict;
use warnings;

open(my $fh, "<", "ex9_4_in.txt") or die;
my $sum = 0;
while (defined(my $n = <$fh>)) {
    chomp($n);
    $sum = $sum + $n;
}
close($fh) or die;

print($sum, "\n");
