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


alias ls="ls -l --color=auto --group-directories-first"
if command -v exa &> /dev/null; then
    alias ls="exa -l --color=auto --group-directories-first --icons"
fi

# aliases
alias vim="nvim"
alias pm="pulsemixer"
alias ip="ip -color=auto"
alias grep="grep --color=auto"
alias diff='diff --color=auto'
alias ranger='. ranger'
alias oot='(cd /home/ton1ght/repos/shipwright/ && ./soh.appimage)'

# exports
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export EDITOR="nvim"
export MANPAGER='less -s -M +Gg'
export PATH=$PATH:/home/ton1ght/scripts:/home/ton1ght/.local/bin

if [ -z $SSH_AUTH_SOCK ]; then
    export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
fi

# plugins
source $HOME/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fpath+=$HOME/.config/zsh/pure
source $HOME/.config/zsh/pure/pure.plugin.zsh
fpath+=$HOME/.config/zsh/zsh-completions/src
source $HOME/.config/zsh/zsh-completions/zsh-completions.plugin.zsh

if [ ${RANGER_LEVEL:-0} -ne 0 ]; then
    RPROMPT=""
else
    RPROMPT=""
fi

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

function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
