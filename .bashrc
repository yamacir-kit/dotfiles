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

# export CXX='/usr/bin/g++-7'
# export CC='/usr/bin/gcc-7'

eval `dircolors ~/.dircolors`

dotfiles="$HOME/dotfiles"

# if test -e /opt/ros; then source $dotfiles/.rosrc2; fi

function rosrc()
{
  for opt in "$@"
  do
    case "$@" in
      1)
        source $dotfiles/.rosrc1
        break;;
      2)
        source $dotfiles/.rosrc2
        break;;
    esac
  done
}

alias ls='ls -avF --color=auto'
alias la='ls'
alias sl='ls'
alias ks='ls'

alias vu='vi'
alias vo='vi'

alias cd_='cd ~/works_'
alias cd-='cd ~/works-'
alias cde='cd ~/Desktop'
alias cdd='cd $dotfiles'
alias cdm='cd $(cat /var/tmp/mark/m)'
alias cdr='cd ~/Dropbox'
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
  find -type f | grep -v "build/" | grep -E "^*\.[c|h](pp)?$" | xargs wc $@
}

function watch-sloc()
{
  watch -n1 'find -type f | grep -v "build/" | grep -v "git" | xargs wc $@ | sort -rn'
}

function watch-csloc()
{
  watch -n1 'find -type f | grep -v "build/" | grep -v "git" | grep -E "^*\.[c|h](pp)?$" | xargs wc $@ | sort -rn'
}

function update()
{
  sudo apt update
  sudo apt upgrade
  sudo apt autoremove
  sudo apt autoclean

  # sudo -H pip2 install --upgrade pip
  # sudo -H pip2 list --outdated 2> /dev/null

  # sudo -H pip3 install --upgrade pip
  # sudo -H pip3 list --outdated
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

