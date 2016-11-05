# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# -- Startup Execution -----------------------------------------
[[ -z "$TMUX" ]] && exec tmux -2u && ls -avF --color=auto


# -- Ubuntu Default Configs ------------------------------------
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


# -- Prompt ----------------------------------------------------
function parse_git_info() {
  if git status &> /dev/null; then
    git_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/');
    git_status=$(git status -s | wc -l);
    echo -e "$git_branch[$git_status]";
  else
    echo "norepo";
  fi
}

export PS1="\n\$(if test \$?; then echo \"\[\e[0;36m\]( ^q^) < \[\e[0;37m\]\$(parse_git_info) \[\e[0;36m\])\"; else echo \"\[\e[0;31m\]( ^q^) < \[\e[0;37m\]\$(parse_git_info) \[\e[0;31m\])\"; fi)\n${debian_chroot:+($debian_chroot)}\[\e[0;32m\]\u@\H: \[\e[0;33m\]\w\[\e[0;00m\]\$ "


eval `dircolors ~/.dircolors`

export locale=en_US.UTF-8
export LANG=C
export LC_MESSAGE=C
export LESSCHARSET=utf-8


# -- Dotfiles --------------------------------------------------
export DOTFILES="$HOME/dotfiles"
if export | grep -e "ros" &> /dev/null; then source ${DOTFILES}/.rosconfig; fi


# -- Standard Command Alias ------------------------------------
alias ls='ls -avF --color=auto'
alias sl='ls -avF --color=auto'
alias ks='ls -avF --color=auto'

cd() {
  builtin cd "$@" && ls -avF --color=auto
}

alias cdw='cd ~/works'
alias cdd='cd ${DOTFILES}'
alias cdm='echo "marked directory: $(cat ${DOTFILES}/marked)"; cd $(cat ${DOTFILES}/marked)'

alias grep='grep --color=auto --exclude-dir=.git'

alias ps='ps aux --sort=start_time'

alias grm='git rm $(git ls-files --deleted)'


# -- Shell Arts ------------------------------------------------
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias rank='sort | uniq -c | sort -nr'


# -- Test Area -------------------------------------------------
mark() {
  pwd > ~/dotfiles/marked
  echo "marked path: $(cat ~/dotfiles/marked)";
}
