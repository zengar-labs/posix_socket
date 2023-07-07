.DEFAULT_GOAL := all
# Query the default target.
ifeq ($(.DEFAULT_GOAL),)
  $(warning no default target is set)
endif

#CROSS_COMPILE = aarch64-none-linux-gnu-
ifdef CROSS_COMPILE
	CC := $(CROSS_COMPILE)gcc
	CFLAGS = -g -Wall -Wextra -pedantic
endif

SRC := socket_srvr.c
TARGET = socket_srvr
OBJS := $(SRC:.c=.o)

all: $(TARGET)

$(TARGET) : $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) $(OBJS) -o $(TARGET) $(LDFLAGS)

clean:
	$(RM) *.o $(TARGET) *.elf *.map