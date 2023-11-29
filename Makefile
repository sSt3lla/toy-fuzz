
CXX=clang++
CC=clang
CFLAGS=-W -Wall -Wextra
OBJECTS=bvalue.o compile.o compiler_code.o dict.o collect_garbage.o main.o \
	object.o util.o value.o vm.o

all: fuzz

fuzz: CFLAGS+=-O1 -g -fsanitize=fuzzer,address
fuzz: libfuzz

libfuzz: $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^

main.o: main.cpp
	$(CXX) $(CFLAGS) -c -o $@ $<

compiler_code.c: *.js
	node translate_to_c.node.js > $@

clean:
	rm -rf $(OBJECTS) compiler_code.c libfuzz
