#!/bin/bash
sudo docker build --rm -t "zoul15/hellopy:1" .
sudo docker run -it zoul15/hellopy:1 /bin/bash