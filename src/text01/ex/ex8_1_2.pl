#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

my $filename = <STDIN>;
chomp($filename);

open(my $fh, "<", $filename) or die;
while (defined(my $line = <$fh>)) {
    print($line);
}
close($fh) or die;
