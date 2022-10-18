# assignment name (generate executable with this name)
TARGET = proj7
# .cpp files that do not contain a main() function.
SOURCES = CongaLine.cpp

CPP       = g++ --std=c++11 -c
CPPFLAGS   = -Wall -I. -g
LINKER   = g++ -o
LFLAGS   = -Wall

INCLUDES := $(wildcard *.h)
OBJECTS  := $(SOURCES:.cpp=.o)
rm       = rm -f

.PHONY: obj clean all

all: $(TARGET)

$(TARGET): obj main.o
	$(LINKER) $(TARGET) $(LFLAGS) $(OBJECTS) main.o
	@echo "Linking complete!"

obj: $(SOURCES) $(INCLUDES)
	$(CPP) $(CPPFLAGS) $(SOURCES)
	@echo "Compilation complete!"

clean:
	$(rm) $(TARGET) $(TEST_TARGET) $(OBJECTS) main.o
	@echo "Cleanup complete!"

