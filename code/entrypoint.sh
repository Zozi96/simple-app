#!/bin/ash

function run_prod() {
    gunicorn core.wsgi:application \ 
    --bind 0.0.0.0:8000 \
    --workers 3 \
    --log-level debug \
    --timeout 300 \
    --threads 5 \
    --error-logfile - \
    --access-logfile - 
}

function run_dev() {
    python manage.py runserver 0.0.0.0:8000
}

if [ "$DEBUG" == "False" ]; then
    run_prod
else
    run_dev
fi
    