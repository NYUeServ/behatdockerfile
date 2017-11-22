FROM php:7-alpine
MAINTAINER "Neel Shah <neel@hostpaas.io>"

# Install Package Dependencies
RUN apk --update add --no-cache \
	curl \
	curl-dev \
	openjdk8-jre

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN useradd -ms /bin/bash jenkins
RUN mkdir -p /root/tests
RUN mkdir -p /jenkins/tests
COPY root/tests /jenkins/tests/
WORKDIR /jenkins/tests

COPY composer.json /root/
RUN cd /root/ && composer install --prefer-dist
ENV PATH $PATH:/root/bin
