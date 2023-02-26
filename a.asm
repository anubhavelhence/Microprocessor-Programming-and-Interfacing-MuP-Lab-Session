.model tiny

; START FILLING DATA ---
.data
src_str     db      03h,05h,06h,0abh,'a','A'
ex_str      dw      0fedfh, 'a'
dst_str     db      4 dup(?) ; creates four emplty spaces

; START FILLING CODE ---
.code
.startup
            lea     si,ex_str       ; loads the address of extra string to SI, nowonwards you may simply use SI to access the string

            lea     si,src_str      ; loads source string's address to SI
            lea     di,dst_str      ; loads destination string's address to DI
            mov     cx,04h          ; initiates a counter of four
      rep   movsb                   ; increments SI and DI and decrements CX by 1(b)/2(w)/4(d) after moving
.exit

; Note that this code did not copy the whole src_str because we counted only till 4 bytes (CX was 04h)
end


