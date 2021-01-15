#!/bin/sh

set -e

if [ "$(uname)"=="Linux" ]; then                              # Checks the OS of the user
  . /etc/os-release
  echo "$ID"
  if [ "$ID"=="ubuntu" ]; then
    if ! [ -x "$(command -v wget)" ]; then 
      echo "Installing wget"
      apt install wget
    fi
  
    if ! [ -x "$(command -v curl)" ]; then
      echo "Installing curl"
      apt install curl
    fi

    if ! [ -x "$(command -v node)" ]; then
      echo "Installing node"
      apt install node
    fi
  
  elif [ "$ID"=="centos" ]; then
    if ! [ -x "$(command -v wget)" ]; then 
      echo "Installing wget"
      yum install wget
    fi
  
    if ! [ -x "$(command -v curl)" ]; then
      echo "Installing curl"
      yum install curl
    fi

    if ! [ -x "$(command -v node)" ]; then
      echo "Installing node"
      yum install node
    fi
  fi
elif [ "$(uname)"=="Darwin" ]; then              # check the OS of the user
  echo "Mac"
  if ! [ -x "$(command -v wget)" ]; then 
    echo "Installing wget"
    brew install wget
  fi
  
  if ! [ -x "$(command -v curl)" ]; then
    echo "Installing curl"
    brew install curl
  fi

  if ! [ -x "$(command -v node)" ]; then
    echo "Installing node"
    brew install node
  fi
fi

