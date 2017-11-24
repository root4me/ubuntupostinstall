#!/bin/bash

# Functions to install nodejs
# Command line argument : insta

pushd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) > /dev/null
source textformatting.sh

function installNodejs() {

  if [[ $(source installed.sh nodejs) == 'N' ]]; then
    echo $cyanfg"Need to run apt-get upgrade" $resetall
    sudo apt-get update && sudo apt-get upgrade

    if [[ $(source installed.sh curl) == 'N' ]]; then
      echo $cyanfg"Installing curl" $resetall
      sudo apt-get install -y curl
    fi

    if [[ $(source installed.sh build-essential) == 'N' ]]; then
      echo $cyanfg"Installing build essential" $resetall
      sudo apt-get install -y build-essential
    fi

    echo $cyanfg"Installing nodejs 8.x" $resetall
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get install -y nodejs
    echo "${bold}${greenfg}Installed nodejs" && node -v && echo ${resetall}
  else
    echo $cyanfg"Node js  is already installed" $resetall
    dpkg -l nodejs
  fi

}

if [[ $(uppercase $1) == "INSTALL" ]]; then
  echo ${bold}${bluefg} && if [[ $(source enquirer.sh Install Nodejs) == 'Y' ]]; then
    echo ${resetall} && installNodejs
  fi
fi

if [[ $(uppercase $1) == "UNINSTALL" ]]; then
  echo ${bold}${bluefg}
  if [[ $(source enquirer.sh Uninstall Nodejs) == 'Y' ]]; then
    echo ${resetall} && sudo apt-get remove --purge -y nodejs
    #echo && echo "${bold}${greenfg}Uninstalled nodejs${resetall}" && echo
  fi
fi

if [[ $(uppercase $1) == "" ]]; then
  echo ${cyanfg}"Usage:
  node.sh [command]"
  echo "Commands :
  install
  uninstall" ${resetall}
fi

popd > /dev/null
