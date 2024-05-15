BITS 64

extern ft_create_elem

section .text
	global ft_list_size

ft_list_size:
	xor rax, rax
	jmp .loop

.loop:
	cmp rdi, 0
	je .ret
	inc rax
	mov rdi, qword [rdi + 8]
	jmp .loop

.ret:
	ret
