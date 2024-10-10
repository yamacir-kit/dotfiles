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

export LANG=en_US.UTF-8
export LC_COLLATE=C
export LC_TIME=C
export LESSCHARSET=utf-8

eval "$(dircolors ~/.dircolors)"

dotfiles="$HOME/dotfiles"

alias cda='cd $(cat /var/tmp/mark/a)'
alias cdb='cd $(cat /var/tmp/mark/b)'
alias cdc='cd $(cat /var/tmp/mark/c)'
alias cdd='cd $(cat /var/tmp/mark/d)'
alias cde='cd $(cat /var/tmp/mark/e)'
alias cdf='cd $(cat /var/tmp/mark/f)'
alias cdg='cd $(cat /var/tmp/mark/g)'
alias cdh='cd $(cat /var/tmp/mark/h)'
alias cdi='cd $(cat /var/tmp/mark/i)'
alias cdj='cd $(cat /var/tmp/mark/j)'
alias cdk='cd $(cat /var/tmp/mark/k)'
alias cdl='cd $(cat /var/tmp/mark/l)'
alias cdm='cd $(cat /var/tmp/mark/m)'
alias cdn='cd $(cat /var/tmp/mark/n)'
alias cdo='cd $(cat /var/tmp/mark/o)'
alias cdp='cd $(cat /var/tmp/mark/p)'
alias cdq='cd $(cat /var/tmp/mark/q)'
alias cdr='cd $(cat /var/tmp/mark/r)'
alias cds='cd $(cat /var/tmp/mark/s)'
alias cdt='cd $(cat /var/tmp/mark/t)'
alias cdu='cd $(cat /var/tmp/mark/u)'
alias cdv='cd $(cat /var/tmp/mark/v)'
alias cdw='cd $(cat /var/tmp/mark/w)'
alias cdx='cd $(cat /var/tmp/mark/x)'
alias cdy='cd $(cat /var/tmp/mark/y)'
alias cdz='cd $(cat /var/tmp/mark/z)'

alias grep='grep --color=always --exclude-dir=.git'
alias ls='ls -avF --color=auto'
alias ps='ps acux --sort=rss'
alias tmux='tmux -2u'

cd()
{
  builtin cd "$@" && ls -Fav --color=auto
}

watch_grep()
{
  watch --color \
        --interval 1 \
        --exec grep --binary-files=without-match \
                    --color=always \
                    --exclude=CHANGELOG.* \
                    --exclude-dir=build \
                    --exclude-dir=.git \
                    --line-number \
                    --recursive \
                    "$*" ./
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

mark()
{
  for each in "$@"
  do
    if test ${#each} -eq 1
    then
      mkdir -p /var/tmp/mark || exit 1
      echo "marked $(pwd | tee /var/tmp/mark/$each) as '$each'";
    else
      case "$each" in
        "-l" | "--list" )
          for each in /var/tmp/mark/*
          do
            echo -e "$(basename $each)\t$(cat $each)"
          done
      esac
    fi
  done
}

develop()
{
  session_name='develop'

  if tmux has-session -t $session_name
  then
    tmux -2u attach-session -d -t $session_name
  else
    tmux new-session -c "$HOME/.meevax" -d -s $session_name

    tmux split-window -c "$HOME/.meevax" -h
    tmux split-window -c "$HOME/.meevax" -h
    tmux split-window -c "$HOME/.meevax" -h
    tmux split-window -c "$HOME/.meevax" -h

    tmux select-layout even-horizontal

    tmux split-window -c "$HOME/.meevax" -v
    tmux split-window -c "$HOME/.meevax" -v

    tmux select-pane -t 0
    tmux send "clear && ./script/update.sh -DCMAKE_BUILD_TYPE=Release -DCMAKE_CXX_COMPILER=g++" ENTER

    tmux select-pane -t 4
    tmux send "watch -cn1 git status" ENTER

    tmux select-pane -t 5
    tmux send "watch -cn1 git diff --stat --color --cached" ENTER

    tmux select-pane -t 6
    tmux send "watch -cn1 git diff --stat --color" ENTER

    tmux new-window -c "$HOME/.meevax"

    tmux split-window -c "$HOME/.meevax" -h
    tmux split-window -c "$HOME/.meevax" -h
    tmux split-window -c "$HOME/.meevax" -h
    tmux split-window -c "$HOME/.meevax" -h

    tmux select-layout even-horizontal

    tmux select-pane -t 0
    tmux split-window -c "$HOME/.meevax" -v

    tmux select-pane -t 0
    tmux send "du -b ./build/bin/meevax" ENTER

    tmux select-pane -t 1
    tmux send "du -b ./build/lib/*" ENTER

    tmux select-window -t 0
    tmux select-pane -t 0

    tmux -2u attach-session -d -t $session_name
  fi
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
