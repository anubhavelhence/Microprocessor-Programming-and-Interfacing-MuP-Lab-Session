.model tiny
.486
.data
max1 db 32
act1 db ?
inp1 db 32 dup(0)
.code
.startup

    lea DX, max1
    mov ah, 0ah
    int 21h

.exit
end

