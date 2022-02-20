#!/bin/sh

docker rm -f smartcontract_automation
docker build -t smartcontract_automation .
docker run --name smartcontract_automation -v "$(pwd)":/smartcontract_automation -e PROFILE=$PROFILE smartcontract_automation:latest
docker rm -f smartcontract_automation