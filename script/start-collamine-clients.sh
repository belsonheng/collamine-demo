#!/bin/bash
FILE="/tmp/collamine"
if [ -f $FILE ]; then
   echo "File '$FILE' Exists"
   ssh cm07 ruby ~/gems/collamine/test.rb
   
   ssh cm06 bash ~/git/collamine-client-python/scrapybot/run.sh
   echo "Removing '$FILE'"
   rm $FILE
else
   echo "The File '$FILE' Does Not Exist"
fi