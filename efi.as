import;'boot' / 'efi' / 'os' / 'ram' / 'kernel'
efi_mode = true
mov al, 0x6547
mov al, 0x006
read al, 0x006
buffer:
   load = ram
   load = efi
   load = boot
   load = kernel
   load = os
