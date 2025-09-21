# ===== Top-level Makefile =====
CC = gcc
CFLAGS = -Iinclude -Wall -g
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin

TARGET = $(BIN_DIR)/client

all: $(TARGET)

$(TARGET): 
	$(MAKE) -C $(SRC_DIR)
	$(CC) $(OBJ_DIR)/*.o -o $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	$(MAKE) -C $(SRC_DIR) clean
	rm -f $(TARGET)

