# zshrc is called every time an interactive shell is initialised
#
# options
source $ZDOTDIR/scripts/options

# program config
source $ZDOTDIR/scripts/programs

# aliases
source $ZDOTDIR/scripts/aliases

# plugins
source $ZDOTDIR/scripts/plugins

# wezterm
source $ZDOTDIR/wezterm.sh

# load theme
eval "$(starship init zsh)"
