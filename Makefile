##########################################
#		   Editable options			 #
##########################################

# Compiler options
CC := g++
CFLAGS := -Wall -Wextra -Wpedantic
LDFLAGS=
EXECUTABLE_NAME=run

# Define Paths
DIR_PATH=$(shell pwd)
SRC_PATH=$(shell pwd)/src
BUILD_PATH=$(DIR_PATH)/build
OUTPUT_PATH=$(BUILD_PATH)/exe
OBJ_PATH=$(BUILD_PATH)/bin
CORE_PATH=$(SRC_PATH)/Core
IO_PATH=$(SRC_PATH)/IO
IO_HARDWARE_PATH=$(IO_PATH)/Hardware
IO_SOFTWARE_PATH=$(IO_PATH)/Software
NETWORKING_PATH=$(SRC_PATH)/Networking

# Make build folder
$(shell mkdir -p $(BUILD_PATH))
$(shell mkdir -p $(OUTPUT_PATH))
$(shell mkdir -p $(OBJ_PATH))

# Folders
SRC=SRC_PATH
BIN=OBJ_PATH
OBJ=$(BIN)/obj

# Files
SOURCE_FILES=\
	$(wildcard $(CORE_PATH)/*.cpp) \
	$(wildcard $(IO_HARDWARE_PATH)/*.cpp) \
	$(wildcard $(IO_SOFTWARE_PATH)/*.cpp) \
	$(wildcard $(NETWORKING_PATH)/*.cpp)

##########################################
#		Should be fairly static		 #
##########################################
#	 http://www.gnu.org/software/make/manual/make.html#Substitution-Refs
EXECUTABLE_FILES = $(EXECUTABLE_NAME:%=$(BIN)/%)
OBJECT_FILES	 = $(SOURCE_FILES:%.cpp=$(OBJ)/%.o)

build: $(EXECUTABLE_FILES)

clean:
	rm -rf $(BUILD_PATH)

# http://www.gnu.org/software/make/manual/make.html#Phony-Targets
.PHONY: build clean

# Build
# http://www.gnu.org/software/make/manual/make.html#Automatic-Variables
$(EXECUTABLE_FILES): $(OBJECT_FILES)
	@$(CC) $(LDFLAGS) -o $@ $^
	@echo "Build successful!"

# Compile
# http://www.gnu.org/software/make/manual/make.html#Static-Pattern
# http://www.gnu.org/software/make/manual/make.html#index-_0024_0028_0040D_0029
$(OBJECT_FILES): $(OBJ)/%.o: %.cpp
	@echo Compiling $<
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) -o $@ $<
