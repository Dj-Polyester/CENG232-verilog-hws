MAIN=testbench_part2_3

all:
	clear
	make clean
	if make $(MAIN); then ./$(MAIN); fi

#the below can be customized 
$(MAIN):
	iverilog lab3_2.v $(MAIN).v -o $(MAIN)

clean:
	rm -f $(MAIN)