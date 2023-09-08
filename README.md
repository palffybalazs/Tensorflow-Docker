# ST-Cloudify



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


In VSCode install Dev Container


The repository `/data` folder is not synced to github, but it is attached to the container at `/home/appuser/data`
