#!/bin/bash
sudo docker run -v /home/zoul15/pccppdocker/build/testdir:/home/zoul15/testdir --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it zoul15/hellobuild:1


