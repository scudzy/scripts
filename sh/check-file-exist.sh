#!/usr/bin/env bash

FILE="/etc/passwd"
if [[ -s $FILE ]]; then
   echo "$FILE exists and not empty"
else
   echo "$FILE doesn't exist or is empty"
fi