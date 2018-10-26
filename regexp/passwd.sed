# This is a sed file, that can store a sed command using
# a regular expression then delete, append or substitutes
# some texts.
# This substitutes the default shell of the user fernando

/^fernando/ s@/usr/bin/zsh@/bin/bash@
# and back again
/^fernando/ s@/bin/bash@/usr/bin/zsh@

# Sed files allow us to make more than one changes at once.
 
# If need to use '/' as search string, we can use any other
# character as a delimiter, such as '@'. Only needs to put
# right after the substituition mark 's'

# We can also create a shell function beggining with:
# sed '{
# > /^fernando/ s@/usr/bin/zsh@/bin/bash@
# > /^fernando/ s@/bin/bash@/usr/bin/zsh@
# } ' /etc/passwd 
