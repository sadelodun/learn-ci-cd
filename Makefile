CC=gcc
CFLAGS=-Wall -Wextra -g -Iinclude
BUILD_DIR=build

SRCS=$(wildcard src/*.c) $(wildcard tests/*.c)
# Ensures object files are cleanly mapped to build/src/*.o and build/tests/*.o
OBJS=$(patsubst %.c,$(BUILD_DIR)/%.o,$(SRCS))
TARGET=$(BUILD_DIR)/test_led

all: $(TARGET)

# Rule to link the final executable
$(TARGET): $(OBJS)
	$(CC) -o $@ $^ 

# Pattern rule to compile .c files into .o files, handling nested directories
$(BUILD_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)

.PHONY: all clean
