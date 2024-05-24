BITS 64

extern ft_create_elem

section .text
	global ft_sorted_list_insert

ft_sorted_list_insert:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	test rdi, rdi
	je .end
	test rsi, rsi
	je .end
	test rdx, rdx
	je .end
	mov [rbp - 8], rdi
	mov [rbp - 16], rsi
	mov [rbp - 24], rdx
	mov rdi, rsi
	call ft_create_elem
	test rax, rax
	je .end
	xor r12, r12
	mov r13, [rbp - 8]
	mov r13, [r13]
	mov r14, rax
	test r13, r13
	je .first
	jmp .loop

.loop:
	mov rdi, [r13]
	mov rsi, [rbp - 16]
	call [rbp - 24]
	cmp rax, 0
	jg .swap
	mov r12, r13
	mov r13, [r13 + 8]
	test r13, r13
	je .last
	jmp .loop

.swap:
	mov [r14 + 8], r13
	test r12, r12
	je .first
	mov [r12 + 8], r14
	jmp .end

.first:
	mov rax, [rbp - 8]
	mov [rax], r14
	jmp .end

.last:
	test r12, r12
	je .first
	mov [r12 + 8], r14
	jmp .end

.end:
	mov rsp, rbp
	pop rbp
	xor rax, rax
	ret
