##########################################
#		   Editable options			 #
##########################################

# Compiler options
CC := g++
CFLAGS := -Wall -Wextra -Wpedantic
LDFLAGS=-R
EXECUTABLE_NAME=run

# Define Paths
DIR_PATH=$(shell pwd)
BUILD_PATH=$(DIR_PATH)/build
EXE_PATH=$(BUILD_PATH)/exe
SRC=src
BUILD=build
EXE=$(BUILD)/exe
OBJ=$(BUILD)/bin
CORE_PATH=$(SRC)/Core
IO_PATH=$(SRC)/IO
IO_HARDWARE_PATH=$(IO_PATH)/Hardware
IO_SOFTWARE_PATH=$(IO_PATH)/Software
NETWORKING_PATH=$(SRC)/Networking

# Make directories
$(shell mkdir -p $(EXE_PATH))

# Files
SOURCE_FILES=\
	$(wildcard $(SRC)/*.cpp) \
	$(wildcard $(CORE_PATH)/*.cpp) \
	$(wildcard $(IO_HARDWARE_PATH)/*.cpp) \
	$(wildcard $(IO_SOFTWARE_PATH)/*.cpp) \
	$(wildcard $(NETWORKING_PATH)/*.cpp)

##########################################
#		Should be fairly static		 #
##########################################
#	 http://www.gnu.org/software/make/manual/make.html#Substitution-Refs
EXECUTABLE_FILES = $(EXECUTABLE_NAME:%=$(EXE)/%)
OBJECT_FILES	 = $(SOURCE_FILES:%.cpp=$(OBJ)/%.o)

build: $(EXECUTABLE_FILES)

clean:
	rm -rf $(BUILD_PATH)

# http://www.gnu.org/software/make/manual/make.html#Phony-Targets
.PHONY: build clean

# Build
# http://www.gnu.org/software/make/manual/make.html#Automatic-Variables
$(EXECUTABLE_FILES): $(OBJECT_FILES)
	$(info $$OBJECT_FILES is [${OBJECT_FILES}])
	$(info $$EXECUTABLE_FILES is [${EXECUTABLE_FILES}])
	$(info $$@ is [${@}])
	$(info $$^ is [${^}])
	@$(CC) $(LDFLAGS) -o $@ $^
	@echo "Build successful!"

# Compile
# http://www.gnu.org/software/make/manual/make.html#Static-Pattern
# http://www.gnu.org/software/make/manual/make.html#index-_0024_0028_0040D_0029
$(OBJECT_FILES): $(OBJ)/%.o: %.cpp
	@echo Compiling $<
	$(info $$@D is [${@D}])
	$(info $$@ is [${@}])
	$(info $$< is [${<}])
	@mkdir -p $(@D)
	@$(CC) $(CFLAGS) -o $@ $<
