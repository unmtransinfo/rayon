#!/bin/bash
set -e
if [ -z "$RYN_VAR" ]; then
   echo "You must source the defs script first."
   exit 1
fi
echo "Removing directories owned by ${RYN_USER}."
$RYN_SUDO -u $RYN_USER rm -r  $RYN_TMP $RYN_VAR ${RYN_LOG}/* 
echo "Removing rayon root directory."
rm -rf ${RYN_ROOT}/*
