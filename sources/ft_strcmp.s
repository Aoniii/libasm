BITS 64

section .text
	global ft_strcmp

ft_strcmp:
	jmp .loop

.loop:
	mov al, byte [rdi]
	mov bl, byte [rsi]
	test al, al
	je .end
	test bl, bl
	je .end
	cmp al, bl
	jne .end
	inc rdi
	inc rsi
	jmp .loop

.end:
	movzx rax, al
	movzx rdx, bl
	sub rax, rdx
	ret
