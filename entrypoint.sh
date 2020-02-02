#!/bin/sh
until nc -z -v -w30 post 5432; do
    echo "Waiting for database connection..."
    # wait for 5 seconds before check again
    sleep 5
done

./manage.py migrate
./manage.py updatecatalog
./manage.py collectstatic --noinput
./manage.py runserver 0.0.0.0:8000