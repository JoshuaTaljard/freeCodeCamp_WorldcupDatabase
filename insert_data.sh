#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")

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

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # remove header

  if [[ $YEAR != "year" ]]
  then
  WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE teams.name='$WINNER'")
  OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE teams.name='$OPPONENT'")
  # insert row and show process ok
  INSERT_DATA_RESULT=$($PSQL " INSERT INTO games(year,round,winner_id,opponent_id,winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
    if [[ $INSERT_DATA_RESULT == "INSERT 0 1" ]]
    then
    echo inserted data $INCREMENT : $YEAR -- $ROUND -- $OPPONENT -- Score: $WINNER_GOALS - $OPPONENT_GOALS
    fi
  fi
done
