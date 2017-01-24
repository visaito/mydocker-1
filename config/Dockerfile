# Comment
FROM centos:6

LABEL Vendor="CentOS"

RUN rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm && \
	rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm && \
	curl --silent --location https://rpm.nodesource.com/setup_6.x | bash - && \
	yum -y update && \
	yum -y install acl php56w.x86_64 php56w-xml.x86_64 php56w-pdo.x86_64 php56w-mysql.x86_64 php56w-imap.x86_64 php56w-pecl-xdebug.x86_64 php56w-mcrypt.x86_64 php56w-mbstring.x86_64 php56w-ldap.x86_64 git.x86_64 wget php56w-pecl-memcached.x86_64 php56w-intl.x86_64 gcc-c++ make nodejs fontconfig && \
	curl -sS https://getcomposer.org/installer | php  -- --install-dir=/bin && \
	cp /bin/composer.phar /bin/composer && \
	wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo && \
	yum -y install yarn && \
	gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 && \
	curl -sSL https://get.rvm.io | bash -s stable --ruby=2.3 --gems=scss-lint && \
	source /usr/local/rvm/scripts/rvm && \
	yum clean all

EXPOSE 80
EXPOSE 9876
EXPOSE 23053

ADD httpd/virtualHost.conf /etc/httpd/conf.d/
ADD httpd/httpd.conf /etc/httpd/conf/
ADD httpd-script.sh /httpd-script.sh

#ADD ~/.ssh/* /root/.ssh/

RUN mkdir -p /var/www/html && chmod -Rf 777 /var/www/html
RUN chmod -v +x /httpd-script.sh

CMD ["/httpd-script.sh"]