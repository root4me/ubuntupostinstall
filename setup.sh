#!/bin/bash

echo '-- Setup starts here'

# Prompt - Install google Chrome?

read -p "Install google chrome stable build (y/n) : " chrome

if [[ "$chrome" == [Yy]* ]]
then
	echo "== Installing google chrome"
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - &&
	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && 
	sudo apt-get update && 
	sudo apt-get install google-chrome-stable
fi

# Prompt - Install nodejs ?
# Install nvm , node version .10 and .8 (most of the stuff i need work only on .8)
# Maybe prompt which all versions to install

# Prompt - Install Cloud9 IDE ?

# Prompt - Install Mongodb ?

# Prompt - Install Virtualbox ?

# Prompt - Install keepassx ?

