#!/usr/bin/env fish 

set -gx EDITOR nvim

set -gx PATH ~/bin/ /usr/local/bin /usr/bin /bin /sbin /usr/sbin

set -gx PATH $PATH ~/.rvm/bin ~/.rvm/gems/*/bin ~/.rvm/rubies/*/bin

alias gst "git status"

alias j "z"

alias vim "nvim"

#eval (fasd --init posix-alias)

source ~/.profile
