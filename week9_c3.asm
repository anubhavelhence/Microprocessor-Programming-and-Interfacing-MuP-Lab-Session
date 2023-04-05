.model tiny
.386
.data
inp1 db 32 DUP(0)
rowstr dw ?
rowend dw ?
colmstr dw ?
colmend dw ?
cnt db ?

.code
.startup

    ; Set display mode to 640x480 16 colors
    MOV AH, 00H
    MOV AL, 12H
    INT 10H

    ; Set cursor position to (25, 25)
    MOV AH, 02H
    MOV DH, 10
    MOV DL, 10
    MOV BH, 00
    INT 10H

    ; Initialize parameters for box drawing
    MOV rowstr, 10
    MOV rowend, 410
    MOV colmstr, 10
    MOV colmend, 410
    MOV cnt, 00

    ; Paint the first box
    PAINT1:
    MOV SI, rowstr ; Row start
    COLM1:
    MOV CX, colmend ; Column end
    ROW1:
    DEC CX
    MOV DI, CX
    PUSH CX
    MOV AH, 0Ch
    MOV AL, 1111b ; Color for first box
    MOV CX, DI
    MOV DX, SI
    INT 10h
    POP CX
    CMP CX, colmstr ; Column start
    JNZ ROW1
    INC SI
    MOV AX, rowend ; Row end
    CMP SI, AX
    JNZ COLM1


    END1:
    MOV AH, 07H
    INT 21h
    CMP AL, "%"
    JNZ END1 ; Loop until '%' is received

    TERM:
    MOV AH, 4CH ; Terminate program
    INT 21H

.exit
end
