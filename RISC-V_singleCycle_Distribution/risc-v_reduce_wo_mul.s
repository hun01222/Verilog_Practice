matmul:
        beq     x31,x0,34 // 68/2
.L4:
        add     x26,x29,x29 // 2i
        add     x26,x26,x29 // 3i
        addi    x26,x26,3 // mat+3i
        addi    x27,x30,0 // j
        add     x26,x26,x27 // mat+3i+j
        addi    x27,x27,12 // vec+j
        lw      x24,0(x26)
        lw      x25,0(x27)
        mul     x24,x24,x25 // mem[mat+3i+j]*mem[vec+j]
        add     x31,x31,x24 // mem[mat+3i+j]*mem[vec+j]+k
        addi    x30,x30,1 // j+1
.L3:
        beq     x30,x23,2  // j<=2 // 4/2
        sw      x31,0(x29) // mem[result+i]=k
        addi    x31,x0,0 // k=0
        addi    x30,x0,0 // j=0
        addi    x29,x29,1 // i+1
.L2:
        beq     x29,x23,24  // i<=2 // 48/2