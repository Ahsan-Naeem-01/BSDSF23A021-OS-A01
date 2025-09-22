# ===== Top-level Makefile (Static Library Version) =====
CC = gcc
CFLAGS = -Iinclude -Wall -g
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
LIB_DIR = lib

TARGET = $(BIN_DIR)/client_static
LIB_STATIC = $(LIB_DIR)/libmyutils.a

OBJECTS = $(OBJ_DIR)/main.o
UTIL_OBJS = $(OBJ_DIR)/mystrfunctions.o $(OBJ_DIR)/myfilefunctions.o

all: $(TARGET)

$(LIB_STATIC): $(UTIL_OBJS)
	ar rcs $(LIB_STATIC) $(UTIL_OBJS)

$(TARGET): $(OBJECTS) $(LIB_STATIC)
	$(CC) $(OBJECTS) -L$(LIB_DIR) -lmyutils -o $(TARGET)

$(OBJECTS) $(UTIL_OBJS):
	$(MAKE) -C $(SRC_DIR)

run: $(TARGET)
	./$(TARGET)

clean:
	$(MAKE) -C $(SRC_DIR) clean
	rm -f $(TARGET) $(LIB_STATIC)

