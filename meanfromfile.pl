#!/usr/bin/perl
use warnings;

#read file into the object MATRIX; for some reason the file to be opened must be in the home directory /Users/simongray -- not sure why, need to ask Alos
$filename = 'numbers.txt';

open(MATRIX, $filename) or die$!;
while($line = <MATRIX>){
    chomp($line); #gets rid of null byte and new line
    @array = split(/,/, $line);
}

# Calculate the mean
$l = scalar(@array);

$sum=0;
for($i=0;$i<$l;$i++){
    $sum = $sum + $array[$i];
}

$mean=$sum/$l;
print "mean is " . $mean . "\n";

#Calculate the median
@sorted = sort(@array);
print @sorted;
print "\n";

$middle = $l/2;
if($l%2>0){ #If the string of numbers is odd in length, median is the middle number)
    print $sorted[$middle];
    print "\n";
}
else{   #If the string of numbers is even, find the average of the middle two numbers)
    $lower = $middle - 0.5;
    $upper = $middle + 0.5;
    $median = ($sorted[$lower] + $sorted[$upper])/2;
    print $median;
    print "\n";
}

close MATRIX;
