docker-mysql
============

MySQL on Docker.

Includes a bunch of cool features such as:

 - Exporting volumes so your data persists.
 - Not running as root.
 - Printing log output.
 - Setting a root password.
 - Creating a user and database.
 - Setting my.cnf variables with environment variables
 - Running mysql under supervisor
 - Also running an openssh daemon if you'd ever need to access the container directly. user/pass = root/root

Environment variables
---------------------

* `MYSQL_ROOT_PASSWORD`
  - The password for the root user, set every time the server starts. Defaults to a blank password, which is handy for development, but you should set this to something in production.
* `MYSQL_DATABASE`
  - A database to automatically create if it doesn't exist. If not provided, does not create a database.
* `MYSQL_USER`
  - A user to create that has access to the database specified by `MYSQL_DATABASE`.
* `MYSQL_PASSWORD`
  - The password for `MYSQL_USER`. Defaults to a blank password.
* `BIND_ADDRESS`
  - Default 0.0.0.0
* `LOG_BIN`
  - If provided, will become the value of the `log-bin` config variable
* `SERVER_ID`
  - Default = 1
* `INNODB_FORCE_RECOVERY`
  - Default = 0
* `INNODB_FILE_FORMAT`
  - Default = Barracuda
* `INNODB_FILE_FORMAT_MAX`
  - Default = Barracuda
* `INNODB_FILE_PER_TABLE`
  - Default = 1
* `MAX_ALLOWED_PACKET`
  - Default = 134217728
* `SYNC_BINLOG`
  - Default = 4
* `MAX_CONNECTIONS`
  - Default = 251
* `CONF_*`
  - Any environment variables in the format `CONF_varname=value` will be put in my.cnf as `varname=value`

Ports
-----

* 3306
  - MySQL
* 22
  - SSH

Volumes
-------

* `/var/lib/mysql`
