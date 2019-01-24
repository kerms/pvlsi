CC   = ghdl
FLAG = -a -v
EXEC = shifter_tb

all : $(EXEC)

shifter.o : shifter.vhdl
	$(CC) $(FLAG) shifter.vhdl

shifter_tb.o : shifter_tb.vhdl shifter.o
	$(CC) $(FLAG) shifter_tb.vhdl

shifter_tb : shifter_tb.o shifter.o
	$(CC) -e -v shifter_tb

run : $(EXEC)
	$(CC) -r shifter_tb --vcd=shifter.vcd
	
clean : 
	rm -f *.o 

mrproper : clean
	rm -f *.vcd $(EXEC)