#!/usr/bin/env perl

use strict;
use warnings;

my $filename = <STDIN>;
chomp($filename);

open(my $fh, "<", $filename) or die;
while (defined(my $line = <$fh>)) {
    print($line);
}
close($fh) or die;
