# Startup
Build your AA ability an easy way

## Docker Compose

1. Config

```sh
# pwd ./deploy/docker-compose/conf


```

2. Start

```sh
# pwd ./deploy/docker-compose

docker-compose up
```

## How to build image

```sh
docker buildx create --use --platform=linux/arm64,linux/amd64 --name multi-platform-builder
docker buildx build --platform=linux/arm64,linux/amd64 -t <image tag> .
```