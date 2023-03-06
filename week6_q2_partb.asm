.model tiny
.data
fname1	db 'name.txt',0
handle1	dw ?
fname2	db	'id.txt',0
handle2	dw ?
fname3	db	'splice.txt',0
handle3	dw	?

part1		db	8 dup('$')
part2		db 6 dup('$')

.code
.startup

        ; WRITE 
        ; YOUR
        ; CODE 
        ; HERE

.exit
end