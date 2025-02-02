#!/bin/bash

print_error()
(
  message=$1
  printf "\033[31m%s\033[m\n" $message
)

print_bar()
(
  percent=$1

  width_indicator=71
  width_arrow=`expr $width_indicator \* $percent / 100`
  width_space=`expr $width_indicator - $width_arrow`

  bar='\r['

  i=0
  while [ $i -lt $width_arrow ]; do
    bar=$bar'='
    i=`expr $i + 1`
  done
  bar="$bar>"

  j=0
  while [ $j -lt $width_space ]; do
    bar=$bar'_'
    j=`expr $j + 1`
  done

  bar="$bar] $percent%\c"

  echo -e $bar
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

  count_files=`find ./dist/ -type f | wc -l`

  i=0
  for file in './dist/'*
  do
    cp -r $file './target/'
    percent=`expr $i / $count_files \* 100`
    print_bar $percent
    i=`expr $i + 1` # increment
  done

  echo -e "\r"
  echo 'completed'
)

main