#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

my $i = 1;
my $sum = 0;
while ($i <= 10) {
    $sum = $sum + $i;
    $i = $i + 1;
}
print($sum, "\n");
