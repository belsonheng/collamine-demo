#!/bin/bash
FILE="/tmp/collamine"
if [ -f $FILE ]; then
   echo "File '$FILE' Exists"
   echo "Removing '$FILE'"
   rm $FILE
   echo 'y'
   screen -S ruby -d -m ssh cm07 ruby ~/gems/collamine/test.rb
   screen -S python -d -m ssh cm06 bash ~/git/collamine-client-python/scrapybot/run.sh
else
   echo "The File '$FILE' Does Not Exist"
fi