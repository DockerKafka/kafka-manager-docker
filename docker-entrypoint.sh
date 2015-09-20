#!/bin/bash
set -e

if [ "$1" = 'kafka-manager' ]; then

    # sed -i -r 's|#zookeeper.connect=localhost:2181|zookeeper.connect=zookeeper:2181|g' /opt/confluent-1.0.1/etc/kafka-rest/kafka-rest.properties

    exec "$@"
fi

exec "$@"
