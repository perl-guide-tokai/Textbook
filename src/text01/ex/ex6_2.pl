#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

open(my $fh, ">", "sample.txt") or die;
print($fh "This is test file.", "\n");
print($fh "書き込まれているでしょうか?", "\n");
close($fh) or die;
