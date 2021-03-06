# ASTRID - Packetbeat
# author: Alex Carrega <alessandro.carrega@cnit.it>

# Image
ARG OS_VERSION=3.12.0
FROM alpine:$OS_VERSION

# Args
ARG COMPONENT=packetbeat
ARG VERSION=7.8.0
ARG INSTALLATION_PATH=/opt/$COMPONENT
ARG TMP_PATH=/tmp
ARG SOURCE=$COMPONENT-$VERSION-linux-x86_64
ARG FILE=$SOURCE.tar.gz

# Label
LABEL maintainer="alessandro.carrega@cnit.it"
LABEL description="$COMPONENT image based on Alpine Linux"
LABEL version=$VERSION

# Download
RUN wget -P $TMP_PATH/ https://artifacts.elastic.co/downloads/beats/$COMPONENT/$FILE
RUN tar xzvf $TMP_PATH/$FILE -C $TMP_PATH/
RUN mv $TMP_PATH/$SOURCE $INSTALLATION_PATH
RUN rm $TMP_PATH/$FILE

# Component execution deps
RUN apk add libc6-compat

# Variables
ENV COMPONENT=$COMPONENT
ENV VERSION=$VERSION
ENV INSTALLATION_PATH=$INSTALLATION_PATH

ENV ELASTICSEARCH_MONITORING_ENABLED=false
ENV ELASTICSEARCH_HOSTS=localhost:9200
ENV LOGSTASH_HOSTS=localhost:5044

# Settings
COPY settings/$VERSION/$COMPONENT.yml $INSTALLATION_PATH/
RUN mkdir -p $INSTALLATION_PATH/config
COPY settings/$VERSION/config/* $INSTALLATION_PATH/config/

# Execute
WORKDIR $INSTALLATION_PATH
ENTRYPOINT [ "/opt/packetbeat/packetbeat" ]
