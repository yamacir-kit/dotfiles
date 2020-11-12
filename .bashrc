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

eval `dircolors ~/.dircolors`

dotfiles="$HOME/dotfiles"

rosrc_enabled='/var/tmp/rosrc'
rosrc_version='.rosrc-2'
rosrc_workspace="$(cat /var/tmp/mark/c)"

if test -e $rosrc_enabled
then
  source $dotfiles/$rosrc_version

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
    case "$@" in
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
        source $dotfiles/$rosrc_version
        break;;
      2)
        rosrc_version='.rosrc-2'
        echo "[.bashrc] invoke $rosrc_version";
        source $dotfiles/$rosrc_version
        break;;
      *)
        rosrc_workspace="$each"
        break;;
    esac
  done
}

function i() # identity combinator
{
  cat $@
}

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
alias cdi='cd $(cat /var/tmp/mark/c)/src/simulator/scenario_runner'
alias cdl='cd $(cat /var/tmp/mark/c)/src/simulator/scenario_simulator.iv/scenario_launcher'
alias cdm='cd $(cat /var/tmp/mark/m)'
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

function sloc()
{
  find -type f | xargs wc $@
}

function csloc()
{
  find -type f | grep -v 'CMakeFiles' | grep -E "^*\.[c|h](pp)?$" | xargs wc $@
}

function watch-cloc()
{
  watch -n5 'cloc --exclude-dir=build ./'
}

function watch-sloc()
{
  watch -n1 'find -type f | grep -v "CMakeFiles" | grep -v "git" | xargs wc $@ | sort -rn'
}

function watch-csloc()
{
  grep='grep --color=always --exclude-dir=.git'
  watch -n1 "find -type f | $grep -v 'CMakeFiles' | $grep -E '^*\.[c|h](pp)?$' | xargs wc $@ | sort -rn"
}

function watch-grep()
{
  grep='grep --color=always --exclude-dir=.git'
  watch --color -n1 "$grep -Irn ./ -e $@ | $grep -v 'CMakeFiles'"
}

update()
{
  sudo apt update
  sudo apt upgrade
  sudo apt autoremove
  sudo apt autoclean

  # sudo -H python3 -m pip install --upgrade pip
  # sudo -H python3 -m pip list --outdated /var/tmp/outdated.txt
  # sudo -H python3 -m pip install --upgrade $(/var/tmp/outdated.txt)
}

update-python()
{
  for each in $(sudo -H pip3 list -o | tail -n +3 | sed -E 's/(\w+)\s.*$/\1/' | tr '\n' ' ')
  do
    echo "package: $each"
    sudo -H pip3 install -U "$each"
  done
}

function cxx()
{
  g++-7 $@ -std=c++17 -Wall -Wextra
}

function mark()
{
  file="m"

  mkdir -p /var/tmp/mark || exit 1

  for opt in "$@"
  do
    case "$@" in
      "-c" | "--catkin" )
        file="c"
        break;;
    esac
  done

  echo "mark: $(pwd | tee /var/tmp/mark/$file)";
}

function gitinfo()
{
  if git status &> /dev/null
  then
    git_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    # echo -e "$git_branch[$(git status -s | grep -v docs | wc -l)/$(git status -s | wc -l)]"
    echo -e "$git_branch[$(git status -s | wc -l)]"
  else
    echo "norepo"
  fi
}

function bgjobs()
{
  [[ $(jobs) ]] && echo ", jobs[$(jobs | wc -l)]"
}

export PS1="\n"
export PS1="$PS1\[\e[0;36m\]( ^q^) < \[\e[0m\]\$(gitinfo)\$(bgjobs) \[\e[0;36m\])\n"
export PS1="$PS1${debian_chroot:+($debian_chroot)}\[\e[0;32m\]\u@\H: \[\e[0;33m\]\w\[\e[0m\]\n"
export PS1="$PS1>> "
