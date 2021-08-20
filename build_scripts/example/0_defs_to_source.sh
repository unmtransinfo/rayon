#!/usr/bin/env bash
DOC="""Set environmental variables to build/install rayon.

Usage:
   . ${BASH_SOURCE}
"""
#
# Check to see that this script was sourced, not run.
#
if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then # this file was run, not sourced
  echo "$DOC"
  exit 1
fi
#
# Check for required files and define envvars based on them.
#
txtfilelist=("secret_key"
             "sentry_dsn"
             "crashmail_email")
for txtfile in "${txtfilelist[@]}" ; do
   if [ ! -e ${txtfile}.txt ]; then
      echo "ERROR--must create ${txtfile}.txt file in this directory."
   else
      varstring="$(echo $txtfile | tr /a-z/ /A-Z/)"
      export RYN_${varstring}="$(cat ${txtfile}.txt)"
   fi
done
#
# Exports: edit this to suit yourself.
#
#        RYN-* : Local to the build scripts only.
#      RAYON-* : Used in rayon_tool
#
export RYN_VERSION="0.1"
export RYN_ROOT="/var/www/rayon-${RYN_VERSION}"
export RYN_DEV_HOSTNAME="hatch"
export RYN_DEV_IP="206.192.180.167"
export RYN_STAGE_HOSTNAME="hatch"
export RYN_STAGE_IP="206.192.180.167"
export RYN_PROD_HOSTNAME="proteingraph.ml"
export RYN_PROD_IP="206.192.180.167"
export RYN_INSTALLER=$USER
export RYN_USER="www"
export RYN_GROUP="www"
export RYN_SCRIPT_DIR=$PWD
export RYN_VAR=/var/rayon/${RYN_VERSION}
export RYN_TMP=/tmp/rayon
export RYN_LOG=/var/log/rayon
export RYN_INSTALLER_HOME=~
export RAYON_BUILD_DIR="${RYN_ROOT}/build"
export RAYON_TEST_DIR="${RYN_ROOT}/test"
#
# The following assumes that the user has full sudo
# privs on dev, but only sudo -u $RYN_USER on stage.
#
hostname=$(hostname)
if [ "$hostname" == "$RYN_DEV_HOSTNAME" ]; then
  export RYN_STAGE="dev"
  export RYN_SUDO="sudo sudo"
elif [ "$hostname" == "$RYN_STAGE_HOSTNAME" ]; then
  export RYN_STAGE="stage"
  export RYN_SUDO="sudo"
elif [ "$hostname" == "$RYN_PROD_HOSTNAME" ]; then
  export RYN_STAGE="prod"
  export RYN_SUDO="sudo"
else
  echo "ERROR-unknown host $(hostname)"
fi

#
# Set up the links to config files.
#
if [ "$USER" == "$RYN_INSTALLER" ]; then
  rm -f ~/.rayon
  ln -s ~/.rayon-$RYN_STAGE ~/.rayon
else
  echo "Warning--you are not ${RYN_INSTALLER}, links to ~${RYN_INSTALLER}/.rayon will be preserved."
fi
#
# Define convenient aliases.
#
alias cd_rayon="cd $RYN_ROOT"
