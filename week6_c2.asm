.model tiny
.data
fname 	db 'sec.txt',0
handle 	dw ?
msg 	db 'MuP docks!'
.code
.startup

    ; Create a file if it
    ; is not existing
    mov ah, 3ch
	lea dx, fname
	mov cl, 1h
	int 21h
	mov handle, ax

	; open file
	mov ah, 3dh
	mov al, 1h
	lea dx, fname
	int 21h
	mov handle, ax

	; write msg to file
	mov ah, 40h
	mov bx, handle
	mov cx,	10
	lea dx, msg
	int 21h

	; close file
	mov ah, 3eh
	int 21h
.exit
end
