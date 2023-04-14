FROM registry.docker.com/library/ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt remove --autoremove ruby && apt-get install -y --no-install-recommends \
    make \
		autoconf \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    wget \
    curl \
    git \
    build-essential \
		ca-certificates \
    vim \
    dtach \
    libffi-dev \
		libcurl4-openssl-dev \
		gcc \
		tzdata

# Install JavaScript dependencies
ARG NODE_VERSION=16.19.1
ARG YARN_VERSION=1.22.19
ENV PATH=/usr/local/node/bin:$PATH
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    npm install -g yarn@$YARN_VERSION && \
    rm -rf /tmp/node-build-master

RUN apt-get clean \
		&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*