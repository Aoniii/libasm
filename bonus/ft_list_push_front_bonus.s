BITS 64

extern ft_create_elem

section .text
	global ft_list_push_front

ft_list_push_front:
	push rdi
	mov rdi, rsi
	call ft_create_elem
	pop rdi
	cmp rax, 0
	je .error
	mov rsi, [rdi]
	mov qword [rax + 8], rsi
	mov [rdi], rax
	xor rax, rax
	ret

.error:
	xor rax, rax
	ret
