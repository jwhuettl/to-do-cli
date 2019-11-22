#!/bin/bash

  # reading config file
  declare -a cfg # cfg array

  # reads line by into cfg
  for line in $(cat config.ini);
  do
    cfg+=($line)
  done

  # moving cfg to proper vars
  JS_FILE_PATH=${cfg[0]}
  LIST_FILE_PATH=${cfg[1]}


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
