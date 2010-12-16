# This file is sourced by bash for login shells.

[ -f ~/.bashrc ] && source ~/.bashrc

# MacPorts
if [ -d /opt/local/bin ]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/share/man:$MANPATH
fi

# Perl
if [ -d "$HOME/local" ]; then
    export PATH=$HOME/local/bin:$PATH
    export PERL5LIB=$HOME/local/lib/perl5:$HOME/local/lib:$PERL5LIB
fi

# Keychain SSH management
if [ -x "$(which keychain)" ]; then
    keychain id_rsa
    source ~/.keychain/${HOSTNAME}-sh
    [ -f ~/.keychain/${HOSTNAME}-sh-gpg ] && source ~/.keychain/${HOSTNAME}-sh-gpg
fi

# Fetchmail and OfflineIMAP
if [ "$(hostname -s)" == "li3-126" ]; then
    if ! pgrep -u $USER fetchmail > /dev/null; then
        echo "Starting fetchmail..."
        fetchmail -d 300
    fi

    if ! pgrep -u $USER -f offlineimap > /dev/null; then
        echo "Starting offlineimap..."
        nohup offlineimap 2>&1 >> "$HOME/.offlineimap.log" &
    fi
fi

export EDITOR=emacsclient
export ALTERNATE_EDITOR=emacs

export LESSOPEN=
export PATH=$PATH:$HOME/bin:$HOME/src/up2date-ng/bin

# Fix mutt for transparency
export COLORFGBG="11;default;0"

# Set up CVS
export CVSROOT=":ext:dwc@cvs.danieltwc.com:/home/cvs"
export CVS_RSH="ssh"

export NNTPSERVER="snews://secure.news.us.easynews.com:563"

export GENTOO_COMMITTER_NAME="Daniel Westermann-Clark"
export GENTOO_COMMITTER_EMAIL="dwc@pobox.com"
