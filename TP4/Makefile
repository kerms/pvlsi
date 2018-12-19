CC   = ghdl
FLAG = -a -v

VIEW = gtkwave
VFLAG= 
SRC  = .vhdl

#mettre ici le nom de Exec, il va chercher le nom.$(SRC)
#et le compiler avec les dependances donnees
EXEC  = alu_tb adder_tb shifter_tb
TB    = 

#prend tout les fichiers .$(SRC),filter-out: exclusion
LIB = $(filter-out ,$(wildcard *$(SRC)))
	
#donne les noms .$(SRC) ->.o
OBJ = $(LIB:$(SRC)=.o)

#recupere la liste des argumensts
# If the first argument is "run"...
ifeq (run,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
 	RUN_TARGET = $(word 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
 	ARGS_RUN = $(wordlist 3,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
	_ARGS_RUN= $(ARGS_RUN:=.args)
  # ...and turn them into do-nothing targets
  	$(eval $(RUN_TARGET): ;@:)
  	$(eval $(ARGS_RUN): ;@:)
endif

# If the first argument is "runs"...
ifeq (runs,$(firstword $(MAKECMDGOALS)))
  # use the rest as arguments for "run"
 	ARGS_RUNS = $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
	_ARGS_RUNS= $(ARGS_RUNS:=.args)
  # ...and turn them into do-nothing targets
  	$(eval $(ARGS_RUNS):;@:)
endif

all: $(OBJ) $(EXEC)

# ajout de dependances
alu_tb: 

adder4_tb: HA.o FA.o

# fin ajout dependances

#compiler les Execs
$(EXEC):%: %$(SRC)
	$(CC) $(FLAG) $@ $^
	$(CC) -e -v $@

#regle pour les future fichiers .o
$(OBJ):%.o: %$(SRC)
	$(CC) $(FLAG) $*$(SRC)


run : $(_ARGS_RUN)
	$(CC) $(FLAG) $(RUN_TARGET)$(SRC)
	$(CC) -e -v $(RUN_TARGET)
	$(CC) -r $(RUN_TARGET) --vcd=$(RUN_TARGET).vcd
	
	
$(_ARGS_RUN): %.o.args:
	$(CC) $(FLAG) $*$(SRC)

#lancer la stimulation un par un par sur les args
runs: $(_ARGS_RUNS)

$(_ARGS_RUNS): %.args: 
	@echo $(CC) -r $* --vcd=$*.vcd
	
#view avec $(view)
view: $(ARGS)
	$(CC) -r $^ --vcd=$^.vcd
	$(VIEW) $(VFLAG) $^.vcd
	
#ce qui n'est pas un fichier
.PHONY: all clean mrproper run view $(OBJ) $(_ARGS_RUNS) $(_ARGS_RUN)

#ne garde que les Execs
clean:
	rm -f *.o *~ *.out

#supprime toutes generation de make ()
mrproper: 
	rm -f $(EXEC) *.out *.o .vcd *~
