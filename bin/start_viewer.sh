#!/bin/bash

# SUGUSR1 from the viewer is also sent to the container
# Prevent it so that the container does not fail
trap '' 16

dbus-run-session python viewer.py &

# Waiting for the viewer
while true; do
  PID=$(pidof python)
  if [ "$?" == '0' ]; then
    break
  fi
  sleep 0.5
done

# Exit when the viewer falls
while kill -0 "$PID"; do
  sleep 1
done
