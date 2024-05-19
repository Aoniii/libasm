BITS 64

extern ft_create_elem

section .text
	global ft_list_push_strs

ft_list_push_strs:
	xor rax, rax
	mov r12, rdi
	mov r13, rsi
	jmp .loop

.loop:
	mov rdi, [r13]
	cmp r12, 0
	je .end
	dec r12
	mov rbx, rax
	call ft_create_elem
	test rax, rax
	je .error
	mov qword [rax + 8], rbx
	add r13, 8
	jmp .loop
	ret

.end:
	ret

.error:
	xor rax, rax
	ret
