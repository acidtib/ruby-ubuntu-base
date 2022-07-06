FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --force-yes --no-install-recommends \
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
    imagemagick \
    libffi-dev \
		gnupg \
		gcc

# node.js install
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get update && apt-get install -y --no-install-recommends nodejs
RUN npm install npm@latest --location=global

# # yarn install
RUN npm install yarn --location=global

RUN apt-get clean \
		&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*