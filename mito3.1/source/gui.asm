load_gui:
    mov ax, 0x0013      ; Modo VGA 320x200
    int 0x10
    call InitMouse
    call EnableMouse
    call draw_full_desktop
    call draw_folder
    jmp gui_loop

draw_taskbar:
    mov ax, 0xA000
    mov es, ax
    mov di, 320*182
    mov al, 20        
    mov cx, 320*18
    rep stosb
    
    mov dx, 0x1701  
    mov ah, 2
    xor bh, bh
    int 0x10
    
    mov si, btn_start
    call print_string_gui
    ret

draw_start_menu:
    mov bx, 100
.l: 
    mov ax, 320
    mul bx
    mov di, ax
    mov al, 8
    mov cx, 80
    call draw_line_gui
    inc bx
    cmp bx, 182
    jne .l
    mov dx, 0x0D01
    mov ah, 2
    int 0x10
    mov si, menu_items
    call print_string
    ret

draw_notepad:
    mov bx, 40
.l: 
    mov ax, 320
    mul bx
    add ax, 60
    mov di, ax
    mov al, 15
    mov cx, 200
    call draw_line_gui
    inc bx
    cmp bx, 140
    jne .l
    mov dx, 0x0608
    mov ah, 2
    int 0x10
    mov si, txt_note
    call print_string
    ret

draw_cmd_window:
    mov bx, 50
.l: 
    mov ax, 320
    mul bx
    add ax, 100
    mov di, ax
    mov al, 0
    mov cx, 120
    call draw_line_gui
    inc bx
    cmp bx, 110
    jne .l
    mov dx, 0x070D
    mov ah, 2
    int 0x10
    mov si, txt_cmd
    call print_string
    ret

draw_folder:
    mov bx, 25
.l: mov ax, 320
    mul bx
    add ax, 25
    mov di, ax
    mov al, 44
    mov cx, 15
    mov dx, 0xA000
    mov es, dx
    rep stosb
    inc bx
    cmp bx, 38
    jne .l
    mov dx, 0x0503
    mov ah, 2
    int 0x10
    mov si, txt_system
    call print_string
    ret