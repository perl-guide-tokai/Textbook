#!/usr/bin/env perl

use strict;
use warnings;

use File::Temp;
use Cwd;

print("current directory: ", cwd(), "\n");

my $temp_dir = File::Temp::tempdir(CLEANUP => 1);
chdir($temp_dir) or die;

print("new     directory: ", cwd(), "\n");
