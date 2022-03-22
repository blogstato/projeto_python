FROM ubuntu:latest
MAINTAINER André Stato <tstato@gmail.com>

ENV TZ=America/Sao_Paulo


RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" TZ="Amercia/Sao_Paulo" apt-get -y install tzdata
RUN apt-get install -y apache2 curl wget git
RUN apt-get install -y python3 libexpat1 python3-pip ssl-cert libapache2-mod-wsgi



ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

EXPOSE 80

RUN rm -rf /etc/apache2/sites-available/000-default.conf
COPY 000-default.conf /etc/apache2/sites-available/

RUN a2enmod cgid

COPY teste.py /var/www/html
COPY index.html /var/www/html
COPY save_file.py /var/www/html
RUN chmod +x /var/www/html/teste.py
RUN chown www-data.www-data /var/www/html/teste.py
RUN ln -s /usr/bin/python3 /usr/bin/python

CMD /usr/sbin/apache2ctl -D FOREGROUND

