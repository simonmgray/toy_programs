#!/usr/bin/perl
use warnings;

sub temp{
    local($F) = @_;
    $C = ($F - 32) / 1.8;
    print "$F Fahrenheit is $C Celsius\n";
}

$F=75;
&temp($F);
