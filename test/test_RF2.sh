#!/usr/bin/env bash

echo "Boros RF2 Test"
echo "Please check that is pluged with 2 radios in the socket."
echo "To execute this test nrf24libs, nodejs and nrf24 npm must be installed"
echo "Please excute this exprit after electrical test are done:"
echo " - Inspect Capacitor soldering"
echo " - Check stable 3.3v on pig pin of the regulator."
echo " - Test charge of the super cap. Increasing voltage must present after boot."
echo "\n\n------"
echo "Testing RTC"
echo "==========="
echo "Detecting I2C Slave..."
i2cdetect -y 1 0x68
echo "Init Kernel module...."
echo ds3231 0x68 > /sys/class/i2c-adapter/i2c-1/new_device
echo "Read current time of RTC:$(hwclock -r)"
echo "Setting the clock to local time"
hwclock -w
echo "Pi:$(date) RTC:$(hwclock -r)"
echo "Reading temperature..."
printf "CPU:"
cat /sys/class/thermal/thermal_zone0/temp | awk '{print $1/1000 " C"}'
printf "Clock:"
cat /sys/class/hwmon/hwmon0/temp1_input  | awk '{print $1/1000 " C"}'
echo "\n\n"

echo "Testing RF24 Radios"
echo "==================="
