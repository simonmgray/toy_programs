#!/usr/bin/perl
use warnings;

my @subscripts;

@subscripts = ('123', '234', '345');

my $l=$i=0;

$l=scalar(@subscripts);

my %hash;

for($i=0;$i<$l;$i++){
    $hash{$subscripts[$i]}=1;
}

if(exists $hash{'123'}){
    print "True";
}
else{
    print "False";
}
