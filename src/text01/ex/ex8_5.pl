#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

my $n = 1;
while ($n < 20) {
    print($n, "\n");
    $n = $n + 3; # 3ずつ離れている
}
