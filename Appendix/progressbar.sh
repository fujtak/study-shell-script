#!/bin/sh

main()
{
  i=0
  while [ $i -le 100 ]
  do
    echo "ループ${i}回目"
    sleep 1
    i=$(expr $i + 1)
  done
}

main