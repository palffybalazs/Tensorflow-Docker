FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

#set shell 
SHELL ["/bin/bash", "-c"]
#set colors
ENV BUILDKIT_COLORS=run=green:warning=yellow:error=red:cancel=cyan
#start with root user
USER root


RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive\
    apt-get install -y\
    netbase\
    git\
    build-essential\   
    wget\
    curl\
    gdb\
    lsb-release

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y zlib1g-dev
USER root

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive\
    apt-get install -y

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive\
    apt-get install -y\
    python3-wstool\
    python3-pip\
    python3-empy\
    python-is-python3



# tensorflow
RUN pip3 install tensorflow==2.12.1

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics



COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh

ENTRYPOINT [ "bash" , "/usr/bin/docker-entrypoint.sh" ]


