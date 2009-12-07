SRCNAME = chasen.c
OBJNAME = chasen.o
LIBNAME = chasen.so

LUAPKG = lua
CFLAGS = `pkg-config $(LUAPKG) --cflags` -fpic -Os -Wall
LFLAGS = -shared -L/usr/lib -lchasen -lstdc++

CC = gcc

all: $(LIBNAME)

$(OBJNAME): $(SRCNAME)
	$(CC) -o $(OBJNAME) -c $(SRCNAME) $(CFLAGS)

$(LIBNAME): $(OBJNAME)
	$(CC) -o $(LIBNAME) -shared $(OBJNAME) $(LFLAGS)
