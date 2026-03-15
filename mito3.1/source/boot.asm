[BITS 16]
[ORG 0x7C00]

boot_start:
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00

    mov ax, 0x0003
    int 0x10

    mov ah, 0x02    
    mov al, 6
    mov ch, 0
    mov cl, 2
    mov dh, 0
    mov bx, kernel_entry 
    int 0x13
    
    jmp kernel_entry

times 510-($-$$) db 0
dw 0xAA55

%include "mito3.1/source/kernel.asm"