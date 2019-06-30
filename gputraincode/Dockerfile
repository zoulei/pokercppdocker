#FROM pustudy/hellogpudata:1
FROM docker.peidan.me/haowenxu/ml-runtime:gpu
#FROM ubuntu:18.04

#RUN apt clean && apt update && apt install -y \
#software-properties-common gnuplot \
#python3-pip \
#wget unzip \
#build-essential \
#cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
#libbson-1.0 \
#libboost-all-dev \
#libjsoncpp-dev \
#ffmpeg \
#htop \
#gdb \
#vim \
#libcurl4-openssl-dev pkg-config libssl-dev python-dev python-numpy libtbb2 libtbb-dev \
#gcc-7 g++-7 \
#pkg-config zip g++ zlib1g-dev unzip python \
#build-essential curl git cmake unzip autoconf autogen automake libtool mlocate \
#zlib1g-dev g++-7 python python3-numpy python3-dev python3-pip python3-wheel wget
#
#RUN updatedb
#
#RUN pip3 install \
#pymongo numpy scipy sympy pandas tables scikit-learn matplotlib tqdm \
#seaborn pillow imageio PyYAML sqlalchemy pymongo jinja2 scikit-image scipy progressbar2 mock pep8 coverage \
#mako Flask GitPython tinydb tinydb-serialization hashfs fs \
#tensorflow-gpu keras


ENV PYTHONPATH="/home/zoul15/pylib/:${PYTHONPATH}"

RUN mkdir -p /home/zoul15/pylib/hunlgame/
WORKDIR /home/zoul15/pylib
COPY hunlgame/ /home/zoul15/pylib/hunlgame

RUN mkdir -p /home/zoul15/pokerweb/
WORKDIR /home/zoul15/pokerweb/
#COPY pokerweb/ /home/zoul15/pokerweb/
