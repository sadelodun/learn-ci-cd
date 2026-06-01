# FIX: Clear any implicit Windows defaults for CC if they point to the non-existent 'cc'
# ifeq ($(origin CC), default)
#     CC = gcc
# endif
# ifeq ($(origin CXX), default)
#     CXX = g++
# endif

CC ?= gcc
CXX ?= g++
CFLAGS = -Wall -Wextra -Werror -g -Iinclude
CXXFLAGS = -Wall -Wextra -Werror -g -Iinclude
BUILD_DIR = build

APP_OBJS = $(BUILD_DIR)/src/session.o
TEST_OBJS = $(BUILD_DIR)/tests/test_session.o

TARGET_TEST = $(BUILD_DIR)/test_runner

all: $(TARGET_TEST)

$(BUILD_DIR)/src/%.o: src/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/tests/%.o: tests/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(TARGET_TEST): $(APP_OBJS) $(TEST_OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) -o $@ $^

clean:
	rm -rf $(BUILD_DIR)
	rm -rf reports

.PHONY: all clean
