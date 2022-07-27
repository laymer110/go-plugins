Go plugins is a place for community maintained plugins.

## Overview

Micro tooling is built on a powerful pluggable architecture. Plugins can be swapped out with zero code changes.
This repository contains plugins for all micro related tools. Read on for further info.

## Getting Started

* [Contents](#contents)
* [Versions](#versions)
* [Usage](#usage)
* [Build Pattern](#build)
* [Contributions](#contributions)
* [Community](#community)

## Contents

Contents of this repository:

| Directory | Description                                                     |
| --------- | ----------------------------------------------------------------|
| Broker    | PubSub messaging; NATS, NSQ, RabbitMQ, Kafka                    |
| Client    | RPC Clients; gRPC, HTTP                                         |
| Codec     | Message Encoding; BSON, Mercury                                 |
| Micro     | Micro Toolkit Plugins                                           |
| Registry  | Service Discovery; Etcd, Gossip, NATS                           |
| Selector  | Load balancing; Label, Cache, Static                            |
| Server    | RPC Servers; gRPC, HTTP                                         |
| Transport | Bidirectional Streaming; NATS, RabbitMQ                         | 
| Wrapper   | Middleware; Circuit Breakers, Rate Limiting, Tracing, Monitoring|

## Versions

- [v2 - github.com/micro/go-micro/v2](https://github.com/laymer110/go-plugins/tree/main/v2)
- [v3 - github.com/asim/go-micro/v3](https://github.com/laymer110/go-plugins/tree/main/v3)
- [v4 - go-micro.dev/v4](https://github.com/laymer110/go-plugins/tree/main/v4)

## Usage

Plugins can be added to go-micro in the following ways. By doing so they'll be available to set via command line args or environment variables.

Import the plugins in a `plugins.go` file

```go
package main

import (
	_ "github.com/laymer110/go-plugins/v4/broker/rabbitmq"
	_ "github.com/laymer110/go-plugins/v4/registry/kubernetes"
	_ "github.com/laymer110/go-plugins/v4/transport/nats"
)
```

Create your service and ensure you call `service.Init`

```go
package main

import (
	"go-micro.dev/v4"
)

func main() {
	service := micro.NewService(
		// Set service name
		micro.Name("my.service"),
	)

	// Parse CLI flags
	service.Init()
}
```

Build your service

```
go build -o service ./main.go ./plugins.go
```

### Env

Use environment variables to set the

```
MICRO_BROKER=rabbitmq \
MICRO_REGISTRY=kubernetes \ 
MICRO_TRANSPORT=nats \ 
./service
```

### Flags

Or use command line flags to enable them

```shell
./service --broker=rabbitmq --registry=kubernetes --transport=nats
```

### Options

Import and set as options when creating a new service

```go
import (
	"go-micro.dev/v4"
	"github.com/laymer110/go-plugins/v4/registry/kubernetes"
)

func main() {
	registry := kubernetes.NewRegistry() //a default to using env vars for master API

	service := micro.NewService(
		// Set service name
		micro.Name("my.service"),
		// Set service registry
		micro.Registry(registry),
	)
}
```

## Build Pattern

An anti-pattern is modifying the `main.go` file to include plugins. Best practice recommendation is to include
plugins in a separate file and rebuild with it included. This allows for automation of building plugins and
clean separation of concerns.

Create file plugins.go

```go
package main

import (
	_ "github.com/laymer110/go-plugins/v4/broker/rabbitmq"
	_ "github.com/laymer110/go-plugins/v4/registry/kubernetes"
	_ "github.com/laymer110/go-plugins/v4/transport/nats"
)
```

Build with plugins.go

```shell
go build -o service main.go plugins.go
```

Run with plugins

```shell
MICRO_BROKER=rabbitmq \
MICRO_REGISTRY=kubernetes \
MICRO_TRANSPORT=nats \
service
```

## Community

- [Discord](https://discord.gg/qV3HvnEJfB)
- [Slack](https://join.slack.com/t/go-micro/shared_invite/zt-175aaev1d-iHExPTlfxvfkOeeKLIYEYw)
- [QQ Group](https://jq.qq.com/?_wv=1027&k=5Gmrfv9i)
