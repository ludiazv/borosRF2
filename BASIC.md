__NRF24L01 / NRF24L01+__ radios are a low-cost way to go wireless for limited resource Hardware
such as micro-controllers or small computers. These radios are popular in the sensor arena and typical
arduino(AVR), STM  or other mcu projects that interact with other sensors or devices. __Boros RF2__ are enabled to integrate
these kind of devices and DIY projects with regular computers running linux or Windows 10 and high-level
development technologies like ruby, python or nodejs. OIT/SmartHome frameworks such Node-RED, MySensors, OpenHab, AzureIoT,AdafruitIO,... also support NRF24L01 radios integrated sensors and actuators.

![image](https://github.com/ludiazv/borosRF2/blob/master/media/all.jpg?raw=true)

__Boros RF2__ offers a dual header for up to two __NRF24L01 / NRF24L01+__  radios connected to your Raspberry Pi (or similar SBCs).

The typical applications of these radios:

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

__Boros RF2__ helps hobbists and makers to use integrated radio communication in their projects/products without dealing with the complexities of hardware interfaces with __nRF24L01__ radios. Makers can __focus__ on their project and speed up the development.

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

For more information check out the technical documentation.

