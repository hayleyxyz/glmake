CC=clang
CXX=clang++
CFLAGS=-Wall
LIBS=-lglfw -ldl
INCLUDES=-I./include
TARGET=glyui


$(TARGET): obj/main.o obj/glad.o
	$(CXX) -g -o $(TARGET) $^ $(LIBS)

obj/main.o: src/main.cpp
	$(CXX) -g -c $< -o $@ $(INCLUDES) $(CFLAGS)

obj/glad.o: src/glad.c
	$(CC) -g -c $< -o $@ $(INCLUDES) $(CFLAGS)

.PHONY: clean

clean:
	rm obj/*.o $(TARGET)