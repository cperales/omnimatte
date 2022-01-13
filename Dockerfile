FROM nvidia/cuda:11.1-base-ubuntu20.04

# Environments
ARG DEBIAN_FRONTEND=noninteractive
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility
CMD nvidia-smi

# Install linux CUDA 11.0
RUN apt-get update -y && apt-get install -y cuda-nvcc-11-1

# Install Python 3.8
RUN apt-get -y update && apt-get -y install \
    python3.8 \
    python3-pip \
    ipython3 \
    python3-opencv

# Install torch
RUN pip install -U pip && pip install --no-cache-dir \
    torch==1.8.0+cu111 torchvision==0.9.0+cu111 -f https://download.pytorch.org/whl/torch_stable.html

# Install other libraries
RUN pip install --no-cache-dir \
    dominate==2.4.0 \
    visdom==0.1.8 \
    matplotlib \
    opencv-python \
    Pillow>=6.1.0 \
    numpy==1.19.2

VOLUME /repo
WORKDIR /repo
