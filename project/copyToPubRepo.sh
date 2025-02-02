#!/bin/sh

# 絶対パスを取得
DIR=$(dirname $0)

# コピー
if cp -R "${DIR}/dist/"* "${DIR}/repo/"
then
  echo 'コピーに成功しました'
  exit 0
else
  echo 'コピーに失敗しました'
  exit 1
fi