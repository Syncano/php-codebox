FROM ubuntu:trusty
MAINTAINER "Syncano DevOps Team" <devops@syncano.com>

ENV LAST_REFRESHED 2016-03-25
ENV SYNCANO_APIROOT https://api.syncano.io/

RUN groupadd -r syncano && \
    useradd -u 1000 -r -g syncano syncano -d /tmp -s /bin/bash && \
    mkdir /home/syncano && \
    chown -R syncano /home/syncano

# enable everyone to use /tmp
RUN chmod 1777 /tmp
# -- CUT BEGIN --

RUN apt-get update && apt-get install -qqy \
    php5 \
    php5-cli \
    php5-json

# -- CUT END --
USER syncano
WORKDIR /tmp
