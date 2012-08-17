# Defines the part name.
PART=LM3S1968

# Define the processor type.
VARIANT=cm3

# Define the path for StellarisWare.
ifdef STELLARISWARE_PATH
    ROOT=${STELLARISWARE_PATH}
else
    ROOT=./stellarisware
endif

# Include the common make definitions.
include ${ROOT}/makedefs

# Path to the drivers for the lm3s1968 evaluation board.
VPATH=${ROOT}/boards/ek-lm3s1968/drivers

# Path to the extra headers needed.
IPATH=${ROOT}/boards/ek-lm3s1968
IPATH+=${ROOT}

# The rule for the program compilation.
all: ${COMPILER}
all: ${COMPILER}/main.axf

# The rule that cleans the project.
clean: 
	@rm -rf ${COMPILER} ${wildcard *~}

# The rule to create the output directory.
${COMPILER}: 
	@mkdir -p ${COMPILER}

# The rules to build the program.
${COMPILER}/main.axf: ${COMPILER}/main.o
${COMPILER}/main.axf: ${COMPILER}/rit128x96x4.o
${COMPILER}/main.axf: ${COMPILER}/startup.o
${COMPILER}/main.axf: ${ROOT}/driverlib/${COMPILER}-cm3/libdriver-cm3.a
${COMPILER}/main.axf: lm3s1968.ld
SCATTERgcc_main=lm3s1968.ld
ENTRY_main=ResetISR
