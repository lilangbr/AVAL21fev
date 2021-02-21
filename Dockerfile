# Base debian buster image
FROM debian:buster

LABEL author="Eliane Bresser" user_name="ebresser" email="ebresser@student.42sp.og.br"

COPY srcs /tmp/

RUN apt-get update && \
    apt-get -y upgrade && \
#Install other features
    #apt-get install -y apt-utils && \
#Install NGINX, OpenSSL and MariaDB
    #Step1 ---------------------------------------
    apt-get install -y nginx && \ 
    #Step2 ---------------------------------------
    apt-get install -y openssl && \
    #Step3 ---------------------------------------
    apt-get install -y mariadb-server && \
#Install PHP and packages
    #Step4 ---------------------------------------
    apt-get install -y php7.3 && \
    apt-get install -y php-fpm php-mysql && \
    #Step5 ---------------------------------------
    apt-get install -y php-curl php-gd php-intl && \
    apt-get install -y php-mbstring php-soap php-xml php-xmlrpc php-zip && \
#Prepare to Download Wordpress and phpMyAdmin in tmp folder    
    apt-get install -y wget && \
    #apt-get install -y curl && \
    cd /tmp && \
#Download Wordpress and extract the compressed file    
    wget https://wordpress.org/latest.tar.gz && \
    #curl -LO https://wordpress.org/latest.tar.gz && \
    #tar xzvf latest.tar.gz
#Download phpMyAdmin and extract the compressed file    
    #cd /tmp && \
    #Step6 ---------------------------------------
    wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-english.tar.gz
    #tar -zxvf phpMyAdmin-5.0.2-english.tar.gz && \
    #rm -rf phpMyAdmin-5.0.2-english.tar.gz && \
    #mv phpMyAdmin-5.0.2-english/ /var/www/localhost/phpmyadmin


RUN bash /tmp/config.sh

EXPOSE 80 443

ENTRYPOINT bash /tmp/init.sh

#Black Hole: Infinite Loop to maintain the container operant
CMD tail -f /dev/null





