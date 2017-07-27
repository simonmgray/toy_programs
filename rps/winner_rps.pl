#!/usr/bin/perl
use warnings;
use strict;

my $human_score=0;
my $computer_score=0;
my $input=0;
my $computer_throw=0;

print "\n human throw";
chomp($input = <STDIN>);

print "\n computer throw";
chomp($computer_throw = <STDIN>);

if($computer_throw eq $input){
    print "\nTie! No winner is recorded\n"
}
elsif($computer_throw eq 'r' and $input eq 'p'){
    $human_score = $human_score + 1;
}
elsif($computer_throw eq 'r' and $input eq 's'){
    $computer_score = $computer_score + 1;
}
elsif($computer_throw eq 'p' and $input eq 'r'){
    $computer_score = $computer_score + 1;
}
elsif($computer_throw eq 'p' and $input eq 's'){
    $human_score = $human_score + 1;
}
elsif($computer_throw eq 's' and $input eq 'r'){
    $human_score = $human_score + 1;
}
else{
    $computer_score = $computer_score + 1;
}

print "\nhuman score is " . $human_score;
print "\ncomputer score is " . $computer_score;
