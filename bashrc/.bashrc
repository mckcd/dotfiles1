# ~/.bushrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

alias t='tldr'

ts() {
    tldr --list | grep -i "$1" | column
}

alias m='man'

ms() {
    man -k "$1" | column
}

eval "$(starship init bash)"
eval "$(mcfly init bash)"
# some more ls aliases
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='ls -CF'

# nvim alias's
alias n='nvim'
alias ev='NVIM_APPNAME=ecosse3 nvim'
alias nv='NVIM_APPNAME=nvchad nvim'
alias lv='NVIM_APPNAME=lnvim nvim'
alias lz='NVIM_APPNAME=lvf nvim'
alias cn='NVIM_APPNAME=cn nvim'
alias nc='NVIM_APPNAME=nc nvim'
alias a='NVIM_APPNAME=astro nvim'
alias st='NVIM_APPNAME=scratch nvim'
alias launch='NVIM_APPNAME=launch nvim'
alias cz='NVIM_APPNAME=zc nvim'
alias jn='NVIM_APPNAME=nvim_java nvim'
alias jim='NVIM_APPNAME=jim nvim'

alias l='lsd'
# for exa
alias exa='exa --color=always'
alias ee='exa -alF --color=always'
alias ea='exa -A --color=always'
alias e='exa -xF --color=always'
# which alias to see more info about file
# alias wl='function _exl { which "$1" | xargs exa -l; };_exl' 
alias c='z'
alias ci='zi'
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
# Exec=/opt/zen-browser-bin/zen-bin %u
export PATH="$PATH:/home/mark/.local/opt/go/bin/go"
export PATH="$PATH:/opt/zen-brower-bin/zen-bin"
export PATH=$PATH:$HOME/go/bin
export EDITOR=nvim
export MCFLY_BASH_USE_TIOCSTI=1
export PATH="$PATH:/home/mark/bash_scripts"
export PATH="$PATH:/home/mark/.modular/bin"
# Created by `pipx` on 2024-06-21 20:22:28
export PATH="$PATH:/home/mark/.local/bin"
# export MANPAGER="less -R -Dd+r -Du+b"
export MANPAGER="sh -c 'col -bx | bat --paging=always --language=man'"
for dir in $(find ~/app_images/ -type d); do
	PATH="$PATH:$dir"
done
export PATH
export ANTHROPIC_API_KEY="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"



# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
source /usr/share/nvm/init-nvm.sh




source /home/mark/.config/broot/launcher/bash/br
