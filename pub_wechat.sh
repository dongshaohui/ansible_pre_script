#!/bin/bash

#if [ $# == 1 -a $1 == "log" ]
#then
##ssh 10.253.18.46 "cd /opt/apache-tomcat-7.0.59/webapps/wecha/ ; git log "
#echo  "git log"
#elif [ $# == 0  ]
#then
ssh 10.253.18.46 "cd /opt/apache-tomcat-7.0.59/webapps/wechat/  ; git pull origin master  ; cd ../../bin   ;./shutdown.sh   &&  ./startup.sh"
#echo " git pull "
#fi
