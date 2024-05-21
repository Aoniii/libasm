BITS 64

section .text
	global ft_list_reverse

ft_list_reverse:
	test rdi, rdi
	je .error
	mov rsi, [rdi]
	xor rdx, rdx
	jmp .loop

.loop:
	test rsi, rsi
	je .end
	mov r10, qword [rsi + 8]
	mov qword [rsi + 8], rdx
	mov rdx, rsi
	mov rsi, r10
	jmp .loop

.error:
	xor rax, rax
	ret

.end:
	mov [rdi], rdx
	xor rax, rax
	ret
