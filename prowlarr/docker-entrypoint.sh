#!/bin/bash

if [ -n "$PGID" ]; then
    groupmod -g "$PGID" app
fi

if [ -n "$PUID" ]; then
    usermod -u "$PUID" app
fi

if [ -n "$PGID" ] || [ -n "$PUID" ]; then
    chown -R app:app /app/
fi

exec su app <<< "$@"
