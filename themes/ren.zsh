# ls colors
autoload -U colors && colors

export LSCOLORS="Gxfxcxdxbxegedabagacad"

setopt auto_cd
setopt multios
setopt prompt_subst

# VCS
YS_VCS_PROMPT_PREFIX1="%{$fg[white]%}%{$reset_color%} "
YS_VCS_PROMPT_PREFIX2="%{$fg[red]%}"
YS_VCS_PROMPT_SUFFIX="%{$reset_color%}"
YS_VCS_PROMPT_DIRTY=" %{$fg[yellow]%} "
YS_VCS_PROMPT_CLEAN=" %{$fg[green]%} "

# Git info
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX="${YS_VCS_PROMPT_PREFIX1}${YS_VCS_PROMPT_PREFIX2}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$YS_VCS_PROMPT_SUFFIX"
ZSH_THEME_GIT_PROMPT_DIRTY="$YS_VCS_PROMPT_DIRTY"
ZSH_THEME_GIT_PROMPT_CLEAN="$YS_VCS_PROMPT_CLEAN"

# HG info
local hg_info='$(ys_hg_prompt_info)'
ys_hg_prompt_info() {
	if [ -d '.hg' ]; then
		echo -n "${YS_VCS_PROMPT_PREFIX1}hg${YS_VCS_PROMPT_PREFIX2}"
		echo -n $(hg branch 2>/dev/null)
		if [ -n "$(hg status 2>/dev/null)" ]; then
			echo -n "$YS_VCS_PROMPT_DIRTY"
		else
			echo -n "$YS_VCS_PROMPT_CLEAN"
		fi
		echo -n "$YS_VCS_PROMPT_SUFFIX"
	fi
}

PROMPT="
%{$fg[black]$bg[cyan]%}  %{$reset_color%}%{$fg[black]$bg[cyan]%} %~ %{$reset_color%}%{$fg[cyan]%}%{$reset_color%}${hg_info}${git_info} %{$fg[blue]%}  %{$reset_color%}"
