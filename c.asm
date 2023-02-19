.model tiny
.data
dat1 db 'anubhavelhence'
dat2 db 'anubhavElhence'
res dw 00h
.code
.startup

    lea si, dat1
    lea di, dat2
    mov cx, 0dh
    cld
    REPE CMPSB
    sub di, offset dat2
    mov bx, di
    dec bx
    lea si, res
    mov [si],bx

.exit
end
