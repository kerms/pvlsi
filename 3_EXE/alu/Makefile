CC   = ghdl
FLAG = -a -v
EXEC = adder4_tb alu_tb

all : $(EXEC)

adder4.o : adder4.vhdl FA.o
	$(CC) $(FLAG) adder4.vhdl

adder4_tb.o : adder4_tb.vhdl
	$(CC) $(FLAG) adder4_tb.vhdl

alu.o : alu.vhdl
	$(CC) $(FLAG) alu.vhdl

alu_tb : alu_tb.o alu.o
	$(CC) -e -v alu_tb

alu_tb.o : alu_tb.vhdl alu.o
	$(CC) $(FLAG) alu_tb.vhdl

adder4_tb : adder4.o adder4_tb.o
	$(CC) -e -v adder4_tb

FA.o : HA.o
	$(CC) $(FLAG) FA.vhdl

HA.o : 
	$(CC) $(FLAG) HA.vhdl

run : adder4_tb alu_tb
	$(CC) -r adder4_tb --vcd=adder4.vcd
	$(CC) -r alu_tb --vcd=alu.vcd

clean : 
	rm -f *.o 

mrproper : clean
	rm -f *.vcd $(EXEC)