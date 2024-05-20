BITS 64

section .text
	global ft_list_at

ft_list_at:
	jmp .loop

.loop:
	test rdi, rdi
	je .error
	test rsi, rsi
	je .ret
	dec rsi
	mov rdi, qword [rdi + 8]
	jmp .loop

.error:
	xor rax, rax
	ret

.ret:
	mov rax, rdi
	ret
