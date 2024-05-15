BITS 64

section .text
	global ft_strcpy

ft_strcpy:
	xor rdx, rdx
	jmp .loop

.loop:
	cmp byte [rsi + rdx], 0
	je .end
	mov al, [rsi + rdx]
	mov [rdi + rdx], al
	inc rdx
	jmp .loop

.end:
	mov byte [rdi + rdx], 0
	mov rax, rdi
	ret
