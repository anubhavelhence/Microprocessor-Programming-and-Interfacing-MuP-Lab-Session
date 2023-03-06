.model tiny
.data
str1	db	'Enter your name: $'

max1	db	32
act1	db	?
inp1 	db	32 dup('$')

fname	db	'testing.txt',0
handle	dw	?
.code
.startup

        ; WRITE 
        ; YOUR
        ; CODE 
        ; HERE

.exit
end


