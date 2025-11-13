.intel_syntax noprefix
.text
.globl randomWord
.globl mapWord
.globl guessCheck

# .globl main
# .type main, @function


# main:
#        push    rbp
#        mov     rbp, rsp
#        sub     rsp, 48
#        mov     dword ptr [rbp - 4], 0
#        xor     eax, eax
#        mov     edi, eax
#        call    time@PLT
#        mov     edi, eax
#        call    srand@PLT
#        call    randomWord
#       mov     qword ptr [rbp - 16], rax
#        mov     rsi, qword ptr [rbp - 16]
#        lea     rdi, [rip + .L.str]
#        mov     al, 0
#        call    printf@PLT
#        mov     rdi, qword ptr [rbp - 16]
#        call    mapWord
#        mov     qword ptr [rbp - 24], rax
#        mov     dword ptr [rbp - 28], 0
# .LBB0_1:
#        cmp     dword ptr [rbp - 28], 26
#        jge     .LBB0_4
#        mov     esi, dword ptr [rbp - 28]
#        add     esi, 65
#        mov     rax, qword ptr [rbp - 24]
#        movsxd  rcx, dword ptr [rbp - 28]
#        mov     edx, dword ptr [rax + 4*rcx]
#        lea     rdi, [rip + .L.str.1]
#        mov     al, 0
#        call    printf@PLT
#        mov     eax, dword ptr [rbp - 28]
#        add     eax, 1
#        mov     dword ptr [rbp - 28], eax
#        jmp     .LBB0_1
# .LBB0_4:
#        mov     rdi, qword ptr [rbp - 24]
#        call    free@PLT
#        mov     eax, dword ptr [rip + .L__const.main.word]
#        mov     dword ptr [rbp - 33], eax
#        mov     al, byte ptr [rip + .L__const.main.word+4]
#        mov     byte ptr [rbp - 29], al
#        mov     eax, dword ptr [rip + .L__const.main.guess]
#        mov     dword ptr [rbp - 38], eax
#        mov     al, byte ptr [rip + .L__const.main.guess+4]
#        mov     byte ptr [rbp - 34], al
#        mov     dword ptr [rbp - 44], 0
# .LBB0_5:
#        cmp     dword ptr [rbp - 44], 5
#        jge     .LBB0_8
#        movsxd  rax, dword ptr [rbp - 44]
#        movsx   esi, byte ptr [rbp + rax - 33]
#        lea     rdi, [rip + .L.str.2]
#        mov     al, 0
#        call    printf@PLT
#        mov     eax, dword ptr [rbp - 44]
#        add     eax, 1
#        mov     dword ptr [rbp - 44], eax
#        jmp     .LBB0_5
# .LBB0_8:
#        lea     rdi, [rip + .L.str.3]
#        mov     al, 0
#        call    printf@PLT
#        lea     rdi, [rbp - 38]
#        lea     rsi, [rbp - 33]
#        call    guessCheck
#        xor     eax, eax
#        add     rsp, 48
#        pop     rbp
#        ret

mapWord:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32
        mov     qword ptr [rbp - 8], rdi
        mov     edi, 26
        mov     esi, 4
        call    calloc@PLT
        mov     qword ptr [rbp - 16], rax
        mov     dword ptr [rbp - 20], 0
.LBB1_1:
        cmp     dword ptr [rbp - 20], 5
        jge     .LBB1_4
        mov     rax, qword ptr [rbp - 8]
        movsxd  rcx, dword ptr [rbp - 20]
        movsx   eax, byte ptr [rax + rcx]
        sub     eax, 65
        mov     dword ptr [rbp - 24], eax
        mov     rax, qword ptr [rbp - 16]
        movsxd  rcx, dword ptr [rbp - 24]
        mov     edx, dword ptr [rax + 4*rcx]
        add     edx, 1
        mov     dword ptr [rax + 4*rcx], edx
        mov     eax, dword ptr [rbp - 20]
        add     eax, 1
        mov     dword ptr [rbp - 20], eax
        jmp     .LBB1_1
.LBB1_4:
        mov     rax, qword ptr [rbp - 16]
        add     rsp, 32
        pop     rbp
        ret

guessCheck:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 64
        mov     qword ptr [rbp - 8], rdi
        mov     qword ptr [rbp - 16], rsi
        mov     rdi, qword ptr [rbp - 16]
        call    mapWord
        mov     qword ptr [rbp - 24], rax
        mov     dword ptr [rbp - 52], 0
.LBB2_1:
        cmp     dword ptr [rbp - 52], 5
        jge     .LBB2_6
        mov     rax, qword ptr [rbp - 8]
        movsxd  rcx, dword ptr [rbp - 52]
        movsx   eax, byte ptr [rax + rcx]
        mov     rcx, qword ptr [rbp - 16]
        movsxd  rdx, dword ptr [rbp - 52]
        movsx   ecx, byte ptr [rcx + rdx]
        cmp     eax, ecx
        jne     .LBB2_4
        movsxd  rax, dword ptr [rbp - 52]
        mov     dword ptr [rbp + 4*rax - 48], 2
        mov     rax, qword ptr [rbp - 24]
        mov     rcx, qword ptr [rbp - 8]
        movsxd  rdx, dword ptr [rbp - 52]
        movsx   ecx, byte ptr [rcx + rdx]
        sub     ecx, 65
        movsxd  rcx, ecx
        mov     edx, dword ptr [rax + 4*rcx]
        add     edx, -1
        mov     dword ptr [rax + 4*rcx], edx
.LBB2_4:
        jmp     .LBB2_5
.LBB2_5:
        mov     eax, dword ptr [rbp - 52]
        add     eax, 1
        mov     dword ptr [rbp - 52], eax
        jmp     .LBB2_1
.LBB2_6:
        mov     dword ptr [rbp - 56], 0
.LBB2_7:
        cmp     dword ptr [rbp - 56], 5
        jge     .LBB2_15
        movsxd  rax, dword ptr [rbp - 56]
        cmp     dword ptr [rbp + 4*rax - 48], 2
        je      .LBB2_13
        mov     rax, qword ptr [rbp - 8]
        movsxd  rcx, dword ptr [rbp - 56]
        movsx   eax, byte ptr [rax + rcx]
        sub     eax, 65
        mov     dword ptr [rbp - 60], eax
        mov     rax, qword ptr [rbp - 24]
        movsxd  rcx, dword ptr [rbp - 60]
        cmp     dword ptr [rax + 4*rcx], 0
        jle     .LBB2_11
        movsxd  rax, dword ptr [rbp - 56]
        mov     dword ptr [rbp + 4*rax - 48], 1
        mov     rax, qword ptr [rbp - 24]
        movsxd  rcx, dword ptr [rbp - 60]
        mov     edx, dword ptr [rax + 4*rcx]
        add     edx, -1
        mov     dword ptr [rax + 4*rcx], edx
        jmp     .LBB2_12
.LBB2_11:
        movsxd  rax, dword ptr [rbp - 56]
        mov     dword ptr [rbp + 4*rax - 48], 0
.LBB2_12:
        jmp     .LBB2_13
.LBB2_13:
        jmp     .LBB2_14
.LBB2_14:
        mov     eax, dword ptr [rbp - 56]
        add     eax, 1
        mov     dword ptr [rbp - 56], eax
        jmp     .LBB2_7
.LBB2_15:
        mov     dword ptr [rbp - 64], 0
.LBB2_16:
        cmp     dword ptr [rbp - 64], 5
        jge     .LBB2_25
        movsxd  rax, dword ptr [rbp - 64]
        cmp     dword ptr [rbp + 4*rax - 48], 2
        jne     .LBB2_19
        mov     rax, qword ptr [rbp - 8]
        movsxd  rcx, dword ptr [rbp - 64]
        movsx   esi, byte ptr [rax + rcx]
        lea     rdi, [rip + .L.str.24]
        mov     al, 0
        call    printf@PLT
        jmp     .LBB2_23
.LBB2_19:
        movsxd  rax, dword ptr [rbp - 64]
        cmp     dword ptr [rbp + 4*rax - 48], 1
        jne     .LBB2_21
        mov     rax, qword ptr [rbp - 8]
        movsxd  rcx, dword ptr [rbp - 64]
        movsx   esi, byte ptr [rax + rcx]
        lea     rdi, [rip + .L.str.25]
        mov     al, 0
        call    printf@PLT
        jmp     .LBB2_22
.LBB2_21:
        mov     rax, qword ptr [rbp - 8]
        movsxd  rcx, dword ptr [rbp - 64]
        movsx   esi, byte ptr [rax + rcx]
        lea     rdi, [rip + .L.str.26]
        mov     al, 0
        call    printf@PLT
.LBB2_22:
        jmp     .LBB2_23
.LBB2_23:
        jmp     .LBB2_24
.LBB2_24:
        mov     eax, dword ptr [rbp - 64]
        add     eax, 1
        mov     dword ptr [rbp - 64], eax
        jmp     .LBB2_16
.LBB2_25:
        mov     dword ptr [rbp - 68], 1          
        mov     dword ptr [rbp - 72], 0          
.LCHECK_LOOP:
        cmp     dword ptr [rbp - 72], 5
        jge     .LCHECK_END
        movsxd  rax, dword ptr [rbp - 72]
        cmp     dword ptr [rbp + 4*rax - 48], 2  
        je      .LCHECK_NEXT
        mov     dword ptr [rbp - 68], 0          
.LCHECK_NEXT:
        mov     eax, dword ptr [rbp - 72]
        add     eax, 1
        mov     dword ptr [rbp - 72], eax
        jmp     .LCHECK_LOOP
.LCHECK_END:
        mov     eax, dword ptr [rbp - 68]        
        add     rsp, 64
        pop     rbp
        ret

# .LBB2_25:
#        add     rsp, 64
#        pop     rbp
#        ret

randomNumber:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword ptr [rbp - 4], edi
        call    rand@PLT
        cdq
        idiv    dword ptr [rbp - 4]
        mov     eax, edx
        add     rsp, 16
        pop     rbp
        ret

randomWord:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 16
        mov     dword ptr [rbp - 4], 20
        mov     edi, dword ptr [rbp - 4]
        call    randomNumber
        mov     dword ptr [rbp - 8], eax
        movsxd  rcx, dword ptr [rbp - 8]
        lea     rax, [rip + randomWord.words]
        mov     rax, qword ptr [rax + 8*rcx]
        add     rsp, 16
        pop     rbp
        ret

# .L.str:
#        .asciz  "Palabra aleatoria: %s\n"
#
# .L.str.1:
#        .asciz  "%c: %d\n"
#
# .L__const.main.word:
#        .ascii  "RAMIC"
#
# .L__const.main.guess:
#        .ascii  "ADFADFAD"
#
# .L.str.2:
#        .asciz  " %c "
#
# .L.str.3:
#        .asciz  "\n"

randomWord.words:
        .quad   .L.str.4
        .quad   .L.str.5
        .quad   .L.str.6
        .quad   .L.str.7
        .quad   .L.str.8
        .quad   .L.str.9
        .quad   .L.str.10
        .quad   .L.str.11
        .quad   .L.str.12
        .quad   .L.str.13
        .quad   .L.str.14
        .quad   .L.str.15
        .quad   .L.str.16
        .quad   .L.str.17
        .quad   .L.str.18
        .quad   .L.str.19
        .quad   .L.str.20
        .quad   .L.str.21
        .quad   .L.str.22
        .quad   .L.str.23

.L.str.4:
        .asciz  "QUIRK"

.L.str.5:
        .asciz  "VEXED"

.L.str.6:
        .asciz  "JAZZY"

.L.str.7:
        .asciz  "NYMPH"

.L.str.8:
        .asciz  "WHARF"

.L.str.9:
        .asciz  "PIXEL"

.L.str.10:
        .asciz  "ZESTY"

.L.str.11:
        .asciz  "BLITZ"

.L.str.12:
        .asciz  "CRYPT"

.L.str.13:
        .asciz  "KNACK"

.L.str.14:
        .asciz  "FJORD"

.L.str.15:
        .asciz  "GUILT"

.L.str.16:
        .asciz  "OZONE"

.L.str.17:
        .asciz  "LYNCH"

.L.str.18:
        .asciz  "TWIRL"

.L.str.19:
        .asciz  "WOVEN"

.L.str.20:
        .asciz  "MIRTH"

.L.str.21:
        .asciz  "VAPID"

.L.str.22:
        .asciz  "QUILT"

.L.str.23:
        .asciz  "ZONAL"

.L.str.24:
        .asciz  "\033[42m %c \033[0m"

.L.str.25:
        .asciz  "\033[43m %c \033[0m"

.L.str.26:
        .asciz  "\033[47m %c \033[0m"
