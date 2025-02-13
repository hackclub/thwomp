FROM nginx:latest

# COPY ./hcb.hackclub.com /etc/nginx/sites-available/hcb.hackclub.com
COPY ./ngnix.conf /etc/nginx/nginx.conf
COPY ./maintenance.html /usr/share/nginx/html/maintenance.html

