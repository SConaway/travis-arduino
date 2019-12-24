#! /usr/bin/env bash

set -ex

mkdir -p ~/bin

curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=~/bin sh

cat <<EOF >~/arduino-cli.yaml
proxy_type: auto
board_manager:
    additional_urls:
        - http://arduino.esp8266.com/stable/package_esp8266com_index.json
        - https://adafruit.github.io/arduino-board-index/package_adafruit_index.json
        - https://dl.espressif.com/dl/package_esp32_index.json
EOF

if [[ "$(uname -s)" == "Darwin" ]]; then
    mkdir -p /Users/travis/Library/Arduino15/packages
    mkdir -p /Users/travis/Library/Arduino15/staging
    mkdir -p /Users/travis/Library/Arduino15/tmp
else
    mkdir -p "$HOME/.arduino15/packages"
    mkdir -p "$HOME/.arduino15/staging"
    mkdir -p "$HOME/.arduino15/tmp"
fi

arduino-cli version

arduino-cli config dump

arduino-cli core update-index
arduino-cli core install arduino:avr adafruit:avr adafruit:samd arduino:megaavr arduino:samd esp8266:esp8266 esp32:esp32

arduino-cli lib update-index
