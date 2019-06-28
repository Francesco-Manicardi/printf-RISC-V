riscv64-unknown-elf-as -o format_functions.o format_functions.s
riscv64-unknown-elf-as -o printf.o printf.s
riscv64-unknown-elf-as -o params.o params.s
riscv64-unknown-elf-ld -o printf printf.o format_functions.o params.o
qemu-riscv64 printf