matmul:
        j       .L2
.L4:
        addi    x26,x29,0 // lw      a4,-20(s0) //i
        slli    x26,x26,1 // slli    a5,a5,1 // 2i
        add     x26,x26,x29 // add     a5,a5,a4 // 3i
        slli    x26,x26,2 // slli    a5,a5,2 // 12i
        addi    x26,x26,12 // add     a4,a5,a4 // mat+12i
        addi    x27,x30,0 // lw      a5,-24(s0) // j
        slli    x27,x27,2 // slli    a5,a5,2 // 4j
        add     x26,x26,x27 // add     a5,a4,a5 // mat+12i+4j
        addi    x27,x27,48// add     a5,a3,a5 // vec+4j
        mul     a5,a4,a5 // mem[mat+12i+4j]*mem[vec+4j]
        add     a5,a4,a5 // mem[mat+12i+4j]*mem[vec+4j]+k
        sw      a5,-28(s0) // k
        addi    x30,x30,1// addi    a5,a5,1 // j+1
.L3:
        beq     x30,3,.L4 // ble     a4,a5,.L4 // j<=2
        addi    x26,x29,0// lw      a5,-20(s0) // i
        slli    x26,x26,2// slli    a5,a5,2 // 4i
        sw      x11,0(x26) // sw      a4,0(a5) // mem[result+4i]=k
        addi    x29,x29,1 // addi    a5,a5,1 // i+1
.L2:
        beq     x29,3,.L3 // ble     a4,a5,.L5 // i<=2