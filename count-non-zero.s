.intel_syntax noprefix

.section .text
.global _start

_start:
  cmp rdi, 0x0
  je exit
  
  jmp while

while:
  cmp qword ptr [rdi + rax], 0x0
  je done
  
  add rax, 0x1
  jmp while

exit:
  mov rax, 0x0

done:
