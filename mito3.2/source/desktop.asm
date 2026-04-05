draw_full_desktop:
    mov ax, 0xA000
    mov es, ax
    xor di, di
.l1: 
    mov ax, di
    shr ax, 8
    add al, 19
    stosb
    cmp di, 320*182
    jb .l1
    call draw_taskbar
    ret

draw_line_gui:
    push es
    push ax
    mov ax, 0xA000
    mov es, ax
    pop ax
    rep stosb
    pop es
    ret