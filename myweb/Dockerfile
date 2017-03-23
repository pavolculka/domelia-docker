FROM debian:jessie
MAINTAINER Pavol Culka

ENV DEBIAN_FRONTEND noninteractive

ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M


RUN apt-get -y update && \
    apt-get -y install git apache2 wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


RUN wget -qO - http://www.dotdeb.org/dotdeb.gpg | apt-key add - 
ADD dotdeb.list /etc/apt/sources.list.d/dotdeb.list

RUN apt-get -y update && \
    apt-get -y install \
    	libapache2-mod-php7.0 php7.0 php7.0-apcu php7.0-apcu-bc php7.0-bcmath php7.0-cli php7.0-common \
	php7.0-fpm php7.0-json php7.0-mbstring php7.0-mysql php7.0-opcache php7.0-readline php7.0-xml && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

ADD apache_virtual_host.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

ADD run.sh /run.sh
RUN chmod +x /run.sh


RUN sed -ri -e "s/^upload_max_filesize.*/upload_max_filesize = ${PHP_UPLOAD_MAX_FILESIZE}/" \
        -e "s/^post_max_size.*/post_max_size = ${PHP_POST_MAX_SIZE}/" /etc/php/7.0/apache2/php.ini


VOLUME  /var/www/

EXPOSE 80 
CMD /run.sh
