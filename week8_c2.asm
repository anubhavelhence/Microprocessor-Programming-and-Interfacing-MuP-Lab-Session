.model tiny
.data

.code
.startup

    MOV AH, 02H 
    MOV DL, 40
    MOV DH, 0
    MOV BH, 0 
    INT 10H 


.exit
end