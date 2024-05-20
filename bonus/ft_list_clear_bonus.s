BITS 64

extern free

section .text
	global ft_list_clear

ft_list_clear:
	test rsi, rsi
	je .end
	mov r12, rsi
	jmp .loop

.loop:
	test rdi, rdi
	je .end
	mov rbx, qword [rdi + 8]
	mov r13, rdi
	mov rdi, [r13]
	call free
	mov rdi, r13
	call r12
	mov rdi, rbx
	jmp .loop

.end:
	xor rax, rax
	ret
