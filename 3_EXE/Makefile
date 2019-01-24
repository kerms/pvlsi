CC   = ghdl
FLAG = -a -v
EXEC = exec_tb adder4_tb alu_tb shifter_tb

all : $(EXEC)

exec.o : exec.vhdl fifo_72b.o adder4.o alu.o shifter.o
	$(CC) $(FLAG) exec.vhdl

shifter.o : shifter.vhdl
	$(CC) $(FLAG) shifter.vhdl

shifter_tb.o : shifter_tb.vhdl shifter.o
	$(CC) $(FLAG) shifter_tb.vhdl

shifter_tb : shifter_tb.o shifter.o
	$(CC) -e -v shifter_tb

exec_tb.o : exec_tb.vhdl fifo_72b.o exec.o
	$(CC) $(FLAG) exec_tb.vhdl

fifo_72b.o : fifo_72b.vhdl
	$(CC) $(FLAG) fifo_72b.vhdl

exec_tb : exec_tb.o 
	$(CC) -e -v exec_tb

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

run : $(EXEC)
	$(CC) -r shifter_tb --vcd=shifter.vcd
	$(CC) -r adder4_tb --vcd=adder4.vcd
	$(CC) -r alu_tb --vcd=alu.vcd
	$(CC) -r exec_tb --vcd=exec.vcd

.PHONY: all $(SUBDIRS)

clean : 
	rm -f *.o 

mrproper : clean
	rm -f *.vcd $(EXEC) *.vbe