# If not running interactively, don't do anything
[[ $- != *i* ]] && return

eval `dircolors ~/.dircolors`

# -- Ubuntu Default Configs ------------------------------------
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=4096
HISTFILESIZE=4096

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
gitinfo() {
  if git status &> /dev/null; then
    git_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/');
    git_status=$(git status -s | wc -l);
    echo -e "$git_branch[$git_status]";
  else
    echo "norepo";
  fi
}

bgjobs() {
  if [ $(jobs | wc -l) != 0 ]; then
    echo ", bgjobs[$(jobs | wc -l)]";
  fi
}

export PS1="\n\$(if test \$?; then echo \"\[\e[0;36m\]( ^q^) < \[\e[0;37m\]\$(gitinfo)\$(bgjobs) \[\e[0;36m\])\"; else echo \"\[\e[0;31m\]( ^q^) < \[\e[0;37m\]\$(gitinfo)\$(bgjobs) \[\e[0;31m\])\"; fi)\n${debian_chroot:+($debian_chroot)}\[\e[0;32m\]\u@\H: \[\e[0;33m\]\w\[\e[0;00m\]\$ "


# -- Locale and Character --------------------------------------
export LANG=C
export LC_MESSAGE=C
export LC_TIME=en_US.UTF-8
export LESSCHARSET=utf-8
export locale=en_US.UTF-8


# -- Dotfiles --------------------------------------------------
export dotfiles="${HOME}/dotfiles"
export marked="${dotfiles}/etc/marked"

if test -e /opt/ros; then
  source ${dotfiles}/.rosrc;
fi


# -- Standard Command Alias ------------------------------------
alias ls='ls -avF --color=auto'
alias sl='ls -avF --color=auto'
alias ks='ls -avF --color=auto'

cd() {
  builtin cd "$@" && ls -avF --color=auto
}

alias cdd='cd ${dotfiles}'
alias cdm='echo "marked path: $(cat ${marked}/path)"; cd $(cat ${marked}/path)'
alias cdr='cd ~/Dropbox'
alias cdw='cd ~/works'

alias grep='grep --color=always --exclude-dir=.git'

alias ps='ps aux --sort=start_time'

alias tmux='tmux -2u'


# -- Shell Arts ------------------------------------------------
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias rank='sort | uniq -c | sort -nr'


# -- Test Area -------------------------------------------------
mark() {
  marked_path="path"
  message="next path marked"

  mkdir -p ${marked} || exit 1

  for opt in "$@"
  do
    case "$@" in
      "-c" | "--catkin" )
        marked_path="catkin_ws"
        message="next path marked as catkin workspace"
        ;;
    esac
  done

  pwd > "${marked}/${marked_path}"
  echo "${message}: $(cat "${marked}/${marked_path}")";
}

if test -e ~/.Xmodmap; then
  xmodmap ~/.Xmodmap
fi

