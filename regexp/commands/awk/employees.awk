BEGIN { FS="," }
{ print toupper($1), tolower($2), $3 }

# -F"," ' { print toupper($1), tolower($2), $3 } '
