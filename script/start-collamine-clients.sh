#!/bin/bash
FILE="/tmp/collamine"
if [ -f $FILE ]; then
   echo "File '$FILE' Exists"
   echo "Removing '$FILE'"
   yes | rm $FILE
   echo "Start Ruby Crawler"
   screen -S ruby -d -m ssh cm07 ruby ~/gems/collamine/test.rb
   echo "Start Python Crawler"
   ssh cm06 screen -S python -d -m 'bash -s' < ~/git/collamine-client-python/scrapybot/run.sh
   #nohup ssh cm07 && ruby ~/gems/collamine/test.rb 2>&1 >> /tmp/ruby.log
   #nohup ssh cm06 && bash ~/git/collamine-client-python/scrapybot/run.sh 2>&1 >> /tmp/python.log
else
   echo "The File '$FILE' Does Not Exist"
fi
