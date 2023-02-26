.model tiny

; START FILLING DATA ---
.data
array1  db      91h,02h,083h,0ffh,075h,06h,047h,012h,076h
RESULT  db      ?

; START FILLING CODE ---
.code
.startup
                lea     bx,RESULT       ; loads result byte's address to BX
                lea     bx,array1       ; loads array address to BX (overwrites it)
                mov     cl, 0ah         ; initiates a counter of 10 size
                mov     al,[bx]         ; moves current array byte to AL
                dec     cl              ; decrements CL (hence CX) by 1
                inc     bx              ; increments BX by 1

        X2:     CMP     al, [bx]        ; compares the current array byte to byte stored in AL
                JGE     SKIP            ; if AL is not small (is greater or equal to [BX]) then jump to SKIP
                MOV     al, [bx]        ; else move [BX] to AL

        SKIP:   INC     bx              ; increment BX by 1
                DEC     cl              ; decrement CL by 1
                JNZ     X2              ; if counter is not zero yet, jump back to X2
                MOV     RESULT,AL       ; else move the answer in AL to RESULT
.exit
end


