# Jenkins CI JNLP Slave with Boost C++ Libraries

## Overview

This repository contains a Dockerfile to build a docker image suitable
for use as a Jenkins JNLP slave for testing C++ code that depends only
on the Boost C++ Libraries.

## Development

Only releases of this project should be pushed to
https://hub.docker.com.

## Building

``` shell
docker build -t tee3/jenkinsci-jnlp-slave-boostcpp .
```

## Distribution

``` shell
docker login -u tee3 hub.docker.com
docker tag tee3/jenkinsci-jnlp-slave-boostcpp tee3/jenkinsci-jnlp-slave-boostcpp:<TAG>
docker push tee3/jenkinsci-jnlp-slave-boostcpp:<TAG>
docker logout hub.docker.com
```

## Usage

``` shell
docker pull hub.docker.com/tee3/jenkinsci-jnlp-slave-boostcpp:<TAG>
```
