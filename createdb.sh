#!/bin/bash

# mariadb 폴더 생성
if [ ! -d "mariadb" ]; then
  mkdir mariadb
  echo "mariadb 폴더가 생성되었습니다."
else
  echo "mariadb 폴더가 이미 존재합니다."
fi

# mongodb 폴더 생성  
if [ ! -d "mongodb" ]; then
  mkdir mongodb
  echo "mongodb 폴더가 생성되었습니다."
else
  echo "mongodb 폴더가 이미 존재합니다."
fi

# redis 폴더 생성
if [ ! -d "redis" ]; then
  mkdir redis
  echo "redis 폴더가 생성되었습니다."
else
  echo "redis 폴더가 이미 존재합니다."
fi

echo "데이터베이스 폴더 생성 완료."
