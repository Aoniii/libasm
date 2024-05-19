BITS 64

extern __errno_location
extern malloc
extern ft_strlen
extern ft_strcpy

section .text
	global ft_strdup

ft_strdup:
	call ft_strlen
	push rdi
	mov rdi, rax
	inc rdi
	call malloc
	test rax, rax
	je .error
	mov rdi, rax
	pop rsi
	call ft_strcpy
	ret

.error:
	neg rax
	mov rdi, rax
	call __errno_location
	mov [rax], rdi
	mov rax, -1
	ret
