# Kudu Docker Slim
Slim docker image for [Apache Kudu](https://github.com/apache/kudu) based on CentOS 7
and RPM from [kudu-rpm](https://github.com/MartinWeindel/kudu-rpm)

Image can be found on [DockerHub](https://hub.docker.com/r/mweindel/kudu-docker-slim/)

## Getting Started

```
docker run -d --rm --name apache-kudu --net=host mweindel/kudu-docker-slim
```

If using the host network is no option, you can use something like
```
docker run -d --rm --name apache-kudu -p 18050:8050 -p 18051:8051 -p 17050:7050 -p 17051:7050 \
  -e KUDU_MASTER_EXTRA_OPTS='--webserver_advertised_addresses my-docker-host:18051 --rpc_advertised_addresses my-docker-host:17051' \
  -e KUDU_TSERVER_EXTRA_OPTS='--webserver_advertised_addresses my-docker-host:18050 --rpc_advertised_addresses my-docker-host:17050' \
  mweindel/kudu-docker-slim
```

## Building

```
docker build . -t mweindel/kudu-docker-slim
```

