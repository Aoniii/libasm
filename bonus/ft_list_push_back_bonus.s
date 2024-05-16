BITS 64

extern ft_create_elem
extern ft_list_last

section .text
	global ft_list_push_back

ft_list_push_back:
	cmp rdi, 0
	je .error
	push rdi
	mov rdi, rsi
	call ft_create_elem
	pop rdi
	cmp rax, 0
	je .error
	mov rdx, rax
	mov rax, [rdi]
	cmp rax, 0
	je .insert_first
	mov rdi, rax
	call ft_list_last
	cmp rax, 0
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
