# zshrc is sourced for interactive shells

# options
source $ZDOTDIR/scripts/options

# program config
source $ZDOTDIR/scripts/programs

# aliases
source $ZDOTDIR/scripts/aliases

# plugins
source $ZDOTDIR/scripts/plugins

# load starship if not in tty
if [[ "$TERM" != "linux" ]]; then
    eval "$(starship init zsh)"
fi
