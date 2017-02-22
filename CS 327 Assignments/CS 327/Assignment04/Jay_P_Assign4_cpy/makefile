ALL: sndinfo sndcat sndmix

sndinfo: snd.o sndmix.o sndcat.o main.o flip.o testing.o switches.o
	g++ -o sndinfo snd.o sndmix.o sndcat.o flip.o testing.o switches.o main.o

sndcat: sndcat.o snd.o sndmix.o flip.o testing.o switches.o sndcatMain.o
	g++ -o sndcat sndcat.o snd.o sndmix.o flip.o testing.o switches.o sndcatMain.o

sndmix: sndmix.o snd.o sndcat.o sndmixMain.o flip.o testing.o switches.o
	g++ -o sndmix sndmix.o snd.o sndcat.o flip.o testing.o switches.o sndmixMain.o


snd.o: snd.cpp snd.hpp all.hpp
	g++ -c snd.cpp snd.hpp all.hpp
sndcat.o: sndcat.cpp all.hpp
	g++ -c sndcat.cpp all.hpp
sndmix.o: sndmix.cpp all.hpp
	g++ -c sndmix.cpp all.hpp
main.o: main.cpp all.hpp
	g++ -c main.cpp all.hpp
sndmixMain.o: sndmixMain.cpp all.hpp
	g++ -c sndmixMain.cpp all.hpp
sndcatMain.o: sndcatMain.cpp all.hpp
	g++ -c sndcatMain.cpp all.hpp
flip.o: flip.cpp all.hpp
	g++ -c flip.cpp all.hpp
testing.o: testing.cpp all.hpp
	g++ -c testing.cpp all.hpp
switches.o: switches.cpp all.hpp
	g++ -c switches.cpp all.hpp
clean:
	rm -f sndinfo sndmix sndcat snd.o sndcat.o sndmix.o main.o sndcatMain.o sndmixMain.o flip.o testing.o switches.o