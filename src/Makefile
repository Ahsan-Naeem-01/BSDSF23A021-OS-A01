CC = gcc
CFLAGS = -I../include -Wall -g
OBJ_DIR = ../obj
SRC = main.c mystrfunctions.c myfilefunctions.c
OBJ = $(SRC:%.c=$(OBJ_DIR)/%.o)

all: $(OBJ)

$(OBJ_DIR)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ_DIR)/*.o

