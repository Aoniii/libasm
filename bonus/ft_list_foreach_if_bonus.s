BITS 64

section .text
	global ft_list_foreach_if

ft_list_foreach_if:
	test rsi, rsi
	je .end
	test rdx, rdx
	je .end
	test rcx, rcx
	je .end
	mov r12, rsi
	mov r13, rdx
	mov r14, rcx
	jmp .loop

.loop:
	test rdi, rdi
	je .end
	mov rbx, rdi
	mov rdi, [rdi]
	mov rsi, r13
	call r14
	test rax, rax
	jne .next
	mov rdi, rbx
	mov rbx, qword [rdi + 8]
	mov rdi, [rdi]
	call r12
	mov rdi, rbx
	jmp .loop

.next:
	mov rdi, rbx
	mov rbx, qword [rdi + 8]
	mov rdi, rbx
	jmp .loop

.end:
	xor rax, rax
	ret
