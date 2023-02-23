.model tiny

; START FILLING DATA ---
.data
data1 db '[',']','*'
data2 dw 9876h, 'a', 'A', '0'
data3 dw 0fefeh
array dw 01,02,03,04,05,06,07,08,09

; START FILLING CODE ---
.code
.startup
    mov BX,data2        ; moves data2 (9876) to BX
    mov CX,data3        ; moves data3 (FEFE) to CX
    mov data1,BL        ; moves BL (76: lower in BX) to data1
    mov DL,data1        ; moves data1 (76) to DL
    mov DI,0002h        ; moves 02 to DI immediately
    mov AX,array[DI]    ; moves [array + DI] (here 02 only) to AX
.exit
end