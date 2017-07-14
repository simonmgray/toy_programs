#!/usr/bin/perl
use warnings;

#This program computes the sum of all numbers before the input number

chomp($input = <STDIN>);

$num = $input - 1;

if($num%2==0){      #The case for an even input number
    $sum = ($input/2)*$num;
    print $sum;
    print "\n";
}

else{       #The case for an odd input number
    $sum = ($input/2-0.5)*$num + ($input/2-0.5);
    print $sum;
    print "\n";
}
