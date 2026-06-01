CC=gcc
CXX=g++
CFLAGS=-Wall -Wextra -g -Iinclude
CXXFLAGS=-Wall -Wextra -g -Iinclude
BUILD_DIR=build

# Build Targets
TEST_TARGET=$(BUILD_DIR)/test_runner

all: $(TEST_TARGET)

# Compile C Module
$(BUILD_DIR)/src/notification.o: src/notification.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

# Compile C++ Test Drivers
$(BUILD_DIR)/tests/%.o: tests/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Link C and C++ Object Files together
$(TEST_TARGET): $(BUILD_DIR)/src/notification.o $(BUILD_DIR)/tests/test_notification.o $(BUILD_DIR)/tests/test_main.o
	@mkdir -p $(BUILD_DIR)
	$(CXX) -o $@ $^

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
