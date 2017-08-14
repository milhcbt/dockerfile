#!/bin/bash

if [ ! -f /usr/local/bin/docker ]; then
  echo "Abort!"
  echo "Error: docker command not found."
  echo ""
  echo "Please install docker from Docker.com first."
  exit 2
fi
if [ ! -f /usr/local/bin/docker-squash ]; then
  echo "Abort!"
  echo "Error: docker-squash command not found."
  echo ""
  echo "Please install docker-squash from python pip first."
  exit 2
fi

if [ -z "$1" ]; then
  echo "Abort!"
  echo "Error: First parameter as docker image name and tag not found."
  echo ""
  echo "Please supply docker image name and tag as the first parameter."
  exit 2
fi
if [ -z "$2" ]; then
  echo "Abort!"
  echo "Error: Second parameter as Dockerfile directory not found."
  echo ""
  echo "Please supply Dockerfile directory as the first parameter."
  exit 2
fi

echo "Building $1 image ..."
docker build --compress -t $1-build $2

echo "Squashing $1 image ..."
docker-squash -t $1 $1-build

echo "Cleaning-up ..."
docker rmi -f $1-build

echo "Done"
exit 0
