CC=gcc
CFLAGS=-I.
#Dependencies which also have to be compiled
DEPS=elections.ads
#SRC = file1.adb file2.adb ...
SRC = testscript.adb elections.adb
OUTPUT = testscript

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
