#!/bin/bash
FILE="/tmp/collamine"
if [ -f $FILE ]; then
   echo "File '$FILE' Exists"
   ruby ~/gems/collamine/test.rb
   echo "Removing '$FILE'"
   rm $FILE
else
   echo "The File '$FILE' Does Not Exist"
fi