#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

# 入力
open(my $rfh, "<", "ex7_4_in.txt") or die;
my $op1 = <$rfh>;
chomp($op1);
my $op2 = <$rfh>;
chomp($op2);
close($rfh) or die;

# 出力
open(my $wfh, ">", "ex7_4_out.txt") or die;
print($wfh $op1 + $op2, "\n");
print($wfh $op1 * $op2, "\n");
print($wfh $op1 x $op2, "\n");
close($wfh) or die;
