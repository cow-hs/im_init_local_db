#!/bin/bash

# Create mariadb folder
if [ ! -d "mariadb" ]; then
  mkdir mariadb
  echo "The mariadb folder has been created."
else
  echo "The mariadb folder already exists."
fi

# Create mongodb folder  
if [ ! -d "mongodb" ]; then
  mkdir mongodb
  echo "The mongodb folder has been created."
else
  echo "The mongodb folder already exists."
fi

# Create redis folder
if [ ! -d "redis" ]; then
  mkdir redis
  echo "The redis folder has been created."
else
  echo "The redis folder already exists."
fi

echo "Database folders creation complete."
