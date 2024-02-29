#!/usr/bin/perl -w

use strict;
use warnings;
#IMPORTANT: Must have a blank line between chromosomes. 
#This part just searches for new lines


#Help section






local $/ = ''; #I have no idea what this does dude

#Just says what file you're opening
my $in = $ARGV[0];
my $strain = $ARGV[1];
print "Splitting up the file $in\n";
my $Chr = "_Chr";
my $label = "$strain$Chr";
my $count = "A";
my $count2 = 1;

#Opens file and creates new files?
while (<>) {
	my $nfname = "$label$count";
	my ($fileName) = $nfname;
   # my ($fileName) = /^>([^\s]+)/; #old label, we can add out own, yay :D
    open my $fh, '>', "$fileName.txt" or die "Can't write to '$fileName.txt'";
    chomp $_; #removes trailing new line, can cause issues in calculation
	print $fh $_;
    close $fh;

	#Last bit just says to stop at end chromosome, which for us is M
	if ($count eq "M"){
	last;}
	$count++;
	$count2++
	
}


print "Done, generated $count2 files.\n"