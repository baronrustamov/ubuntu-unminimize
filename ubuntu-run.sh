#!/bin/bash
# Bash Menu Script Example
# https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script
#docker run -p 8080:80 --rm -it -v -v /shapiro/Documents/vscode/:/home/user/ ubuntu-run

docker image rm ubuntu-run
docker build -t ubuntu-run . 
docker run -p 8080:80 --rm -it -v /Users/shapiroisme/Documents/vscode/:/home/user/ ubuntu-run
docker builder prune -a