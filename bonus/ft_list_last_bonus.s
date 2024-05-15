BITS 64

section .text
	global ft_list_last

ft_list_last:
	xor rax, rax
	jmp .loop

.loop:
	cmp qword [rdi + 8], 0
	je .ret
	mov rdi, qword [rdi + 8]
	jmp .loop

.ret:
	mov rax, rdi
	ret
