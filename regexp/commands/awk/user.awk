# Awk take space as delimiter by default
BEGIN { FS=":"; print "Username,Shell"}
# Semicolon (;) is used to separate differents commands
# inside tags
# -F especify the delimiter, now ":". To insert a delimiter
# inside a control file, just insert inside a BEGIN tag
# FS="<delimiter>", in this case FS=":"
$3 > 999 { print $1"@"$7}
# $3 > 999 means, select only lines that the 3rd field (user ID)
# is greater than 999 (in debian based, common user
# ussually starts at 1000)
END{ print "Total Users : " NR }
# NR is a internal awk variable that stored the number 
# of lines on the main file
 
# Use exemple: awk -F":" -f users.awk /etc/passwd
