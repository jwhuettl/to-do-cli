#!/bin/bash

  # some configuration stuff

  # this is the path to the javascript script
  # eventually I would like to move this to a config file 
  # default values or if no config file (./main.js and ./list.json)
  JS_FILE_PATH="/home/$USER/to-do-cli/main.js"
  LIST_FILE_PATH="/home/$USER/to-do-cli/list.json"


  # disregard cmd case
  shopt -s nocasematch

  cmd=$1  # getting operation
  shift
  task=$* # getting task

  # 'parsing' for action
  case "$cmd" in
    'a'*) # add
      if [[ ! -z "$task" ]]; then
        node ${JS_FILE_PATH} ${LIST_FILE_PATH} "add" "$task"
      else
        echo "no task specified"
      fi
      ;;
    'c'*) # clean
      node ${JS_FILE_PATH} ${LIST_FILE_PATH} "clean"
      ;;
    'd'*) # done
      if [[ ! -z "$task" ]]; then
        node ${JS_FILE_PATH} ${LIST_FILE_PATH} "done" "$task"
      else 
        echo "no task specified"
      fi
      ;;
    's'*) # show
      node ${JS_FILE_PATH} ${LIST_FILE_PATH} "show"
      ;;
    *) # default
      echo "command not found ..."
  esac