#!/bin/bash

# Functions to install git

pushd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) > /dev/null
source textformatting.sh

function installGit() {

  if [[ $(source installed.sh curl) == 'N' ]]; then
    echo $cyanfg "Installing curl" $resetall &&  sudo apt-get install curl
  fi
  if [[ $(source installed.sh git) == 'N' ]]; then
    echo $cyanfg "Installing git" $resetall &&  sudo apt-get install git

    # Set git to use https:// . Firewalls usually blocks git:// calls
    git config --global url."https://".insteadOf git://
  else
    echo $cyanfg"Git is already installed" $resetall
    dpkg -l git
  fi
}

if [[ $(uppercase $1) == "INSTALL" ]]; then
  echo ${bold}${bluefg} &&   if [[ $(source enquirer.sh Install git) == 'Y' ]]; then
    echo ${resetall} && installGit
  fi
fi

if [[ $(uppercase $1) == "UNINSTALL" ]]; then
  echo ${bold}${bluefg} &&  if [[ $(source enquirer.sh Uninstall git) == 'Y' ]]; then
    echo ${resetall} && sudo apt-get remove --purge -y git
  fi
fi

if [[ $(uppercase $1) == "" ]]; then
  echo ${cyanfg}"Usage:
  git.sh [command]"
  echo "Commands :
  install
  uninstall" ${resetall}
fi

popd > /dev/null
