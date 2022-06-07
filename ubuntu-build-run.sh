#!/bin/bash
# Bash Menu Script Example
# https://askubuntu.com/questions/1705/how-can-i-create-a-select-menu-in-a-shell-script
# https://computingforgeeks.com/run-ubuntu-linux-in-docker-with-desktop-environment-and-vnc/
# docker run -p 8080:80 --rm -it -v -v /shapiro/Documents/vscode/:/home/user/ ubuntu-run

#-e TZ=UTC	Timezone.
#-p 8080:80	Expose Nginx on localhost:8080.
#-v /local/path/to/website:/var/www/html	Mount and serve a local website.
#-v /path/to/conf.template:/etc/nginx/templates/conf.template	Mount template files inside /etc/nginx/templates. They will be processed and the results will be placed at /etc/nginx/conf.d. (e.g. listen ${NGINX_PORT}; will generate listen 80;).
#-v /path/to/nginx.conf:/etc/nginx/nginx.conf

docker builder prune -a
docker image rm ubuntu-run
docker build -t ubuntu-run .
docker run -p 8080:80 --rm -it ubuntu-run
#docker run -p 8080:80 --rm -it -v /Users/shapiroisme/Documents/vscode/:/home/user/ ubuntu-run

# docker builder prune -a