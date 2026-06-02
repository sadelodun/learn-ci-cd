ifeq ($(origin CC), default)
    CC = gcc
endif
ifeq ($(origin CXX), default)
    CXX = g++
endif

CFLAGS = -Wall -Wextra -Werror -g -Iinclude --coverage
CXXFLAGS = -Wall -Wextra -Werror -g -Iinclude --coverage
BUILD_DIR = build

APP_SRC = $(wildcard src/*.c)
TEST_SRC = $(wildcard tests/*.cpp)

APP_OBJS = $(patsubst %.c, $(BUILD_DIR)/%.o, $(APP_SRC))
TEST_OBJS = $(patsubst %.cpp, $(BUILD_DIR)/%.o, $(TEST_SRC))

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
	$(CXX) --coverage -o $@ $^

clean:
	rm -rf $(BUILD_DIR)
	rm -rf reports

.PHONY: all clean
