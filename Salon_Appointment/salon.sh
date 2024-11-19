#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c"
echo -e "\n ~~~~ MY SALON ~~~~\n"
echo -e "Welcome to My Salon, how can I help you?" 

MAIN_MENU() {
  if [[ $1 ]]
  then 
    echo -e "\n$1"
  fi 

  SERVICES=$($PSQL "SELECT service_id, name FROM services")
  # Check if services were retrieved successfully
  if [[ -z "$SERVICES" ]]; 
  then
    echo "No services available."
  else
    # Display the services using a while loop
    echo -e "$SERVICES" | while IFS="|" read -r  SERVICE_ID NAME
    do
      echo "$SERVICE_ID) $NAME"
    done
  
  # get service id
  read SERVICE_ID_SELECTED
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$  ]]
    then
      MAIN_MENU "That's not a valid number. What would you like today?"
    else 
      VALID_SERVICE_ID=$($PSQL "SELECT service_id, name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
      if [[ -z $VALID_SERVICE_ID ]]
      then 
        MAIN_MENU "I could not find that service. What would you like today?"
      else
      # get customer phone number
        echo -e "\nWhat is your phone number?"
        read PHONENUMBER
        # check if customer is new or not
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$PHONENUMBER'")
        # new
          if [[ -z $CUSTOMER_NAME ]]
          then 
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME
          CUSTOMER_INFO=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$PHONENUMBER', ',$CUSTOMER_NAME')") 
          SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
          # get time
          echo "What time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
          read TIME
          # update schedule
          CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$PHONENUMBER'")
          APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
          echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
        else 
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
        echo "What time would you like your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
        read SERVICE_TIME
        # update the appointment table 
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$PHONENUMBER'")
        APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$TIME')")
        echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $TIME, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
        fi
      fi
    fi
  fi
}

MAIN_MENU