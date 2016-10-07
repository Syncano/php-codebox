#!/bin/bash

if [ ${1:-full} != "--partial" ]
then
    docker build -t quay.io/syncano/php-codebox .
fi

docker run -d -p 2200:22 --env-file image/environment --name ansible quay.io/syncano/php-codebox dumb-init /usr/sbin/sshd -D
ansible-playbook -i "`docker inspect --format '{{ .NetworkSettings.IPAddress }}' ansible`," -u root --private-key image/id_rsa provision-php-codebox.yml
docker commit ansible quay.io/syncano/php-codebox

docker run -d --env-file image/environment -u syncano --name php quay.io/syncano/php-codebox dumb-init /usr/sbin/sshd -D
docker commit php quay.io/syncano/php-codebox
