all: pppppppppppppp
# Which compiler
CC = gcc
# Where to install
INSTDIR = ~/bin
# Where are include files kept
INCLUDE = .
# Options for development
CFLAGS = -g -Wall -ansi
# Options for release
# CFLAGS = -O -Wall -ansi

ppppppppp: main.o 2.o 3.o
	$(CC) -o pppppppp 
main.o: main.c a.h
  	$(CC) -I$(INCLUDE) $(CFLAGS) -c main.c
2.o: 2.c a.h b.h
  	$(CC) -I$(INCLUDE) $(CFLAGS) -c 2.c
clean:
   	-rm main.o 2.o 3.o
install:
   	@if [ -d $(INSTDIR) ]; \
      	then \
      	cp pppppppppp $(INSTDIR);\
      	chmod a+x $(INSTDIR)/pppppppppp;\
      	chmod og-w $(INSTDIR)/pppppppppp;\
      	echo “Installed in $(INSTDIR)”;\
   	else \
      	echo “Sorry, $(INSTDIR) does not exist”;\
   	fi

