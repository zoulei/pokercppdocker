FROM docker.peidan.me/haowenxu/ml-runtime:gpu
#FROM tensorflow/tensorflow:latest-gpu-py3

RUN apt clean && apt update && apt install -y git vim htop && pip install opencv-python setuptools wheel && pip install \
pyemd pymongo numpy scipy sympy pandas tables scikit-learn matplotlib tqdm \
seaborn pillow imageio PyYAML sqlalchemy pymongo jinja2 scikit-image scipy progressbar2 mock pep8 coverage \
mako Flask GitPython tinydb tinydb-serialization hashfs fs \
tensorflow-gpu tensorflow keras

FROM ubuntu:16.04
RUN apt clean && apt update && apt install -y apt-transport-https wget python3 python3-setuptools python3-pip software-properties-common
RUN add-apt-repository -y ppa:graphics-drivers/ppa
pip3 install tensorflow-gpu
RUN wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1604-10-1-local-10.1.105-418.39_1.0-1_amd64.deb && \
    dpkg -i cuda-repo-ubuntu1604-10-1-local-10.1.105-418.39_1.0-1_amd64.deb && \
    apt-key add /var/cuda-repo-10-1-local-10.1.105-418.39/7fa2af80.pub && \
    apt update && apt install -y cuda