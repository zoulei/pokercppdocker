# This dockerfile executes the build, it starts from the dev environment
FROM python:2.7-slim

# RUN rm /usr/local/src/hello/.git
# COPY .git/modules/hello-cpp-linwin /usr/local/src/hello/.git/
RUN apt clean && apt update && apt install -y git vim htop

WORKDIR /home/zoul15/pylib
RUN git clone https://github.com/zoulei/hunlgame.git
ENV PYTHONPATH="/home/zoul15/pylib/:${PYTHONPATH}"
RUN pip install pymongo

WORKDIR /home/zoul15
RUN git clone https://github.com/zoulei/newpokerweb.git
WORKDIR /home/zoul15/newpokerweb