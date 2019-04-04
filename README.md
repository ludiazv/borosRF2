# Boros RF2 - NRF24L01 / NRF24L01+ plug and Go to your PI

__NRF24L01 / NRF24L01+__ radios are a low-cost way to go wireless for limited resource Hardware
such micro-controllers or small computer. This radios are popular among in the sensor arena and typical
arduino(AVR), STM  or other mcu projects to interact with other sensors or devices. __Boros RF2__ enable to integrate
this kind of devices and DYI projects with regular computers running linux or Windows 10 and high-level
development technologies like ruby ,python or nodejs. OIT/SmartHome frameworks such Node-RED, MySensors, OpenHab, AdafruitIO, AzureIoT... also support NRF24L01 radios integrate sensors and actuators.

![image](https://github.com/ludiazv/borosRF2/blob/master/media/all.jpg?raw=true)

__Boros RF2__ offer a dual header for up to two __NRF24L01 / NRF24L01+__  radios connected to your Raspberry Pi (or similar SBCs).

The typical applications of this radios:

- Hubs/Gateways for sensors networks.
- Radio Mesh networks.
- Over the air Software updates.
- Wireless audio transmission.
- Radio to TCP/IP radio links.
- Radio repeaters/range expanders.
- Remote controls of motors and relays.
- Radio controllers toys, robots, drones, etc...
- Protocol analyzers.
- 2.4GHz Band scanners, sniffers, ...

... and much more.

__Boros RF2__ help hobbists and makers to use integrate radio communication in their projects/products without dealing with the complexities of hardware interfaces with __nRF24L01__ radios. Makers can __focus__ on their project and speed up the development.

You can buy assembled boards on __Tindie__: [Boros Store](https://www.tindie.com/stores/boros/)


## Hardware
__Boros RF2__ hardware enable seamless integration of Pi-like SBCs/SOCs using built-in
SPI support of SBC boards. With the following features:

1. Small form factor compatible with Raspberry PI Zero / Pi Zero W Hat (pHat) specification but compatible with
regular Raspberry Pi (3,2,B,B+,A+) or other SBC with same pinout (40-pin/2x20pin) like Orange Pi, Banana Pi,
NanoPi, Ordoid, Thinker Board, Pine , ...
2. Dual __NRF24L01__ / __NRF24L01+__ headers.
3. Stackable design with standard mounting holes.
3. Dedicated power regulator to avoid power shortages or unstable power lines.
4. Beefy decoupling capacitors to radio sensibility and reduce transmission errors. This is specially
relevant in long range applications with amplified (PA+LNA) versions of the radios.
5. Robust & tested routing signal to minimize signal losses.
6. Support for optional IRQ lines.

__Boros RF2__ include a optional accurate RTC based on Maxim DS3231 chipset that will enable:
1. High accurate timekeeping with a back-up super capacitor.
2. Calendar and alarm management with hardware interrupts.
3. Programable square wave output.
4. SQW/IRQ, RTS and 32Khz RTC break out pins for custom applications.
2. I2C/TWI interface with the RTC up to 400kHz(fast I2C) frequency. No additional GPIO are wasted.
3. Seamless integration with linux via kernel available kernel modules.
4. Integrated temperature sensor.

> __caveat__: The power supply provided by the super capacitor is designed as back-up for time-keeping only. The energy
stored in the super-capacitor will to keep the internal oscillator of the clock running for *several* hours. On the other hand,
charging the capacitor only a couple of minutes of main power supply is needed.


### GPIO used by Boros RF2
__Boros RF2__ use a minimal set of GPIO of your board.

Check some examples of pinouts:

*Raspberry Pi 2,3 B,B+,A+ 40pin-20x2:*
![RPI 40-pin pinout](https://github.com/ludiazv/borosRF2/blob/master/media/rpi-pinout.png?raw=true)

*Orange Pi 40pin-20x2:*
![Orange Pi 40-pin pinout](https://github.com/ludiazv/borosRF2/blob/master/media/opi-pinout.png?raw=true)

*Orange Pi Zero 26pin-13x2:*
![Orange Pi Zero 20-pin pinout](https://github.com/ludiazv/borosRF2/blob/master/media/opi-zero-pinout.jpg?raw=true)


| Physical Pin | RPI GPIO #      | Orange Pi GPIO | Notes
|--------------| ----------------| ---------------| ------
| 19           | IO10/SPI0 MOSI  | PC0/SPI0 MOSI  | SPI data
| 21           | IO09/SPI0 MISO  | PC1/SPI0 MISO  | SPI data
| 23           | IO11/SPI0 SCLK  | PC2/SPI0 SCK   | SPI clock
| 24           | IO08/SPI0 CSN0  | PC3/SPI0 CSN0  | SPI Chip  Select 0*
| 26           | IO07/SPI0 CSN1  | PA21 (#21)     | SPI Chip  Select 1*
| 22           | IO25            | PA2 (#2)       | Radio 1 CE *
| 15           | IO22            | PA3 (#3)       | Radio 1 IRQ *
| 18           | IO24            | PC7 (#71)      | Radio 0 CE *
| 13           | IO27            | PA0 (#0)       | Radio 0 IRQ *
| __For I2C__
| 1            | 3.3V            |  3.3V          | Power supply for RTC
| 3            | GPIO2/I2C-1 SDA | PA12/I2C-0 SDA | I2C
| 5            | GPIO3/I2C-1 SCL | PA11/I2C-0 SCL | I2C

 __(\*)__ Pins marked can be used for other purposes if radio is not connected.

Note: Orange PI GPIO code to GPIO number is calculated with this formula : ```(position of letter in alphabet - 1) * 32 + pin number```

__Notes on SPIDEV__: SpiDev is a portable access to SPI devices in linux. Boros RF2 is compatible with native BCM modules and libraries and other libraries to access GPIO SPI like WiringPi or MRAA. It is recommended to use SPIdev unless you have specific requirements.

### Schematic

__Boros RF2__ schematic can be found here: [Boros RF2 v1](borosRF2.pdf)


## Usage

__Plug & Go, no cabling or soldering needed__

0. Disconnect your Raspberry Pi/SBC from power to avoid any electrical socks.
1. Plug __one__ or __two__ radios radios in the __NRF24L01__ / __NRF24L01+__ headers (J2/J3).
2. Plug __Boros RF2__ to GPIO expansion port. Please check the pinout of your board as the pin header in inverted in some boards such the case of Orange Pis.
3. Fast Hat board with suitable pcb spacers or standoffs if needed.
4. Power up your Raspberry PI and __Go.__

Check the video for mounting:

[![mount](http://img.youtube.com/vi/--7sZeuIxPg/0.jpg)](http://www.youtube.com/watch?v=--7sZeuIxPg "")


## Recommended software

There are several ways to interact with __nRF24L01__ radios in linux environments. For standard purposes the recommended software are:


### Windows 10 / .Net /C#

[@kiwiBryn](https://github.com/KiwiBryn) has created a set of solutions for field gateways/hubs for __AzureIoT__ and __AdafruitIO__. Check his blog post [here](https://blog.devmobile.co.nz/2019/04/04/windows-10-iot-core-borosrf2-dual-nrf24l01-phat-hat/). Code repositories are here for [AzureIoT](https://github.com/KiwiBryn/Azure.IoTHub.IoTCore.FieldGateway.nRF24L01) and [AdafruitIO](https://github.com/KiwiBryn/AdaFruitIO.IoTCore.FieldGateway.nRF24L01). 

Also a RF24 driver for in C# for .NET framework can be found [here](https://github.com/gralin/nrf24l01). 


### C++:
  [nRF24](https://github.com/nRF24/RF24) is a stable and optimized library enable control radios in linux with the same primitives of the Arduino environment.

  There are other resources available to work in C/C++. *nrf24* library is recommended as it well supported and include lots of examples.

### Javascript/nodejs:

   There are several npm packages to available. Recommended packages are:
   - C++ wrapper: [nrf24](https://www.npmjs.com/package/nrf24)
   - Pure Javascript: [nrf](https://www.npmjs.com/package/nrf)

   For __Node-RED__: [node-red-contrib-nrf24](https://flows.nodered.org/node/node-red-contrib-nrf24)

### Pyhton:
  [nRF24](https://github.com/nRF24/RF24) C++ library offer a python wrapper and several examples.

### ruby:
  Pure ruby Gem: https://github.com/eflukx/nrf24-ruby

### My Sensors gateway:
  MySensors platform supports out of the box communication via __nRF24L01__ radios. You can found the detailed tutorials [here](https://www.mysensors.org/build/raspberry) and [here](https://www.mysensors.org/build/orange).


## Real time clock linux configuration:
Optional RTC module can be used under linux without programing as the linux kernel
supports this RTC out of the box.

For modern linux distibutions such Raspbian/DietPi jessie or stretch (based on mainline kernel and systemd) you can follow
[this](https://ubuntu-mate.community/t/supporting-ds3231-rtc-source-synchronise-with-network-time/5711)
tutorial. This will enable the RTC and use systemd to sync time with via NTP if needed.

For older versions ``rc.local``init script should be used to configure the RTC. You can follow [this](https://www.raspberrypi-spy.co.uk/2015/05/adding-a-ds3231-real-time-clock-to-the-raspberry-pi/) tutorial.

Typical commands in linux console to work with the driver are (__require root/sudo__):


> Init the driver manually

> echo ds3231 0x68 > /sys/class/i2c-adapter/i2c-1/new_device

> Read time in the RTC

> hwclock -r

> Set the RTC with current system time

> hwclock -w

> Set the system time with the time stored in the RTC

> hwclock -s


The RTC include a temperature sensor that can be monitor the temperature of the RTC chip. The RTC temperature is updated once a minute (68s) and could provide information about the ambient temperature or the temperature inside your case. Temperature sensor can be read using *sysfs* under the following path: `` /sys/class/hwmon/hwmon0/temp1_input ``. To convert to human readable centigrade temperature you can use this simple one-liner:


> Read temp / 1000 in Celsius

> cat /sys/class/hwmon/hwmon0/temp1_input  | awk '{print $1/1000 " C"}'

> example output

> 28.25 C


For custom or advanced user could interact directly with the RTC using *i2c-dev* interface or specific libraries.


# Tested enviroments:

- __nRF24L01__ radios: Original and clones.
- Raspberry PI (using modern Raspbian & DietPi stretch):
  - Zero
  - Zero W
  - 3 B
- Raspberry PI 3B Windows 10 (only RF interfaces)
- Orange Pi (using armbian mainline ubuntu xenial or Debian Strech):
  - Orange Pi (H3)
  - Orange Pi zero (H2+)
  - Orange Pi zero plus (H5)

# Contributing and testing:

Testing feedback on other boards and operating systems are welcome.

# Issues:
Please open an issue in github to report any relevant. Please have in mind that issues related software or library usage should be sumbitted to library/software maintaners. On the other, have in mind that the market is full of fake radios that could cause several communication and stability problems. Problems related with fake radios are also not covered here.


# Change log:
- V1: First version.
