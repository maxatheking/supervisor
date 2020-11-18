FROM ubuntu:18.04
ENV HOSTNAME Abraham
ENV TZ=Europe/Belgrade

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get install -y supervisor nginx nodejs npm bind9 bind9utils bind9-doc
RUN mkdir /var/www/nodeapp/
COPY node/. /var/www/nodeapp/ 
COPY nginx/default /etc/nginx/sites-available/default
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 80 3000 53/tcp 53/udp
CMD ["/usr/bin/supervisord"]