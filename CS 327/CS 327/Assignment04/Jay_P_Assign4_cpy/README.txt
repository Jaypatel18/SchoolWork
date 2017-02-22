I have this many files in my project:


Sndinfo:
sndmix:
sndcat:
sndgen:
sndcvt:
sndplay:
sndfx:
swithces:
flip:


I have created a class and in that class I made a method that will read. In that it checks for every sample and if it is found and then it returned.
	In this class I am checking for each and every sample that is required for this assignment. I did that using if statements. I also made sure that the number is not greater than it is required that could be one error. Also I have mentioned all the samples that are required with their return type.For example if getSampleRate returns sampleRate I have did that. I have made couple of private variables for that as well. Also I have added a sndinfo all I have done is it return the correct value like sample rate, bit depth and num of channels.
	
In this file I have called my main header files which is "all" and I am basically doing cout for all the samples like" num of samples, num of channels etc
	
In sndmix I have a method called sndmix where it takes three parameters and one of them is from a class that I used to read the file, I have including that header file in sndmix. In soundmix I am checking for getnumChannels, getSampleRate and getNumsamples. I am checking for the errors first and then I am outputting them in a way that it will show the result as it is in the document which was provided by the teacher.


In sndcat I have a method called sndcat where it takes two parameters and of them is from a class that I used to read the file, I have including that header file in sndcat as well.
sndcat is similar to the one I did in sndmix this also have al the samples that are required to out put the first one, that means it has getFiletype, getNumOfFile, all all the others samples that I have mentioned before in this document. 

I have also made a header file for all of those in one in order to look my code more beautiful and clean. It is called all.hpp.
This is the header file that I created this will have the prototypes of the functions I have created in my project. this contains prototype of sndcat, sndmix and my snd files.

I have also made a flip.cpp which I use where I have to check for all those samples, I include flip.cpp in snd.cpp 
This is the one I used a lot in all my classes, I made this because it will convert it automatically when I call that function this saved a lot of time for me in order to check for the conversions of those samples.

Apart from that I have also made a switches.hpp, in that I have all those switches that are required in the individual snd file, sndmix and sndcat

I have not got chance to do sandmen and extra credit and I apologize for that.

* Please Note :
For my UML diagram, I have two parts,
1- I did it in word, and when I convert into pdf it is moved to different places and due to that you cannot see the UML properly, but I am also attaching world document with it so that you can have a look at it.
2- I created a brand new one in that one I have followed TA’s instructions since I remember asking them a lot of questions about that, as well as I have followed the structure of the instructors slides on blackboard about OO Design.

At last, I have added all of those in  my 3 different mains, since we had to create different executables for different sndfiles I thought that this would be the easiest way and help me save a lot of time.