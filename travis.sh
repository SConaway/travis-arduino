mkdir -pq ~/bin

curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | BINDIR=~/bin sh

cp ./arduino-cli.yaml ~

arduino-cli version

arduino-cli config dump

arduino-cli core update-index
arduino-cli core install arduino:avr adafruit:avr adafruit:samd arduino:megaavr arduino:samd esp8266:esp8266 esp32:esp32

arduino-cli lib update-index
