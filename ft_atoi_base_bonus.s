BITS 64

extern ft_strlen

section .text
	global ft_atoi_base

ft_atoi_base:
	push rdi
	mov rdi, rsi
	pop rsi
	cmp rdi, 0
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
	cmp al, 0
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
	cmp bl, 0
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
	cmp al, 0
	je .out
	jmp .values

.values:
	mov bl, byte [rdi + rdx]
	cmp bl, 0
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
