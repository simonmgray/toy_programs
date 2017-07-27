#!/usr/bin/perl
use warnings;
use strict;

############
## This program makes 'random' decisions based on the time of the <STDIN>
############

my $input = 0;

chomp($input = <STDIN>);

sub randomthrow(){
    my $t_input = 0;
    $t_input = time;
    
    my $lasttwo=0;
    
    $lasttwo = substr($t_input, -1);
    
    if($lasttwo <= 3){
        return 'rock';
    }
    elsif($lasttwo >= 7){
        return 'paper';
    }
    else{
        return 'scissors';
    }
}

my $randrps=0;

$randrps = randomthrow();

print "\n" . $randrps . "\n"

