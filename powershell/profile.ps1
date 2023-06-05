# ls alias
Set-Alias -Name ls -Value lsd

# ll alias
function ll_func {
	lsd -la;
}
Set-Alias -Name ll -Value ll_func

# Neovim nightly alias
Set-Alias -Name nvim -Value "C:\NVME Files\Personal\Programs\Neovim-nightly\bin\nvim.exe"

# dotfiles alias
function dotfiles_func {
    git --git-dir=$HOME\.config\.dotfiles --work-tree=$HOME\.config $args;
}

Set-Alias -Name dotfiles -Value dotfiles_func 

function lazygit_dotfiles_func {
    lazygit --git-dir=$HOME\.config\.dotfiles --work-tree=$HOME\.config;
}

# lazygit dotfiles alias
Set-Alias -Name dotfileslazy -Value lazygit_dotfiles_func

# Init starship
Invoke-Expression (&starship init powershell)
$ENV:STARSHIP_CONFIG = "$HOME\.config\starship\starship.toml"
