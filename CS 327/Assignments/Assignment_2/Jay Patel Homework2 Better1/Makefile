testformat: weatherio.o testformat.o
	gcc -o testformat weatherio.o testformat.o
weatherio.o: weatherio.c weatherio.h
	gcc -c weatherio.c weatherio.h
tesformat.o: testformat.c weatherio.h
	gcc -c tesformat.c weatherio.h
clean:
	rm -f testformat weatherio.o testformat.o