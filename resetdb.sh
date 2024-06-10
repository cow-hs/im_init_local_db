#!/bin/bash

# Reset MariaDB
if [ -d "mariadb" ]; then
  rm -rf mariadb/data/
  echo "The MariaDB data directory has been deleted."
else
  echo "The MariaDB data directory does not exist."
fi

# Reset MongoDB
if [ -d "mongodb" ]; then
  rm -rf mongodb/data/
  echo "The MongoDB data directory has been deleted."
else
  echo "The MongoDB data directory does not exist."
fi

# Reset Redis
if [ -d "redis" ]; then
  rm -rf redis/data/
  echo "The Redis data directory has been deleted."
else
  echo "The Redis data directory does not exist."
fi

# docker-compose 중지 및 볼륨 삭제
if [ -f "docker-compose.yml" ]; then
  docker-compose down -v
  echo "The Docker containers and volumes have been deleted."
else
  echo "The docker-compose.yml file does not exist."
fi

echo "Database reset complete."