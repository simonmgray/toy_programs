#!/usr/bin/perl
use warnings;

#Program description: This program finds the largest common subsequence between 2 strings. It is very inefficient because it uses 3 nested loops. It does not tell you if the subsequence occurs more than once, just the identity of the largest common subsequence.

#Intitialize $string1 and $string2 for accepting standard input
my $string1=$string2=0;

#Request user to input string1 and string2
print "Input string 1 \n";
chomp($string1 = <STDIN>);

print "Input string 2 \n";
chomp($string2 = <STDIN>);

#Code a subroutine called 'substring maker' fed 'string' to make an array of all substrings of size 'substring_size' (also fed to the subroutine) and store each substring in the array '$substring_array' where the index in $substring_array is also the location of the first character of the substring within 'string'. ie if string were 12345 and substring_size=2, then $substring_array[1] = '23', and $substring_array[3] = '45'

sub substring_maker($$){
    #accept subroutine arguements as references
    my $string_ref = shift;
    my $substring_size_ref = shift;
    
    #convert references
    my $string = $string_ref;
    my $substring_size = $substring_size_ref;
    
    #determine when to stop the loop (last index that generates full substring length)
    my $l = length($string);
    my $end_loop = $l - $substring_size +1;
    
    #initialization
    my @substring_array = ();
    my $substring_holder = 0;
    my $i = 0;
    
    #generate substrings and put into substring_array at appropriate index
    for($i=0;$i<$end_loop;$i++){
        $substring_holder = substr $string, $i, $substring_size;
        $substring_array[$i] = $substring_holder;
    }
    
    #subroutine output
    return @substring_array;
}

#initialization of non local program variables
my $l_s1=$l_s2=$string_big=$string_small=0;

#Make the larger string $string_big, and the smaller string $string_small; if the strings are the same size, make $string1 = $string_big
$l_s1 = length($string1);
$l_s2 = length($string2);

if($l_s1 == $l_s2){
    $string_big = $string1;
    $string_small = $string2;
}
elsif($l_s1 > $l_s2){
    $string_big = $string1;
    $string_small = $string2;
}
else{
    $string_big = $string2;
    $string_small = $string1;
}

#determine length of $string_small and $string_big
my $l_big=$l_small=0;

$l_big = length($string_big);
$l_small = length($string_small);

#Loop through all the substrings of $string_small (from largest to smallest) and determine if there is a match within $string_big

my $i=$substring_length=$loop_iterations=0;
my @substring_small_substr_array;

$loop_iterations = $l_small - 2; #We only want to iterate until substrings of 2 elements long;

#Give the outer loop a label "OUTERLOOP" to be used when calling last (which takes an optional label)
OUTERLOOP: for($i=0;$i<$loop_iterations;$i++){
    $substring_length = $l_small - $i; #generates string lengths
    @string_small_substr_array = &substring_maker($string_small,$substring_length);
    my $j=$l_array=0;
    $l_array = scalar(@string_small_substr_array);
    for($j=0;$j<$l_array;$j++){
        if($string_big =~ m/$string_small_substr_array[$j]/){
            print $string_small_substr_array[$j] . " is the largest common string of string1 and string2" . "\n";
            last OUTERLOOP;
        }
    }
}
