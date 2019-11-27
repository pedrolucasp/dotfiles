#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

if [[ "$(tty)" == "/dev/tty1" ]]; then
	pgrep i3 || startx
fi

export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox
export SSH_KEY_PATH="$HOME/.ssh/"

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/.local/bin"

export FZF_DEFAULT_COMMAND='fd --type f'

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
