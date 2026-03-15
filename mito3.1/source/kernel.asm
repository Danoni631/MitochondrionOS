kernel_entry:
    xor ax, ax
    mov ds, ax
    mov es, ax

    mov si, msg_boot
    call print_string

.wait_input:
    mov di, buffer
    call read_line
    mov si, buffer
    cmp byte [si], 'b'
    jne .wait_input
    cmp byte [si+1], 'o'
    jne .wait_input
    jmp load_gui

%include "mito3.1/source/graphics.asm"
%include "mito3.1/source/gui.asm"
%include "mito3.1/source/print.asm"
%include "mito3.1/source/keyboard.asm"
%include "mito3.1/source/mouse.asm"
%include "mito3.1/source/cursor.asm"
%include "mito3.1/source/data.asm"