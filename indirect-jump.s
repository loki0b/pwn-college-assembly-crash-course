.intel_syntax noprefix

.section .text
.global _start

_start:
  cmp rdi, 0x3
  jg else # jump to else if rdi > 3

  shl rdi, 0x3
  add rsi, rdi
  jmp [rsi]

else:
  mov rax, 0x4
  shl rax, 0x3  # multiply rax by 8
  add rsi, rax
  jmp [rsi]
