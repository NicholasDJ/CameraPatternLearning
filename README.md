This project is intended to flash LEDs or a LCD screen to indicate where a camera has detected motion or sound. This will need outside app setup from the user to indicate which LED or LCD output is connected to which camera.

This will then tie into a Machine Learning algorithm or AI model to learn patterns of motion and sound through the connected cameras.

/* This code is meant to be used with an ESP32-WROVER-E */
This Code utilizes the built-in WiFi capabilities of the ESP32 to communicate with Google Home and Wyze Cameras. 

/* Additional Hardware Required */
Google Home Camera
- Google Nest Cam (Wired)

Wyze Camera
- Wyze Cam v3 Pro
- Wyze Cam Pan v3

Petlibro
- PLAF203 Camera Feeder

File Structure Description
------------------------------------------------------------------------------------------------------------------
src: This directory contains all the source files for the project.
Core: This directory contains the control loop files and functions for the entire app.
	main.cpp - This file contains the entry point for the application
IO: This directory contains the input/output file and functions for interfacing with external applications.
	Hardware: This directory contains IO for hardware related interfaces.
	Software: This directory contains IO for software related interfaces.
Networking: This directory contains the necessary files and functions for interfacing with IOT applications.

build: This directory contains the executables and object files of the project.
