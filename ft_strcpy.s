BITS 64

section .text
	global ft_strcpy

ft_strcpy:
	xor rax, rax
	jmp .loop

.loop:
	cmp byte [rsi + rax], 0
	je .end
	mov rdx, [rsi + rax]
	mov [rdi + rax], rdx
	inc rax
	jmp .loop

.end:
	mov byte [rdi + rax], 0
	mov rax, rdi
	ret
