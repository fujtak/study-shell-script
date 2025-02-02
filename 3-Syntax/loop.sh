#!/bin/sh

i=0
while [ $i -le 100 ]
do
  echo "ループ${i}回目"
  i=$(expr $i + 1)
done