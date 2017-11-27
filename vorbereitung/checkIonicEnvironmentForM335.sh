#!/bin/bash
#
# checkIonicEnviornmentForM335.sh
#
#  This script checks the ionic-installation and sends the information to the M335 server
#
#
# CONFIG
#
SERVER_URL="https://sheetsu.com/apis/v1.0/039d4e2f9f13"
USER_FIRSTNAME=""
USER_LASTNAME=""
USER_GROUP=""
USER_COMPANY=""
TMP_JSON=""
TMP_IONIC_VERSION_FILE="ionic_version.tmp"
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
#
# FUNCTIONS
#
# Collection the for this course important informations
function gatherInformationFromSystem {
    type ionic >/dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        IONIC_INFO_TMP="$(ionic info >${TMP_IONIC_VERSION_FILE})"
        USER_EMAIL=$(ionic config get -g user.email | cut -d "'" -f2)
        CLI_PACKAGES="$(cat ${TMP_IONIC_VERSION_FILE} | grep 'cli packages' | cut -d'(' -f2 | cut -d')' -f1)"
        CLI_UTILS_VERSION="$(cat ${TMP_IONIC_VERSION_FILE} | grep 'cli-utils' | cut -d':' -f2 | sed 's/ //g')"
        IONIC_CLI_VERSION="$(cat ${TMP_IONIC_VERSION_FILE} | grep 'Ionic CLI' | cut -d':' -f2 | sed 's/ //g')"
        NODE_VERSION="$(cat ${TMP_IONIC_VERSION_FILE} | grep 'Node'  | cut -d':' -f2 | sed 's/ //g' )"
        NPM_VERSION="$(cat ${TMP_IONIC_VERSION_FILE} | grep 'npm' | grep -v 'cli' | cut -d':' -f2)"
        OS_VERSION="$(cat ${TMP_IONIC_VERSION_FILE} | grep 'OS'  | cut -d':' -f2)"
    else
        echo "${RED}ERROR: Ionic ist nicht korrekt installiert. Bitte versuche es mit der Anleitung erneut oder wende dich am 1. Kurstag an deinen Instruktor.${NC}"
    fi
}
# Generating a json-file for sending the data to the server
function  generateJSONData {
    TMP_JSON="${TMP_JSON} { \"rows\": [{ \"user_email\" : \"${USER_EMAIL}\", "
    TMP_JSON="${TMP_JSON} \"user_firstname\" : \"${USER_FIRSTNAME}\", "
    TMP_JSON="${TMP_JSON} \"user_lastname\" : \"${USER_LASTNAME}\", "
    TMP_JSON="${TMP_JSON} \"user_company\" : \"${USER_COMPANY}\", "
    TMP_JSON="${TMP_JSON} \"user_groupno\" : \"${USER_GROUP}\", "
    TMP_JSON="${TMP_JSON} \"cli_utils_version\" : \"${CLI_UTILS_VERSION}\", "
    TMP_JSON="${TMP_JSON} \"ionic_cli_version\" : \"${IONIC_CLI_VERSION}\", "
    TMP_JSON="${TMP_JSON} \"node_version\" : \"${NODE_VERSION}\", "
    TMP_JSON="${TMP_JSON} \"npm_version\" : \"${NPM_VERSION}\", "
    TMP_JSON="${TMP_JSON} \"os_version\" : \"${OS_VERSION}\", "
    TMP_JSON="${TMP_JSON} \"script_executed_date\" : \"$(date "+%d.%m.%Y %H:%M")\" }]} "
}

function promptForUserData {
  echo -e "${GREEN}---"
  echo -e "ICT BERUFBILDUNG ZENTRALSCHWEIZ"
  echo -e "Modul 335 - Mobile Applikation realisieren "
  echo -e "---${NC}"
  echo -e "Wir brauchen noch ein paar Informationen von dir..."
  echo -e "  "
  echo -e "Wie ist dein Vorname? \c"
  read first_name
  echo -e "Wie ist dein Nachname? \c"
  read last_name
  echo -e "Wie heisst dein Lehrbetrieb? \c"
  read company
  echo -e "Wie lautet dein Gruppen-Nummer dieses ÜK's (siehe Anmeldebestätigung/Sephir)? \c"
  read group_no
  USER_FIRSTNAME=$first_name
  USER_LASTNAME=$last_name
  USER_COMPANY=$company
  USER_GROUP=$group_no
}
# If possible, send the json to the M335 server, if not print it on the console
function postJSONToServer {
    #echo $TMP_JSON
    curl -H "Content-Type: application/json" -X POST -d "${TMP_JSON}" ${SERVER_URL} > /dev/null 2>&1

    if [[ $? -eq 0 ]]; then
      echo -e "${GREEN}Bravo!${NC} Deine Daten konnte erfolgreich übermittelt werden. Bis am 1. Kurstag..."
    else
      echo -e "${RED}ERROR: Fehler beim senden der Daten. Wende dich am 1. Kurstag an deinen Instruktor.${NC}"
    fi
}

# Always clean the temporary stuff
function cleanup {
    rm -rf "${TMP_IONIC_VERSION_FILE}"   > /dev/null 2>&1
}

#
# MAIN
#
promptForUserData
gatherInformationFromSystem
generateJSONData
postJSONToServer

cleanup
