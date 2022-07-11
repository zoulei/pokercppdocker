FROM pustudy/hellobuild:1

#RUN apt clean
#RUN apt update
#RUN apt install -y htop unzip gnupg
#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4 && \
#echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
##RUN apt update && apt install -y mongodb-org
#
#RUN apt install cmake libpcre3-dev zlib1g-dev libgcrypt11-dev libicu-dev python -y
#RUN cd /home/zoul15 && wget https://astuteinternet.dl.sourceforge.net/project/cppcms/cppcms/1.2.1/cppcms-1.2.1.tar.bz2 \
#&& tar -xvjf cppcms-1.2.1.tar.bz2 && cd /home/zoul15/cppcms-1.2.1 && mkdir -p /home/zoul15/cppcms-1.2.1/build \
#&& cd /home/zoul15/cppcms-1.2.1/build && cmake .. && make && make install
#
#
#RUN cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
#
#RUN mkdir -p /home/zoul15/pylib && cd /home/zoul15/pylib && git clone https://github.com/zoulei/hunlgame.git
#ENV PYTHONPATH=$PATHONPATH:/home/zoul15/pylib
#
#RUN apt install -y python-setuptools python-pip
#RUN pip install pymongo flask
#
##RUN mkdir -p /home/zoul15/testdir/
##RUN mkdir -p /home/zoul15/testdirdata/TESTPARALLELLEARNDIR
##WORKDIR /home/zoul15/testdir/
##COPY testdir/ /home/zoul15/testdir/
##
##RUN rm -rf /home/zoul15/testdir/build
#
#ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
#ENV LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

COPY apr-1.7.0/ /home/zoul15/apr-1.7.0/

RUN apt clean && apt update && apt install -y libcppunit-dev build-essential
#RUN cd /home/zoul15 && wget https://mirrors.bfsu.edu.cn/apache/activemq/activemq-cpp/3.9.5/activemq-cpp-library-3.9.5-src.tar.gz \
#&& tar -zxvf activemq-cpp-library-3.9.5-src.tar.gz && cd activemq-cpp-library-3.9.5 && ./configure --with-apr=/home/zoul15/apr-1.7.0/bin/apr-1-config \
#&& make install
RUN cd /home/zoul15 && wget https://mirrors.bfsu.edu.cn/apache/activemq/activemq-cpp/3.9.5/activemq-cpp-library-3.9.5-src.tar.gz \
&& tar -zxvf activemq-cpp-library-3.9.5-src.tar.gz && cd activemq-cpp-library-3.9.5 && ./configure --with-apr=/home/zoul15/apr-1.7.0/ \
&& make install

RUN python3 -m pip install --upgrade pip && pip3 uninstall tensorflow -y && pip3 install tensorflow

RUN cd /home/zoul15 && wget https://github.com/bazelbuild/bazel/releases/download/3.7.2/bazel-3.7.2-installer-linux-x86_64.sh && \
    chmod +x bazel-3.7.2-installer-linux-x86_64.sh && \
    ./bazel-3.7.2-installer-linux-x86_64.sh

RUN cd /home/zoul15 && git clone https://github.com/FloopCZ/tensorflow_cc.git && \
    cd tensorflow_cc && \
    cd tensorflow_cc && \
    mkdir build && cd build && \
    cmake -DTENSORFLOW_STATIC=OFF -DTENSORFLOW_SHARED=ON .. && \
    make && make install && \
    rm -rf ~/.cache && \
    cd .. && rm -rf build

WORKDIR /home/zoul15/testdir/build

#CMD ["./Main"]