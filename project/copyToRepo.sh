#!/bin/sh

# 絶対パスを取得
DIR=$(cd $(dirname $0); pwd)

# コピー
if cp -R "${DIR}/dist/"* "${DIR}/repo/"
then
  echo 'コピーに成功しました'
  exit 0
else
  echo 'コピーに失敗しました'
  exit 1
fi