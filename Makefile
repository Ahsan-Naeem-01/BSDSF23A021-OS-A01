# ===== Top-level Makefile (Dynamic Library Version) =====
CC = gcc
CFLAGS = -Iinclude -Wall -g -fPIC
SRC_DIR = src
OBJ_DIR = obj
BIN_DIR = bin
LIB_DIR = lib
PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man

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


install: $(TARGET)
	# Install binary
	install -d $(BINDIR)
	install -m 755 $(TARGET) $(BINDIR)/client

	# Install man1 page for client
	install -d $(MANDIR)/man1
	install -m 644 man/man1/client.1 $(MANDIR)/man1/client.1

	# Install man3 pages for library functions
	install -d $(MANDIR)/man3
	install -m 644 man/man3/*.3 $(MANDIR)/man3/

uninstall:
	rm -f $(BINDIR)/client
	rm -f $(MANDIR)/man1/client.1
	rm -f $(MANDIR)/man3/mystrlen.3 \
	      $(MANDIR)/man3/mystrcpy.3 \
	      $(MANDIR)/man3/mystrncpy.3 \
	      $(MANDIR)/man3/mystrcat.3 \
	      $(MANDIR)/man3/wordCount.3 \
	      $(MANDIR)/man3/mygrep.3
