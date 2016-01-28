FROM ubuntu:trusty
MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y php5 php5-cli php5-json

RUN chmod 1777 /tmp

# create a special user to run code
# user without root privileges greatly improves security
RUN useradd syncano -d /tmp -s /bin/bash
USER syncano

