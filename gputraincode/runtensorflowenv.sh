#!/bin/bash
sudo docker build --rm -t "pustudy/hellogpu:1" .
sudo nvidia-docker run -it -e CUDA_VISIBLE_DEVICES=3 pustudy/hellogpu:1 /bin/bash