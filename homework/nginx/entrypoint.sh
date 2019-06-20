#!/bin/bash

echo "$STRING" >> /usr/share/nginx/html/index.html

echo "Starting nginx"

nginx -g 'daemon off;'
