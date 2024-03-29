#!/usr/bin/perl -w

use strict;
use warnings;

my $in = $ARGV[0];

#Purpose
#Get the number of duplicate outputs in Bedtools to condense file down 
#Usage: perl BunkBed.pl <file.bed>

#Needs way to count how many "Bunks" or repeats for each ocurrence, but works to reduce the amount of data 
open(my $FH, '<',$in) or die "$in cannot be opened.\nUse perl BunkBed.pl -h for help.\n";
open (my $OF, ">", "TuckedIn.bed");

print "Bunking duplicate genes.\n"; 


my $line = <$FH>;
my $dl; 
my $count =0; 

#Hash to store seen values
my %seen = (); 
my @uniq = (); 

#Header for output file
print $OF "chrom\tchromStart\tchromEnd\tname\t\tbedChrom\tsource\ttype\tbedStart\tbedEnd\t?\tstrand\t?\tGeneInfo\n";



while (<$FH>){

#Split up as usual 
foreach $line (<$FH>){
	chomp $line; 
	my @line = split /\s+/,$line;
	my $label = $line[12];
	my $Chr = $line[0];
	my $pos = $line [7];
	my $dl = "$Chr$pos";
	++$count; 
	


unless ($seen{$dl}){ #Fancy little line that makes it so that you only print out new Reference values
#Still need to find a way to count duplicates, but works to compress data for now


print $count;

print "$count++\n";
print $OF "$line\n";

$seen{$dl} = 1; #Print X amount of times a thing is seen

}}
}
print "Done!\n";

exit; 
