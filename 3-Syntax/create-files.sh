#!/bin/bash

i=0
while [ $i -le 1000 ]; do
  echo "dist$i" > "./dist/dummy$i.txt"
  i=`expr $i + 1`
done