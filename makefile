COPT = -O2 -fpic

CWARNS = 
CFLAGS = $(CWARNS) $(COPT) -ansi
DLLFLAGS = -O -shared -fpic -L/usr/lib -lchasen -lstdc++
CC = gcc

chasen.so: chasen.o
	$(CC) $(DLLFLAGS) chasen.o -o chasen.so

chasen.o:	makefile chasen.c
