.model tiny
.data
fname	db 'test.txt',0
handle	dw ?
.code
.startup
	mov ah, 3ch
	lea dx, fname
	mov cl, 1h
	int 21h
	mov handle, ax
.exit
end




