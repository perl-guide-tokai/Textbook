#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

open(my $fh, "<", "todolist.txt") or die;
my $count = 1;
while (defined(my $line = <$fh>)) {
    print($count, ":", $line);
    $count = $count + 1;
}
close($fh) or die;
