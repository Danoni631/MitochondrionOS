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

%include "MitochondrionOS-3.3/src/gui.asm"
%include "MitochondrionOS-3.3/src/ethernet.asm"
%include "MitochondrionOS-3.3/src/apm.asm"
%include "MitochondrionOS-3.3/src/print.asm"
%include "MitochondrionOS-3.3/src/kb.asm"
%include "MitochondrionOS-3.3/src/mouse.asm"
%include "MitochondrionOS-3.3/src/cursor.asm"
%include "MitochondrionOS-3.3/src/data.asm"