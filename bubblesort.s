.text
.global _main
.align 4
      
_main:
        adrp x8, _main
        add x0, x8, 0x1000
        mov x9, x0
        mov x4, 0
loop1:
        mov x3, 0
        mov x5, 0
        mov x6, 0
loop2:
        add x5, x0, x3
        add x6, x5, 0x1
        ldrb w1, [x5]
        ldrb w2, [x6]
        cmp w1, w2
        bge no_swap
        mov w7, w1
        mov w1, w2
        mov w2, w7
        strb w1, [x5, 0]
        strb w2, [x6, 0]
no_swap:
        add x3, x3, 1
        cmp x3, 7
        bne loop2

        add x4, x4, 1
        cmp x4, 7
        bne loop1

        ldr x0, [x9]
        brk 0

.data

array:

      .byte 0x08
      .byte 0x05
      .byte 0x03
      .byte 0x02
      .byte 0x07
      .byte 0x01
      .byte 0x06
      .byte 0x04
