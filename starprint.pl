#!/usr/bin/perl
use warnings;

chomp($input = <STDIN>);

@star=();

for($i=0; $i<$input; $i++){
    $star[$i]= '*';
}

@output = ();
@output = join('',@star);

print(@output);

