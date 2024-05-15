BITS 64

section .text
	global ft_list_last

ft_list_last:
	xor rax, rax
	jmp .loop

.loop:
	cmp rdi, 0
	je .error
	cmp qword [rdi + 8], 0
	je .ret
	mov rdi, qword [rdi + 8]
	jmp .loop

.error:
	xor rax, rax
	ret

.ret:
	mov rax, rdi
	ret
