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
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]
then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix
then
  if test -f /usr/share/bash-completion/bash_completion
  then
    . /usr/share/bash-completion/bash_completion
  elif test -f /etc/bash_completion
  then
    . /etc/bash_completion
  fi
fi


# -- Prompt ----------------------------------------------------
gitinfo()
{
  if git status &> /dev/null
  then
    git_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    # git_status=$(git status -s | wc -l)
    echo -e "$git_branch[$(git status -s | wc -l)]"
  else
    echo "norepo"
  fi
}

bgjobs() {
  if test $(jobs | wc -l) != 0
  then
    echo ", bgjobs[$(jobs | wc -l)]"
  fi
}

ascii_face_success="\[\e[0;36m\]( ^q^) < \[\e[0;37m\]\$(gitinfo)\$(bgjobs) \[\e[0;36m\])"
ascii_face_failed="\[\e[0;31m\]( ^q^) < \[\e[0;37m\]\$(gitinfo)\$(bgjobs) \[\e[0;31m\])"
export PS1="\n\$(if test \$?; then echo \"$ascii_face_success\"; else echo \"$ascii_face_failed\"; fi)\n${debian_chroot:+($debian_chroot)}\[\e[0;32m\]\u@\H: \[\e[0;33m\]\w\[\e[0;00m\]\$ "


export LANG=C
export LC_MESSAGE=C
export LC_TIME=en_US.UTF-8
export LESSCHARSET=utf-8
export locale=en_US.UTF-8

export  CC='gcc-7'
export CXX='g++-7'


# -- Dotfiles --------------------------------------------------
export dotfiles="$HOME/dotfiles"
export marked="$dotfiles/etc/marked"

if test -e /opt/ros; then source $dotfiles/.rosrc; fi


# -- Standard Command Alias ------------------------------------
function cd()
{
  builtin cd "$@" && ls -avF --color=auto
}


alias ls='ls -avF --color=auto'
alias sl='ls -avF --color=auto'
alias ks='ls -avF --color=auto'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias cdd='cd $dotfiles'
alias cdm='echo "move marked path: $(cat $marked/unnamed)"; cd $(cat $marked/unnamed)'
alias cdr='cd ~/Dropbox'
alias cdt='cd ~/works/toybox'
alias cdw='cd ~/works'

alias grep='grep --color=always --exclude-dir=.git'

alias ps='ps aux --sort=start_time'

alias tmux='tmux -2u'

alias rank='sort | uniq -c | sort -nr'


function update()
{
  sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean
}


function cxx17b()
{
  compiler="g++-7"
  cxx_version="-std=c++17"
  options="-Wall -Wextra -O3"
  boost_links="-lboost_system -lboost_thread -lboost_date_time"

  $compiler $@ $cxx_version $options $boost_links
}


function mark()
{
  file="unnamed"
  info="[mark] following path marked"

  mkdir -p $marked || exit 1

  for opt in "$@"
  do
    case "$@" in
      "-c" | "--catkin" )
        file="catkin"
        info="$info as catkin workspace"
        ;;
    esac
  done

  echo "$info: $(pwd | tee $marked/$file)";
}

