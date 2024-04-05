#!/bin/sh

set -e

echo "run db migration"

source /app/sample.env
cat /app/sample.env

/app/migrate -path /app/migration -database "$DB_SOURCE" -verbose up

echo "start the app"
exec "$@"