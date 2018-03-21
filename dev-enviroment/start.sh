#!/bin/bash

echo "Setting VNC password"
mkdir -p "$HOME"/.vnc
echo "$ENV_VNC_PASSWD" | vncpasswd -f >> "$HOME/.vnc/passwd"
chmod 600 "$HOME/.vnc/passwd"

echo "Prepare VNC startup"
vncserver -kill "$ENV_VNC_DISPLAY"
rm /tmp/.X1-lock /tmp/.X11-unix/X1

echo "Run VNC server"
vncserver "$ENV_VNC_DISPLAY" -geometry "$ENV_VNC_RESOLUTION" -depth "$ENV_VNC_DEPTH"
echo "Start noVNC"
"$ENV_WDIR"/novnc/utils/launch.sh --vnc localhost:"$ENV_LOCAL_VNC_PORT" --listen "$ENV_NOVNC_PORT"&

echo "VNC startup done!"
echo "    VNC is running on: $ENV_LOCAL_VNC_PORT"
echo "    noVNC is running on: $ENV_NOVNC_PORT"

echo "Starting SSH"
mkdir -p /var/run/sshd
echo "root:$ENV_SSH_PASSWD" | chpasswd
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
#/usr/sbin/sshd

echo "Dropping to shell"
/bin/bash
