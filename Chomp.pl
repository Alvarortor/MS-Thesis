#!/usr/bin/perl -w

use strict;
use warnings;

#Purpose: Converts FastA and multiFastA into a .txt format readable by Seqstracter. Allows for extraction of genomic regions. 
#Usage: perl Chomp.pl <File.fastA> <OutputName>

#Define arguments
my $in = $ARGV[0];
my $outname = $ARGV[1]; 

#Help section
if (($in or $outname) eq "-h"){
	print "Purpose: Converts FastA and multiFastA into a .txt format readable by Seqstracter.\nAllows for extraction of genomic regions.\nUsage: perl Chomp.pl <File.fastA> <OutputName>" and exit;
}

#Create file names
my $FH = "_chomp.txt";
my $name = $outname.$FH; 

#Counter
my $count = 0; 

#Open in and output files
open(my $IF,"<",$in) or print "Error:$in cannot be opened" and exit;
open (my $OF, ">",$name);


#Extract sequence and get the lines organized. 
while (my $line = <$IF>){
	if (($line =~ m/[>]/)){#To keep headers unchanged
	$count++; 
	if ($count>1){
	print $OF "\n$line";
	}else{
	print $OF $line;
	}
}else{
	chomp $line; 
	print $OF $line; 
}}
print "Chomped!"; 

exit; 
