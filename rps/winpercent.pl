#!/usr/bin/perl
use warnings;
use strict;

##########
## Display human / computer win percentages
##########

#Declarations for $human_wins and $computer_wins are outside the while loop

my $human_wins=0;
my $human_score=0;
my $computer_wins=0;
my $computer_score=0;

$human_score=0;
$computer_score=0;

if($human_score > 0 or $computer_score > 0){
    $human_wins = 100 * $human_score / ($human_score + $computer_score);
    $computer_wins = 100 * $computer_score / ($human_score + $computer_score);
    
    print "\n";
    print "Your overall win % is: " . $human_wins . "%\n";
    print "Computer overall win % is: " . $computer_wins . "%\n";
    print "\n";
}
else{
    print "\n only ties so far!";
}

