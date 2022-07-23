# Update the command line to include timestamp of when commands start
RPROMPT='[%D{%H:%M:%S}]'
TMOUT=1
TRAPALRM() {
    zle reset-prompt
}
