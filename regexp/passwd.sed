# This is a sed file, that can store a sed command using
# a regular expression then delete, append or substitutes
# some texts.
# This substitutes the default shell of the user fernando

/^fernando/ s@/usr/bin/zsh@/bin/bash@

# If need to use '/' as search string, we can use any other
# character as a delimiter, such as '@'. Only needs to put
# right after the substituition mark 's'
