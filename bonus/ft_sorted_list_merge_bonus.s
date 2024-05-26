BITS 64

section .text
	global ft_sorted_list_merge

ft_sorted_list_merge:
	push rbp
	mov rbp, rsp
	sub rsp, 24
	test rdi, rdi
	je .end
	test rsi, rsi
	je .end
	test rdx, rdx
	je .end
	mov [rbp - 8], rdi
	mov [rbp - 16], rdx
	mov r12, [rdi]
	mov r13, rsi
	xor r14, r14
	jmp .loop

.loop:
	test r12, r12
	je .list2
	test r13, r13
	je .list1
	mov rdi, [r12]
	mov rsi, [r13]
	call [rbp - 16]
	cmp rax, 0
	jl .list1
	jmp .list2

.list1:
	test r12, r12
	je .end
	mov rcx, r12
	mov r12, [r12 + 8]
	test r14, r14
	je .first
	mov [r14 + 8], rcx
	mov r14, [r14 + 8]
	jmp .loop

.list2:
	test r13, r13
	je .end
	mov rcx, r13
	mov r13, [r13 + 8]
	test r14, r14
	je .first
	mov [r14 + 8], rcx
	mov r14, [r14 + 8]
	jmp .loop

.first:
	mov r14, rcx
	mov rax, [rbp - 8]
	mov [rax], r14
	jmp .loop

.end:
	mov rsp, rbp
	pop rbp
	xor rax, rax
	test r14, r14
	je .ret
	mov [r14 + 8], rax
	ret

.ret
	ret
