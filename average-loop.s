.intel_syntax noprefix

.section .text
.global _start

_start:
  cmp rbx, rsi
  jge done
  
  mov rcx, rbx
  shl rcx, 0x3
  add rax, [rdi + rcx]

  add rbx, 0x1
  jmp _start

done:
  div rsi
