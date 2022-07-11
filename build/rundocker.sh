#!/bin/bash
sudo docker run -e HOST_HOSTNAME=`hostname` --network host \
-e LD_LIBRARY_PATH="/usr/local/lib" \
-v /mnt/mfs/users/zoul15/pccppdocker/build/pokerweb:/home/zoul15/pokerweb \
-v /mnt/mfs/users/zoul15/pccppdocker/build/testdir:/home/zoul15/testdir \
-v /mnt/mfs/users/zoul15/pcshareddir:/home/zoul15/pcshareddir \
-v /mnt/mfs/users/zoul15/example:/home/zoul15/tensorflow-master/tensorflow/cc/example \
--cap-add=SYS_PTRACE \
--security-opt seccomp=unconfined \
-it pustudy/hellobuild:3