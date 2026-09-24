# конфигурация
CC      = gcc
CFLAGS  = -Wall -Wextra -g
LEX     = flex
LEXFLAGS =

SRC_DIR   = src
BUILD_DIR = build

TARGETS := $(patsubst $(SRC_DIR)/%.l,$(BUILD_DIR)/%,$(wildcard $(SRC_DIR)/*.l))

# цели
.PHONY: all clean test

all: $(TARGETS)

$(BUILD_DIR)/%: $(BUILD_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) $< -o $@

$(BUILD_DIR)/%.c: $(SRC_DIR)/%.l | $(BUILD_DIR)
	$(LEX) $(LEXFLAGS) -o $@ $<

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

test: all
	@bash tests/run.sh
