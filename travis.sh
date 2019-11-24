curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh

cp ./arduino-cli.yaml ~

arduino-cli version

arduino-cli config dump

arduino-cli core update-index
arduino-cli core install adafruit:avr adafruit:samd arduino:megaavr arduino:samd esp8266:esp8266 esp32:esp32

arduino-cli lib update-index
