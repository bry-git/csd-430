#!/bin/bash

###########################################################
#
# builds a module of your choice and deploys to a tomcat container
#
# usage:
#        ./deploy.sh
#        ./deploy.sh $mod
#
###########################################################

modChoice=""
artifact=""

function menu() {
  clear
  echo "Which module do you want to deploy?"
  i=0
  declare -a mods=($(ls | grep -E 'mod|ebookshop'))
  for mod in "${mods[@]}" ;
  do
    echo "[$((i+1))]: $mod" ;
    ((i++))
  done

  read choice
  modChoice="${mods[$((choice-1))]}"
  [ -z "$modChoice" ] && echo "$choice is not valid" && exit 1
}

function checkJavaVersion() {
  if [[ `uname` == "Darwin" ]] ; then
    #its mac
    local user=`whoami`
    [ -d "/Users/$user/Library/Java/JavaVirtualMachines/*-11.*" ] && echo "found java 11"
    local jdk11="/Users/$user/Library/Java/JavaVirtualMachines/*-11.*/Contents/Home"
    echo $jdk11
    #TODO add flow control for other OS's
  fi
}

function checkIfDbNeeded() {
  tree | grep ".sql" > /dev/null
  if [ $? -eq 0 ] ; then
    echo "true"
  else
    cat build.gradle | grep "mysql" > /dev/null
    if [ $? -eq 0 ] ; then
      echo "true"
    else
      echo "false"
    fi
  fi
}

function build() {
  clear
  local jdk=$1

  # change the version name so the URL is /mod4 and not /mod4-SnApsHoT-1.0.war in tomcat
  sed -i.bu "s/version\ \'1.0-SNAPSHOT\'/version\ \'\'/" build.gradle

  ./gradlew clean war -Dorg.gradle.java.home="$jdk"

  if [ $? -ne 0 ] ; then
    echo "build failed"
    sleep 2
    cleanUp
    exit 1
  fi

  mv build/libs/*.war build/libs/ROOT.war

  artifact="$(ls build/libs/.)"
}

function buildComposeFile() {
  clear
  local sql=$1

  echo "
  version: '3'

  services:
    web:
      image: tomcat
      ports:
        - \"8080:8080\"
      volumes:
        - ./build/libs/$artifact:/usr/local/tomcat/webapps/$artifact
  " > docker-compose.yml

    if [[ $sql == "true" ]] ; then
      echo "
    db:
      container_name: db
      image: mysql:8
      ports:
        - \"3306:3306\"
      restart: unless-stopped
      command: --default-authentication-plugin=mysql_native_password
      environment:
        - MYSQL_ROOT_PASSWORD=password
        - MYSQL_PASSWORD=password
      volumes:
        - ./src/main/resources/initdb.d/:/docker-entrypoint-initdb.d/
      " >> docker-compose.yml
    fi


  if [ $? -ne 0 ] ; then
    echo "error creating docker-compose file"
    sleep 2
    exit 1
  else
    echo "build docker compose successful"
  fi
}

function containerStart() {
    docker-compose up
}

function cleanUp() {
  rm docker-compose.yml
  rm -rf build/libs/*
  rm -rf build/resources/*
  mv build.gradle.bu build.gradle
  docker rm $(docker ps -a | grep "tomcat" | awk '{print $1}')
  docker rm $(docker ps -a | grep "mysql" | awk '{print $1}')
  docker volume prune -f
}

####DRIVER#####
if [ $# -eq 0 ] ; then
  menu
else
  modChoice=$1
fi

cd $modChoice

jdk=$(checkJavaVersion)

sql=$(checkIfDbNeeded)

build $jdk

buildComposeFile $sql

containerStart

cleanUp

cd ..
