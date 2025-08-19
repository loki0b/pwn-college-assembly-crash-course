.intel_syntax noprefix

.section .text
.global _start

# x = edi, y = eax
_start:
# if [x] is 0x7f454c46 then, y = [x+4] + [x+8] + [x+12]
cmp dword ptr [edi], 0x7f454c46
jne elseif
mov eax, [edi + 4]
add eax, [edi + 8]
add eax, [edi + 12]
jmp done

elseif:
# if [x] is 0x00005A4D then, y = [x+4] - [x+8] - [x+12]
cmp dword ptr [edi], 0x00005a4d
jne else
mov eax, [edi + 4]
sub eax, [edi + 8]
sub eax, [edi + 12]
jmp done

else:
# y = [x+4] * [x+8] * [x+12]
mov eax, [edi + 4]
mul dword ptr [edi + 8]
mul dword ptr [edi + 12]
jmp done

done:
  mov rdi, rax
  mov rax, 0x3C
  syscall
