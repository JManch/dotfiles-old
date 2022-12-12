# ls alias
Set-Alias -Name ls -Value lsd

# ll alias
function ll_func {
	lsd -l;
}
Set-Alias -Name ll -Value ll_func

# dotfiles alias
function dotfiles_func {
    git --git-dir=$HOME\.config\.dotfiles --work-tree=$HOME\.config $args;
}

Set-Alias -Name dotfiles -Value dotfiles_func

# Init starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
