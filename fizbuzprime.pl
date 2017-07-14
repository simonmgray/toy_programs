#!/usr/bin/perl
use warnings;

#Given a number say 250, create a loop that prints “fiz” if the number is odd, “buz” if even, but if the number is prime prints “prime”

chomp($input = <STDIN>); #user inputs number

$num = $input; #This is the inputted number stored as $num
$prime=2; #this is a place holder
$half = $num/2;

for($i=2;$i<$half;$i++){   #loop through all numbers from 2 until $num/2 which is the largest possible factor of a number other than itself*1
    if($num%$i==0){     #this checks if i is a factor of $num
        if($num%2==0){
            print "buz";
            last;
        }
        else{
            print "fiz";
            last;
        }
    }
    else{
        $prime=$prime+1;
    }
}

#If the number is prime, it should go through the loop and increment $prime to be 0.5 > than $num/2
if($prime>$num/2){
    print "prime";
}
