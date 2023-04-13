.model tiny
.data

.code
.startup

    CALL m1
    MOV AX,2h
    RET

    m1 PROC
        MOV BX,5h
    RET
    m1 ENDP


.exit
end