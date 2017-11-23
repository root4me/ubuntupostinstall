#!/bin/bash

dpkg -s $1 > /dev/null

if [ $? -eq 0 ]; then
  echo "Y"
else
  echo "N"
fi
