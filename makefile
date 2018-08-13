all:coolc spim
coolc:
	/home/grad/ccomp/11/pedro.caldeira/students/compilers/bin/coolc stack.cl atoi.cl -o stack.s
spim:
	/home/grad/ccomp/11/pedro.caldeira/students/compilers/bin/spim -file stack.s
