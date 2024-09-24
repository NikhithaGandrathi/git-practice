#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
#echo "User ID is: $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ] 
    then
       echo -e "$R Please run this script with root priveleges $N" &>>$LOG_FILE
       exit 1
   fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is...$R FAILED $N" &>>$LOG_FILE
    exit 1
    else
      echo -e "$2 is...$G SUCCESS $N" &>>$LOG_FILE
    fi
}

CHECK_ROOT

#sh 15-loops.sh git mysql pstfix nginx
for package in $@ #$@ refers to all arguments passed to it
do 
    dnf list installed $package
    if [ $? -ne 0 ]
    then
       echo "$package is not installed, going to install it.."
       dnf install $package -y
       VALIDATE $? "Installing $package"
    else
       echo "$package is already installed..nothing to do"
    fi 
done