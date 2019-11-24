#! /usr/bin/env bash

arduino-cli core update-index
arduino-cli lib update-index
arduino-cli lib install "Adafruit SleepyDog Library"

cd /sketches

for D in *; do
    if [ -d "${D}" ]; then
        arduino-cli compile --fqbn "arduino:avr:uno" "${D}"
        arduino-cli compile --fqbn "arduino:avr:mega" "${D}"
    fi
done
