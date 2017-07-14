#!/usr/bin/perl
use warnings;

my ($line,$i,$j,$element,$rows,$cols,$sum,$totnum,$mean);
my (@main_2D_array, @row_array);

$line=$i=$j=$element=$rows=$cols=0;

my $filename = '/Users/simongray/perl_code/image_data.txt';

#syntax for opening file
open(MATRIX, $filename) or die $!;

while($line = <MATRIX>){
    #chomp off new line character, skip the comments and empty lines
    chomp($line);
    @row_array = split(/\t/, $line);
    
    $j=0;
    
    #$element (@row_array) allows you to go element by element in the ith row from j=0 to j++
    foreach $element (@row_array){
        $main_2D_array[$i][$j++] =$element;
    }
    $i++;
}

#Define the number of columns and rows in the 2D array
$rows = $i;
$cols = $j;

$sum=0;

my ($l,$m);
$l=$m=0;

#determine sum of all elements
for($l=0;$l<$rows;$l++){
    for($m=0;$m<$cols;$m++){
        $sum = $sum + $main_2D_array[$l][$m];
    }
}

#total number of elements in $main_2D_array
$totnum = $i * $j;

$mean = $sum/$totnum;

my ($a);
$a=0;

$l=$m=0;
$sum1=0;

#calculate standard deviation term: sum of (X - mean)^2 = sdTerm1
for($l=0;$l<$rows;$l++){
    for($m=0;$m<$cols;$m++){
        $a = $main_2D_array[$l][$m] - $mean;
        $b = $a**2;
        $sum1 = $b + $sum1;
    }
}

my ($sdDenom, $f);
$sdDenom=$f=0;

$sdDenom = $totnum-1;
$f = $sum1/$sdDenom;

$sd = sqrt($f);

my (@zscore_main_2D);

$p=$q=$diff=0;
#calculate standard deviation term: sum of (X - mean)^2 = sdTerm1
for($p=0;$p<$rows;$p++){
    for($q=0;$q<$cols;$q++){
        $diff = $main_2D_array[$p][$q] - $mean;
        $zscore_main_2D[$p][$q] = $diff / $sd;
    }
}

print 'The mean is ' . $mean;
print "\n";
print 'The standard deviation is ' . $sd;
print "\n";
print $main_2D_array[0][0];
print "\n";
print $zscore_main_2D[0][0];
print "\n";

#generate log transformed values for data

#make a subroutine for calculating non-base e log. note that log(x) is ln(x) in perl
sub logb{
    my($n,$b) = @_; #name subroutine parameters: number to be log transformed =n, base = b
    return log($n)/log($b);
}

#log transform the data
my (@logtransformed_main_2D);
my ($transformed);
$p=$q=$transformed=0;

for($p=0;$p<$rows;$p++){
    for($q=0;$q<$cols;$q++){
        $transformed = logb($main_2D_array[$p][$q],10);
        $logtransformed_main_2D[$p][$q] = $transformed;
    }
}

print $logtransformed_main_2D[0][0];
print "\n";
