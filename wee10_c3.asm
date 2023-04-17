.model small
.data

.code
.startup
    MOV AX, 1212h
    MOV BX, 3434h

    PUSH AX
    PUSH BX

    POP AX
    POP BX



.exit
end
