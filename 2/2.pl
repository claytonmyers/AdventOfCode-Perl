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
  my $hori = 0;
  my $vert = 0;
  foreach my $line (@{$input}) {
    my ($dir, $num) = split / /, $line;
    if ($dir =~ m/forward/) {
      $hori += $num;
    }
    elsif ($dir =~ m/up/) {
      $vert -= $num;
    }
    else {
      $vert += $num;
    }
  }
  return $hori * $vert;
}

sub part_2 {
  my ($input) = @_;
  my $hori = 0;
  my $vert = 0;
  my $aim = 0;
  foreach my $line (@{$input}) {
    my ($dir, $num) = split / /, $line;
    if ($dir =~ m/forward/) {
      $hori += $num;
      $vert += $num * $aim;
    }
    elsif ($dir =~ m/up/) {
      $aim -= $num;
    }
    else {
      $aim += $num;
    }
  }
  return $hori * $vert;
}
