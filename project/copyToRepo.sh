#!/bin/sh

# 絶対パスを取得
DIR=$(cd $(dirname $0); pwd)

# コピー
if cp -R "${DIR}/dist/"* "${DIR}/repo/"
then
  echo 'コピーに成功しました'
else
  echo 'コピーに失敗しました'
fi