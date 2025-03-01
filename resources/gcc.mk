# Set it to yes if you are using the sifive precompiled GCC pack
SIFIVE_GCC_PACK ?= no

ifeq ($(SIFIVE_GCC_PACK),yes)
	RISCV_NAME ?= riscv64-unknown-elf
	RISCV_PATH ?= /opt/riscv/
else
	RISCV_NAME ?= riscv32-unknown-elf
	ifeq ($(MULDIV),yes)
		RISCV_PATH ?= /opt/rv32im/
	else
		RISCV_PATH ?= /opt/rv32i/
	endif
endif

MABI=ilp32
MARCH := rv32i
ifeq ($(MULDIV),yes)
	MARCH := $(MARCH)m
endif
ifeq ($(COMPRESSED),yes)
	MARCH := $(MARCH)ac
endif

CFLAGS += -march=$(MARCH)_zicsr  -mabi=$(MABI)
LDFLAGS += -march=$(MARCH)_zicsr  -mabi=$(MABI)
