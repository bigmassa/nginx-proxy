#!/usr/bin/env sh
set -eu

envsubst '${CLIENT_MAX_BODY_SIZE}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
envsubst '${PROXY_HOST} ${PROXY_PORT}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"