#!/bin/bash
echo "stopping homebridge in case it is running"
docker stop -t 60 homebridge
echo "removing old container"
docker rm homebridge
echo "starting new instance of homebridge"
docker run -d --net=host --name=homebridge -p 51826:51826 -p 8080:8080-v /volume1/docker/homebridge:/root/.homebridge cbrandlehner/homebridge:0.21
echo "done"
