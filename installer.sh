#!/bin/bash

# setting up to-do

chmod +x to-do.sh
chmod +x main.js

# sets up the to-do list file
# do not remove this as for now it will not 
# function without, right now this is for initial 
# setup, fixing can be done with the (f)ix command
echo {"tasks":[]} > list.json

# users may move the files to where ever in the system they would like
# the following code will prompt the user with where they have placed 
# the files (main.js and list.json)

echo "if left blank, the default is all files located in same directory"

echo "Enter path to JS file"
read JS_FILE_PATH

echo "Enter path to list file"
read LIST_FILE_PATH

# checking users submitted paths and making sure they are valid

if [[ -z "$JS_FILE_PATH" ]] && [[ -z "$LIST_FILE_PATH" ]]; then
  # user has entered nothing, so defaults will be chosen
  # since 
  echo "default paths selected"
else 
  # user has entered custom paths, proceed to path validation
  if [[ -d "$JS_FILE_PATH" ]] && [[ -d "$LIST_FILE_PATH" ]]; then
    echo "valid paths selected writing to config file"

    # writing to config file here 
    echo ${JS_FILE_PATH}"main.js" > to-do.config
    echo ${LIST_FILE_PATH}"list.json" >> to-do.config

  else
    # invalid path found, prompt user to create?
    echo "invalid path selected, please rerun setup"
  fi
fi

# adding alias to make calling to-do.sh
# easier -- but mostly cause i'm lazy af

#
#  echo "alias todo='PATH/TO/to-do.sh" >> /home/.bashrc
#  source ~/.bashrc
#