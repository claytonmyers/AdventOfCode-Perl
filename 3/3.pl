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
  my @bitcounts;
  foreach my $line (@{$input}) {
    chomp $line;
    my @bits = split //, $line;
    foreach my $i (0 .. (@bits - 1)) {
      $bitcounts[$i]->{$bits[$i]}++;
    }
  }
  my $gamma = '';
  my $epsilon = '';
  foreach my $bit (@bitcounts) {
    if ($bit->{0} > $bit->{1}) {
      $gamma .= '0';
      $epsilon .= '1';
    }
    else {
      $gamma .= '1';
      $epsilon .= '0';
    }
  }
  $gamma = oct("0b$gamma");
  $epsilon = oct("0b$epsilon");
  return $gamma * $epsilon;
}

sub part_2 {
  my ($input) = @_;
  my $lists = split_by_bit($input, 0);
  my $o2 = find_single_value(@{$lists->[1]} >= @{$lists->[0]} ? pop @{$lists} : shift @{$lists}, 1, 1);
  my $co2 = find_single_value(pop @{$lists}, 0, 1);
  chomp $o2;
  chomp $co2;
  $o2 = oct("0b$o2");
  $co2 = oct("0b$co2");
  return $o2 * $co2;
}

#Returns an arrayref of arrayrefs
#The least common starting bit (or 0 if equal) is in the 0 index,
#The most common starting bit (or 1 if equal) is in  the 1 index.
sub split_by_bit {
  my ($list, $bindex) = @_;
  my @return_lists = ([],[]);
  foreach my $item (@{$list}) {
    my @chars = split //, $item;
    push @{$return_lists[$chars[$bindex]]}, $item;
  }
  if (@{$return_lists[1]} >= @{$return_lists[0]}) {
    return \@return_lists;
  }
  else {
    return [$return_lists[1], $return_lists[0]];
  }
}

sub find_single_value {
  my ($list, $list_index, $bindex) = @_;
  $list = split_by_bit($list, $bindex)->[$list_index];
  if (@{$list} > 1) {
    return find_single_value($list, $list_index, ++$bindex);
  }
  else {
    return $list->[0];
  }
}
