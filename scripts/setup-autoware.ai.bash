#!/bin/bash -eu

scripts=$(cd "$(dirname $0)/.."; pwd)

if test $# -ne 1
then

  echo "error: this script require install destination as operand."
  exit 1

else

  echo "install destination: $1"

  sudo apt update

  sudo apt install python-catkin-pkg \
                   python-rosdep \
                   ros-$ROS_DISTRO-catkin \
                   python3-pip \
                   python3-colcon-common-extensions \
                   python3-setuptools \
                   python3-vcstool

  sudo -H python3 -m pip install --upgrade pip
  sudo -H python3 -m pip install --upgrade setuptools

  echo "mkdir -p $1/autoware.ai/src"
        mkdir -p $1/autoware.ai/src

  pushd $1/autoware.ai
  wget -O autoware.ai.repos "https://gitlab.com/autowarefoundation/autoware.ai/autoware/raw/1.12.0/autoware.ai.repos?inline=false"

  vcs import src < autoware.ai.repos

  rosdep update
  rosdep install -y --from-paths src --ignore-src --rosdistro $ROS_DISTRO

  read -p "build autoware.ai? (y/N): " answer
  case "$answer" in
    [yY]*)
      colcon build --cmake-args -DCMAKE_BUILD_TYPE=Release
      break
      ;;
    *)
      echo "abort"
      break
      ;;
  esac

fi

