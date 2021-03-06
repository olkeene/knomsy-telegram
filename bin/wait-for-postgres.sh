#!/bin/bash

# TODO https://github.com/vishnubob/wait-for-it

set -e

host="$1"
shift
cmd="$@"
export PGPASSWORD=$PG_PASSWORD

until psql -h "$host" -U "postgres" -c '\l'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done

>&2 echo "Postgres is up - executing command"
exec $cmd
