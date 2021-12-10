use strict;
use warnings;

use feature qw/say/;
use FindBin qw/$Bin/;
use lib "$Bin/..";
use AOC::Common qw/read_input_file/;

my $operation = $ARGV[0];
my $input = read_input_file("$Bin/input");
if (!$operation || $operation == 1) {
  say part_1($input);
}
else {
  say part_2($input);
}

sub part_1 {
  my ($input) = @_;
  my $counter = 0;
  foreach my $in (1 .. @{$input} - 1) {
    $counter++ if $input->[$in] > $input->[$in - 1];
  }
  return $counter;
}

sub part_2 {
  my ($input) = @_;
  my $counter = 0;
  foreach my $in (4 .. @{$input} - 1) {
    $counter++ if sum_window($input, $in) > sum_window($input, $in - 1);
  }
  return $counter;
}

sub sum_window {
  my ($arr, $i) = @_;
  return $arr->[$i] + $arr->[$i - 1] + $arr->[$i - 2];
}
