#!/bin/bash

  config="./to-do.conf"


  # reading config file
  while IFS= read -r path 
  do
    JS_FILE_PATH="$path"
  done < "$config"
  
  LIST_FILE_PATH="$path"

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
    'f'*) # fix
      rm ${LIST_FILE_PATH}
      touch ${LIST_FILE_PATH}
      echo '{"tasks":[]}' > ${LIST_FILE_PATH}
      ;;
    's'*) # show
      node ${JS_FILE_PATH} ${LIST_FILE_PATH} "show"
      ;;
    *) # default
      echo "command not found ..."
  esac