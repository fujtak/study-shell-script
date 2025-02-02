#!/bin/sh

if cp -R ./dist/* ./repo
then
  echo 'コピーに成功しました'
else
  echo 'コピーに失敗しました'
fi