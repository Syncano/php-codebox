# php-codebox

This repository contains Dockerfile for PHP5 image.

You can build the image yourself:

```
$ docker build -t quay.io/syncano/php-codebox .
```

or pull it from Docker registry:

```
$ docker pull quay.io/syncano/php-codebox
```

Then you can run PHP code inside Docker container:

```
$ docker run -it -v `pwd`/test.php:/tmp/source.php \
    quay.io/syncano/php-codebox php -f /tmp/source.php
```
