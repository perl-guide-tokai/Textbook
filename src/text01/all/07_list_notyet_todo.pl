#!/usr/bin/env perl

use strict;
use warnings;

open(my $fh, "<", "todolist.txt") or die;
my $count = 1;
while (defined(my $line = <$fh>)) {
    chomp($line);
    my ($state, $content) = split(/,/, $line);
    if ($state ne "Done") {
        print($count, ":", $line, "\n");
    }
    $count = $count + 1;
}
close($fh) or die;
