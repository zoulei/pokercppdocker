FROM pustudy/hellorun:1

RUN apt clean
RUN apt update
RUN apt install -y htop unzip gnupg
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 68818C72E52529D4 && \
echo "deb http://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt update
RUN apt install -y mongodb-org

RUN apt install cmake libpcre3-dev zlib1g-dev libgcrypt11-dev libicu-dev python -y
RUN cd /home/zoul15 && wget https://astuteinternet.dl.sourceforge.net/project/cppcms/cppcms/1.2.1/cppcms-1.2.1.tar.bz2 \
&& tar -xvjf cppcms-1.2.1.tar.bz2 && cd /home/zoul15/cppcms-1.2.1 && mkdir -p /home/zoul15/cppcms-1.2.1/build \
&& cd /home/zoul15/cppcms-1.2.1/build && cmake .. && make && make install


RUN cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime

RUN mkdir -p /home/zoul15/pylib && cd /home/zoul15/pylib && git clone https://github.com/zoulei/hunlgame.git
ENV PYTHONPATH=$PATHONPATH:/home/zoul15/pylib

RUN apt install -y python-setuptools python-pip
RUN pip install pymongo flask

RUN mkdir -p /home/zoul15/testdir/
RUN mkdir -p /home/zoul15/testdirdata/TESTPARALLELLEARNDIR
WORKDIR /home/zoul15/testdir/
COPY testdir/ /home/zoul15/testdir/

RUN rm -rf /home/zoul15/testdir/build

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
ENV LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# These are the build steps
#RUN BUILD_DIR=/home/zoul15/testdir/build  \
#&& mkdir $BUILD_DIR \
#&& cd $BUILD_DIR \
#&& cmake ..
#\
#&& make

WORKDIR /home/zoul15/testdir/build

#CMD ["./Main"]