.model tiny
.data
fname 	db 'USER.txt', 0
handle 	dw ?
msg	db 20 dup('$')
.code
.startup
	; open file
	mov ah, 3dh
	mov al, 0h
	lea dx, fname
	int 21h
	mov handle, ax
	
	; read content into msg
	mov ah, 3fh
	mov bx, handle
	mov cx, 10
	lea dx, msg
	int 21h

	; print msg
	lea dx, msg
	mov ah, 09h
	int 21h

	; close file
	mov ah, 3eh
	int 21h
.exit
end
