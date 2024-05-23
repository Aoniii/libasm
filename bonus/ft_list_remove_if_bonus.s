BITS 64

extern free

section .text
	global ft_list_remove_if

ft_list_remove_if:
	push rbp
	mov rbp, rsp
	sub rsp, 40
	test rdi, rdi
	je .end
	test rsi, rsi
	je .end
	test rdx, rdx
	je .end
	test rcx, rcx
	je .end
	mov [rbp - 8], rdi
	mov [rbp - 16], rsi
	mov [rbp - 24], rdx
	mov [rbp - 32], rcx
	xor r12, r12
	mov r13, [rdi]
	jmp .loop

.loop:
	test r13, r13
	je .end
	mov rdi, [r13]
	mov rsi, [rbp - 16]
	call [rbp - 24]
	test rax, rax
	je .free
	mov r12, r13
	mov r13, [r13 + 8]
	jmp .loop

.free:
	mov r14, [r13 + 8]
	mov rdi, [r13]
	call [rbp - 32]
	mov rdi, r13
	call free
	test r12, r12
	je .first
	mov [r12 + 8], r14
	mov r13, r14
	jmp .loop

.first:
	mov rdi, [rbp - 8]
	mov [rdi], r14
	mov r13, r14
	jmp .loop

.end:
	mov rsp, rbp
	pop rbp
	xor rax, rax
	ret
