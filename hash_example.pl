#!/usr/bin/perl
use warnings;

my % string_hash;

%string_hash = ('Alos'=>'Diallo','Nancy'=>'Pelosi');

$string_hash{'Simon'} = 'Gray';

$string_hash{'Lesley'} = 'Pasman';

print $string_hash{'Simon'} . "\n";
print $string_hash{'Lesley'} . "\n";
print $string_hash{'Alos'} . "\n";

if(exists $string_hash{'Simon'}){
    print 'it is a great day!'."\n";
}

my $name=0;

$name = $string_hash{'Simon'};
print $name."\n";
