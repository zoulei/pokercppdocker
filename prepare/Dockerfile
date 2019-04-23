FROM pustudy/hellorun:1

COPY MonoPoly/ /home/zoul15/MonoPoly/

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu bionic-cran35/' && \
    apt update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt install -y r-base
RUN echo -e 'install.packages("/home/zoul15/MonoPoly", repos = NULL, type = "source")' >> /home/zoul15/installpcg.R && \
    Rscript /home/zoul15/installpcg.R
