#!/bin/zsh

alias cd.='cd ~/dotfiles'
alias ls='ls -Fav --color=auto'
alias tmux='tmux -2u'

eval $(/opt/homebrew/bin/brew shellenv)

cd()
{
  builtin cd "$@" && ls -Fav --color=auto
}

prompt()
{
  echo ''
  echo -n '\e[0;36m( ^q^) < \e[0m'

  if git status &> /dev/null
  then
    echo -n "`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`[`git status -s | wc -l | tr -d ' '`]"
  else
    echo -n 'norepo'
  fi

  jobs_count=`jobs | wc -l | tr -d ' '`

  if test $jobs_count -ne 0
  then
    echo -n ", jobs[$jobs_count]"
  else
    echo -n ''
  fi

  echo '\e[0;36m)'
  echo '\e[0;32m%n@%m: \e[0;33m%~\e[0m'
  echo -n '>> '
}

precmd()
{
  export PROMPT=`prompt`
}

export RPROMPT="%T"
