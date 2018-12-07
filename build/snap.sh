#!/bin/bash
sudo docker build --rm -t "zoul15/hellobuild:1" .
sudo docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it zoul15/hellobuild:1


