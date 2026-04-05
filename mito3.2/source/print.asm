print_string:
    mov ah, 0x0e
.l: 
    lodsb
    or al, al
    jz .d
    int 0x10
    jmp .l
.d: ret

print_string_gui:
    mov ah, 0x0e
    mov bl, 15       
.l: 
    lodsb
    or al, al
    jz .d
    int 0x10
    jmp .l
.d: ret

read_line:
    xor cx, cx
.l: 
    mov ah, 0
    int 0x16
    cmp al, 0x0D
    je .d
    mov ah, 0x0e
    int 0x10
    stosb
    jmp .l
.d: 
    mov al, 0
    stosb
    ret