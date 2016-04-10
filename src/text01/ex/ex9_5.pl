#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

open(my $fh, "<", "ex9_4_in.txt") or die;
my $sum = 0;
while (defined(my $n = <$fh>)) {
    chomp($n);
    if ($n % 2 != 0) {
        $sum = $sum + $n;
    }
}
close($fh) or die;

print($sum, "\n");
