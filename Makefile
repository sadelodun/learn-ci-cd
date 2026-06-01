# 1. FIX: Keep this active to clean up default implicit runner assignments
ifeq ($(origin CC), default)
    CC = gcc
endif
ifeq ($(origin CXX), default)
    CXX = g++
endif

CFLAGS = -Wall -Wextra -Werror -g -Iinclude
CXXFLAGS = -Wall -Wextra -Werror -g -Iinclude
BUILD_DIR = build

# 2. FIX: Wrap paths in $(wildcard ...) so Make scans the actual directories
APP_SRC = $(wildcard src/*.c)
TEST_SRC = $(wildcard tests/*.cpp)

# 3. FIX: Fixed patsubst syntax order, reference wrappers, and mapped them into $(BUILD_DIR)
APP_OBJS = $(patsubst %.c, $(BUILD_DIR)/src/%.o, $(APP_SRC))
TEST_OBJS = $(patsubst %.cpp, $(BUILD_DIR)/tests/%.o, $(TEST_SRC))

TARGET_TEST = $(BUILD_DIR)/test_runner

all: $(TARGET_TEST)

$(BUILD_DIR)/src/%.o: src/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/tests/%.o: tests/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# 4. FIX: Your test runner needs BOTH the app objects (session.o) AND test objects (test_session.o) to link!
$(TARGET_TEST): $(APP_OBJS) $(TEST_OBJS)
	@mkdir -p $(BUILD_DIR)
	$(CXX) -o $@ $^

clean:
	rm -rf $(BUILD_DIR)
	rm -rf reports

.PHONY: all clean
