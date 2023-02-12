.model tiny
.data
src_str         db      03h,05h,06h,0abh,07h,08h,09h,10h,11h,12h
dst_str         db      10 dup(?)
.code
.startup
                lea     si,src_str
                lea     di,dst_str
                mov     cx,0ah
                mov     ax,00h
        x1:     mov     al,[si]
                mov     [di],al
                inc     si
                inc     di
                dec     cx
                cmp     cx,00h
                jne     x1
.exit
end


