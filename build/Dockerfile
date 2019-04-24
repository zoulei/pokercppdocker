FROM pustudy/hellorun:1

RUN mkdir -p /home/zoul15/testdir/
RUN mkdir -p /home/zoul15/testdirdata/TESTPARALLELLEARNDIR
WORKDIR /home/zoul15/testdir/
COPY testdir/ /home/zoul15/testdir/

RUN rm -rf /home/zoul15/testdir/build

RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
RUN export LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# These are the build steps
RUN BUILD_DIR=/home/zoul15/testdir/build  \
&& mkdir $BUILD_DIR \ 
&& cd $BUILD_DIR \
&& cmake ..
#\
#&& make

WORKDIR /home/zoul15/testdir/build

#CMD ["./Main"]