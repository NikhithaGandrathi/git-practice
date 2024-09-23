#!/bin/bash


USERID=$(id -u)
#echo "User ID is: $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0]
    then
       echo "Please run this script with root priveleges"
       exit 1
   fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
      echo -e "$2 is...$R FAILED $N"
    exit 1
    else
      echo -e "$2 is...$G SUCCESS $N"
    fi
}

if [ $USERID -ne 0 ]
then
   echo "Please run this script with root priveleges"
   exit 1
fi

dnf list installed git


if [ $? -ne 0 ]
then 
    echo "Git is not installed, going to install it.."
    dnf install git -y
    VALIDATE $? "Installing Git"
       
else
    echo "Git is already installed, nothing to do.."
fi    

dnf list installed mysqlsss

if [ $? -ne 0 ]
then 
    echo "MySql is not installed, going to install"
    dnf install mysqlsssss -y
    VALIDATE $? "Installing MySql"
    
else
   echo "MySql is already installed..nothing to do"
fi

