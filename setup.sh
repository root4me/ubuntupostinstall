#!/bin/bash

pushd $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) > /dev/null
source textformatting.sh


if [[ $(uppercase $1) == "INSTALL" ]]; then
  source git.sh install
  source node.sh install
  source mongo.sh install
  source docker.sh install
  source atom.sh install
fi

if [[ $(uppercase $1) == "UNINSTALL" ]]; then
  source git.sh uninstall
  source node.sh uninstall
  source mongo.sh uninstall
  source docker.sh uninstall
  source atom.sh uninstall
fi

if [[ $(uppercase $1) == "" ]]; then
  echo ${cyanfg}"Usage:
  git.sh [command]"
  echo "Commands :
  install
  uninstall" ${resetall}
fi

popd > /dev/null
