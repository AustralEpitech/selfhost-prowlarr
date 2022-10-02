#!/bin/bash

if [ -n "$PGID" ]; then
    groupmod -g "$PGID" app
fi

if [ -n "$PUID" ]; then
    usermod -u "$PUID" app
fi

chown -R app:app /config/ /app/

exec su app <<< "$@"
