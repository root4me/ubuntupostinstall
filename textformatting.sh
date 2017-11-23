#!/bin/bash

#echo "Loading script : textformatting"
#echo "Contains Text Formatting varaibles and functions"
#echo "Run argument : texty"

blackfg="$(tput setaf 0)"
redfg="$(tput setaf 1)"
greenfg="$(tput setaf 2)"
yellowfg="$(tput setaf 3)"
bluefg="$(tput setaf 4)"
purplefg="$(tput setaf 5)"
cyanfg="$(tput setaf 6)"
whitefg="$(tput setaf 7)"

blackbg="$(tput setab 0)"
redbg="$(tput setab 1)"
greenbg="$(tput setab 2)"
yellowbg="$(tput setab 3)"
bluebg="$(tput setab 4)"
purplebg="$(tput setab 5)"
cyanbg="$(tput setab 6)"
whitebg="$(tput setab 7)"

bold="$(tput bold)"
startunderline="$(tput smul)"
endunderline="$(tput rmul)"
bold="$(tput bold)"

resetall="$(tput sgr0)"


# usage
# echo $(uppercase $1)
function uppercase {
  echo "${1^^}"
}

function lowecase {
  echo "${1,,}"
}

function run {
  echo $whitebg $blackfg "black text - white background" $resetall
  echo $greenfg "green text" $resetall
  echo $redfg "Red text" $resetall
  echo $yellowfg "yellow text" $resetall
  echo $bluefg "blue text" $resetall
  echo $purplefg "purple text" $resetall
  echo $cyanfg "cyan text" $resetall
  echo $whitefg "white text" $resetall
  echo $startunderline "underline text" $resetall
  echo $bold "bold text" $resetall
}

if [[ $(uppercase $1) == "TEXTY" ]]; then
  run
fi
