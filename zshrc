#!/bin/sh
# Variable setting
eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$PATH:/usr/local/platform-tools:$HOME/neovim-local/bin

export EDITOR='nvim'
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

export http_proxy=socks5://127.0.0.1:1080
export https_proxy=socks5://127.0.0.1:1080

## My zsh configuration
export ZSH=$HOME/.config/zsh
# Load plugins
source "$ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZSH/plugins/zsh-autopair/autopair.zsh"
source "$ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZSH/plugins/fzf/completion.zsh"
source "$ZSH/plugins/fzf/key-bindings.zsh"
# Load theme
source "$ZSH/themes/git.zsh"
source "$ZSH/themes/ren.zsh"

# Alias
alias ra="ranger"
alias vim="nvim"
alias lg='lazygit'
alias la="ls -la"
alias bk="cd .."
alias ic="cd ~/.config/nvim/"
alias il="cd ~/.local/share/nvim/site/pack/plugins/start/"
alias iz="cd ~/.config/zsh/"
alias id="cd ~/Documents/"
alias iw="cd ~/Documents/work/"

# Keybinding
bindkey '^F' vi-forward-char
bindkey '' vi-backward-char
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

clear
