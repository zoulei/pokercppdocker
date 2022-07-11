FROM pustudy/hellobuild:2

RUN cd /home/zoul15 && git clone https://github.com/gflags/gflags.git && cd gflags && mkdir build && cd build && cmake .. && make -j25 && make install

WORKDIR /home/zoul15/testdir/build

#CMD ["./Main"]