.model tiny
.data
array1 db 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h, 09h, 10h
res dw 00h
.code
.startup

    lea si, res
    lea di, array1
    mov al, 07h
    mov cx, 0ah
    cld
    REPNE SCASB
    sub di, offset array1
    mov bx, di
    dec bx
    mov [si],bx

.exit
end
