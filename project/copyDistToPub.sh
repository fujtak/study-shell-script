#!/bin/sh

# 絶対パスを取得
DIR=$(dirname $0)

# コピー
if cp -R "${DIR}/dist/"* "${DIR}/repo/"
then
  echo 'コピーが成功しました'
  exit 0
else
  COLOR_RED='31'
  printf "\033[${COLOR_RED}m%s\033[m\n" 'コピーが失敗しました！'
  exit 1
fi