# This dockerfile executes the build, it starts from the dev environment
FROM zoul15/hellorun:1
#FROM ubuntu:16.04

# include the code
RUN mkdir -p /home/zoul15/testdir/
WORKDIR /home/zoul15/testdir/
COPY testdir/ /home/zoul15/testdir/

RUN mkdir -p /home/zoul15/testdirdata/
WORKDIR /home/zoul15/testdirdata/
COPY testdirdata/ /home/zoul15/testdirdata/

