#!/usr/bin/env perl

use strict;
use warnings;

my $n = <STDIN>;
chomp($n);

my $i = 1;
my $sum = 0;
while ($i <= $n) {
    $sum = $sum + $i;
    $i = $i + 1;
}
print($sum, "\n");
