# ~/.bushrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

eval "$(starship init bash)"
eval "$(mcfly init bash)"
# some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

# nvim alias's
alias n='nvim'
alias ev='NVIM_APPNAME=ecosse3 nvim'

alias l='lsd'
# for exa
alias exa='exa --color=always'
alias ee='exa -alF --color=always'
alias ea='exa -A --color=always'
alias e='exa -xF --color=always'
# which alias to see more info about file
alias wl='function _exl { which "$1" | xargs exa -l; };_exl' 

# fun alias/func 
apt() {
	if [[ $1 == "install" ]]; then
		shift
		sudo pacman -S "$@"
	else
		echo "apt command not supported"
	fi
}
# Nix profile initialization
if [ -e "$HOME/.nix-profile/etc/profile.d/nix.sh" ]; then
    . "$HOME/.nix-profile/etc/profile.d/nix.sh"
fi

# Node.js and npm initialization
# Ensure that npm global packages are added to the PATH
export PATH="$PATH:$HOME/.npm-global/bin"
. "$HOME/.cargo/env"

#PATH=$HOME/.cargo/bin:$PATH
export PATH="/home/mark/appimages/Obsidian:$PATH"

eval "$(zoxide init bash)"

alias ipad='ip -c=auto address'

export PATH="$PATH:/home/mark/.local/opt/go/bin/go"
export PATH=$PATH:$HOME/go/bin
export EDITOR=nvim
export MCFLY_BASH_USE_TIOCSTI=1

# Created by `pipx` on 2024-06-21 20:22:28
export PATH="$PATH:/home/mark/.local/bin"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
source /usr/share/nvm/init-nvm.sh
