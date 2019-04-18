#Makefile by Peter, April 18th.

CC=gcc

#Tells GCC which directory to check for header files
CFLAGS=-I./$(IDIR)

#Header and object file directories
IDIR=include
ODIR=obj

#Shared libraries for Lex and YACC
LIBS=-lfl -ly

#Places header files in include/
_DEPS = userinput.h locations.h objects.h input.tab.h
DEPS = $(patsubst %, $(IDIR)/%, $(_DEPS))

#Places object files in obj/
_OBJ = objects.o locations.o lex.yy.o input.tab.o
OBJ = $(patsubst %,$(ODIR)/%, $(_OBJ))

#Final compilation: compiles main() and links everything together. 
game: $(OBJ) main.c $(DEPS)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

#Runs YACC to generate parse table for user input
input.tab.c: input.y
	bison -dv input.y
	mv input.tab.h $(IDIR)

./include/input.tab.h: input.y
	bison -dv input.y
	mv input.tab.h $(IDIR)

#Runs Lex to generate lexical scanner
lex.yy.c: input.l ./include/input.tab.h 
	flex  input.l
	touch compdone.txt

#4 commands to compile individual object components before they can be integrated with main()

$(ODIR)/lex.yy.o : lex.yy.c ./include/input.tab.h 
	$(CC) -c -o $@ lex.yy.c $(CFLAGS)

$(ODIR)/input.tab.o : input.tab.c ./include/userinput.h
	$(CC) -c -o $@ input.tab.c $(CFLAGS)

$(ODIR)/objects.o : objects.c ./include/objects.h
	$(CC) -c -o $@ objects.c $(CFLAGS)

$(ODIR)/locations.o : locations.c ./include/locations.h
	$(CC) -c -o $@ locations.c $(CFLAGS)


.PHONY: clean

clean:
	rm -f lex.yy.c 
	rm -f input.output
	rm -f include/input.tab.h
	rm -f input.tab.c
	rm obj/*
	rm -f game 


