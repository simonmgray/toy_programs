#!/usr/bin/perl
use warnings;

my @string_array;
my $string=$i=$l=0;

$string = 'This is a string of words';
@string_array = ('string','of','monkeys');

$l = scalar @string_array;

for($i=0;$i<$l;$i++){
    if($string =~ m/$string_array[$i]/){
        print $string_array[$i] . "\n";
        last;
    }
}

