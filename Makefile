OBJS   = Vector.o Machine.o
TARGET = demo
FLAGS  = -g -c -Wall -std=c++17

all: run

run: $(TARGET)
	leaks -atExit -- ./$(TARGET)

demo: $(OBJS) user.swift
	swiftc -g -import-objc-header Bridging-Header.h user.swift -sdk `xcrun -sdk macosx --show-sdk-path` -lc++ Machine.o Vector.o -o $(TARGET)

Vector.o: Vector.cpp
	$(CC) $(FLAGS) -x c++ Vector.cpp

Machine.o: Machine.mm
	$(CC) $(FLAGS) -x objective-c++ -fmodules -fcxx-modules Machine.mm

clean:
	rm -rf $(OBJS) $(TARGET) *.dSYM