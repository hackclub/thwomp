FROM nginx:latest

COPY ./ngnix.conf /etc/nginx/nginx.conf
COPY ./maintenance.html /usr/share/nginx/html/maintenance.html

