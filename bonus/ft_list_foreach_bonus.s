BITS 64

section .text
	global ft_list_foreach

ft_list_foreach:
	test rsi, rsi
	je .end
	mov r12, rsi
	jmp .loop

.loop:
	test rdi, rdi
	je .end
	mov rbx, qword [rdi + 8]
	mov rdi, [rdi]
	call r12
	mov rdi, rbx
	jmp .loop

.end:
	xor rax, rax
	ret
