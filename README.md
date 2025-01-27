# Docker composer-and-node-ci image

A docker image to be used on continuous integration projects. 

The idea is to include everything you need to run unit tests and build frontend projects.

Also, it is possible to run pure PHP scripts, Composer for dependency manager.

To deploy and transfer files, [Deployer](https://deployer.org), SSH, and RSync are available.

`Nginx` and `Apache` **are NOT** included.

## This image includes: 

* [NodeJS 18.x and NPM](https://github.com/nodesource/distributions/blob/master/README.md#installation-instructions)
* [Yarn - classic](https://classic.yarnpkg.com/en/docs/install/#debian-stable)
* PHP 8-cli, 7.1-cli
* [Composer](https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md) (latest or v2.2.x for php7.x)
* [Deployer](https://deployer.org) (v6.9.0 or v6.6.0 for php7.x)
* OpenSSH client
* Git
* RSync
* MySql Client
* zsh
* vim
* Make


### Loaded modules:

```
$ php -m

[PHP Modules]
calendar
Core
ctype
curl
date
dom
exif
FFI
fileinfo
filter
ftp
gd
gettext
hash
iconv
json
libxml
mysqli
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_sqlite
Phar
posix
random
readline
Reflection
session
shmop
SimpleXML
sockets
sodium
SPL
sqlite3
standard
sysvmsg
sysvsem
sysvshm
tokenizer
xml
xmlreader
xmlwriter
xsl
Zend OPcache
zip
zlib
```
