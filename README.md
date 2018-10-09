[![Docker Stars](https://img.shields.io/docker/stars/cbrandlehner/homebridge.svg)](https://hub.docker.com/r/cbrandlehner/homebridge/)
[![Docker Pulls](https://img.shields.io/docker/pulls/cbrandlehner/homebridge.svg)](https://hub.docker.com/r/cbrandlehner/homebridge/)
[![GitHub forks](https://img.shields.io/github/forks/cbrandlehner/homebridge-docker.svg?style=social&label=Fork)](https://github.com/cbrandlehner/homebridge-docker)
# Homebridge-Docker

Docker image for Homebrigde
This project only builds a docker image, please do not report problems with homebridge but look into the homebridge project: For details see https://github.com/nfarina/homebridge

This is a Docker enabled version of Homebridge designed to run on a Synology NAS from https://github.com/nfarina/homebridge. I am running a Synology 1815+.

The Docker image has already been built and is on the Docker Hub repository at https://hub.docker.com/r/cbrandlehner/homebridge/ 
You can search for it from the Synology Docker console Registry and load the image directly to your NAS.

On your Synology NAS, create a "docker/homebridge" folder. After creating your config.json and package.json files, copy them to the shared "docker/homebridge" folder. The config.json will have your homebridge config and the package.json will list the NPM packages that you want to be built each time the container is run. You do not have to build a new image everytime you want to add plugins! See https://github.com/cbrandlehner/homebridge-docker/tree/master/config-sample for samples of both the config.json, package.json and homebridge_start.sh files. If you make any changes to the config.json or package.json files, you will need to restart homebridge for the settings to take.

Run the container from the `homebridge_start.sh` via the Synology Task Scheduler in Coltrol Panel or via SSH command line by entering

`sudo docker run --name=homebridge -d --restart=always --net=host -p 51826:51826 -p 8080:8080 -v /volume1/docker/homebridge:/root/.homebridge cbrandlehner/homebridge:0.20`

Enter your root password to run the command.

If you want to use Synology Task Scheduler in the Control Panel of the NAS, you will need to copy `homebridge_start.sh` to the "docker/homebridge" folder on the shared volume. Next, create a task that runs the `docker/homebridge/homebridge_start.sh` at bootup. For the tasks, you will need to make the task user `root`.

If you are running the firewall on the Synology, you will need to open TCP 5353 & 51826 & 8080. You could select from a list of built-in applications and select "Docker homebridge 51826 Docker (TCP)" and "Bonjour 5353 Bonjour Service". You can find the firwall profiles under the Control Panel/Security. If you do not open these ports, the firewall will close within a few minutes and your app will not be reachable from an IOS device.

##Plugins
You can find all of the plugins on NPM at https://www.npmjs.com/search?q=homebridge+plugin 

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

### 0.20
Updated homebridge_start.sh script to expose port 8080 for config UI
Moved from nodesource docker image to pure node.
Updated readme.

### 0.21
Updated run script to avoid to start homebridge if the configuration is missing.
Updated run script to log to /var/log/homebridge
