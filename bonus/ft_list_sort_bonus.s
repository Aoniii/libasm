BITS 64

section .text
	global ft_list_sort

ft_list_sort:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	test rdi, rdi
	je .end
	test rsi, rsi
	je .end
	mov [rbp - 8], rdi
	mov [rbp - 16], rsi
	xor r12, r12
	mov r13, [rdi]
	test r13, r13
	je .end
	jmp .loop

.loop:
	mov r14, [r13 + 8]
	test r14, r14
	je .end
	mov rdi, [r13]
	mov	rsi, [r14]
	call [rbp - 16]
	cmp rax, 0
	jg .swap
	mov r12, r13
	mov r13, r14
	jmp .loop

.swap:
	mov rax, [r14 + 8]
	mov [r13 + 8], rax
	mov [r14 + 8], r13
	test r12, r12
	je .first
	mov [r12 + 8], r14
	jmp .redo

.first:
	mov rax, [rbp - 8]
	mov [rax], r14
	jmp .redo

.redo:
	xor r12, r12
	mov rax, [rbp - 8]
	mov r13, [rax]
	jmp .loop

.end:
	mov rsp, rbp
	pop rbp
	xor rax, rax
	ret
