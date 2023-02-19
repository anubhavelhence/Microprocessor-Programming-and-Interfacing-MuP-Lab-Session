.model tiny
.data
    myString db 12h, 34h, 56h, 42h, 78h, 9Ah   ; our string of bytes
    myStringLength db 06h                 ; calculate the length of the string
    res dw 00h

.code
.startup
    mov     al, 42h        ; set the byte we want to search for in the AL register
    mov     cx , 06h ; set the loop counter to the length of the string
    lea     di, myString  ; set the destination index to the start of the string

searchLoop:
    scasb                   ; compare the byte in AL with the byte at ES:DI, and update DI accordingly
    je      found           ; if the compared bytes are equal, jump to the "found" label
    loop    searchLoop      ; decrement ECX and continue the loop if it's not zero
    jmp     notFound        ; jump to the "notFound" label if the loop completes without finding the byte

found:
    sub     di, offset myString ; calculate the index of the found byte in the string
    mov     bx, di
    lea     si, res
    mov     [si],bx; Do something with the index, for example print it out
;     ; ...

notFound:
;     ; Handle the case where the byte was not found in the string
;     ; ...

.exit
end