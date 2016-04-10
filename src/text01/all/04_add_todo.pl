#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

print("Input todo: ");
my $content = <STDIN>;
chomp($content);
print($content, "\n");

open(my $fh, ">>", "todolist.txt") or die;
print($fh $content, "\n");
close($fh) or die;
