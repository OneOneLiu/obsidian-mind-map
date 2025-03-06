#!/bin/bash
# entrypoint.sh

# 更新apt-get
# apt-get update

# 执行容器的主命令
exec "$@"