#!/bin/bash

# number guessing game

# connect to number_guess database
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# variables
declare player_info_string
declare -a player_info_arr

declare current_guesses=0
declare username_is_valid=0
declare player_guess_bool=0

declare hide_update_db_output

# # get current player info
# player_info_string=echo "$($PSQL1 "SELECT * FROM player_info WHERE username = '$USERNAME';")"

#  IFS='|'
#   read -ra player_info_arr <<< $player_info_string
#   unset IFS


get_user_info () {

  echo "Enter your username:"

  while [ $username_is_valid == 0 ]
  do
    read USERNAME
    if [[ -z $USERNAME || ${#USERNAME} -gt 22 ]];
    then
      echo "Please enter a valid username. That user name may be taken."
    else
      username_is_valid=1
    fi
  done

  # check if user is in database
  player_info_string="$($PSQL "SELECT * FROM player_info WHERE username = '$USERNAME';")"

  if [[ ! -z $player_info_string ]];
    then
      # retrieve all player info
      IFS='|'
      read -ra player_info_arr <<< $player_info_string
      unset IFS

      echo -e "\nWelcome back, ${player_info_arr[1]}! You have played ${player_info_arr[2]} games, and your best game took ${player_info_arr[3]} guesses."
      
      # echo $player_info_string
      # echo ${player_info_arr[@]}
    else
      echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    fi
}

guessing_game () {
  
  echo -e "\nGuess the secret number between 1 and 1000:"

  # generate secret number between 1 and 1000 (inclusive)
  secret_number=$((1 + $RANDOM % 1000))

  while [ $player_guess_bool == 0 ]
  do
    read PLAYER_GUESS
    # increment current_guesses by 1 before if condition
    ((++current_guesses))
    if [[ ! $PLAYER_GUESS =~ ^[+-]?[0-9]+$ ]];
    then
      echo "That is not an integer, guess again:"

    elif [[ $PLAYER_GUESS -gt $secret_number ]];
    then
      echo "It's lower than that, guess again:" 

    elif [[ $PLAYER_GUESS -lt $secret_number ]];
    then
      echo "It's higher than that, guess again:" 
    else
      player_guess_bool=1
      # echo "You guessed it in $current_guesses tries. The secret number was $secret_number. Nice job!"
    fi
  done

# update user info in player_info database
if [[ -z $player_info_string ]];
then
  echo "$($PSQL "INSERT INTO player_info(username, games_played, best_game) VALUES ('$USERNAME', 1, $current_guesses);")" | $hide_update_db_output

elif [[ $current_guesses -lt ${player_info_arr[3]} ]];
then
  echo "$($PSQL "UPDATE player_info SET games_played = games_played + 1, best_game = $current_guesses WHERE username = '${player_info_arr[1]}';")" | $hide_update_db_output

else
  echo "$($PSQL "UPDATE player_info SET games_played = games_played + 1 WHERE username = '${player_info_arr[1]}';")" | $hide_update_db_output
fi

# final message
echo "You guessed it in $current_guesses tries. The secret number was $secret_number. Nice job!"
}

# program start
 echo -e "\n~~~~ Number Guessing Game ~~~~\n"
 get_user_info
 guessing_game
