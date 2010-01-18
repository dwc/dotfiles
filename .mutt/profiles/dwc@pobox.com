# Mutt sender profile: dwc@pobox.com

# Sending options
set from="dwc@pobox.com"
set realname="Daniel Westermann-Clark"

# Signature file
set signature='~/.mutt/signatures/dwc@pobox.com'

# Customized headers
#unmy_hdr *                      # Remove all extra headers first
#my_hdr From: Daniel Westermann-Clark <dwc@pobox.com>
#my_hdr Reply-To: Daniel Westermann-Clark <dwc@pobox.com>

# Include the profile name in the status line
set status_format="-%r-Mutt: %f [Msgs:%?M?%M/?%m%?n? New:%n?%?o? Old:%o?%?d? Del:%d?%?F? Flag:%F?%?t? Tag:%t?%?p? Post:%p?%?b? Inc:%b?%?l? %l?]---(%s/%S)---dwc@pobox.com-%>-(%P)---"
