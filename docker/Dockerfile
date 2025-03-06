ARG DEBIAN_FRONTEND=noninteractive
ARG ISAACSIM_VERSION=4.1.0

# https://catalog.ngc.nvidia.com/orgs/nvidia/containers/isaac-sim
FROM nvcr.io/nvidia/isaac-sim:${ISAACSIM_VERSION} as isaac-sim

ENV MIN_DRIVER_VERSION 525.60.11
ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /deep_seek_local/models
WORKDIR /obsidian-mind-map

# Add symlink
RUN ln -s exts/omni.isaac.examples/omni/isaac/examples extension_examples

# Distributor ID:	Ubuntu
# Description:	Ubuntu 22.04.3 LTS
# Release:	22.04
# Codename:	jammy

# System layer installation
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget && \
    apt-get install -y iputils-ping && \
    apt-get -y install build-essential && \
    apt install -y cmake && \
    apt install -y tree && \
    apt install -y gdb && \
    apt-get install -y git && \
    apt-get install -y python3-pip && \
    apt-get install -y xauth x11-apps # This is for GUI testing

# Install npm and nodejs
RUN apt install -y nodejs && \
    apt install -y npm

# Sync the cloned repositories every time the container is started
RUN echo "Set up the entrypoint"
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bash"]

RUN echo "ALL Done"

# Default entrypoint to launch headless with streaming
# ENTRYPOINT /isaac-sim/runheadless.native.sh 