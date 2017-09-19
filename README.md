## Dockerfile for running Behat Tests

### This repo already contains a composer.json file which I prefer using with the correct dependencies. You can override your custom composer.json file with after pulling the image in own Dockerfile or using docker-compose. 

This image is based off Alpine linux, with PHP 7.0, Curl and Java 8 installed in it. 

In addition the image has no entrypoint and would recommend using docker-compose version 3+ entrypoint to run your behat tests such as:

`entrypoint: sh -c 'behat --profile=<prod> --config=behat.yml'`
