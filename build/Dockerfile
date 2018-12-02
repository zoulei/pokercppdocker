# This dockerfile executes the build, it starts from the dev environment
FROM zoul15/helloprepare:1

# since hello-cpp-linwin is a submodule on the local machine
# git relocated .git/ to the parent repo, un-submodule it in the image
# RUN rm /usr/local/src/hello/.git
# COPY .git/modules/hello-cpp-linwin /usr/local/src/hello/.git/

RUN mkdir -p /home/zoul15/testdir/
WORKDIR /home/zoul15/testdir/
COPY testdir/ /home/zoul15/testdir/

# remove intermediate files (to ensure a clean build later)
RUN rm -rf /home/zoul15/testdir/build

RUN export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
RUN export LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# These are the build steps
RUN BUILD_DIR=/home/zoul15/testdir/build  \
&& mkdir $BUILD_DIR \ 
&& cd $BUILD_DIR \
&& cmake .. \
&& make
#&& ./Main

WORKDIR /home/zoul15/testdir/build

#CMD ["./Main"]