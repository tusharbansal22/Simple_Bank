#!/bin/sh

set -e

echo "run db migration"


cat /app/sample.env
source /app/sample.env
ls /app
echo "DB_SOURCE=postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable
DB_DRIVER=postgres
SERVER_ADDRESS=0.0.0.0:8080
TOKEN_SYMMETRIC_KEY=tushar22tushar22tushar22tushar22
ACCESS_TOKEN_DURATION=15m" > sample.env

cat /app/sample.env
source /app/sample.env

echo "$DB_DRIVER"
echo "$DB_SOURCE"

/app/migrate -path /app/migration -database "$DB_SOURCE" -verbose up

echo "start the app"
exec "$@"