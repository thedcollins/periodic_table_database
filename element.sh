#!/bin/bash

# PSQL command to connect to the database
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# Check if an argument is provided
if [[ -z "$1" ]]; then
  echo "Please provide an element as an argument."
  exit 0
fi

# Determine if the input is a number or not
if [[ "$1" =~ ^[0-9]+$ ]]; then
  # Input is a number, use it as atomic_number
  QUERY=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
    FROM elements 
    JOIN properties ON elements.atomic_number=properties.atomic_number 
    JOIN types ON properties.type_id=types.type_id 
    WHERE elements.atomic_number = '$1'")
else
  # Input is not a number, use it as symbol or name
  QUERY=$($PSQL "SELECT elements.atomic_number, name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius 
    FROM elements 
    JOIN properties ON elements.atomic_number=properties.atomic_number 
    JOIN types ON properties.type_id=types.type_id 
    WHERE elements.symbol = '$1' OR elements.name = '$1'")
fi

# Check if QUERY is empty
if [[ -z "$QUERY" ]]; then
  echo "I could not find that element in the database."
else
  # Read the QUERY result into variables
  IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE MASS MELTING_POINT BOILING_POINT <<< "$QUERY"

  # Output the element details
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi
