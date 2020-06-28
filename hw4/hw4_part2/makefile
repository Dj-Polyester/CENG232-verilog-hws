.PHONY: clean exec clr main all

all: clean main clr exec

main:
	iverilog lab4_2.v pharmacymem_tb.v -o boman

exec:
	./boman

clr:
	clear

clean:
	rm -f boman