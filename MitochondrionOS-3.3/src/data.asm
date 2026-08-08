color_offset db 0
msg_boot  db 'MitochondrionOS v3.3', 13, 10, 'Type boot: ', 0
btn_start db '[START]        Version 3.3', 0
MouseX    dw 160
MouseY    dw 100
mousebmp  db 0x80, 0xC0, 0xE0, 0xF0, 0xF8, 0xFC, 0xFE, 0xF8, 0xDC, 0x8E, 0x06
txt_system   db "system", 0
txt_note     db "Notepad.exe", 0
txt_ether    db "Ethernet was inited", 0
txt_cmd      db "Mit >_", 0
txt_about    db "Arch: x86 | Kernel: 3.3", 0 
menu_items   db "Admin", 0
buffer    times 16 db 0

times 4096-($-$$) db 0