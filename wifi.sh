#!/bin/bash

# disable and enable wifi.
# if there are multiple wifi networks configured for the laptop, this will let it cycle to the next available connection

nmcli nm enable false
nmcli nm enable true
