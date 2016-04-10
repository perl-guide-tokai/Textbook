#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

open(my $fh, ">", "todolist.txt") or die;
print($fh "sample todo\n");
close($fh) or die;
