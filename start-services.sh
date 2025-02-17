#!/bin/sh

# Start Java application in the background
java -jar /app/app.jar &

# Wait for Java app to start
sleep 10

# Start Nginx in the foreground
nginx -g 'daemon off;'