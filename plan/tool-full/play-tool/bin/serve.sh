#!/usr/bin/env bash


### Head: init #################################################################
#
THE_BASE_DIR_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
THE_BASE_DIR_PATH="$THE_BASE_DIR_PATH/../ext"
source "$THE_BASE_DIR_PATH/init.sh"
#
### Tail: init #################################################################


### Head: main #################################################################
#
main_serve () {
	## cd document root dir
	cd $THE_WWW_DIR_PATH


	## serve
	## http://php.net/manual/en/features.commandline.webserver.php
	#php -S localhost:8080
	#php -S 127.0.0.1:8080
	php -S 0.0.0.0:8080
}

main_serve "$@"
#
### Tail: main #################################################################
