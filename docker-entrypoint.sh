#!/bin/sh
# https://stackoverflow.com/a/38732187/1935918
set -e

echo "Removing PID file if it exists..."
if [ -f /code/tmp/pids/server.pid ]; then
  echo "Removing PID file: /code/tmp/pids/server.pid"
  rm /code/tmp/pids/server.pid
fi

echo "Setting RAILS_ENV to development..."
bundle exec rails db:environment:set RAILS_ENV=development
echo "Migrating or starting from scratch..."
bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

echo "Using bundle to execute starting the server..."
exec bundle exec "$@"
