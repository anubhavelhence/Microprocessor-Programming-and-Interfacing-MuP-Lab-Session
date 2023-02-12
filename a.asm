.model tiny
.data
src_str         db      03h,05h,06h,0abh,'a','A'
ex_str          dw      0fedfh, 'a'
dst_str         db      4 dup(?)
.code
.startup
                lea     si,ex_str
                lea     si,src_str
                lea     di,dst_str
                mov     cx,04h
          rep   movsb
.exit
end


