.section .init
.globl _start
_start:

// base address of GPIO controller
ldr w0, =0x20200000

// select pin, move pin address into w1, save it to memory
mov w1, #1
lsl w1, w1, #18
str w1, [x0, #4]

// turn pin 16 off
mov w1, #1
lsl w1, w1, #16
str w1, [x0, #40]

loop$:
b loop$
