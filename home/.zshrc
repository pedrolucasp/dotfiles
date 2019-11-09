########################################
# zsh config
########################################

source $HOME/.bashrc

export ZSH="/home/pedrolucas/.oh-my-zsh"
ZSH_THEME="sorin"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# Custom Aliases
source $HOME/.aliases
