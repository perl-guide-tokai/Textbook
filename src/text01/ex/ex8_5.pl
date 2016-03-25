#!/usr/bin/env perl

use strict;
use warnings;

my $n = 1;
while ($n < 20) {
    print($n, "\n");
    $n = $n + 3; # 3ずつ離れている
}
