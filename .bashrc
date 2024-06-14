# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

eval "$(starship init bash)"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

. "$HOME/.cargo/env"

#PATH=$HOME/.cargo/bin:$PATH
export PATH="/home/mark/appimages/Obsidian:$PATH"


# Other bash-specific configurations can continue below...
eval "$(zoxide init bash)"

alias ipad='ip -c=auto address'

export PATH="$PATH:/home/mark/.local/opt/go/bin/go"
export PATH=$PATH:$HOME/go/bin

