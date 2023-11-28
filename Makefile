# Define Paths
SRC_PATH=$(shell pwd)
BUILD_PATH=$(SRC_PATH)/build
OUTPUT_PATH=$(BUILD_PATH)/exe
CORE_PATH=$(SRC_PATH)/Core
IO_PATH=$(SRC_PATH)/IO
IO_HARDWARE_PATH=$(IO_PATH)/Hardware
IO_SOFTWARE_PATH=$(IO_PATH)/Software
NETWORKING_PATH=$(SRC_PATH)/Networking

# Make required folders
$(shell mkdir -p $(BUILD_PATH))
$(shell mkdir -p $(OUTPUT_PATH))

# Encapsulate all source files in directory paths
CORE_SRC=$(wildcard $(CORE_PATH)/*.cpp)
IO_SRC=$(wildcard $(IO_PATH)/*.cpp)
IO_HARDWARE_SRC=$(wildcard $(IO_HARDWARE_PATH)/*.cpp)
IO_SOFTWARE_SRC=$(wildcard $(IO_SOFTWARE_PATH)/*.cpp)
NETWORKING_SRC=$(wildcard $(NETWORKING_PATH)/*.cpp)

# Define Makefile parameters
CC := g++
CFLAGS := -Wall -Wextra -Wpedantic

all: main
	g++ -o run core.o

main: core.o #io.o networking.o

core.o: $(CORE_SRC) 
	g++ -c $(CORE_SRC)

# io.o: io_hardware io_software

# io_hardware.o: $(IO_HARDWARE_SRC)

# io_software.o: $(IO_SOFTWARE_SRC)

# networking.o: $(NETWORKING_SRC)


clean: 
	rm -rf $(OUTPUT_PATH)
	rm -rf $(BUILD_PATH)
