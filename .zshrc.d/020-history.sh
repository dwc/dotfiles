export HISTSIZE=16000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

# Save history nondestructively
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Share history between zsh processes
#setopt SHARE_HISTORY
