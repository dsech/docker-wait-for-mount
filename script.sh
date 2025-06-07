#!/usr/bin/env sh
set -e

MOUNT_PATH=${MOUNT_PATH:-/mount}
WAIT_FOR_DIRS=${WAIT_FOR_DIRS:-""}
CREATE_DIRS=${CREATE_DIRS:-""}

# Wait for dirs
for dir in $(echo "$WAIT_FOR_DIRS" | sed "s/,/ /g")
do
  echo "Checking for dir $dir"
  while [ ! -d "$MOUNT_PATH/$dir" ]; do
    echo "Waiting for directory $dir"
    sleep 2
  done
  echo "Directory $dir exists!"
done

# Create dirs
for dir in $(echo "$CREATE_DIRS" | sed "s/,/ /g")
do
  mkdir -p "$MOUNT_PATH/$dir"
  echo "Created dir $dir"
done
