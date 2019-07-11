#!/usr/bin/env bash
sudo docker rm $(sudo docker ps -aq --filter "status=exited")
sudo docker rm $(sudo docker ps -aq --filter "status=created")