#!/usr/bin/perl -w

#This is outdated, check FastACleaner.pl or better version
#Print unless first character is >?

my $fh = $ARGV[0];#

#Find out how many lines in file
open(GF, '<',$fh) or die "Reference file cannot be opened";
my $countL = 0;
$countL++ while <GF>;
my $Cleancount = $countL;
close GF;

#Aesthetics
print "Starting clean up...\n";
print "Total number of lines: $Cleancount\n";

#Try to make a way to auto label file with input?

#Now write new file
open(my $NF,'>', <Cleaned.txt>);
close $NF;


#Start Counter
my $count = 0;


$filename = <"Cleaned.txt">; #Create file for writing
open($NF, '>',$filename) or die "Could not update file.";
open($GF, '<', $fh) or die; 

#Add somewhat of a label here
print $NF ">$fh\n";


#Actual loop to remove any > in FASTA
while (<$GF>){
	next if /^>/;
	print $NF $_;
	$count++;
}
close $NF;

#Count number of lines removed
open(NF, '<',$filename) or die "Could not update file.";
my $countN = 0;
$countN++ while <NF>;
my $Skips = $countL - $countN;
close $NF;

#This part is just a flex on my end
if ($Skips == 1){
print "Removed $Skips line.\n"}
else{
print "Removed $Skips lines.\n";
}
;
print "Remember to update file name.\n";

close $GF; 



exit;