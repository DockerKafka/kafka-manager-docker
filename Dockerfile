FROM hseeberger/scala-sbt

MAINTAINER PalSzak

ENV ZK_HOSTS=localhost:2181 \
     KM_VERSION=1.2.7

RUN mkdir -p /tmp && \
    cd /tmp && \
    wget https://github.com/yahoo/kafka-manager/archive/${KM_VERSION}.tar.gz && \
    tar xxf ${KM_VERSION}.tar.gz && \
    cd /tmp/kafka-manager-${KM_VERSION} && \
    sbt clean dist && \
    unzip  -d /opt/ ./target/universal/kafka-manager-${KM_VERSION}.zip && \
    rm -fr /tmp/${KM_VERSION} /tmp/kafka-manager-${KM_VERSION}

ENV PATH /opt/kafka-manager-${KM_VERSION}/bin:$PATH

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 9000

#CMD ["kafka-manager","-Dconfig.file=conf/application.conf"]
CMD ["/bin/bash"]