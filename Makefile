SRC_PATH=$(shell pwd)
BUILD_PATH=$(SRC_PATH)/build
OUTPUT_PATH=$(BUILD_PATH)/exe
CORE_SRC=$(SRC_PATH)/Core
IO_SRC=$(SRC_PATH)/IO
NETWORKING_SRC=$(SRC_PATH)/Networking

# Make required folders
$(shell mkdir -p $(BUILD_PATH))
$(shell mkdir -p $(OUTPUT_PATH))

all: main
	
main: 
	g++ -o $(OUTPUT_PATH)/run $(CORE_SRC)/main.cpp

clean: 
	rm -rf $(OUTPUT_PATH)
	rm -rf $(BUILD_PATH)
