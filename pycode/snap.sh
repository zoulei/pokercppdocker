#!/bin/bash
sudo docker build --rm -t "pustudy/hellopy:1" .
sudo docker run -it pustudy/hellopy:1 /bin/bash