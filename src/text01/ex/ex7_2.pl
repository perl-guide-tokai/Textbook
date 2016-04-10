#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

# 入力
my $r = <STDIN>; chomp($r);

# 出力
my $pi = 3.14;
print("半径: ", $r, " の円周は ", 2 * $pi * $r, "\n");
