#!/bin/bash

print_error()
(
  if [ $# -ne 1 ]; then
    print_error "エラー: 引数に過不足があります。第一引数にエラーメッセージとして出力したい文字列を入力してください。"
    exit 1
  fi

  message=$1
  printf "\033[31m%s\033[m\n" $message
)

print_bar()
(
  if [ $# -ne 1 ]; then
    print_error "エラー: 引数に過不足があります。第一引数に進捗のパーセンテージを数値で入力してください。"
    exit 1
  fi

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
  bar=$bar'>'

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
  if [ $# -ne 2 ]; then
    print_error "エラー: 引数に過不足があります。第一引数にコピー元のディレクトリのパス、第二引数にコピー先のディレクトリのパスを入力してください。"
    exit 1
  fi

  dir_base=$1
  dir_target=$2

  if ! [ -d $dir_base ]; then
    print_error "エラー: $dir_base ディレクトリが存在しません。"
    exit 1
  elif ! [ -d $dir_target ]; then
    print_error "エラー: $dir_target ディレクトリが存在しません。"
    exit 1
  fi

  count_files=`find $dir_base -type f | wc -l`

  if [ $count_files -le 0 ]; then
    print_error "エラー: $dir_base ディレクトリ配下にファイルが存在しません。"
    exit 1
  fi

  echo "コピー開始 $dir_base => $dir_target"

  i=1
  for file in $dir_base*; do
    cp -r $file $dir_target
    percent=$(( i * 100 / count_files ))
    print_bar $percent
    (( i++ ))
  done

  echo -e "\r"
  echo "コピー完了"
)

copy './dist/' './target/'