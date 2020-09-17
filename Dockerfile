FROM        nginx:alpine

ENV         CLIENT_MAX_BODY_SIZE=75M
ENV         PROXY_HOST=app
ENV         PROXY_PORT=80
ENV         SERVER_NAME=localhost
ENV         WORKER_CONNECTIONS=2048
ENV         WORKER_PROCESSES=auto

COPY        nginx.conf.template /etc/nginx/
COPY        default.conf.template /etc/nginx/conf.d/
COPY        docker-entrypoint.sh /

ENTRYPOINT  ["/docker-entrypoint.sh"]

CMD         ["nginx", "-g", "daemon off;"]
