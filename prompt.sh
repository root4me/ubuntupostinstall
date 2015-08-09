#!/bin/bash

# remove user name and host name from command prompt

PS1='${debian_chroot:+($debian_chroot)}\w\$ '
