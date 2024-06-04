#!/bin/bash

# MariaDB 리셋
if [ -d "mariadb" ]; then
  rm -rf mariadb/*
  echo "MariaDB 데이터 디렉토리가 삭제되었습니다."
else
  echo "MariaDB 데이터 디렉토리가 존재하지 않습니다."
fi

# MongoDB 리셋
if [ -d "mongodb" ]; then
  rm -rf mongodb/*
  echo "MongoDB 데이터 디렉토리가 삭제되었습니다."
else
  echo "MongoDB 데이터 디렉토리가 존재하지 않습니다."
fi

# Redis 리셋
if [ -d "redis" ]; then
  rm -rf redis/*
  echo "Redis 데이터 디렉토리가 삭제되었습니다."
else
  echo "Redis 데이터 디렉토리가 존재하지 않습니다."
fi

# docker-compose 중지 및 볼륨 삭제
if [ -f "docker-compose.yml" ]; then
  docker-compose down -v
  echo "Docker 컨테이너와 볼륨이 삭제되었습니다."
else
  echo "docker-compose.yml 파일이 존재하지 않습니다."
fi

echo "데이터베이스 리셋 완료."