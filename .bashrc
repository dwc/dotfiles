# This file is sourced by all *interactive* bash shells on startup.  This
# file *should generate no output* or it will break the scp and rcp commands.

if [ "$PS1" ]; then
    # Colors for ls, etc.
    if [ -x "$(which dircolors)" ]; then
        if [ -f /etc/DIR_COLORS ]; then
            eval `dircolors -b /etc/DIR_COLORS`
        fi

        alias d='ls --color'
        alias ls='ls --color'
        alias ll='ls --color -l'
    else
        alias d='ls'
        alias ll='ls -l'
    fi

    # reattach by default
    alias screen='screen -Rd'

    # distcc monitor for portage
    alias portagemon='DISTCC_DIR=$(portageq envvar DISTCC_DIR) distccmon-text'

    # Stupid w
    if [ $OSTYPE != "darwin8.0" ]; then
        alias w='w -f'
    fi

    # Epoch => local time
    alias localtime='perl -le "print scalar localtime \$_ for @ARGV;"'

    # DB2 shortcuts
    alias db2env='source ~db2inst1/sqllib/db2profile'
    alias db2connect='db2env && db2 connect to public user'
    alias db2conn='db2connect'
    alias db2disconnect='db2env && db2 disconnect all'
    alias db2disc='db2disconnect'

    # Git configuration file management
    # http://necoro.wordpress.com/2009/10/08/managing-your-configuration-files-with-git-and-stgit/
    # http://necoro.wordpress.com/2009/10/10/managing-your-configuration-files-with-git-revisited/
    alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

    # Set a fancy prompt
    COLOR=""
    case $(hostname -s) in
        dev)
            COLOR="35"
            ;;
        dwc)
            COLOR="33"
            ;;
        dovinia)
            COLOR="31"
            ;;
        dulcinea)
            COLOR="36"
            ;;
        fortuna)
            COLOR="32"
            ;;
    esac

    PS1="[\t \[\e[00;${COLOR}m\]\u@\h\[\e[00m\] \w]\$ "
    #PS1='[\t \u@\h \w]\$ '

    unset COLOR

    # Change the window title of X terminals
    case $TERM in
        xterm*|rxvt|eterm)
            PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007"'
            ;;
        screen)
            PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\"'
            ;;
    esac
fi

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

mwget() {
    local url
    for url in $@; do
        wget -c "$url"
    done
}

[ -f /etc/profile.d/bash-completion ] && source /etc/profile.d/bash-completion
