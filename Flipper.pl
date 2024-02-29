#!/usr/bin/perl -w

use strict;
use warnings;

#Purpose: Reverse contig to match with accepted plot
#Usage : perl Seqques.pl <file.fasta>
#May be multifastA

#Define arguments
my $in = $ARGV[0];

#Help section
if ($in eq "-h"){
print "Purpose: Reverse contig to match with accepted plot\nUsage:perl Seqques.pl <file.fasta>";}

#Open files
open (my $IF,"<",$in) or print "$in cannot be opened" and exit;
open (my $OF, ">","Complement.txt");

#Opens file and swaps letters and flips sequence
while (my $line = <$IF>){
  if ($line =~ m/[>]/){#To keep headers unchanged
  print $OF $line; 
}else{
	$line =~ tr/ATGCatcg/TACGtagc/;
	my $reverse = reverse($line); 
	print $OF $reverse;
}}

exit; 


