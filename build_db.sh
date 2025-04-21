#!/bin/bash

# run this file to build the number_guessing_game database

# connect to postgres database
PSQL1="psql --username=freecodecamp --dbname=postgres -t --no-align -c"
# connect to number_guess database
PSQL2="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# create number_guess database
echo "$($PSQL1 "CREATE DATABASE number_guess;")"

# create player_info table
echo "$($PSQL2 "CREATE TABLE player_info(player_id SERIAL PRIMARY KEY, username VARCHAR(22) UNIQUE NOT NULL, games_played INT, best_game INT);")"

echo "$($PSQL2 "INSERT INTO player_info(username) VALUES ('john');")"