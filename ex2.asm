.model tiny
.data
array1         db      91h,02h,083h,0ffh,075h,06h,047h,012h,076h
RESULT            db      ?
.code
.startup
                lea     bx,RESULT
                lea     bx,array1
                mov     cl, 0ah
                mov     al,[bx]
                dec     cl
                inc     bx
        X2:     CMP     al, [bx]
                JGE     SKIP
                MOV     al, [bx]
        SKIP:   INC     bx
                DEC     cl
                JNZ     X2
                MOV     RESULT,AL
.exit
end


