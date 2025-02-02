#!/bin/sh

# ユーザーがfujかどうかを出力
who | grep -q '^fuj\>'
echo $?