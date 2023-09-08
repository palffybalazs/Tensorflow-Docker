# Tensorflow Docker
This repository provides a dockerized tensorflow environment with cuda support for neural network training.



## Install

### Install docker
https://docs.docker.com/engine/install/ubuntu/

#### Run post-installation steps
https://docs.docker.com/engine/install/linux-postinstall/

You should be able to run `docker run hello-world` without using sudo. If sudo is still required, run `sudo newgrp docker` and restart your computer.

### Install Nvidia drivers
Install Nvidia Driver Version: 525.125.06 or higher.
### Install Nvidia container toolkit
https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker

## Compile container

`./compile.sh`

## Run _livox_ros_ container

Run the container: `./run.sh`
In case of an error like this:
`docker: Error response from daemon: Unknown runtime specified nvidia.`

Run the following commands


`sudo apt install -y nvidia-docker2
sudo systemctl daemon-reload
sudo systemctl restart docker`

In VSCode install Dev Container and Docker


The repository `/data` folder is not synced to github, but it is attached to the container at `/home/appuser/data`, the same goes with src.

## Test the docker
Navigate to src folder and run the provided python script.
`python test-gpu.py`
The result should look similar to this:
`I tensorflow/core/common_runtime/gpu/gpu_device.cc:1635] Created device /device:GPU:0 with 6439 MB memory:  -> device: 0, name: NVIDIA GeForce GTX 1080, pci bus id: 0000:02:00.0, compute capability: 6.1
True`

