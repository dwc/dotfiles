# This file is sourced by bash for login shells.

# Used to start Dropbox, Fetchmail, etc.
function _start_unless_running() {
    local nohup="$1"; shift
    local pidfile="$1"; shift
    local daemon="$1"; shift

    if [ ! -f "${pidfile}" ] || ( [ -f "${pidfile}" ] && ! pgrep -u "${USER}" | grep "$(< ${pidfile})" > /dev/null ); then
        if [ "${nohup}" == "1" ]; then
            nohup ${daemon} $@ 2>&1 >> "$HOME/.$(basename ${daemon}).log" &
        else
            ${daemon} $@ &
        fi
    fi
}

# Load in aliases, etc.
[ -f ~/.bashrc ] && source ~/.bashrc

# Scripts
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$HOME/.local/bin:$PATH
fi

# Dropbox
if [ $(which dropbox 2> /dev/null) ]; then
    _start_unless_running 0 "$HOME/.dropbox/dropbox.pid" "dropbox" "start"
fi

export EDITOR=emacsclient
export ALTERNATE_EDITOR=emacs

export LESSOPEN=
export PATH=$PATH:$HOME/bin:$HOME/src/up2date-ng/bin

# Fix mutt for transparency
export COLORFGBG="11;default;0"

export NNTPSERVER="snews://secure.news.us.easynews.com:563"

export GENTOO_COMMITTER_NAME="Daniel Westermann-Clark"
export GENTOO_COMMITTER_EMAIL="dwc@pobox.com"
