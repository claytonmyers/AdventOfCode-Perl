package AOC::Common;

use strict;
use warnings;
use IO::All;
use Exporter;
our @ISA = qw/Exporter/;
our @EXPORT_OK = qw/read_input_file/;

sub read_input_file {
  my ($file) = @_;
  my @lines = io($file)->slurp;
  use Data::Dumper;
  return \@lines;
}
