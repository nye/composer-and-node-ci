ARG FROM_IMAGE=php:8-cli-alpine
FROM $FROM_IMAGE

LABEL maintainer="Carlos A. Gomes <carlos.algms@gmail.com>"


RUN apk add --no-cache \
    util-linux \
    zsh \
    vim \
    ca-certificates \
    zip \
    unzip \
    openssh \
    rsync \
    git \
    mysql-client \
    composer \
    make

ARG PECL_EXT="mcrypt-1.0.4"
ARG PHP_EXT="mysqli pspell zip"
ARG ENABLE_EXT="mcrypt"

RUN apk add --no-cache \
    libzip \
    libmcrypt \
    aspell; \
apk add --no-cache --virtual .build-deps \
    g++ \
    autoconf \
    libzip-dev \
    libmcrypt-dev \
    aspell-dev; \
if [ ! -z "$PECL_EXT" ]; then \
    pecl install $PECL_EXT \
    && docker-php-ext-enable $ENABLE_EXT; \
fi; \
docker-php-ext-install -j "$(nproc)" $PHP_EXT; \
apk del .build-deps


ARG DEPLOYER_VERSION="v6.8.0"
RUN curl -L https://deployer.org/releases/${DEPLOYER_VERSION}/deployer.phar --output /usr/local/bin/dep \
    && chmod +x /usr/local/bin/dep


# Install node, npm and yarn
ARG NODE_VERSION="v16.13.0"
RUN curl -O https://unofficial-builds.nodejs.org/download/release/${NODE_VERSION}/node-${NODE_VERSION}-linux-x64-musl.tar.xz \
    && tar xJf node-v*.xz -C /usr --strip-components=1 --no-same-owner \
    && rm node-v*.xz \
    && npm i -g yarn


COPY zshrc /root/.zshrc
