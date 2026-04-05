vgaprint:
    pusha

    mov ah, 0x0E
    mov al, [si]

    vgaprint.loop:
        int 0x10

        inc si
        mov al, [si]

        cmp al, 0x00
        jne vgaprint.loop

    popa

    ret

vgaprintdec:
    pusha

    xor cx, cx
    xor dx, dx

    .printdecloop:
        cmp ax, 0x00
        je .printdec

        mov bx, 0x0A
        div bx

        push dx

        inc cx

        xor dx, dx
        jmp .printdecloop

    .printdec:
        cmp cx, 0x00
        je vgaprintdec.end

        pop dx

        add dx, '0'

        mov ah, 0x0E
        mov al, dl
        mov bl, 0x0F
        int 0x10

        dec cx

        jmp .printdec

vgaprintdec.end:
    popa

    ret

rainbowpallete:
    cmp al, 32
    jb addcolor

    cmp al, 55
    ja subcolor

    ret

pastelpallete:
    cmp al, 56
    jb addcolor

    cmp al, 78
    ja subcolor

    ret

vgapallete:
    cmp al, 1
    jb addcolor

    cmp al, 15
    ja subcolor

    ret

graypallete:
    cmp al, 16
    jb addcolor

    cmp al, 31
    ja subcolor

    ret

darkpallete:
    cmp al, 103
    jb addcolor

    cmp al, 126
    ja subcolor

    ret

addcolor:
    add al, 16
    jmp rainbowpallete

subcolor:
    add al, 32
    jmp rainbowpallete

vgasetcur:
    pusha

    mov ah, 0x02
    mov bh, 0x00
    int 0x10

    popa

    ret

pxmaxcolor: dw 0x00
pxmincolor: dw 0x00
pr1: dw 8.0
pr2: dw 0.0
pr3: dw 0.0
pr4: dd 12.0