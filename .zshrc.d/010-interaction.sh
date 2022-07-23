# Split more like bash
autoload -U select-word-style
select-word-style bash

# Emacs keybindings
bindkey -e

## Autocomplete
autoload -U compinit
compinit

# Allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD
