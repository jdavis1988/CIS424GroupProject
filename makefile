
game: lex.yy.c input.tab.c objects.o locations.o main.c 
	gcc -g -o game -Wl,--start-group main.c input.tab.c lex.yy.c objects.o locations.o -lfl -ly -Wl,--end-group

objects.o: userinput.h objects.h objects.c
	gcc -g -o objects.o objects.c 
	
locations.o: userinput.h locations.h locations.c
	gcc -g -o locations.o locations.c 

lex.yy.c: input.l
	flex  input.l

input.tab.c: input.y
	bison -dv input.y

clean:
	rm -f lex.yy.c 
	rm -f input.output
	rm -f input.tab.h
	rm -f input.tab.c
	rm -f objects.o
	rm -f locations.o
	rm -f game 
