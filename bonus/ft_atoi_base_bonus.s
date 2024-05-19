BITS 64

extern ft_strlen

section .text
	global ft_atoi_base

ft_atoi_base:
	test rdi, rdi
	je .error
	push rdi
	mov rdi, rsi
	pop rsi
	test rdi, rdi
	je .error
	call ft_strlen
	cmp rax, 2
	jb .error
	mov r8, rax
	mov rdx, -1
	jmp .check_base

.check_base:
	inc rdx
	mov r9, rdx
	inc r9
	jmp .loop

.loop:
	mov al, byte [rdi + rdx]
	test al, al
	je .sign
	mov bl, byte [rdi + r9]
	cmp al, 9
	je .error
	cmp al, 10
	je .error
	cmp al, 11
	je .error
	cmp al, 12
	je .error
	cmp al, 13
	je .error
	cmp al, 32
	je .error
	cmp al, 43
	je .error
	cmp al, 45
	je .error
	test bl, bl
	je .check_base
	cmp al, bl
	je .error
	inc r9
	jmp .loop

.sign:
	xor r11, r11
	xor rdx, rdx
	xor r9, r9
	mov r10, 1
	cmp byte [rsi], 43
	je .positive
	cmp byte [rsi], 45
	je .negative
	jmp .calculate
	ret

.positive:
	inc r9
	jmp .calculate

.negative:
	inc r9
	neg r10
	jmp .calculate

.calculate:
	imul r11, r8
	add r11, rdx
	xor rdx, rdx
	mov al, byte [rsi + r9]
	test al, al
	je .out
	jmp .values

.values:
	mov bl, byte [rdi + rdx]
	test bl, bl
	je .error
	cmp al, bl
	je .next
	inc rdx
	jmp .values

.next:
	inc r9
	jmp .calculate

.error:
	xor rax, rax
	ret

.out:
	imul r11, r10
	mov rax, r11
	ret
