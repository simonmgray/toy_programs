#!/usr/bin/perl
use warnings;

#Request user to input string1 and string2
print "Input string 1 \n";
chomp($string1 = <STDIN>);

print "Input string 2 \n";
chomp($string2 = <STDIN>);

#initialization of non local program variables
########################

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

