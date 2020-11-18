FROM alpine:latest
RUN apk update && apk add --no-cache supervisor nginx nodejs npm openrc 
RUN mkdir -p /run/openrc && touch /run/openrc/softlevel 
RUN rc-update add nginx default && rc-update 
RUN mkdir /var/www/nodeapp/
COPY start.sh /var/www/nodeapp/ 
COPY server.js  /var/www/nodeapp/
COPY package.json /var/www/nodeapp/
COPY default /etc/nginx/sites-available/default
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 80 3000
CMD ["/usr/bin/supervisord"]