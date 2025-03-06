xhost local:root
XAUTH=/tmp/.docker.xauth
docker run --rm -it \
    --name=deep_seek_container \
    --env="DISPLAY=$DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="XAUTHORITY=$XAUTH" \
    --volume="/dev/bus/usb:/dev/bus/usb" \
    --volume="/tmp/.docker.xauth:/tmp/.docker.xauth:rw" \
    --net=host \
    --privileged \
    --volume="/home/$USER/.ssh_docker:/root/.ssh/" \
    -e "ACCEPT_EULA=Y" \
    --runtime=nvidia \
    --gpus all \
    -e "PRIVACY_CONSENT=Y" \
    -v ~/projects/obsidian-mind-map/:/obsidian-mind-map \
    obsidian

echo "Done."