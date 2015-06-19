# Comment
FROM tutum/centos:centos6

LABEL Vendor="CentOS"

RUN echo 'Estamos comecando a inicializar seu container'
RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

RUN yum -y install acl php56w.x86_64 php56w-xml.x86_64 php56w-pdo.x86_64 php56w-mysql.x86_64 php56w-imap.x86_64 php56w-pecl-xdebug.x86_64 php56w-mcrypt.x86_64 php56w-mbstring.x86_64 php56w-ldap.x86_64 git.x86_64 npm tar.x86_64 bzip2.x86_64

RUN npm install bower -g

RUN curl -sS https://getcomposer.org/installer | php  -- --install-dir=/bin
RUN cp /bin/composer.phar /bin/composer

EXPOSE 80
ADD httpd/virtualHost.conf /etc/httpd/conf.d/
ADD httpd-script.sh /httpd-script.sh

RUN mkdir -p /var/www/html && chmod -Rf 777 /var/www/html
RUN chmod -v +x /httpd-script.sh

CMD ["/httpd-script.sh"]




