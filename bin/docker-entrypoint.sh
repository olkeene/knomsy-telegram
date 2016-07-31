#!/bin/bash

bundle check || bundle install --jobs 4 --retry 5

./bin/wait-for-postgres.sh

echo "Running in app: $@"
exec "$@"
