#!/bin/bash

export NAME="dc_master"
export JAR_PATH="/app/app-master.jar"
docker-compose up

# sleep 5

# export NAME="dc_match"
# export JAR_PATH="/app/app-match.jar"
# docker-compose up -d

# export NAME="dc_rank"
# export JAR_PATH="/app/app-rank.jar"
# docker-compose up -d

# export NAME="dc_lb"
# export JAR_PATH="/app/app-lb.jar"
# docker-compose up -d

# export NAME="dc_chat_trade"
# export JAR_PATH="/app/app-chat.jar"
# export JAR_ARG1="-encoding UTF-8 Trade"
# docker-compose up -d

# export NAME="dc_chat_trade"
# export JAR_PATH="/app/app-chat.jar"
# export JAR_ARG1="-encoding UTF-8 GatheringHall"
# docker-compose up -d

# export NAME="dc_market"
# export JAR_PATH="/app/app-market.jar"
# docker-compose up -d
