# ~/.bushrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export SDL_VIDEODRIVER=wayland
export QT_QPA_PLATFORM=wayland
export CLUTTER_BACKEND=wayland

HISTSIZE=100000      # Number of commands stored in memory for the current session
HISTFILESIZE=200000  # Number of commands stored in the .bash_history file
HISTCONTROL=ignoredups
shopt -s histappend

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

# helix alias
alias hx='helix'
# nvim alias's
alias non='nvim -u NONE'
alias n='nvim'
alias fnh='nvim $(fzf -m --preview="bat --color=always {}")'
alias fn='nvim $(fzf -m --preview="bat --color=always {}" --no-hidden)'
alias l='lsd'
alias ks='NVIM_APPNAME="ks_nvim" nvim'
alias tn='NVIM_APPNAME="tugue" nvim'
alias nc='NVIM_APPNAME="nc" nvim'
alias lvim='NVIM_APPNAME="lvim" nvim'
alias bes='NVIM_APPNAME="bes" nvim'
# for exa
alias exa='exa --color=always'
alias ee='exa -alF --color=always'
alias ea='exa -A --color=always'
alias e='exa -xF --color=always'
alias neobean='NVIM_APPNAME=linkarzu/dotfiles-latest/neovim/neobean nvim'
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

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

alias ipad='ip -c=auto address'
#" Exec=/opt/zen-browser-bin/zen-bin %u

export PATH="$PATH:$HOME/system_scripts"
export PATH="$PATH:/home/mark/.local/opt/go/bin/go"
export PATH="$PATH:/opt/zen-brower-bin/zen-bin"
export PATH=$PATH:$HOME/go/bin
export EDITOR=nvim
export BROWSER=zen-beta
export MCFLY_BASH_USE_TIOCSTI=1
export PATH="$PATH:/home/mark/bash_scripts"
export PATH="$PATH:/home/mark/.modular/bin"
# Created by `pipx` on 2024-06-21 20:22:28
export PATH="$PATH:/home/mark/.local/bin"
# export MANPAGER="less -R -Dd+r -Du+b"
# export MANPAGER="sh -c 'col -bx | bat --paging=always --language=man --plain'"
# export MANPAGER="nvim -c 'set ft=man' -"
# export MANPAGER="nvim --clean +Man!"
# export MANPAGER="sh -c 'col -bx | bat -l man -p'"
# export MANPAGER="sh -c 'col -bx | less -S'"
export MANPAGER="less -R  --use-color -Dd+r -Du+b"
export MANWIDTH=80
export MANOPT='--nh --nj'
export MANROFFOPT="-c  -rHY=0 -rLL=80n -rNJ=0"
for dir in $(find ~/app_images/ -type d); do
	PATH="$PATH:$dir"
done
export PATH
export ANTHROPIC_API_KEY="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"



# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
source /usr/share/nvm/init-nvm.sh

export QT_PLUGIN_PATH="/lib/qt/plugins/styles:$QT_PLUGIN_PATH"
export QT_PLUGIN_PATH="/lib/qt6/plugins/styles:$QT_PLUGIN_PATH"


source /home/mark/.config/broot/launcher/bash/br
export FZF_CTRL_R_OPTS="--history"


