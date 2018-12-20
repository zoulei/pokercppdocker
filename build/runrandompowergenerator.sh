#!/bin/bash
sudo docker run --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it zoul15/hellobuild:generaterandomhandpower
