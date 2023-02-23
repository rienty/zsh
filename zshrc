#!/bin/sh

# Variable setting
eval "$(/opt/homebrew/bin/brew shellenv)"

export EDITOR='nvim'
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket

export http_proxy=socks5://127.0.0.1:1080
export https_proxy=socks5://127.0.0.1:1080


export ZSH=$HOME/.config/zsh

# Load plugins
source "$ZSH/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZSH/plugins/zsh-autopair/autopair.zsh"
source "$ZSH/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"
source "/opt/homebrew/opt/fzf/shell/completion.zsh"
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
export FZF_DEFAULT_OPTS="--height=60% --layout=reverse --info=inline "
export FZF_COMPLETION_TRIGGER='\'

# Load theme
source "$ZSH/themes/git.zsh"
source "$ZSH/themes/ren.zsh"

#PROMPT='
# %~%b $ '

# Alias
alias ra="ranger"
alias vim="nvim"
alias lg='lazygit'
alias la="ls -la"
alias id="cd ~/Documents"
alias ic="cd ~/.config"
alias il="cd ~/.local/share/"

# Colorized man
man() {
	LESS_TERMCAP_md=$'\e[01;31m' \
		LESS_TERMCAP_me=$'\e[0m' \
		LESS_TERMCAP_se=$'\e[0m' \
		LESS_TERMCAP_so=$'\e[01;44;33m' \
		LESS_TERMCAP_ue=$'\e[0m' \
		LESS_TERMCAP_us=$'\e[01;32m' \
		command man "$@"
	}


# Keybinding
bindkey '^F' vi-forward-char
bindkey '' vi-backward-char
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

clear
