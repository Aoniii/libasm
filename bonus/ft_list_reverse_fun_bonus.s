BITS 64

extern ft_list_size
extern ft_list_at

section .text
	global ft_list_reverse_fun

ft_list_reverse_fun:
	push rbp
	mov rbp, rsp
	sub rsp, 32
	test rdi, rdi
	je .end
	mov [rbp - 8], rdi
	call ft_list_size
	mov [rbp - 16], rax
	mov rdi, 2
	div rdi
	mov [rbp - 24], rax
	xor r12, r12
	jmp .loop

.loop:
	cmp r12, [rbp - 24]
	jge .end
	mov rdi, [rbp - 8]
	mov rsi, r12
	call ft_list_at
	mov r13, rax
	mov rdi, [rbp - 8]
	mov rsi, [rbp - 16]
	inc r12
	sub rsi, r12
	call ft_list_at
	mov rdi, [r13]
	mov rsi, [rax]
	mov [r13], rsi
	mov [rax], rdi
	jmp .loop

.end:
	mov rsp, rbp
	pop rbp
	xor rax, rax
	ret
