[supervisord]
logfile = /var/log/supervisord.log

[unix_http_server]
file=/tmp/supervisor.sock

[supervisorctl]
serverurl=unix:///tmp/supervisor.sock

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[program:mysqld]
command = /usr/sbin/mysqld {{ MYSQLD_ARGS | default("") }}
autorestart = true

[program:sshd]
command = /usr/sbin/sshd -D
autorestart = true
