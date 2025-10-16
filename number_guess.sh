#!/bin/bash
# Number Guessing Game

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

# Buscar si el usuario existe
USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")

if [[ -n $USER_DATA ]]
then
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
else
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$USERNAME', 0, NULL);" > /dev/null
fi

# --- A partir de acá, el juego ---
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"
read GUESS

while [[ $GUESS != $SECRET_NUMBER ]]
do
  # Validar que sea número entero
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    fi
    ((NUMBER_OF_GUESSES++))
  fi
  read GUESS
done

((NUMBER_OF_GUESSES++))

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

# Actualizar estadísticas
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")
$PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id=$USER_ID;" > /dev/null

BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE user_id=$USER_ID;")

if [[ -z $BEST_GAME || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
then
  $PSQL "UPDATE users SET best_game=$NUMBER_OF_GUESSES WHERE user_id=$USER_ID;" > /dev/null
fi


