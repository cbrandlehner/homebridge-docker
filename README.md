[![Docker Stars](https://img.shields.io/docker/stars/cbrandlehner/homebridge.svg)](https://hub.docker.com/r/cbrandlehner/homebridge/)
[![Docker Pulls](https://img.shields.io/docker/pulls/cbrandlehner/homebridge.svg)](https://hub.docker.com/r/cbrandlehner/homebridge/)
[![GitHub forks](https://img.shields.io/github/forks/cbrandlehner/homebridge-docker.svg?style=social&label=Fork)](https://github.com/cbrandlehner/homebridge-docker)
# Homebridge-Docker

Docker image for Homebrigde
This project only builds a docker image, please do not report problems with homebridge but look into the homebridge project: For details see https://github.com/nfarina/homebridge

As said, this is simply wrapping the source in a runnable Docker image for everyone that cannot install the dev environment on his machine or everyone that wants a simple containerized solution.
If you intend to run this docker image on a Synology NAS, read this documentation:
http://chris.brandlehner.at/Brandlehner/cab_blog.nsf/d6plinks/CBRR-A6XQUY

## Supported plugins
homebridge-philipshue
homebridge-ninjablock-temperature
homebridge-ninjablock-humidity
homebridge-ninjablock-alarmstatedevice
homebridge-luxtronik2
homebridge-mqttswitch
homebridge-edomoticz
homebridge-synology
homebridge-tesla

(and you can extend this list by adding more plugins in the file package.json)

## Configuration

Copy `config-sample.json` to `config.json` and adapt to your likings.

## Build

`./homebridge.sh build`

## Run

### run first time

`./homebridge.sh run`

### stop

`./homebridge.sh stop`

### start

(after stopping)

`./homebridge.sh start`

### remove

(needed before run is possible again)

`./homebridge.sh remove`

### rerun

Stops and removes the containers, then performs run again

`./homebridge.sh rerun`

### attach

Attaches to the running container

`./homebridge.sh attach`

### logs

Diplays stdout log of the running container

`./homebridge.sh logs`

## Changelog
### 0.11
moved from nodesource/jessie:5.6.0 to nodesource/jessie:5.8.0

moved files that are copied into the image are in directory ./image

moved configuration samtes to ./config-sample

simplified Dockerfile and combined the previously two script files into a single script

implemented a way to install homebridge modules at runtime without the need to include them in the docker image

fixing a locale issue with C vs UTF-8

### 0.12
git push problem - do not use this release

### 0.13
should have fixed git push problem

### 0.14
added link to blog and sample start script

### 0.15
moved to jessie:latest

### 0.16
added debug run command to homebridge.sh

### 0.17
added homebridge-tesla

updated versions

### 0.18
updated with current nodesource/jessie

### 0.19
Updated with current nodesource/xenial
Added GUI for configuration by making use of homebridge-config-ui-x
Removed most of the homebridge modules as you can now use the GUI to install them.

