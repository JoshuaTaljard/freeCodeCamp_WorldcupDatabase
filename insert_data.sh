#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

#delete teams and games tables
echo $($PSQL "TRUNCATE teams, games")


# read data from tables, write into games table
cat games.csv | while IFS="," read YEAR ROUND THIS_WINNER THIS_OPPONENT W_GOALS O_GOALS
do

  #ignore header of csv file
  if [[ $YEAR != "year" ]]
  then
    OPPONENT=$($PSQL "SELECT team_id FROM teams WHERE teams.name='$THIS_OPPONENT'")
    WINNER=$($PSQL "SELECT team_id FROM teams WHERE teams.name='$THIS_WINNER'")
    INSERT_DATA_RESULT=$($PSQL " INSERT INTO games(year,round,winner_id,opponent_id, opponent_goals,winner_goals) VALUES($YEAR, '$ROUND', $WINNER, $OPPONENT, $O_GOALS, $W_GOALS)")
  fi
done

#read data from games file, populate unique values into TEAMS table
cat games.csv| while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  #ignore csv file header
  if [[ $YEAR != "year" ]]
  then
  #get ID of loser
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
  #get ID of winner
  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")  
    #no matching opponent in database
    if [[ -z $OPPONENT_ID ]]
    then
      OPPONENT_INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
    fi      
    #no matching winner in database - insert new winner
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
    fi
  fi
done


