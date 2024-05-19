BITS 64

extern ft_create_elem
extern ft_list_last

section .text
	global ft_list_push_back

ft_list_push_back:
	test rdi, rdi
	je .error
	push rdi
	mov rdi, rsi
	call ft_create_elem
	pop rdi
	test rax, rax
	je .error
	mov rdx, rax
	mov rax, [rdi]
	test rax, rax
	je .insert_first
	mov rdi, rax
	call ft_list_last
	test rax, rax
	je .error
	mov qword [rdi + 8], rdx
	xor rax, rax
	ret

.insert_first:
	mov [rdi], rdx
	xor rax, rax
	ret

.error:
	xor rax, rax
	ret
