#!/bin/bash


PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

ARG1=$1

MAIN_SCREEN(){

  if [[ $ARG1 ]]
  then
    ATOMIC_NUMBER_IF_OTHER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$ARG1' OR name='$ARG1'")
    if [[ $ATOMIC_NUMBER_IF_OTHER ]]
    then
      ATOMIC_NUM_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number='$ATOMIC_NUMBER_IF_OTHER'")
      ATOMIC_NUM_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number='$ATOMIC_NUMBER_IF_OTHER'")
      ATOMIC_NUM_TYPE=$($PSQL "SELECT type FROM properties INNER JOIN types USING (type_id) WHERE atomic_number='$ATOMIC_NUMBER_IF_OTHER'")
      ATOMIC_NUM_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number='$ATOMIC_NUMBER_IF_OTHER'")
      ATOMIC_NUM_MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number='$ATOMIC_NUMBER_IF_OTHER'")
      ATOMIC_NUM_BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number='$ATOMIC_NUMBER_IF_OTHER'")
      echo "The element with atomic number $ATOMIC_NUMBER_IF_OTHER is $ATOMIC_NUM_NAME ($ATOMIC_NUM_SYMBOL). It's a $ATOMIC_NUM_TYPE, with a mass of $ATOMIC_NUM_MASS amu. $ATOMIC_NUM_NAME has a melting point of $ATOMIC_NUM_MELTING_POINT celsius and a boiling point of $ATOMIC_NUM_BOILING_POINT celsius."
    else

      ATOMIC_EXISTS=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number='$ARG1'")
      if [[ $ATOMIC_EXISTS ]]
      then
        ATOMIC_NUM_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number='$ARG1'")
        ATOMIC_NUM_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number='$ARG1'")
        ATOMIC_NUM_TYPE=$($PSQL "SELECT type FROM properties INNER JOIN types USING (type_id) WHERE atomic_number='$ARG1'")
        ATOMIC_NUM_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number='$ARG1'")
        ATOMIC_NUM_MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number='$ARG1'")
        ATOMIC_NUM_BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number='$ARG1'")
        echo "The element with atomic number $ARG1 is $ATOMIC_NUM_NAME ($ATOMIC_NUM_SYMBOL). It's a $ATOMIC_NUM_TYPE, with a mass of $ATOMIC_NUM_MASS amu. $ATOMIC_NUM_NAME has a melting point of $ATOMIC_NUM_MELTING_POINT celsius and a boiling point of $ATOMIC_NUM_BOILING_POINT celsius."
      else
        echo "I could not find that element in the database."
      fi
      
      #
    fi
    #ATOMIC_NUecho $ATOMIC_NUMBER_IF_OTHER

  #else
    #echo "I could not find that element in the database."
    
  fi
}

if [[ -z $ARG1 ]]
then
  echo "Please provide an element as an argument."
fi
#comment
#newcomment
#last?



MAIN_SCREEN

