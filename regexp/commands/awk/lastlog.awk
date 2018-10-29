BEGIN {
printf "%8s %11s\n", "Username","Login date"
printf "===================\n" 
}
!( /**Nunca logou**/ || /^Nome/ || /^root/ ) {
# !( /Never logged in/ || /^Username/ || /^root/ ) {
count++
if (NF == 8)
    printf "%8s %2s %3s %4s\n", $1,$5,$4,$8
else
    printf "%8s %2s %3s %4s\n", $1,$6,$5,$9}
# printf using args as strings length as placeholders. %2s 2 characteres string.
END { print "==================="
print "Total Number of Users Processed: ",count }
