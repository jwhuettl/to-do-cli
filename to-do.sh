#!/bin/bash

  # disregard cmd case
  shopt -s nocasematch

  cmd=$1  # getting operation
  shift
  task=$* # getting task

  # 'parsing' for action
  case "$cmd" in
    'a'*) # add
      if [[ ! -z "$task" ]]; then
        node main.js "add" "$task"
      else
        echo "no task specified"
      fi
      ;;
    'c'*) # clean
      node main.js "clean"
      ;;
    'd'*) # done
      if [[ ! -z "$task" ]]; then
        node main.js "done" "$task"
      else 
        echo "no task specified"
      fi
      ;;
    's'*) # show
      node main.js "show"
      ;;
    *) # default
      echo "command not found ..."
  esac