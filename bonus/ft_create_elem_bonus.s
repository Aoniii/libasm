BITS 64

extern malloc

section .text
	global ft_create_elem

ft_create_elem:
	push rdi
	mov rdi, 16
	call malloc
	pop rdi
	cmp rax, 0
	je .error
	mov qword [rax], rdi
	mov qword [rax + 8], 0
	ret

.error:
	xor rax, rax
	ret
