#! /usr/bin/env bash

set -ex

mkdir -p ~/bin

curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=~/bin sh

cat <<EOF >~/arduino-cli.yaml
proxy_type: auto
board_manager:
    additional_urls:
        - https://arduino.esp8266.com/stable/package_esp8266com_index.json
        - https://adafruit.github.io/arduino-board-index/package_adafruit_index.json
        - https://dl.espressif.com/dl/package_esp32_index.json
        - https://raw.githubusercontent.com/stm32duino/BoardManagerFiles/master/STM32/package_stm_index.json
EOF

arduino-cli version

arduino-cli config dump

arduino-cli core update-index || (echo "That failed, trying again..." && arduino-cli core update-index)

CORES_TO_INSTALL = ('arduino:avr' 'adafruit:avr' 'adafruit:samd' 'arduino:megaavr' 'arduino:samd' 'esp8266:esp8266' 'esp32:esp32' 'STM32:stm32')
for core in "${CORES_TO_INSTALL[@]}"
do
  echo "Installing $core, please wait ..."
  arduino-cli core install $core || (echo "That failed, trying again..." && arduino-cli core install $core)
done

arduino-cli lib update-index || (echo "That failed, trying again..." && arduino-cli lib update-index)
