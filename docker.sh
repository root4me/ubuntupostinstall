#!/bin/bash

# Functions to install docker ce

pushd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) > /dev/null
source textformatting.sh

function installDocker() {

  sudo apt-get update
  if [[ $(source installed.sh docker-ce) == 'N' ]]; then
    sudo apt-get install \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo apt-key fingerprint 0EBFCD88

    sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
     $(lsb_release -cs) \
      stable"

    sudo apt-get update


    echo $cyanfg"Installing docker-ce" $resetall &&  sudo apt-get install -y docker-ce
    echo "${bold}${greenfg}Installed Docker" && echo ${resetall}
    echo $cyanfg"Configuring user" $resetall &&  sudo groupadd docker && sudo usermod -aG docker $USER

    echo "${bold}${redfg}You will need to log off and log back in before using docker" && echo ${resetall}

  else
    echo $cyanfg"Docker is already installed" $resetall
    dpkg -l docker-ce
  fi

}

if [[ $(uppercase $1) == "INSTALL" ]]; then
  echo ${bold}${bluefg} &&   if [[ $(source enquirer.sh Install docker-ce) == 'Y' ]]; then
    echo ${resetall} && installDocker
  fi
fi

if [[ $(uppercase $1) == "UNINSTALL" ]]; then
  echo ${bold}${bluefg} &&  if [[ $(source enquirer.sh Uninstall docker-ce) == 'Y' ]]; then
    echo ${resetall} && sudo apt-get remove --purge -y docker-ce
  fi
fi

if [[ $(uppercase $1) == "" ]]; then
  echo ${cyanfg}"Usage:
  docker.sh [command]"
  echo "Commands :
  install
  uninstall" ${resetall}
fi

popd > /dev/null
