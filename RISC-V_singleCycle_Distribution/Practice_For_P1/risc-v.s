matmul:
        addi    sp,sp,-48 // sp : matmul
        sw      ra,44(sp)
        sw      s0,40(sp)
        addi    s0,sp,48
        sw      a0,-36(s0) // result
        sw      a1,-40(s0) // mat
        sw      a2,-44(s0) // vec
        sw      zero,-20(s0) // i=0
        j       .L2
.L5:
        sw      zero,-28(s0) // k=0
        sw      zero,-24(s0) // j=0
        j       .L3
.L4:
        lw      a4,-20(s0) //i
        mv      a5,a4 // addi rd, rs, 0 의 pseudoinst
        slli    a5,a5,1 // 2i
        add     a5,a5,a4 // 3i
        slli    a5,a5,2 // 12i
        mv      a4,a5 // 12i
        lw      a5,-40(s0) // mat
        add     a4,a5,a4 // mat+12i
        lw      a5,-24(s0) // j
        slli    a5,a5,2 // 4j
        add     a5,a4,a5 // mat+12i+4j
        lw      a4,0(a5) // mem[mat+12i+4j]
        lw      a5,-24(s0) // j
        slli    a5,a5,2 // 4j
        lw      a3,-44(s0) // vec
        add     a5,a3,a5 // vec+4j
        lw      a5,0(a5) // mem[vec+4j]
        mul     a5,a4,a5 // mem[mat+12i+4j]*mem[vec+4j]
        lw      a4,-28(s0) // k
        add     a5,a4,a5 // mem[mat+12i+4j]*mem[vec+4j]+k
        sw      a5,-28(s0) // k
        lw      a5,-24(s0) // j
        addi    a5,a5,1 // j+1
        sw      a5,-24(s0) // j
.L3:
        lw      a4,-24(s0) // j
        li      a5,2 // load immediate, i=2인가를 위해
        ble     a4,a5,.L4 // j<=2
        lw      a5,-20(s0) // i
        slli    a5,a5,2 // 4i
        lw      a4,-36(s0) // result
        add     a5,a4,a5 // result+4i
        lw      a4,-28(s0) // k
        sw      a4,0(a5) // mem[result+4i]=k
        lw      a5,-20(s0) // i
        addi    a5,a5,1 // i+1
        sw      a5,-20(s0) // i
.L2:
        lw      a4,-20(s0) // i
        li      a5,2
        ble     a4,a5,.L5 // i<=2
        nop // addi x0, x0, 0
        nop
        lw      ra,44(sp) // 마치는 연산
        lw      s0,40(sp)
        addi    sp,sp,48
        jr      ra