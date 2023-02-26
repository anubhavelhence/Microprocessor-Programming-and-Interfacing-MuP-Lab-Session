.model tiny

; START FILLING DATA ---
.data
src_str         db      03h,05h,06h,0abh,07h,08h,09h,10h,11h,12h
dst_str         db      10 dup(?)

; START FILLING CODE ---
.code
.startup
                lea     si,src_str      ; loads source string address to SI
                lea     di,dst_str      ; loads dest string address to SI
                mov     cx,0ah          ; initiates a 10size counter
                mov     ax,00h          ; initiates AX to 00

        x1:     mov     al,[si]         ; moves current byte pointed by SI to AL
                mov     [di],al         ; moves data byte in AL to byte pointed by DI
                inc     si              ; inrements SI by 1
                inc     di              ; inrements DI by 1
                dec     cx              ; decrements CX by 1
                cmp     cx,00h          ; compares CX to 00
                jne     x1              ; if counter is not zero yet, jumps back to X1 and continues
.exit
end


