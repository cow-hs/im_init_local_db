#!/bin/bash

# Load the .env file
set -a
source ../.env
set +a

SERVICE_PATH="$ROOT_PATH/dungeon-crawler/DungeonCrawlerService"
current_dir=$(pwd)
jar_dir="$current_dir/jars"

# Recreate the jar folder
rm -rf "$jar_dir"
mkdir -p "$jar_dir"

# Copy thirdparty/GameLiftLocal.jar to the jars folder
cp "$SERVICE_PATH/thirdparty/GameLiftLocal.jar" "$jar_dir"
# Copy all .jar files in the SERVICE_PATH jars folder to the jars folder
cp "$SERVICE_PATH/jars"/*.jar "$jar_dir"

echo "Files in $jar_dir:"
ls -l "$jar_dir"