#! /usr/bin/env bash

set -ex

mkdir -p ~/bin

curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=~/bin sh

cat <<EOF >~/arduino-cli.json
proxy_type: auto
board_manager:
    additional_urls:
        - http://arduino.esp8266.com/stable/package_esp8266com_index.json
        - https://adafruit.github.io/arduino-board-index/package_adafruit_index.json
        - https://dl.espressif.com/dl/package_esp32_index.json
EOF

arduino-cli version

arduino-cli config dump

arduino-cli core update-index
arduino-cli core install arduino:avr adafruit:avr adafruit:samd arduino:megaavr arduino:samd esp8266:esp8266 esp32:esp32

arduino-cli lib update-index
