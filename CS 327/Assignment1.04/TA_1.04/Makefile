CFLAGS = -g -Wall -Werror 

OBJS = \
corridor.o \
character.o \
debug.o \
dijkstra.o \
dungeon.o \
heap.o \
main.o \
move.o \
point.o \
room.o \
turn.o \

NAME = rlg327

all: $(NAME)

clean:
	rm -rf $(NAME) *.o $(NAME).dSYM

$(NAME): $(OBJS) 
	gcc $(CFLAGS) -o $(NAME) $(OBJS)

%.o: %.c
	gcc $(CFLAGS) -c $<
