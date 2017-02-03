CFLAGS = -g -Wall -Werror 

NAME = rlg327
OBJS = main.o room.o path.o

all: $(NAME)

clean:
	rm $(NAME) *.o

$(NAME): $(OBJS) 
	gcc $(CFLAGS) -o $(NAME) $(OBJS)

%.o: %.c
	gcc $(CFLAGS) -c $<

