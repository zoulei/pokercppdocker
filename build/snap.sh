#!/bin/bash
sudo docker build --rm -t "pustudy/hellobuild:1" .
sudo docker run -e HOST_HOSTNAME=`hostname` \
-v /home/zoul15/pccppdocker/build/pokerweb:/home/zoul15/pokerweb \
-v /home/zoul15/pccppdocker/build/testdir:/home/zoul15/testdir \
-v /home/zoul15/pcshareddir:/home/zoul15/pcshareddir \
-v /home/zoul15/example:/home/zoul15/tensorflow-master/tensorflow/cc/example \
--cap-add=SYS_PTRACE \
--security-opt seccomp=unconfined \
-it pustudy/hellobuild:1

