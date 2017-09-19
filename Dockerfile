FROM php:7-alpine
MAINTAINER Neel Shah

# Install Package Dependencies
RUN apk --update add --no-cache \
	curl \
	curl-dev \
	openjdk8-jre

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir -p /root/tests
WORKDIR /root/tests

COPY composer.json /root/
RUN cd /root/ && composer install --prefer-dist
ENV PATH $PATH:/root/bin

# ENTRYPOINT ["sh", "-c", "behat --profile=$PROFILE $OPTIONAL_ARGS --config=behat.yml"]