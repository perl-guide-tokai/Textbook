#!/usr/bin/env perl
use strict;
use warnings;

open(my $fh, "<", "ex8_1_in.txt") or die;
while (defined(my $line = <$fh>)) {
    print($line);
}
close($fh) or die;
