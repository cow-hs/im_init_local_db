#!/bin/bash

ENV_FILE=".env"
# Change the INIT_SQL value to false
sed -i 's/INIT_SQL=.*/INIT_SQL=false/' $ENV_FILE
echo "INIT_SQL value in $ENV_FILE has been changed to 'false'."

docker-compose up -d