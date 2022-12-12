# zprofile is called for interactive and non-interactive login shells
#
# fix color issue
export COLORTERM=truecolor

# set starship config path
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# disable bold colors in EXA
export EXA_COLORS=di=34:bd=33:cd=33:so=31:ex=32:ur=33:uw=31:ux=32:ue=32:uu=33:gu=33:lc=31:df=32:sn=32:nb=32:nk=32:nm=32:ng=32:nt=32

# on WSL fix xdg-open for browser links
if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
  export BROWSER="/mnt/c/Windows/system32/WindowsPowerShell/v1.0/powershell.exe /C start"
fi

# asdf config
. $HOME/.asdf/asdf.sh

# pyenv config
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# fnm config
export PATH=$HOME/.fnm:$PATH
eval "`fnm env`"

# rustup config
. "$HOME/.cargo/env"
