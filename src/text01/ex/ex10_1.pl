#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

# 入力
my $ymd = <STDIN>;
chomp($ymd);
my ($y, $m, $d) = split(/,/, $ymd);

# 出力
print($y, "年", $m, "月", $d, "日です", "\n");
