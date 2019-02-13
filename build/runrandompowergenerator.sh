#!/bin/bash
sudo docker run -e HOST_HOSTNAME=`hostname` --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it zoul15/hellobuild:generaterandomhandpower
