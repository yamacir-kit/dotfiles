#!/bin/bash

[[ $- != *i* ]] && return

shopt -s histappend
shopt -s checkwinsize

HISTCONTROL=ignoreboth
HISTFILESIZE=65536
HISTSIZE=65536

test -x /usr/bin/lesspipe && eval "$(SHELL=/bin/sh lesspipe)"

if test -z "${debian_chroot:-}" && test -r /etc/debian_chroot
then
  debian_chroot=$(cat /etc/debian_chroot)
fi

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

export LANG=ja_JP.UTF-8
export LC_TIME=C
export LESSCHARSET=utf-8

eval "$(dircolors ~/.dircolors)"

dotfiles="$HOME/dotfiles"

alias ls='ls -avF --color=auto'
alias la='ls'
alias sl='ls'
alias ks='ls'

alias vu='vi'
alias vo='vi'

alias cd.='cd $dotfiles'
alias cdc='cd $(cat /var/tmp/mark/c)'
alias cdd='cd ~/Documents'
alias cde='cd ~/Desktop'
alias cdi='cd $(cat /var/tmp/mark/c)/src/simulator/scenario_simulator/openscenario/openscenario_interpreter'
alias cdl='cd $(cat /var/tmp/mark/c)/src/simulator/scenario_simulator/test_runner/scenario_test_runner'
alias cdm='cd $(cat /var/tmp/mark/m)'
alias cdo='cd ~/Downloads'
alias cdr='cd ~/Dropbox'
alias cds='cd $(cat /var/tmp/mark/c)/src'
alias cdt='cd ~/works/toybox'
alias cdw='cd ~/works'

alias alpha='for each in $(echo {a..z}); do echo $each; done'

alias grep='grep --color=always --exclude-dir=.git'
alias ps='ps acux --sort=rss'
alias rank='sort | uniq -c | sort -nr'
alias tmux='tmux -2u'

function cd()
{
  builtin cd "$@" && ls -Fav --color=auto
}

sloc()
{
  find . -type f | grep -Fv -e '.git' -e 'CMakeFiles' | xargs wc | sort -rn
}

csloc()
{
  sloc | grep -E '^*\.[c|h](pp)?$'
}

watch-sloc()
{
  watch -n1 "$@" -x bash -c sloc
}

watch-csloc()
{
  watch -n1 "$@" -x bash -c csloc
}

export -f sloc
export -f csloc

watch-grep()
{
  watch --color -n1 "grep --color=always --exclude-dir=.git --exclude-dir=build -Irn ./ -e $*"
}

update()
{
  for each in "$@"
  do
    case "$each" in
      -a | --apt )
        sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean
        break;;

      -p | --python )
        sudo -H pip3 install -U pip
        sudo -H pip3 list -o --format=freeze | grep -v '^\-e' | cut -d'=' -f1 | xargs -n1 sudo -H pip3 install -U
        break;;
    esac
  done
}

cxx()
{
  "$CXX" "$@" -std=c++17 -Wall -Wextra -Wpedantic
}

memcheck()
{
  valgrind --error-exitcode=1 --leak-check=full --quiet --show-leak-kinds=all "$@"
}

mark()
{
  file="m"

  mkdir -p /var/tmp/mark || exit 1

  for each in "$@"
  do
    case "$each" in
      "-c" | "--catkin" )
        file="c"
        break;;
    esac
  done

  echo "mark: $(pwd | tee /var/tmp/mark/$file)";
}

gitinfo()
{
  if git status &> /dev/null
  then
    echo -e "$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')[$(git status -s | wc -l)]"
  else
    echo "norepo"
  fi
}

bgjobs()
{
  [[ $(jobs) ]] && echo ", jobs[$(jobs | wc -l)]"
}

export PS1="\n"
export PS1="$PS1\[\e[0;36m\]( ^q^) < \[\e[0m\]\$(gitinfo)\$(bgjobs) \[\e[0;36m\])\n"
export PS1="$PS1${debian_chroot:+($debian_chroot)}\[\e[0;32m\]\u@\H: \[\e[0;33m\]\w\[\e[0m\]\n"
export PS1="$PS1>> "

rosrc_enabled='/var/tmp/rosrc'
rosrc_version='.rosrc-2'
rosrc_workspace="$(cat /var/tmp/mark/c)"

if test -e $rosrc_enabled
then
  source "$dotfiles"/$rosrc_version

  echo -n "[$rosrc_version] auto-source $rosrc_workspace/install/setup.bash => "

  if test -e "$rosrc_workspace/install/setup.bash"
  then
    if source "$rosrc_workspace/install/setup.bash"
    then
      echo "success"
    else
      echo "failure"
    fi
  else
    echo "skipped (not exist)"
  fi
fi

function rosrc()
{
  for each in "$@"
  do
    case "$each" in
      +)
        touch $rosrc_enabled
        echo "[.bashrc] enabled rosrc auto-source";
        break;;
      -)
        rm $rosrc_enabled
        echo "[.bashrc] disabed rosrc auto-source";
        break;;
      1)
        rosrc_version='.rosrc-1'
        echo "[.bashrc] invoke $rosrc_version";
        source "$dotfiles/$rosrc_version"
        break;;
      2)
        rosrc_version='.rosrc-2'
        echo "[.bashrc] invoke $rosrc_version";
        source "$dotfiles/$rosrc_version"
        break;;
      *)
        rosrc_workspace="$each"
        break;;
    esac
  done
}

# ---- Autoware ----------------------------------------------------------------

export CYCLONEDDS_URI=file:///opt/autoware/cyclonedds_config.xml
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
export LD_LIBRARY_PATH="/usr/local/libtorch/lib:$LD_LIBRARY_PATH"
export PATH="/usr/local/cuda/bin:$PATH"
export RCUTILS_COLORIZED_OUTPUT=1
export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp

# export VEHICLE_ID=logiee_s-tc_01
export VEHICLE_ID=eva_m0-004
