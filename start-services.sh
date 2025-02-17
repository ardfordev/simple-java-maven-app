#!/bin/sh

# Pastikan direktori log ada
mkdir -p /var/log/app

# Start Java application dengan output ke file log
java -jar /app/app.jar > /var/log/app/java.log 2>&1 &

# Tunggu sampai aplikasi Java benar-benar running
echo "Menunggu aplikasi Java startup..."
timeout=60
while ! nc -z localhost 8080; do
  if [ $timeout -le 0 ]; then
    echo "Timeout: Aplikasi Java gagal start"
    exit 1
  fi
  timeout=$((timeout-1))
  sleep 1
done

echo "Aplikasi Java sudah running"

# Start Nginx
echo "Starting Nginx..."
nginx -g 'daemon off;'