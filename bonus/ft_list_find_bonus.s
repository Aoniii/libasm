BITS 64

section .text
	global ft_list_find

ft_list_find:
	test rsi, rsi
	je .error
	test rdx, rdx
	je .error
	mov r12, rsi
	mov r13, rdx
	jmp .loop

.loop:
	test rdi, rdi
	je .error
	mov rbx, rdi
	mov rdi, [rdi]
	mov rsi, r12
	call r13
	test rax, rax
	je .end
	mov rdi, rbx
	mov rbx, qword [rdi + 8]
	mov rdi, rbx
	jmp .loop

.end:
	mov rax, rbx
	ret

.error:
	xor rax, rax
	ret
