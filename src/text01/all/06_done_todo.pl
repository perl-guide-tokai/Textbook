#!/usr/bin/env perl

use strict;
use warnings;

print("which number?: ");
my $num = <STDIN>;
chomp($num);

open(my $rfh, "<", "todolist.txt") or die;
my @lines;
while (defined(my $line = <$rfh>)) {
    push(@lines, $line);
}
close($rfh) or die;

open(my $wfh, ">", "todolist.txt") or die;
my $count = 1;
foreach my $line (@lines) {
    if ($num == $count) {
        $line = "Done," . $line;
    }
    print($wfh $line);
    $count = $count + 1;
}
close($wfh) or die;
