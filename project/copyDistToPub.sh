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
  width_arrow=$(( $width_indicator * $percent / 100 ))
  width_space=$(( $width_indicator - $width_arrow ))

  bar='\r['

  i=0
  while [ $i -lt $width_arrow ]; do
    bar=$bar'='
    (( i++ ))
  done
  bar="$bar>"

  j=0
  while [ $j -lt $width_space ]; do
    bar=$bar'_'
    (( j++ ))
  done

  bar="$bar] $percent%\c"

  echo -e $bar
)

copy()
(
  dir_base=$1
  dir_target=$2

  if ! [ -d $dir_base ]; then
    print_error "$dir_base が存在しません"
    exit 1
  elif ! [ -d $dir_target ]; then
    print_error "$dir_target が存在しません"
    exit 1
  fi

  count_files=`find $dir_base -type f | wc -l`

  i=1
  for file in $dir_base*; do
    cp -r $file $dir_target
    percent=$(( i * 100 / count_files ))
    print_bar $percent
    (( i++ ))
  done

  echo -e "\r"
  echo "$dir_base から $dir_target へコピーが完了しました"
)

copy './dist/' './target/'