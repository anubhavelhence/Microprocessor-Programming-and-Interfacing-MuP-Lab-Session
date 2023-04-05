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

    ; Set cursor position to (20, 20)
    MOV AH, 02H
    MOV DH, 20
    MOV DL, 20
    MOV BH, 00
    INT 10H

    ; Initialize parameters for box drawing
    MOV rowstr, 10
    MOV rowend, 410
    MOV colmstr, 10
    MOV colmend, 210
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

    ; Change vertices for the next box
    LEA SI, rowstr
    ADD WORD PTR[SI], 10
    LEA SI, rowend
    SUB WORD PTR[SI], 10
    LEA SI, colmstr
    ADD WORD PTR[SI], 10
    LEA SI, colmend
    SUB WORD PTR[SI], 10
    LEA SI, cnt
    INC BYTE PTR[SI]

    MOV AL, 07h
    MOV BL, cnt
    CMP BL, AL
    JGE TERM ; Terminate if cnt >= 7

    ; Paint the second box
    MOV SI, rowstr ; Row start
    COLM2:
    MOV CX, colmend ; Column end
    ROW2:
    DEC CX
    MOV DI, CX
    PUSH CX
    MOV AH, 0Ch
    MOV AL, 1100b ; Color for second box
    MOV CX, DI
    MOV DX, SI
    INT 10h
    POP CX
    CMP CX, colmstr ; Column start
    JNZ ROW2
    INC SI
    MOV AX, rowend ; Row end
    CMP SI, AX
    JNZ COLM2

    ; Change vertices for the next box
    LEA SI, rowstr
    ADD WORD PTR[SI], 10
    LEA SI, rowend
    SUB WORD PTR[SI], 10
    LEA SI, colmstr
    ADD WORD PTR[SI], 10
    LEA SI, colmend
    SUB WORD PTR[SI], 10
    LEA SI, cnt
    INC BYTE PTR[SI]

    JMP PAINT1 ; Continue painting boxes

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
