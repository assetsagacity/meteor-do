#!/usr/bin/env bash
#
# executes the 'meteor' command in the context of the app
# - if the app is running, we do an exec
# - if the app is not running, we'll do a run

name=meteor
running=`docker ps | grep ${name}_1`

if [ -z "$1" ]; then
  # no args, user wants to launch meteor server, this should be done with docker-compose up, let's do it
  docker-compose up
elif [ "$running" ]; then
  docker-compose exec $name meteor $*
else
  docker-compose run --rm $name meteor $*
  exit_code=$?
  # down is needed to not leave linked mongo container hanging
  docker-compose down
  exit $exit_code
fi
