#!/bin/bash

# Functions to install mongo db

pushd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) > /dev/null
source textformatting.sh

function installMongoDb() {

  if [[ $(source installed.sh mongodb-org) == 'N' ]]; then
    echo $cyanfg"Installing Mongo db 3.4" $resetall
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

    echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list

    sudo apt-get update
    sudo apt-get install -y mongodb-org

    echo "${bold}${greenfg}To start mongodb : sudo service mongod start" && echo ${resetall}
  else
    echo $cyanfg"MongoDb is already installed" $resetall
    dpkg -l mongodb-org
  fi
}

if [[ $(uppercase $1) == "INSTALL" ]]; then
  echo $cyanfg"This script will install mongodb 3.4 on Ubuntu 16.04." && echo "Do not run this if the version of ubuntu is different."
  echo $cyanfg"For manual install on other versions of Ubuntu, refer to :$resetall $greenfg https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/"
  echo ${bold}${bluefg} &&   if [[ $(source enquirer.sh Install MongoDb) == 'Y' ]]; then
    echo ${resetall} && installMongoDb
  fi
fi

if [[ $(uppercase $1) == "UNINSTALL" ]]; then
  echo ${bold}${bluefg} &&  if [[ $(source enquirer.sh Uninstall MongoDb) == 'Y' ]]; then
    echo ${resetall} && sudo apt-get remove --purge -y mongodb-org
  fi
fi

if [[ $(uppercase $1) == "START" ]]; then
  sudo service mongod start
fi

if [[ $(uppercase $1) == "STOP" ]]; then
  sudo service mongod stop
fi

if [[ $(uppercase $1) == "RESTART" ]]; then
  sudo service mongod restart
fi

if [[ $(uppercase $1) == "LOG" ]]; then
  #echo "${cyanfg}tail /var/log/mongodb/mongod.log${resetall}"
  set -x

  tail /var/log/mongodb/mongod.log

  set +x
fi


if [[ $(uppercase $1) == "" ]]; then
  echo ${cyanfg}"Usage:
  mongo.sh [command]"
  echo "Commands :
  install
  uninstall
  start
  stop
  restart
  log" ${resetall}
fi

popd > /dev/null
