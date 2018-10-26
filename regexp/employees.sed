# Using substitution groups regexp, change the last name to UPPERCASE
s@\([^,]*\)@\U\1@
# \( escapes the parentesis
# [^,]* takes any characteres before the comma (,)
# @ is the delimiter choosen to not confuse with /
# \U\1 is for UPPERCASE the first group (chars before , )

# We can work with 2 substitutions at the same expressio 
 s@\([^,]*\),\([^,]*\)@\U\1,\L\2@
# Put the same expression to identify the second group
# then use \L\2 to lowercase the second group. 
# Inserting a comma between 2 substitution to separate
# on output.

# To update the actual file use:
# sed -i.bak -f employees.sed employees.csv
# This will update employees.csv and make a backup
# file appendig .bak to the same name file, generating
# employees.csv.bak as the original file. We can choose
# what backup extension we want.
