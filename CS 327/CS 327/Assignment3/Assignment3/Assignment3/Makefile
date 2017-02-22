analyze: main.o assign3.o weatherio.o 
	gcc -o analyze main.o assign3.o weatherio.o
main.o: main.c struct.h assign3.h weatherio.h
	gcc -c main.c
assign3.o: assign3.c struct.h assign3.h weatherio.h
	gcc -c assign3.c
clean:
	rm -f analyze main.o assign3.o weatherio.o