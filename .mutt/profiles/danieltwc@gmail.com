# Mutt sender profile: danieltwc@gmail.com

# Sending options
set from="danieltwc@gmail.com"
set realname="Daniel Westermann-Clark"

# Signature file
set signature='~/.mutt/signatures/danieltwc@gmail.com'

# Customized headers
#unmy_hdr *                      # Remove all extra headers first
#my_hdr From: Daniel Westermann-Clark <danieltwc@gmail.com>
#my_hdr Reply-To: Daniel Westermann-Clark <danieltwc@gmail.com>

# Include the profile name in the status line
set status_format="-%r-Mutt: %f [Msgs:%?M?%M/?%m%?n? New:%n?%?o? Old:%o?%?d? Del:%d?%?F? Flag:%F?%?t? Tag:%t?%?p? Post:%p?%?b? Inc:%b?%?l? %l?]---(%s/%S)---danieltwc@gmail.com-%>-(%P)---"
