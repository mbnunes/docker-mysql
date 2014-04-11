[mysqld]
bind-address           = {{ BIND_ADDRESS | default("0.0.0.0") }}
console                = 1
general_log            = 1
general_log_file       = /var/log/mysql/general.log
log_error              = /var/log/mysql/error.log

{% if LOG_BIN is defined %}
log-bin                = {{ LOG_BIN }}
{% endif %}

server-id              = {{ SERVER_ID | default(1) }}
innodb_force_recovery  = {{ INNODB_FORCE_RECOVERY | default(0) }}

innodb_file_format     = {{ INNODB_FILE_FORMAT | default("Barracuda") }}
innodb_file_format_max = {{ INNODB_FILE_FORMAT_MAX | default("Barracuda") }}
innodb_file_per_table  = {{ INNODB_FILE_PER_TABLE | default(1) }}
max_allowed_packet     = {{ MAX_ALLOWED_PACKET | default(134217728) }}
max_connections        = {{ MAX_CONNECTIONS | default(251) }}
sync_binlog            = {{ SYNC_BINLOG | default(4) }}

{% for key, value in environment('CONF_') %}
{{ key }}              = {{ value }}
{% endfor %}
