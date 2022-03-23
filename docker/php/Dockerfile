FROM php:7.4.28-fpm-alpine
# FROM php:8.0-fpm-alpine

RUN apk update --no-cache \
&& apk add \
icu-dev \
oniguruma-dev \
tzdata
 
RUN apk --update add --virtual build-dependencies build-base openssl-dev autoconf \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install pdo_mysql \
  && pecl install xdebug \
  && rm -rf /tmp/pear \
  && docker-php-ext-enable xdebug \
  && apk del build-dependencies build-base openssl-dev autoconf \
  && rm -rf /var/cache/apk/*

# Register the COMPOSER_HOME environment variable
ENV COMPOSER_HOME /composer

# Add global binary directory to PATH and make sure to re-export it
ENV PATH /composer/vendor/bin:$PATH

# Allow Composer to be run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

# Setup the Composer installer
RUN curl -o /tmp/composer-setup.php https://getcomposer.org/installer \
  && curl -o /tmp/composer-setup.sig https://composer.github.io/installer.sig \
  && php -r "if (hash('SHA384', file_get_contents('/tmp/composer-setup.php')) !== trim(file_get_contents('/tmp/composer-setup.sig'))) { unlink('/tmp/composer-setup.php'); echo 'Invalid installer' . PHP_EOL; exit(1); }" \
  && php /tmp/composer-setup.php --install-dir=/usr/bin --filename=composer
  
RUN rm -rf /var/cache/apk/*
 
CMD ["php-fpm"]
