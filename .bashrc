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
export LC_TIME=C
export LESSCHARSET=utf-8

eval "$(dircolors ~/.dircolors)"

dotfiles="$HOME/dotfiles"

alias cdc='cd $(cat /var/tmp/mark/c)'
alias cd.='cd $dotfiles'
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
alias grep='grep --color=always --exclude-dir=.git'
alias ls='ls -avF --color=auto'
alias ps='ps acux --sort=rss'
alias tmux='tmux -2u'

cd()
{
  builtin cd "$@" && ls -Fav --color=auto
}

colcon_build()
{
  MAKEFLAGS=-j4

  colcon build --allow-overriding lanelet2_extension \
               --parallel-workers=8 \
               --symlink-install \
               --cmake-args -DCMAKE_BUILD_TYPE=Release
}

colcon_build_up_to()
{
  MAKEFLAGS=-j4

  colcon build --allow-overriding lanelet2_extension \
               --parallel-workers=8 \
               --symlink-install \
               --packages-up-to $@ \
               --cmake-args -DCMAKE_BUILD_TYPE=Release
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
  file="m"

  mkdir -p /var/tmp/mark || exit 1

  for each in "$@"
  do
    case "$each" in
      "-c" | "--colcon" )
        file="c"
        break;;
    esac
  done

  echo "mark: $(pwd | tee /var/tmp/mark/$file)";
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

colcon_workspace="$(cat /var/tmp/mark/c)"

if test -e "/opt/ros/humble/setup.bash"
then
  source "/opt/ros/humble/setup.bash"

  if test -e "$colcon_workspace/install/setup.bash"
  then
    source "$colcon_workspace/install/setup.bash"
  fi

  export CYCLONEDDS_URI=file:///opt/autoware/cyclonedds_config.xml
  export LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
  export LD_LIBRARY_PATH="/usr/local/libtorch/lib:$LD_LIBRARY_PATH"
  export PATH="/usr/local/cuda/bin:$PATH"
  export RCUTILS_COLORIZED_OUTPUT=1
  export RCUTILS_LOGGING_BUFFERED_STREAM=1
  export RCUTILS_LOGGING_USE_STDOUT=1
  export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
  export ROS_DOMAIN_ID=87
fi
