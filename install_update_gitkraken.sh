
#! /bin/bash

TEMP_DIR=/tmp
GITKRAKEN_URL="https://release.gitkraken.com/linux/gitkraken-amd64.deb"

trap cleanup 1 2 3 6 9 14 15

cleanup() {
  echo "\nCleaning up"
  rm -rf $TEMP_DIR;
  exit 1;
}

install_gitkraken() {
  clear;
  cd $TEMP_DIR;
  echo "Downloading Gitkraken Client..."
  wget -q $GITKRAKEN_URL -O gitkraken.deb && \
  chmod u+x gitkraken.deb;
  echo "Installing Gitkraken..."
  sudo apt install -qq ./gitkraken.deb -y;
  rm -rf $TEMP_DIR/gitkraken.deb;
  echo "Done!"
}

main() {
  mkdir -p $TEMP_DIR
  touch $TEMP_DIR/some_random.txt
  install_gitkraken;
}

main;
