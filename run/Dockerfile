# This dockerfile defines the expected runtime environment before the project is installed
FROM ubuntu:18.04

# Be sure to install any runtime dependencies
RUN apt clean && apt update && apt install -y \
software-properties-common gnuplot \
python3-pip \
wget unzip \
build-essential \
cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev \
libbson-1.0 \
libboost-all-dev \
libjsoncpp-dev \
ffmpeg \
htop \
gdb \
vim \
libcurl4-openssl-dev pkg-config libssl-dev python-dev python-numpy libtbb2 libtbb-dev \
gcc-7 g++-7 \
pkg-config zip g++ zlib1g-dev unzip python \
build-essential curl git cmake unzip autoconf autogen automake libtool mlocate \
zlib1g-dev g++-7 python python3-numpy python3-dev python3-pip python3-wheel wget

RUN python3 -m pip install --upgrade pip

RUN updatedb

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100 && \
    update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-7 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 100

RUN mkdir /root/.pip && printf "[global]\nindex-url = https://mirrors.aliyun.com/pypi/simple" > /root/.pip/pip.conf

RUN pip3 install \
pymongo numpy==1.15.0 scipy sympy pandas tables scikit-learn matplotlib tqdm \
seaborn pillow imageio PyYAML sqlalchemy pymongo jinja2 scikit-image scipy progressbar2 mock pep8 coverage \
mako Flask GitPython tinydb tinydb-serialization hashfs fs keras

RUN pip3 install tensorflow

# Install mongocxx
RUN mkdir -p /home/zoul15/mongoxx && cd /home/zoul15/mongoxx && \
    wget https://github.com/mongodb/mongo-c-driver/releases/download/1.13.0/mongo-c-driver-1.13.0.tar.gz && \
    tar -xzf mongo-c-driver-1.13.0.tar.gz && \
    cd mongo-c-driver-1.13.0 && \
    mkdir cmake-build && \
    cd cmake-build && \
    cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. && \
    make && \
    make install

RUN apt install openssl libssl-dev

RUN cd /home/zoul15/mongoxx && \
    wget https://github.com/mongodb/mongo-cxx-driver/archive/r3.4.0.tar.gz && \
    tar -xzf r3.4.0.tar.gz && \
    cd mongo-cxx-driver-r3.4.0/build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DBSONCXX_POLY_USE_MNMLSTC=1 -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    make && \
    make install

#COPY MonoPoly/ /home/zoul15/MonoPoly/

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' && \
    apt update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt install -y r-base
RUN echo "install.packages('MonoPoly')\ninstall.packages('/home/zoul15/MonoPoly', repos = NULL, type = 'source')" >> /home/zoul15/installpcg.R && \
    Rscript /home/zoul15/installpcg.R

RUN cd /home/zoul15 && wget https://github.com/bazelbuild/bazel/releases/download/3.7.2/bazel-3.7.2-installer-linux-x86_64.sh && \
    chmod +x bazel-3.7.2-installer-linux-x86_64.sh && \
    ./bazel-3.7.2-installer-linux-x86_64.sh

RUN apt install -y htop unzip gnupg python-setuptools python-pip \
cmake libpcre3-dev zlib1g-dev libgcrypt11-dev libicu-dev python libcppunit-dev build-essential

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4 && \
echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt update
RUN apt install -y mongodb-org

RUN cd /home/zoul15 && wget https://astuteinternet.dl.sourceforge.net/project/cppcms/cppcms/1.2.1/cppcms-1.2.1.tar.bz2 \
&& tar -xvjf cppcms-1.2.1.tar.bz2 && cd /home/zoul15/cppcms-1.2.1 && mkdir -p /home/zoul15/cppcms-1.2.1/build \
&& cd /home/zoul15/cppcms-1.2.1/build && cmake .. && make && make install

RUN cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

RUN mkdir -p /home/zoul15/pylib && cd /home/zoul15/pylib && git clone https://github.com/zoulei/hunlgame.git
ENV PYTHONPATH=$PATHONPATH:/home/zoul15/pylib

RUN pip install pymongo flask

RUN mkdir -p /home/zoul15/testdir/
RUN mkdir -p /home/zoul15/testdirdata/TESTPARALLELLEARNDIR

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
ENV LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

COPY apr-1.7.0/ /home/zoul15/apr-1.7.0/

RUN cd /home/zoul15 && wget https://mirrors.bfsu.edu.cn/apache/activemq/activemq-cpp/3.9.5/activemq-cpp-library-3.9.5-src.tar.gz \
&& tar -zxvf activemq-cpp-library-3.9.5-src.tar.gz && cd activemq-cpp-library-3.9.5 && ./configure --with-apr=/home/zoul15/apr-1.7.0/ \
&& make install

RUN cd /home/zoul15 && git clone https://github.com/FloopCZ/tensorflow_cc.git && \
    cd tensorflow_cc && \
    cd tensorflow_cc && \
    mkdir build && cd build && \
    cmake -DTENSORFLOW_STATIC=OFF -DTENSORFLOW_SHARED=ON .. && \
    make && make install && \
    rm -rf ~/.cache && \
    cd .. && rm -rf build

WORKDIR /home/zoul15/testdir/build