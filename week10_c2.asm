.model tiny
.data

.code
.startup
    MOV AL, 1
    MOV BL, 2

    CALL m2
    CALL m2
    CALL m2
    CALL m2
    RET                ; Return to the OS

    m2 PROC
    MUL BL             ; The product of AL, BL is stored in AX
    RET                ; Return to the Caller
    m2 ENDP


.exit
end
