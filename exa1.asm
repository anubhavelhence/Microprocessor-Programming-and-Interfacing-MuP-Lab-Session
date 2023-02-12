.model tiny
.data
src_data         db      03h,05h,06h,0abh,07h,08h,09h,10h,11h,12h
dst_data         db      10 dup(?)
.code
.startup
            lea     si,src_data
            lea     di,dst_data
            mov     cx, 0ah
            mov     ax,00h
    X1:     mov     al,[si]
            mov     [di],al
            inc     si
            inc     di
            dec     cx
            cmp     cx,00h
            jne     X1
.exit
end