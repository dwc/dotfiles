# This file is sourced by bash for login shells.

# Used to start Fetchmail and OfflineIMAP
function _start_unless_running() {
    local nohup="$1"; shift
    local pgrep_full="$1"; shift
    local daemon="$1"; shift

    local pgrep_args="-u $USER"
    if [ ${pgrep_full} ]; then
        pgrep_args="${pgrep_args} -f"
    fi

    if ! pgrep ${pgrep_args} ${daemon} > /dev/null; then
        echo "Starting ${daemon}..."

        if [ "${nohup}" == "1" ]; then
            echo "nohup"
            nohup ${daemon} $@ 2>&1 >> "$HOME/.${daemon}.log" &
        else
            echo "hup"
            ${daemon} $@ &
        fi
    else
        echo "${daemon} already exists"
    fi
}

[ -f ~/.bashrc ] && source ~/.bashrc

# Load in aliases, etc.
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
    _start_unless_running 0 0 "fetchmail" "-Fd" 300;
    _start_unless_running 1 1 "offlineimap"
#    _start_unless_running 1 0 "$HOME/.dropbox-dist/dropboxd"
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
