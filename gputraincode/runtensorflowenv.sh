#!/bin/bash
sudo docker build --rm -t "zoul15/hellogpu:1" .
sudo nvidia-docker run -it -e CUDA_VISIBLE_DEVICES=3 zoul15/hellogpu:1 /bin/bash