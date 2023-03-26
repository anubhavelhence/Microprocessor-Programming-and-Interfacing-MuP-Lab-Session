.model tiny
.data

.code
.startup

    mov ah, 0
    Mov al, 12h
    int 10h ; set graphics video mode.

    mov ah, 0ch
    mov al, 00001100b
    mov cx, 10
    mov dx, 20
    int 10h ; set pixel.

    mov ah,07h
    x1: int 21h
    cmp al,'%'
    jnz x1



.exit
end