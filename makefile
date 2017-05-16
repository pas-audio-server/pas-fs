CC		= g++
CFLAGS	= -g -Wall -std=c++11 -I ../server -pthread -fopenmp
LDFLAGS	= -lmysqlcppconn -fopenmp
SRC		= fsmain.cpp db.cpp fs.cpp logger.cpp track.cpp

%.o				: %.cpp
				$(CC) -c $(CFLAGS) $< -o $@

all				: clear_screen fsmain

fsmain			: fsmain.o track.o db.o logger.o fs.o
				$(CC) -o $@ fsmain.o track.o db.o fs.o logger.o $(LDFLAGS)

track.o 		: track.cpp
				$(CC) -c $(CFLAGS) $< -o $@

logger.o 		: logger.cpp
				$(CC) -c $(CFLAGS) $< -o $@

clean			:
				rm -f fsmain *.o core

.PHONY			: clear_screen

clear_screen	:
				clear

