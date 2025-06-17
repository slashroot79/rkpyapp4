#!/bin/bash

echo "***********************************************************************"
# Make sure your custom glibc is used only by your app
export LD_LIBRARY_PATH=/tmp/@{APPID}/lib:$LD_LIBRARY_PATH

# daphne -b 0.0.0.0 -p 8000 myproject.asgi:application >> /home/site/wwwroot/daphne-log.txt 2>&1
gunicorn myapp.wsgi:application --bind 0.0.0.0:8000 --workers 3 --timeout 600