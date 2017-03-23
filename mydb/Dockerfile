FROM debian:jessie
MAINTAINER Pavol Culka

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get upgrade -y && \
    apt-get -y update && \
    apt-get -y install mysql-server \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD my.cnf /etc/mysql/my.cnf


COPY run.sh /run.sh
RUN chmod +x /run.sh

VOLUME  /var/lib/mysql

EXPOSE 3306
CMD /run.sh
