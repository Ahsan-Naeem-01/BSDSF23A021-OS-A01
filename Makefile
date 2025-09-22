# ===== Top-level Makefile (Dynamic Library Version) =====
CC = gcc
CFLAGS = -Iinclude -Wall -g -fPIC
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
LIB_DIR = lib

TARGET = $(BIN_DIR)/client_dynamic
LIB_SHARED = $(LIB_DIR)/libmyutils.so
OBJECTS = $(OBJ_DIR)/main.o
UTIL_OBJS = $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o

all: $(TARGET)

$(LIB_SHARED): $(UTIL_OBJS)
	$(CC) -shared -o $(LIB_SHARED) $(UTIL_OBJS)

$(TARGET): $(OBJECTS) $(LIB_SHARED)
	$(CC) $(OBJECTS) -L$(LIB_DIR) -lmyutils -o $(TARGET)

$(OBJECTS) $(UTIL_OBJS):
	$(MAKE) -C $(SRC_DIR)

run: $(TARGET)
	LD_LIBRARY_PATH=$(LIB_DIR):$$LD_LIBRARY_PATH ./$(TARGET)

clean:
	$(MAKE) -C $(SRC_DIR) clean
	rm -f $(TARGET) $(LIB_SHARED)

