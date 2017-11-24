#!/bin/bash

# Functions to install docker ce

version="v1.22.1"

pushd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) > /dev/null
source textformatting.sh

function installAtom() {


  if [[ $(source installed.sh atom) == 'N' ]]; then

    sudo apt-get update
    echo $cyanfg"Downloading and installing Atom Editor" $resetall
    pushd ~/Downloads
    curl -L https://github.com/atom/atom/releases/download/$version/atom-amd64.deb -o atom.deb
    sudo dpkg -i atom.deb
    popd
    sudo apt-get -f install
  else
    echo $cyanfg"Atom is already installed" $resetall
    dpkg -l atom
  fi

}

if [[ $(uppercase $1) == "INSTALL" ]]; then
  echo ${bold}${bluefg} &&   if [[ $(source enquirer.sh Install atom) == 'Y' ]]; then
    echo ${resetall} && installAtom
  fi
fi

if [[ $(uppercase $1) == "UNINSTALL" ]]; then
  echo ${bold}${bluefg} &&  if [[ $(source enquirer.sh Uninstall atom) == 'Y' ]]; then
    echo ${resetall} && sudo apt-get remove --purge -y atom
  fi
fi

if [[ $(uppercase $1) == "" ]]; then
  echo ${cyanfg}"Usage:
  atom.sh [command]"
  echo "Commands :
  install
  uninstall" ${resetall}
fi

popd > /dev/null
