hw2: weatherio.o testformat.o
	gcc main.o testformat.o -o hw2
weatherio.o: weatherio.c
	gcc -c weatherio.c
testformat.o: testforamt.c
	gcc -c testformat.c

clean:
	rm -f *.o hw2
