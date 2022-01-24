mov ah, 0x0e 
int 0x10
jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
mov ah, 0x0e 
int 0x10
jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
mov ah, 0
int 0x16
 char:
   db 0
mov ah, 0
int 0x16
 
mov al, [char]
buffer:
   times 10 db 0
   mov bx, buffer
   mov[bx], al
   inc bx
   mov ah, 2
   mov al, 1
   mov ch, 0
   mov cl, 2
   mov dh, 0
   mov dl, [disknum]
;  es :bx = 0x7e00
mov es, 0
mov bx, 0x7e00
int 0x13
[org 0x7c00]
kernel_location equ 0x1000
boot_disk: db 0
mov [boot_disk], dl
   times 10 db 0
   mov bx, kernel_location
   mov dh, 20
   inc bx
   mov ah, 2
   mov al, 1
   mov ch, 0
   mov cl, 2
   mov dh, 0
   mov dl, [disknum]
;  es :bx = 0x7e00
mov es, 0
mov dl, [boot_disk]
int 0x13
