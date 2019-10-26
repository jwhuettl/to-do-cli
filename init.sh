#!/bin/bash

# setting up to-do

chmod +x to-do.sh
chmod +x main.js

# sets up the to-do list file
# do not remove this as for now it will not 
# function without, this will be changed in 
# the future
echo {"tasks":[]} > list.json

# adding alias to make calling to-do.sh
# easier -- but mostly cause i'm lazy af

#
#  echo "alias todo='PATH/TO/to-do.sh" > /home/.bashrc
#
#