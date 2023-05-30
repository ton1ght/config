# options
HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd extendedglob nomatch

# set vi key bindings
bindkey -v

# edit command in vim with v
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# enabe history
autoload -Uz compinit && compinit

# aliases
alias ls='exa -l --color=auto --group-directories-first --icons'
alias ll='exa -al --color=auto --group-directories-first --icons'
alias vim="nvim"
alias nc="ncmpcpp"
alias pm="pulsemixer"
alias ip="ip -color=auto"
alias grep="grep --color=auto"
alias diff='diff --color=auto'
alias ranger='. ranger'
alias dotfiles='/usr/bin/git --git-dir=/home/$USER/.cfg/ --work-tree=/home/$USER'

# exports
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR="nvim"
export MANPAGER='less -s -M +Gg'
export PATH=$PATH:/home/ton1ght/scripts:/home/ton1ght/.local/bin
export SSH_AUTH_SOCK=/run/user/$(id -u)/gcr/ssh

# plugins
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fpath+=$HOME/.config/zsh/pure
source $HOME/.config/zsh/pure/pure.plugin.zsh
fpath+=$HOME/.config/zsh/zsh-completions/src
source $HOME/.config/zsh/zsh-completions/zsh-completions.plugin.zsh

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] && \
#     [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
#         eval "$("$BASE16_SHELL/profile_helper.sh")"

# CTRL-R - Paste the selected command from history into the command line
__fzfcmd() {
  [ -n "$TMUX_PANE" ] && { [ "${FZF_TMUX:-0}" != 0 ] || [ -n "$FZF_TMUX_OPTS" ]; } &&
    echo "fzf-tmux ${FZF_TMUX_OPTS:--d${FZF_TMUX_HEIGHT:-40%}} -- " || echo "fzf"
}

fzf-history-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail no_aliases 2> /dev/null
  selected=( $(
    FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} $FZF_DEFAULT_OPTS -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort $FZF_CTRL_R_OPTS --query=${(qqq)LBUFFER} +m" $(__fzfcmd) < <(
      fc -rl 1 | perl -ne 'print if !$seen{(/^\s*[0-9]+\**\s+(.*)/, $1)}++'
  ) ) )
  local ret=$?
  if [ -n "$selected" ]; then
    num=$selected[1]
    if [ -n "$num" ]; then
      zle vi-fetch-history -n $num
    fi
  fi
  zle reset-prompt
  return $ret
}
zle     -N   fzf-history-widget
bindkey '^R' fzf-history-widget

export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 0; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7) # white
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
