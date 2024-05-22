BITS 64

section .text
	global ft_strcmp

ft_strcmp:
	xor rcx, rcx
	jmp .loop

.loop:
	cmp byte [rdi + rcx], 0
	je .end
	cmp byte [rsi + rcx], 0
	je .end
	mov al, byte [rdi + rcx]
	cmp al, byte [rsi + rcx]
	jne .end
	inc rcx
	jmp .loop

.end:
	movzx rax, byte [rdi + rcx]
	movzx rdx, byte [rsi + rcx]
	sub rax, rdx
	ret
