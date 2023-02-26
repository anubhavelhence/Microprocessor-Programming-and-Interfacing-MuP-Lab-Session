.model tiny

; START FILLING DATA ---
.data
src_str     db      03h,05h,06h,0abh,07h,08h,09h,10h,11h,12h
dst_str     db      10 dup(?)

; START FILLING CODE ---
.code
.startup
            lea     si,src_str      ; loads source string address to SI
            lea     di,dst_str      ; loads destination string address to DI
            mov     cx,0ah          ; initiates a counter of size 0Ah (10d) 
      rep   movsb                   ; repeats movsb until 10 iterations
.exit
end


