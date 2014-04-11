FROM        ubuntu:precise
MAINTAINER  Andreas Jansson <andreas@jansson.me.uk>

RUN         apt-get update
RUN         apt-get install -y \
                mysql-server-5.5 \
                openssh-server \
                python-pip

RUN         pip install supervisor envtpl

RUN         echo 'root:root' | chpasswd
RUN         mkdir /var/run/sshd

ADD         my.cnf.tpl /etc/mysql/conf.d/my.cnf.tpl
ADD         supervisord.conf.tpl /etc/supervisord.conf.tpl
ADD         start_container /bin/start_container
RUN         chmod +x /bin/start_container

VOLUME      /var/lib/mysql
EXPOSE      3306 22
CMD         /bin/start_container
