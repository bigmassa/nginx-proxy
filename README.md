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
    ports:
    - "80:80"
```

## Environment Variables

- CLIENT_MAX_BODY_SIZE = client max body size (default: 75M)
- PROXY_HOST = address to proxy to (default: app)
- PROXY_PORT = port to proxy to (default: 80)
