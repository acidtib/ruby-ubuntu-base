FROM ubuntu:22.04

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

# node.js install
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install -y --no-install-recommends nodejs
RUN npm install npm@latest --location=global

# # yarn install
RUN npm install yarn --location=global

RUN apt-get clean \
		&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*