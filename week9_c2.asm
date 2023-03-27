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

    ;SET DISPLAY MODE
    MOV AH, 00H
    MOV AL, 12H
    INT 10H

    ;SETTING CURSOR POS
    MOV AH, 02H
    MOV DH, 20
    MOV DL, 20
    MOV BH, 00
    INT 10H

    ;INITIALISING PARAMETERS
    MOV rowstr, 10
    MOV rowend, 410
    MOV colmstr, 10
    MOV colmend, 210
    MOV cnt, 00

    ;PAINTING FIRST BOX
    PAINT1:
    MOV SI, rowstr ; ROW START
    COLM1:
    MOV CX, colmend ; COLM END
    ROW1:
    DEC CX
    MOV DI, CX
    PUSH CX
    MOV AH, 0Ch
    MOV AL, 1111b
    MOV CX, DI
    MOV DX, SI
    INT 10h
    POP CX
    CMP CX, colmstr ; COLM START
    JNZ ROW1
    INC SI
    MOV AX, rowend ; ROW END
    CMP SI, AX
    JNZ COLM1

    ;CHANGING VERTICES
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
    JGE TERM

    ;PAINTING SECOND BOX
    MOV SI, rowstr ; ROW START
    COLM2:
    MOV CX, colmend ; COLM END
    ROW2:
    DEC CX
    MOV DI, CX
    PUSH CX
    MOV AH, 0Ch
    MOV AL, 1100b
    MOV CX, DI
    MOV DX, SI
    INT 10h
    POP CX
    CMP CX, colmstr ; COLM START
    JNZ ROW2
    INC SI
    MOV AX, rowend ; ROW END
    CMP SI, AX
    JNZ COLM2

    ;CHANGING VERTICES
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

    JMP PAINT1

    END1:
    MOV AH, 07H
    INT 21h
    CMP AL, "%"
    JNZ END1

    TERM:
    MOV AH, 4CH
    INT 21H

.exit
end
