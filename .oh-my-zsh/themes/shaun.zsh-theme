export arrow='➜'
# export beer='🍺 '
#PROMPT='%{$fg_bold[blue]%}$arrow%{$fg[white]%} %t %{$fg[blue]%}✘%{$fg[green]%}%p %{$fg[white]%}%c %{$fg[blue]%}$(git_prompt_info)$(hg_prompt_info)%{$fg[blue]%} $(tasks)✘ % %{$reset_color%}'
PROMPT='%{$fg[blue]%}$arrow%{$fg[white]%} %t %{$fg[blue]%}✘%{$fg[green]%}%p %{$fg[white]%}%c %{$fg[blue]%}$(git_prompt_info)%{$fg[blue]%}✘ % %{$reset_color%}'
#PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

# Ξ ⏣ ♫ ☢
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[red]%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

function hg_prompt_info {
    hg prompt --angle-brackets "\
<%{$fg[blue]%}(%{$fg[white]%}<branch>%{$fg[blue]%})%{$reset_color%}>\
%{$fg[red]%}<status|modified|unknown><update>%{$reset_color%}" 2>/dev/null
}

#Copied mostly from vi-mode plugin
function zle-line-init zle-keymap-select {
  zle reset-prompt
}
function tasks {
    numberOfCurrentTasks
}
zle -N zle-line-init
zle -N zle-keymap-select

bindkey -v


#Creates a normal/insert mode indicator on the right prompt
#INSERT_MODE_INDICATOR=%{$bg[green]%}%{$fg[white]%}insert%{$reset_color%}
#NORMAL_MODE_INDICATOR=%{$bg[red]%}%{$fg[white]%}normal%{$reset_color%}

#function vi_mode_prompt_info() {
    ##echo "${${KEYMAP/vicmd/ $NORMAL_MODE_INDICATOR }/(main|viins|\s*)/ $INSERT_MODE_INDICATOR}"
##  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
#}

# define right prompt, if it wasn't defined by a theme
#if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  ##RPS1='$(vi_mode_prompt_info)'
#fi
#
function tab_title() {
  local REPO=$(basename `git rev-parse --show-toplevel 2> /dev/null` 2> /dev/null) || return
  if [[ -z $REPO ]]
  then
    echo "%20<…<${PWD/#$HOME/~}%>>"   # 20 char left truncated PWD
  else
    echo "%20>…>$REPO%>>🔹"   # 20 char right truncated
  fi
}
 
ZSH_THEME_TERM_TAB_TITLE_IDLE='$(tab_title)'
