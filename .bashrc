# If not running interactively, don't do anything
case $- in
  *i*) ;;
*) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=2048
HISTFILESIZE=2048

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

export PS1="${debian_chroot:+($debian_chroot)}\[\e[0;32m\]\u@\H: \[\e[0;33m\]\w\[\e[0;00m\]\$ "


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


eval `dircolors ~/.dircolors`

export locale=en_US.UTF-8
export LANG=C
export LC_MESSAGE=C

export DOTFILES_DIR="$HOME/dotfiles"

# Alias
alias ls='ls -avF --color=auto'
alias sl='ls -avF --color=auto'
alias ks='ls -avF --color=auto'

alias cdd='cd ${DOTFILES_DIR}'
alias cdw='cd ~/works'

alias grep='grep --color=auto'
alias ps='ps aux --sort=start_time'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias grm='git rm $(git ls-files --deleted)'
alias tmux='tmux -2u'


# -------------------------------------------------------------
#  ROS
# -------------------------------------------------------------
if [ -e ${DOTFILES_DIR}/.rosconfig ]; then
  source ${DOTFILES_DIR}/.rosconfig
fi


# -------------------------------------------------------------
#  TEST
# -------------------------------------------------------------
alias rank='sort | uniq -c | sort -nr' # usage: cmd | rank

cd() {
  builtin cd "$@" && ls -avF --color=auto
}
