kafka-manager-docker
============

Dockerfile for [kafka manager](https://github.com/yahoo/kafka-manager). It is a tool from Yahoo Inc. for managing [Apache Kafka](http://kafka.apache.org).

The image is available directly from [DockerHub](https://hub.docker.com/r/dockerkafka/kafka-manager/)

You can browse the source in [GitHub](https://github.com/DockerKafka/kafka-manager-docker)

## Usage

### Pull the image.
```sh
$  docker pull dockerkafka/kafka-manager

```
### Start a server.
```sh
$  docker run -d --name kafkadocker_zookeeper_1  dockerkafka/zookeeper
$  docker run -d --name kafkadocker_kafka_1 --link kafkadocker_zookeeper_1:zookeeper dockerkafka/kafka
$  docker run -it --rm --link kafkadocker_zookeeper_1:zookeeper --link kafkadocker_kafka_1:kafka -p 9000:9000 -e ZK_HOSTS=zookeeper:2181 mdockerkafka/kafka-manager
```

Wisit [localhost:90000](localhost:90000).

## Customization

Check out this repository, you will found the default Kafka configuration files under image/conf.

Start the container with the following line, so now you can modify the config in your host, and then start the server.
```sh
$  docker run -it --rm --volume `pwd`/image/conf:/opt/kafka_2.10-0.8.2.1/config kafkadocker/kafka /bin/bash
```

After you finished the customization & testing of the config changes, build your own image.
```sh
$  docker build --tag="my-image" .
```

## Useful links
* [Kafka manager](https://github.com/yahoo/kafka-manager)
