#! /bin/bash

TEMP_DIR=/tmp
DOCKER_DESKTOP_URL="https://desktop.docker.com/linux/main/amd64/docker-desktop-$1-amd64.deb"

trap cleanup 1 2 3 6 9 14 15

cleanup() {
  echo "\nCleaning up"
  rm -rf $TEMP_DIR;
  exit 1;
}

install_docker_desktop() {
  clear;
  cd $TEMP_DIR;
  echo "Downloading Docker Desktop ..."
  wget -q $DOCKER_DESKTOP_URL -O docker_desktop.deb && \
  chmod u+x docker_desktop.deb;
  echo "Installing Docker Desktop..."
  sudo apt install -qq ./docker_desktop.deb -y;
  rm -rf $TEMP_DIR/docker_desktop.deb;
  echo "Done!"
}

main() {
  mkdir -p $TEMP_DIR
  touch $TEMP_DIR/some_random.txt
  install_docker_desktop;
}

main;
