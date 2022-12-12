### Clone and configure commands
```
git clone --bare https://github.com/JManch/dotfiles $HOME/.dotfiles  
git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME checkout
git --git-dir=$HOME/.dotfiles/ config --local status.showUntrackedFiles no
```

Add the following to /etc/zsh/zshenv: `export ZDOTDIR=~/.config/zsh`

Use the `dotfiles` alias to interact with the repo
