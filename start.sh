#!/bin/sh

set -e

echo "run db migration"


cat /app/sample.env
source /app/sample.env
ls /app

echo "$DB_DRIVER"
echo "$DB_SOURCE"

/app/migrate -path /app/migration -database "$DB_SOURCE" -verbose up

echo "start the app"
exec "$@"