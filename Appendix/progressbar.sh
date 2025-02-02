#!/bin/bash

print_bar()
(
  percent=$1

  width_indicator=71
  width_arrow=`expr $width_indicator \* $percent / 100`
  width_space=`expr $width_indicator - $width_arrow`

  bar='\r['

  i=0
  while [ $i -lt $width_arrow ]
  do
    bar=$bar'='
    i=`expr $i + 1`
  done
  bar="$bar>"

  j=0
  while [ $j -lt $width_space ]
  do
    bar=$bar'_'
    j=`expr $j + 1`
  done

  bar="$bar] $percent%\c"

  echo -e $bar
)

main()
{
  # 擬似的に進捗の%を再現
  i=0
  while [ $i -le 100 ]
  do
    print_bar $i
    sleep 0.05
    i=`expr $i + 1`
  done
  echo -e "\r"
  echo 'completed'
}

main