CC=gcc
CFLAGS=-I.
#Dependencies which also have to be compiled
DEPS=dates.ads
#SRC = file1.adb file2.adb ...
SRC = weekday.adb dates.adb
OUTPUT = weekday

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

$(OUTPUT): $(SRC)
  gcc -c $^ $(CFLAGS)
  gnatbind $(OUTPUT)
  gnatlink $(OUTPUT)
  gnatmake $(OUTPUT)
  make clean
clean:
  rm *.ali *.o
