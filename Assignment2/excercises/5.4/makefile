CC=gcc
CFLAGS=-I.
#Dependencies which also have to be compiled
DEPS=card.ads
#SRC = file1.adb file2.adb ...
SRC = card_game.adb card.adb
OUTPUT = card_game

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(OUTPUT): $(SRC)
	gcc -c $^ $(CFLAGS)
	# gnatbind $(OUTPUT)
	# gnatlink $(OUTPUT)
	gnatmake $(OUTPUT)
	make clean
clean:
	rm *.ali *.o
