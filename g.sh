#!/bin/bash

NAME="mysite"                              #Name of the application (*)
DJANGODIR=/var/www/moringaschool/current              # Django project directory (*)
SOCKFILE=/var/www/moringaschool/current/run/gunicorn.sock        # we will communicate using this unix socket (*)
USER=nginx                                        # the user to run as (*)
GROUP=www-data                                     # the group to run as (*)
NUM_WORKERS=3                                     # how many worker processes should Gunicorn spawn (*)
DJANGO_SETTINGS_MODULE=mysite.settings             # which settings file should Django use (*)
DJANGO_WSGI_MODULE=mysite.wsgi                    # WSGI module name (*)
LOG_LEVEL=error

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
source /var/www/moringaschool/current/venv/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec /var/www/moringaschool/current/venv/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --bind 0.0.0.0:8000 \
  --workers $NUM_WORKERS \
  --user $USER
  --log-level=$LOG_LEVEL \
  --log-file=-
