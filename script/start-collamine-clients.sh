#!/bin/bash
FILE="/tmp/collamine"
if [ -f $FILE ]; then
   echo "File '$FILE' Exists"
   echo "Removing '$FILE'"
   yes | rm $FILE
   echo "Start Ruby Crawler"
   ssh cm07 "nohup ruby ~/gems/collamine/test.rb > /dev/null 2>&1 >> /tmp/ruby.log &"
   #screen -S ruby -d -m ruby ~/gems/collamine/test.rb
   echo "Start Python Crawler"
   ssh cm06 "nohup bash ~/git/collamine-client-python/scrapybot/run.sh > /dev/null 2>&1 >> /tmp/python.log &"
   #nohup ssh cm07 && ruby ~/gems/collamine/test.rb 2>&1 >> /tmp/ruby.log
   #nohup ssh cm06 && bash ~/git/collamine-client-python/scrapybot/run.sh 2>&1 >> /tmp/python.log
else
   echo "The File '$FILE' Does Not Exist"
fi
