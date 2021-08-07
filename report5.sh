#!/bin/bash

#変数の数Check
if [ $# -ne 2 ];
then
  echo "input 2 argments"
  exit 1
fi

#自然数Check
expr $1 + $2 > /dev/null 2>&1
if [ $? -ge 2 ];
then
  echo "input natural number"
  exit 1
fi

#負数Check
if [ $1 -lt 0 -o $2 -lt 0 ];
then
  echo "input positive number"
  exit 1
fi

a=$1
b=$2
while [ $b -ne 0 ]; do
  #echo "$a % $b"
  let remainder=$a%$b
  a=$b
  b=$remainder
  #echo $b
done
echo $a
