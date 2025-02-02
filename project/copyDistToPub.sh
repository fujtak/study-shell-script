#!/bin/bash

print_error()
(
  message=$1
  printf "\033[31m%s\033[m\n" $message
)

main()
(
  if ! [ -d "./dist/" ]; then
    print_error './dist/が存在しません'
    exit 1
  elif ! [ -d "./target/" ]; then
    print_error './target/が存在しません'
    exit 1
  fi

  for file in './dist/'*
  do
    cp -r $file './target/'
  done
)

main