FROM        nginx:alpine

ENV         PROXY_HOST=app
ENV         PROXY_PORT=80
ENV         CLIENT_MAX_BODY_SIZE=75M

COPY        nginx.conf.template /etc/nginx/
COPY        default.conf.template /etc/nginx/conf.d/
COPY        docker-entrypoint.sh /

ENTRYPOINT  ["/docker-entrypoint.sh"]

CMD         ["nginx", "-g", "daemon off;"]
