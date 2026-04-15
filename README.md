# Startup

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

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

## License

Licensed under the [Apache License, Version 2.0](https://opensource.org/licenses/Apache-2.0). See [LICENSE](./LICENSE) for details.
