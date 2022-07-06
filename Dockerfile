FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y --force-yes --no-install-recommends \
		autoconf \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    wget \
    curl \
    git \
    build-essential \
    vim \
    dtach \
    imagemagick \
    libffi-dev \
		gnupg

# node.js install
RUN curl -sSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get update \ 
		&& apt-get install -y --no-install-recommends nodejs npm

# yarn install
RUN npm install -g yarn

RUN apt-get clean \
		&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*