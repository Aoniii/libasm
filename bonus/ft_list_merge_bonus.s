BITS 64

extern ft_list_last

section .text
	global ft_list_merge

ft_list_merge:
	test rdi, rdi
	je .end
	mov r12, rdi
	mov r13, rsi
	mov rdi, [rdi]
	test rdi, rdi
	je .null
	call ft_list_last
	mov [rax + 8], r13
	jmp .end

.null:
	mov [r12], r13
	jmp .end

.end:
	xor rax, rax
	ret
