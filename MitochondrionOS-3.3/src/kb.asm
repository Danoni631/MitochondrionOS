gui_loop:
    hlt                 
    
    mov ah, 1
    int 0x16
    jz gui_loop         

    mov ah, 0
    int 0x16            
    cmp al, 'm'
    je .show_menu
    cmp al, 'a'
    je .show_about
    cmp al, 'n'
    je .show_notes
    cmp al, 'c'
    je .show_cmd
    cmp al, 'r'
    je .reboot
    cmp al, 'p'
    je .poweroff
    cmp al, 'e'
    je .ethernet
    cmp al, 'b'      
    je load_gui
    jmp gui_loop

.show_menu:
    call draw_start_menu
    jmp gui_loop
.show_notes:
    call draw_notepad
    jmp gui_loop
.show_cmd:
    call draw_cmd_window
    jmp gui_loop
.show_about:
    call draw_about_window
    jmp gui_loop
.reboot:
    call restart
.poweroff:
    call shutdown
.ethernet:
    call rtl8139_init
    call rtl8139_send_packet