#!/usr/bin/perl

print "Enter a valid UK postcode... ";
# try to catch the first arg
$pcode = $ARGV[0]; # this take the first arg

# test if already have a postcode
if ( ! $pcode ) {
    $pcode = <STDIN>;
} 

chomp($pcode); # removes trailing symbols (like \n) at end of line

$pcode = uc $pcode; # uc parse to Uper Case

# REGEXP PATTERN:
# ^ for first line
# [A-Z] A to Z uppercase
# {1,2} minimum 1 occurence, maximum 2
# [0-9] numeric values
# ? optional occurrence
# $ end of line

$pattern = '^[A-Z]{1,2}[0-9]{1,2}[A-Z]?\s[0-9][A-Z]{2}$';

# comparing the pcode to pattern w/ regexp comparator (=~) and adding word boundaries (/) 
if ($pcode =~ /$pattern/) {
    print "We can deliver to: $pcode \n";
} else {
    print "We cannot find the postcode $pcode \n";}
