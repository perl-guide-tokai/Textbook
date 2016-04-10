#!/usr/bin/env perl

use strict;
use warnings;
use utf8;

my @lines = `perldoc -u -f atan2`;
foreach (@lines) {
    s/\w<([^>]+)>/\U$1/g;
    print;
}
