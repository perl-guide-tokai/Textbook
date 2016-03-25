#!/usr/bin/env perl

use strict;
use warnings;

my $op1 = <STDIN>; # 入力を受け取る
chomp($op1); # 入力された改行文字を削除する

my $op2 = <STDIN>;
chomp($op2);

print($op1 + $op2, "\n");
print($op1 - $op2, "\n");
print($op1 * $op2, "\n");
print($op1 / $op2, "\n");
print($op1 . $op2, "\n");
print($op1 x $op2, "\n");
