# NGINX PROXY

Nginx proxy container that uses env variables to substitute the `nginx.conf` and `default.conf`

## Example Usage

Proxies traffic from nginx service to the app service

```yaml
version: '3'

services:
  app:
    image: nginx:alpine
  nginx:
    image: bigmassa/nginx-proxy
    environment:
    - CLIENT_MAX_BODY_SIZE=75M
    - PROXY_HOST=app
    - PROXY_PORT=80
    - SERVER_NAME=localhost
    - WORKER_CONNECTIONS=2048
    - WORKER_PROCESSES=auto
    depends_on:
    - app
    ports:
    - "80:80"
```

Then go to http://<SERVER_NAME>/

## Volumes

mount volumes into the folder /www these will be available from the root url eg:

```
version: '3'

services:
  app:
    image: nginx:alpine
  nginx:
    ...
    volumes:
    - ./static:/www/static
    ...
```

the files will then be available like `http://localhost/static/...`. Nginx will try these
files before proxying off to the upstream server.

## Environment Variables

- CLIENT_MAX_BODY_SIZE = client max body size (default: 75M)
- PROXY_HOST = address to proxy to (default: app)
- PROXY_PORT = port to proxy to (default: 80)
- SERVER_NAME = the server name / domain name to use, anything else will return a 444 response (default: localhost)
- WORKER_CONNECTIONS = maximum number of simultaneous connections (default 2048)
- WORKER_PROCESSES = number of worker processes (default auto)
