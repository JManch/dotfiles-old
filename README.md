### Clone and configure commands
```
git clone --bare https://github.com/JManch/dotfiles $HOME/.config/.dotfiles
git --git-dir=$HOME/.config/.dotfiles --work-tree=$HOME/.config checkout
git --git-dir=$HOME/.config/.dotfiles config --local status.showUntrackedFiles no
```

Add the following to /etc/zsh/zshenv: `export ZDOTDIR=~/.config/zsh`

Use the `dotfiles` alias to interact with the repo
