.model tiny
.data

.code
.startup

    MOV AH, 09H
    MOV AL, '*'
    MOV BH, 00
    MOV BL, 10001001b 
    MOV CX, 01
    INT 10H

    mov ah,07h
    x1: int 21h
    cmp al,'%'
    jnz x1




.exit
end