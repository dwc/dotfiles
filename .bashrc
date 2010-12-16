# This file is sourced by all *interactive* bash shells on startup.  This
# file *should generate no output* or it will break the scp command.

# Bail out for scp, etc.
if [[ $- != *i* ]]; then
    return
fi

[ -f /etc/bash/bashrc ] && source /etc/bash/bashrc
[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion

# Set a fancy prompt
prompt_color=""
case $(hostname -s) in
    dev)
        prompt_color="35"
        ;;
    dwc)
        prompt_color="33"
        ;;
    dovinia)
        prompt_color="31"
        ;;
    dulcinea)
        prompt_color="36"
        ;;
    fortuna)
        prompt_color="32"
        ;;
esac

PS1="[\t \[\e[00;${prompt_color}m\]\u@\h\[\e[00m\] \w]\$ "
#PS1='[\t \u@\h \w]\$ '

unset prompt_color

# Change the window title of X terminals
case $TERM in
    xterm*|rxvt|eterm)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
        ;;
    screen)
        PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
        ;;
esac

# Reattach by default
alias screen='screen -Rd'

# Stupid w
if [[ $OSTYPE != darwin* ]]; then
    alias w='w -f'
fi

# Epoch => local time
alias localtime='perl -le "print scalar localtime \$_ for @ARGV;"'

# Use Gist by default for nopaste
alias nopaste='nopaste --services Gist'

# Git configuration file management
# http://necoro.wordpress.com/2009/10/08/managing-your-configuration-files-with-git-and-stgit/
# http://necoro.wordpress.com/2009/10/10/managing-your-configuration-files-with-git-revisited/
alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

# DB2 shortcuts
alias db2env='source ~db2inst1/sqllib/db2profile'
alias db2connect='db2env && db2 connect to public user'
alias db2conn='db2connect'
alias db2disconnect='db2env && db2 disconnect all'
alias db2disc='db2disconnect'

# Other shortcuts
alias ll='ls -l'

psgrep() {
    if [ "$@" ]; then
        ps waux | grep -i "$@" | grep -v grep
    else
        ps waux
    fi
}

backup() {
    sudo -H /root/backup-scripts/"$@"
}
