PROMPT_COLOR=${PROMPT_COLOR:-magenta}
PS1="%{${fg[$PROMPT_COLOR]}%}%B%n@%m] %b%{${fg[default]}%}"
RPROMPT="%{${fg[$PROMPT_COLOR]}%}%B%(7~,.../,)%6~%b%{${fg[default]}%}"

# Load private environment configuration
[ -f $HOME/.zshrc_private ] && source $HOME/.zshrc_private

# Load general shell initialization
if [ -d $HOME/.zshrc.d ]; then
    for file in $HOME/.zshrc.d/*.sh; do
        source "$file"
    done
fi
