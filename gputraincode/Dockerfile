#FROM pustudy/hellogpudata:1
FROM docker.peidan.me/haowenxu/ml-runtime:gpu

ENV PYTHONPATH="/home/zoul15/pylib/:${PYTHONPATH}"

RUN mkdir -p /home/zoul15/pylib/hunlgame/
WORKDIR /home/zoul15/pylib
COPY hunlgame/ /home/zoul15/pylib/hunlgame

RUN mkdir -p /home/zoul15/pokerweb/
WORKDIR /home/zoul15/pokerweb/
COPY pokerweb/ /home/zoul15/pokerweb/
