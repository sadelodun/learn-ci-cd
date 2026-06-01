CC=gcc
CFLAGS=-Wall -Wextra -g -Iinclude
BUILD_DIR=build

APP_SRCS=$(wildcard src/*.c)
TEST_SRCS=$(wildcard tests/*.c)
# Ensures object files are cleanly mapped to build/src/*.o and build/tests/*.o
APP_OBJS=$(patsubst %.c,$(BUILD_DIR)/%.o,$(APP_SRCS))
TEST_OBJS=$(BUILD_DIR)/src/battery.o $(patsubst %.c, $(BUILD_DIR)/%.o, $(TEST_SRCS))

APP_TARGET=$(BUILD_DIR)/battery_monitor-$(CC)
TEST_TARGET=$(BUILD_DIR)/test-$(CC)

all:  version $(APP_TARGET) $(TEST_TARGET)

# Force version generation before compiling any files
version:
	@chmod +x scripts/*
	@bash scripts/print_build_info.sh
	@bash scripts/generate_version.sh

# Rule to link the final executable
$(APP_TARGET): $(APP_OBJS)
	$(CC) -o $@ $^ 

$(TEST_TARGET): $(TEST_OBJS)
	$(CC) -o $@ $^

# Pattern rule to compile .c files into .o files, handling nested directories
$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)
	rm -f include/version.h

.PHONY: all clean version
