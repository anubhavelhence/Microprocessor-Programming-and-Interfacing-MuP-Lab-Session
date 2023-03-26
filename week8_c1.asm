.model tiny
.data

.code
.startup

    MOV AH, 00H
    MOV AL, 03h
    INT 10H
    ; mov ah,07h
    ; x1: int 21h
    ; cmp al,'%'
    ; jnz x1



.exit
end