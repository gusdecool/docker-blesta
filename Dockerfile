FROM gusdecool/php-apache:7.3

# Set Apache root directory
RUN sed -ri -e "s!/app/public/!/app/!g" /etc/apache2/sites-available/*.conf
RUN sed -ri -e "s!/app/public/!/app/!g" /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Ioncube loder
COPY ./ioncube/extension/* /usr/local/lib/php/extensions/no-debug-non-zts-20180731/
COPY ./ioncube/00-ioncube.ini /usr/local/etc/php/conf.d

#--------------------------------------------------------------------------------------------------
# Install PHP packages
#--------------------------------------------------------------------------------------------------

RUN docker-php-ext-install pdo_mysql

# IMAP
RUN apt-get install -y libc-client-dev libkrb5-dev
RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl
RUN docker-php-ext-install imap

# GD
RUN apt-get install -y libgd-dev
RUN docker-php-ext-install gd

# GMP
RUN apt-get install -y libgmp-dev
RUN docker-php-ext-install gmp

# Mailparse
RUN pecl install mailparse
RUN docker-php-ext-enable mailparse
