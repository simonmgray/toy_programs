#!/usr/bin/perl
use warnings;

print "This program makes a pyramid of stars based your input number";
print "\n";
print "If the number inputted does not make a symmetric pyramid";
print "\n";
print "the biggest symmetric pyramid is made";
print "\n";
print "please input a number and press RETURN";
print "\n";
chomp($input = <STDIN>);

my ($num,$i,$rows,$remainder,$count,$height,$spaces,$base);
$num=$i=$rows=$remainder=$count=$height=$spaces=$base=0;

$num = $input;
$remainder = $num;
$count=1;

#determine the number of lines required
for($i=1;$i<$num;$i++){
    $remainder = $remainder - $count;
    if($remainder<0){
        last;
    }
    $count++;
}

#Pyramid height
$height = $count - 1;

#calculate base width
$spaces = $height - 1;
$base = $height + $spaces;

#establish rules for building the pyramid

#pre-space rule subroutine
sub prespace{
    my($level,$height) = @_;
    return $height-$level;
}

#the stars and spaces subroutine
sub starnspace{
    my($level) = @_;
    return 2*$level-1;
}

#print the pyramid:

my ($l,$j,$k,$lev,$ss,$height2);
$l=$j=$k=$lev=$ss=$height2=0;

#l is the level in iteration
$height2 = $height + 1;
for($l=1;$l<$height2;$l++){
    #print the number of prespaces for iterated level =l
    $j=0;
    $lev = $l;
    $pre = prespace($lev,$height);
    for($j=0;$j<$pre;$j++){
        print ' ';
    }
    
    #print stars loop:
    $k=0;
    $ss=starnspace($lev);
    for($k=0;$k<$ss;$k++){
        if($k==0){
            print '*';
        }
        elsif($k%2==0){
            print '*';
        }
        else{
            print '_';
        }
    }
    print "\n";
}
