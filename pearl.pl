#!/usr/bin/perl

print "Enter a valid UK postcode... ";

$pcode = $ARGV[0]; # this take the first arg
if ( ! $pcode ) {
    $pcode = <STDIN>;
} 

chomp($pcode);

$pcode = uc $pcode;

# REGEXP PATTERN:
# ^ for first line
# [A-Z] A to Z uppercase
# {1,2} minimum 1 occurence, maximum 2
# [0-9] numeric values
# ? optional occurrence
# $ end of line

$pattern = '^[A-Z]{1,2}[0-9]{1,2}[A-Z]?\s[0-9][A-Z]{2}$';

if ($pcode =~ /$pattern/) {
    print "We can deliver to: $pcode \n";
} else {
    print "We cannot find the postcode $pcode \n";}
