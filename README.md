# Jenkins Slave with Ettus UHD

## Overview

This repository contains a Dockerfile to build a docker image suitable
for use as a Jenkins slave for testing projects that depend the Ettus
UHD.

## Development

Only releases of this project should be pushed to
https://hub.docker.com.

## Building

``` shell
docker build -t tee3/jenkinsci-slave-ettus-uhd .
```

## Distribution

``` shell
docker login -u tee3 hub.docker.com
docker tag tee3/jenkinsci-slave-ettus-uhd tee3/jenkinsci-slave-ettus-uhd:<TAG>
docker push tee3/jenkinsci-slave-ettus-uhd:<TAG>
docker logout hub.docker.com
```

## Usage

``` shell
docker pull hub.docker.com/tee3/jenkinsci-slave-ettus-uhd:<TAG>
```
