#!/bin/bash

#parameters
containerName="tensorflowdocker"
imageName="tensorflow"
imageTag=docker


src_folder=$(pwd)/src/
data_folder=$(pwd)/data/



# Check data directory
if [ -d "$data_folder" ];
then
    echo "$data_folder directory exists."
else
	echo "$data_folder directory does not exist."
    mkdir -p $data_folder
fi




#for gpu access
#xhost local:root has security risks.
xhost local:root
XAUTH=/tmp/.docker.xauth
YEL='\033[0;33m'
NC='\033[0m' # No Color

#Set permissions for newly created files. All new files will have the following permissions.
#Important is that the group permissions of the files created are set to read and write.
#We add src as a volume, so we will be able to edit and delete the files created in the container.
#Output of this command is silenced
setfacl -PRdm u::rwx,g::rwx,o::r ./ &> /dev/null


# container remove
if docker ps | grep -q "$containerName"; then
    echo -e "${YEL}stopping ${containerName}${NC}"
    docker stop "$containerName"
fi
if docker ps -a | grep -q "$containerName"; then
    echo -e "${YEL}removing ${containerName}${NC}"
    docker rm "$containerName"
fi


echo "Creating new $containerName container."
docker run -d \
    --env DISPLAY=${DISPLAY} \
    --env="QT_X11_NO_MITSHM=1" \
    --env="XAUTHORITY=$XAUTH" \
    --device=/dev/dri:/dev/dri \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume $data_folder:/home/appuser/data/ \
    --volume $src_folder:/home/appuser/src/ \
    --volume="$XAUTH:$XAUTH" \
    --network host \
    --gpus all \
    --runtime=nvidia \
    --name="$containerName" \
    "$imageName":"$imageTag"


echo "Hello $USER"


