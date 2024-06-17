#!/bin/bash

# copy .env_tmp to .env
if [ -f ".env_tmp" ]; then
  cp .env_tmp .env
  echo ".env_tmp has been copied to .env."
fi

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
sql_source_dir="$current_dir/mariadb/_sql"

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

# Copy the _sql folder to the sql folder, overwriting existing files
if [ -d "$sql_source_dir" ]; then
  cp -r "$sql_source_dir/"* "$sql_dir"
fi

echo "The folders from the $SCRIPT_PATH folder have been copied to the sql folder."