#!/bin/bash
sudo nvidia-docker run -it \
-v /home/zoul15/pcshareddir:/home/zoul15/pcshareddir \
-v /home/zoul15/pccppdocker/build/pokerweb:/home/zoul15/pokerweb \
-e CUDA_VISIBLE_DEVICES=6 pustudy/hellogpu:1 /bin/bash