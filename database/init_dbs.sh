#!/bin/bash

ENV_FILE=".env"
# Change the INIT_SQL value to true
sed -i 's/INIT_SQL=.*/INIT_SQL=true/' $ENV_FILE
echo "INIT_SQL value in $ENV_FILE has been changed to 'true'."