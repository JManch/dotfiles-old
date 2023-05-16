# zshrc is sourced for interactive shells

# options
source $ZDOTDIR/scripts/options

# program config
source $ZDOTDIR/scripts/programs

# aliases
source $ZDOTDIR/scripts/aliases

# plugins
source $ZDOTDIR/scripts/plugins

# load starship
eval "$(starship init zsh)"
