#!/bin/bash

# Requires: autossh

REMOTE_HOST=ash-temp-new-33754.portmap.host
REMOTE_KEY=~/.ssh/ash-temp-new.server.pem
REMOTE_HOST_SSH_PORT=22
REMOTE_HOST_SSH_USER=ash-temp-new.server


# Define reverse port forwards
# Format: 'REMOTE_PORT:LOCAL_HOST:LOCAL_PORT' (where LOCAL_HOST can be actual localhost or any host acessible by localhost)
PORTS=(
     33754:localhost:22      # 33754:localhost:22
     #"8880:localhost:80"    # 8880 -> 80
     #"8443:localhost:443"   # 8443 -> 443
    )


for PORT in ${PORTS[@]}
do
  PORT_STR="$PORT_STR -R 0.0.0.0:$PORT"
done


# Ignore early failed connections at boot
export AUTOSSH_GATETIME=0

autossh -4 -M 0 -o "ServerAliveInterval 10" -o "ServerAliveCountMax 3" -N $PORT_STR -i $REMOTE_KEY -p $REMOTE_HOST_SSH_PORT $REMOTE_HOST_SSH_USER@$REMOTE_HOST

