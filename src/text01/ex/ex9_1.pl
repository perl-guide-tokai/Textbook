#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

my @chars = ("alpha", "bravo", "charlie", "delta", "echo");
my $i = 0;
while ($i < 5) {
    print($chars[$i], "\n");
    $i = $i + 1;
}
