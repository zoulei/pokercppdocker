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
gcc-7 g++-7

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 100 && \
    update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-7 100 && \
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 100

# RUN apt-get install -y python-opencv
# RUN apt-get install -y opencv-data
# RUN apt-get install -y libopencv-dev

#apt install -y wget unzip build-essential cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libbson-1.0 libboost-all-dev libjsoncpp-dev ffmpeg htop gdb vim libcurl4-openssl-dev pkg-config libssl-dev python-dev python-numpy libtbb2 libtbb-dev


# libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev \
# apt-get clean && apt-get update &&

RUN pip3 install \
pymongo numpy scipy sympy pandas tables scikit-learn matplotlib tqdm \
seaborn pillow imageio PyYAML sqlalchemy pymongo jinja2 scikit-image scipy progressbar2 mock pep8 coverage \
mako Flask GitPython tinydb tinydb-serialization hashfs fs \
tensorflow==1.5 keras

# Install mongocxx
RUN mkdir -p ~/mongoxx && cd ~/mongoxx && \
    wget https://github.com/mongodb/mongo-c-driver/releases/download/1.13.0/mongo-c-driver-1.13.0.tar.gz && \
    tar -xzf mongo-c-driver-1.13.0.tar.gz && \
    cd mongo-c-driver-1.13.0 && \
    mkdir cmake-build && \
    cd cmake-build && \
    cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF .. && \
    make && \
    make install

RUN apt install openssl libssl-dev

RUN cd ~/mongoxx && \
    wget https://github.com/mongodb/mongo-cxx-driver/archive/r3.4.0.tar.gz && \
    tar -xzf r3.4.0.tar.gz && \
    cd mongo-cxx-driver-r3.4.0/build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DBSONCXX_POLY_USE_MNMLSTC=1 -DCMAKE_INSTALL_PREFIX=/usr/local .. && \
    make && \
    make install

# Install Open CV - Warning, this takes absolutely forever
RUN mkdir -p ~/opencv cd ~/opencv && \
    wget https://github.com/Itseez/opencv/archive/3.4.0.zip && \
    unzip 3.4.0.zip && \
    cd opencv-3.4.0 && \
    mkdir build && \
    cd build && \
    cmake -D CMAKE_BUILD_TYPE=Release -D ENABLE_CXX=1 -D CMAKE_INSTALL_PREFIX=/usr/local .. && \
    make -j4 && \
    make install && \
    ldconfig

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' && \
    apt update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt install -y r-base
RUN echo -e 'install.packages("/home/zoul15/MonoPoly", repos = NULL, type = "source")' >> /home/zoul15/installpcg.R && \
    Rscript /home/zoul15/installpcg.R