# Comment
FROM projeto_trayhttpd

MAINTAINER TRAY
LABEL Vendor="CentOS"

USER root

RUN echo 'Estamos comecando a inicializar seu container'
#RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm
RUN yum -y remove php
RUN yum -y install php56w.x86_64 
RUN yum -y install php56w-xml.x86_64
RUN yum -y install php56w-pdo.x86_64

RUN yum -y install php56w-mysql.x86_64 
RUN yum -y install php56w-imap.x86_64 
RUN yum -y install php56w-pecl-xdebug.x86_64
RUN yum -y install php56w-mcrypt.x86_64 
RUN yum -y install php56w-mbstring.x86_64 
RUN yum -y install php56w-ldap.x86_64
RUN yum -y install git.x86_64
RUN yum -y install npm
RUN yum -y install tar.x86_64
RUN yum -y install bzip2.x86_64
RUN npm install bower -g
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/bin
RUN cp /bin/composer.phar /bin/composer

EXPOSE 80
ADD httpd/virtualHost.conf /etc/httpd/conf.d/
WORKDIR /var/www/html

RUN chmod -Rf 777 /var/www/html
RUN chmod -v +x /httpd-script.sh
ADD httpd-script.sh /httpd-script.sh


CMD ["/httpd-script.sh"]
