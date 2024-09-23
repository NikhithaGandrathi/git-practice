#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables passed: $#" #count
echo "Script name: $0"
echo "Current working directory:$PWD"
echo "Home directory of current user: $HOME"
echo "PID of the script executing now: $$" #PID-Process instance ID
sleep 100 &
echo "PID of last background command: $!"
