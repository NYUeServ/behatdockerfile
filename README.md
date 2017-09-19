## Dockerfile for running Behat Tests

### This repo already contains a composer.json file which I prefer using with the correct dependencies for behat tests. You can override your custom composer.json file with after pulling the image in your own custom Dockerfile or using docker-compose. It also has a Behat extension installed to allowing taking screenshots using Bex Screenshot package.

This image is based off Alpine linux, with PHP 7.0, Curl and Java 8 installed in it.

In addition the image has no entrypoint and would recommend using docker-compose version 3+ entrypoint to run your behat tests such as:

entrypoint: sh -c 'behat --profile=<prod> --config=behat.yml'

Current Dependencies or version supported:
Behat 3.1.0
Mink 1.7.1
Symfony 2.0.0
Bex Behat Screenshot 1.2.6