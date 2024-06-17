#!/bin/bash

# Load the .env file
set -a
source ../.env
set +a

SCRIPT_PATH="$ROOT_PATH/dungeon-crawler/DungeonCrawlerService/database"
# Run the Python script from the ROOT_PATH
python "$SCRIPT_PATH/parse_xls_data.py" $SCRIPT_PATH

# Get the current directory path
current_dir=$(pwd)

# Create the sql folder path
sql_dir="$current_dir/mariadb/sql"

# If the sql folder exists, delete it
if [ -d "$sql_dir" ]; then
  rm -rf "$sql_dir"
fi

# Create the sql folder
mkdir "$sql_dir"

# Copy all folders from the SCRIPT_PATH folder to the sql folder
for dir in "$SCRIPT_PATH"/*/; do
  if [ -d "$dir" ]; then
    cp -r "$dir" "$sql_dir"
  fi
done

echo "The folders from the $SCRIPT_PATH folder have been copied to the sql folder."