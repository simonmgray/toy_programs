#!/usr/bin/perl
use warnings;

chomp($input = <STDIN>);  #This standard input allows user to input the numbers to calculate mean, and removes the new line character

@values = split /,/, $input; #This splits the string of numbers into an array of numbers

$l = scalar(@values);

$sum=0;
for($i=0;$i<$l;$i++){
    $sum = $sum + $values[$i];
}

$mean=$sum/$l;
print($mean);

