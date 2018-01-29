#!/bin/sh
# https://stackoverflow.com/a/38732187/1935918
set -e

echo "Removing PID file if it exists..."
if [ -f /code/tmp/pids/server.pid ]; then
  echo "Removing PID file: /code/tmp/pids/server.pid"
  rm /code/tmp/pids/server.pid
fi

echo "Using bundle to execute starting the server..."
exec bundle exec "$@"
