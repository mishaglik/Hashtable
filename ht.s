	.file	"Hashtable.cpp"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"void deleteNextHashtableNode(HashtableList*, HashtableListNodeIt)"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"src/Hashtable/Hashtable.cpp"
.LC2:
	.string	"htlist->data[node].next != 0"
	.text
	.p2align 4
	.type	_Z23deleteNextHashtableNodeP13HashtableListm.part.0, @function
_Z23deleteNextHashtableNodeP13HashtableListm.part.0:
.LFB5532:
	.cfi_startproc
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	lea	rcx, .LC0[rip]
	mov	edx, 139
	lea	rsi, .LC1[rip]
	lea	rdi, .LC2[rip]
	call	__assert_fail@PLT
	.cfi_endproc
.LFE5532:
	.size	_Z23deleteNextHashtableNodeP13HashtableListm.part.0, .-_Z23deleteNextHashtableNodeP13HashtableListm.part.0
	.section	.rodata.str1.8
	.align 8
.LC3:
	.string	"void expandHashtableList(HashtableList*)"
	.section	.rodata.str1.1
.LC4:
	.string	"htlist != NULL"
.LC5:
	.string	"htlist->capacity != 0"
	.text
	.p2align 4
	.globl	_Z19expandHashtableListP13HashtableList
	.type	_Z19expandHashtableListP13HashtableList, @function
_Z19expandHashtableListP13HashtableList:
.LFB5515:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	test	rdi, rdi
	je	.L13
	mov	r12, QWORD PTR 16[rdi]
	mov	rbp, rdi
	test	r12, r12
	je	.L14
	mov	rsi, r12
	mov	edi, 32
	sal	r12, 6
	sal	rsi, 7
	call	aligned_alloc@PLT
	mov	rdx, r12
	xor	esi, esi
	lea	rdi, [rax+r12]
	mov	rbx, rax
	call	memset@PLT
	mov	r13, QWORD PTR 24[rbp]
	mov	rdx, r12
	mov	rdi, rbx
	mov	rsi, r13
	call	memcpy@PLT
	mov	rdi, r13
	call	free@PLT
	mov	rdx, QWORD PTR 16[rbp]
	mov	QWORD PTR 24[rbp], rbx
	mov	rax, rdx
	lea	rdi, [rdx+rdx]
	sal	rax, 6
	lea	rsi, -1[rdi]
	mov	QWORD PTR 40[rbx+rax], 0
	lea	rax, 1[rdx]
	cmp	rax, rdi
	jb	.L8
	jmp	.L7
	.p2align 4,,10
	.p2align 3
.L15:
	add	rax, 1
.L8:
	mov	rcx, rdx
	sal	rcx, 6
	mov	QWORD PTR 104[rbx+rcx], rdx
	mov	rdx, rax
	cmp	rsi, rax
	jne	.L15
.L7:
	vmovq	xmm1, rsi
	vpinsrq	xmm0, xmm1, rdi, 1
	vmovdqu	XMMWORD PTR 8[rbp], xmm0
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
.L13:
	.cfi_restore_state
	lea	rcx, .LC3[rip]
	mov	edx, 60
	lea	rsi, .LC1[rip]
	lea	rdi, .LC4[rip]
	call	__assert_fail@PLT
.L14:
	lea	rcx, .LC3[rip]
	mov	edx, 61
	lea	rsi, .LC1[rip]
	lea	rdi, .LC5[rip]
	call	__assert_fail@PLT
	.cfi_endproc
.LFE5515:
	.size	_Z19expandHashtableListP13HashtableList, .-_Z19expandHashtableListP13HashtableList
	.section	.rodata.str1.8
	.align 8
.LC6:
	.string	"HashtableListNodeIt insertHashtableListNode(HashtableList*, HashtableListNodeIt, const hkey_t*, const data_t*)"
	.section	.rodata.str1.1
.LC7:
	.string	"data != NULL"
	.text
	.p2align 4
	.globl	_Z23insertHashtableListNodeP13HashtableListmPK4wordPKm
	.type	_Z23insertHashtableListNodeP13HashtableListmPK4wordPKm, @function
_Z23insertHashtableListNodeP13HashtableListmPK4wordPKm:
.LFB5514:
	.cfi_startproc
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	test	rdi, rdi
	je	.L25
	mov	r8, QWORD PTR 8[rdi]
	mov	rbx, rdi
	mov	rbp, rsi
	mov	r12, rdx
	mov	r13, rcx
	test	r8, r8
	je	.L26
.L18:
	mov	rax, r8
	sal	rax, 6
	add	rax, QWORD PTR 24[rbx]
	mov	rdx, QWORD PTR 40[rax]
	mov	QWORD PTR 8[rbx], rdx
	test	r12, r12
	je	.L23
	test	r13, r13
	je	.L27
	mov	rdx, QWORD PTR 0[r13]
	mov	QWORD PTR 32[rax], rdx
	vmovdqu	xmm0, XMMWORD PTR [r12]
	xor	edx, edx
	vmovdqu	XMMWORD PTR [rax], xmm0
	vmovdqu	xmm1, XMMWORD PTR 16[r12]
	vmovdqu	XMMWORD PTR 16[rax], xmm1
.L19:
	mov	DWORD PTR 48[rax], edx
	test	rbp, rbp
	je	.L28
	sal	rbp, 6
	add	rbp, QWORD PTR 24[rbx]
	mov	rdx, QWORD PTR 40[rbp]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, r8
	mov	QWORD PTR 40[rbp], r8
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L28:
	.cfi_restore_state
	mov	rdx, QWORD PTR [rbx]
	mov	QWORD PTR 40[rax], rdx
	mov	rax, r8
	mov	QWORD PTR [rbx], r8
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	.cfi_restore_state
	call	_Z19expandHashtableListP13HashtableList
	mov	r8, QWORD PTR 8[rbx]
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L23:
	mov	edx, 1
	jmp	.L19
.L25:
	lea	rcx, .LC6[rip]
	mov	edx, 26
	lea	rsi, .LC1[rip]
	lea	rdi, .LC4[rip]
	call	__assert_fail@PLT
.L27:
	lea	rcx, .LC6[rip]
	mov	edx, 38
	lea	rsi, .LC1[rip]
	lea	rdi, .LC7[rip]
	call	__assert_fail@PLT
	.cfi_endproc
.LFE5514:
	.size	_Z23insertHashtableListNodeP13HashtableListmPK4wordPKm, .-_Z23insertHashtableListNodeP13HashtableListmPK4wordPKm
	.p2align 4
	.globl	_Z17initHashtableListP13HashtableList
	.type	_Z17initHashtableListP13HashtableList, @function
_Z17initHashtableListP13HashtableList:
.LFB5516:
	.cfi_startproc
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	esi, 64000
	mov	rbx, rdi
	mov	edi, 32
	call	aligned_alloc@PLT
	mov	edx, 64000
	xor	esi, esi
	mov	QWORD PTR 24[rbx], rax
	mov	rdi, rax
	call	memset@PLT
	mov	QWORD PTR 16[rbx], 1000
	mov	rcx, rax
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L30:
	mov	rdx, rax
	sal	rdx, 6
	mov	QWORD PTR 104[rcx+rdx], rax
	add	rax, 1
	cmp	rax, 999
	jne	.L30
	mov	QWORD PTR 8[rbx], 999
	mov	DWORD PTR 48[rcx], 1
	mov	QWORD PTR 52[rcx], 0
	mov	QWORD PTR 40[rcx], 0
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE5516:
	.size	_Z17initHashtableListP13HashtableList, .-_Z17initHashtableListP13HashtableList
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"void dumpHashtable(const Hashtable*, void (*)(const hkey_t*), void (*)(const data_t*))"
	.section	.rodata.str1.1
.LC9:
	.string	"ht != NULL"
.LC10:
	.string	"pf_k != NULL"
.LC11:
	.string	"pf_d != NULL"
.LC12:
	.string	"HashTable at [%p]{      \n"
.LC13:
	.string	"    .capacity = %zu     \n"
.LC14:
	.string	"    .size = %zu         \n"
.LC15:
	.string	"    .data = %p          \n"
.LC16:
	.string	"    .htlist = {         "
.LC17:
	.string	"        .root = %zu     \n"
.LC18:
	.string	"        .free = %zu     \n"
.LC19:
	.string	"        .capacity = %zu \n"
.LC20:
	.string	"        .data = %p      \n"
.LC21:
	.string	"    }                   "
.LC22:
	.string	"    DATA_DUMPING:       "
.LC23:
	.string	"    [%4zu]: "
.LC24:
	.string	"EMPTY"
.LC25:
	.string	"<%4zu> ...->\n"
.LC26:
	.string	"        ...-> [%4zu]{\n"
.LC27:
	.string	"             .key: "
.LC28:
	.string	"\n             .data:"
.LC29:
	.string	"\n    } -> ..."
.LC30:
	.string	"}"
	.text
	.p2align 4
	.globl	_Z13dumpHashtablePK9HashtablePFvPK4wordEPFvPKmE
	.type	_Z13dumpHashtablePK9HashtablePFvPK4wordEPFvPKmE, @function
_Z13dumpHashtablePK9HashtablePFvPK4wordEPFvPKmE:
.LFB5517:
	.cfi_startproc
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	push	r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	push	rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	push	rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sub	rsp, 40
	.cfi_def_cfa_offset 96
	mov	QWORD PTR 16[rsp], rsi
	mov	QWORD PTR 24[rsp], rdx
	test	rdi, rdi
	je	.L46
	cmp	QWORD PTR 16[rsp], 0
	je	.L47
	cmp	QWORD PTR 24[rsp], 0
	je	.L48
	mov	rbp, rdi
	mov	rsi, rdi
	lea	rdi, .LC12[rip]
	xor	eax, eax
	call	printf@PLT
	mov	rsi, QWORD PTR 48[rbp]
	lea	rdi, .LC13[rip]
	xor	eax, eax
	call	printf@PLT
	mov	rsi, QWORD PTR 40[rbp]
	lea	rdi, .LC14[rip]
	xor	eax, eax
	call	printf@PLT
	mov	rsi, QWORD PTR 32[rbp]
	lea	rdi, .LC15[rip]
	xor	eax, eax
	call	printf@PLT
	lea	rdi, .LC16[rip]
	call	puts@PLT
	mov	rsi, QWORD PTR 0[rbp]
	lea	rdi, .LC17[rip]
	xor	eax, eax
	call	printf@PLT
	mov	rsi, QWORD PTR 8[rbp]
	lea	rdi, .LC18[rip]
	xor	eax, eax
	call	printf@PLT
	mov	rsi, QWORD PTR 16[rbp]
	lea	rdi, .LC19[rip]
	xor	eax, eax
	call	printf@PLT
	mov	rsi, QWORD PTR 24[rbp]
	lea	rdi, .LC20[rip]
	xor	eax, eax
	call	printf@PLT
	lea	rdi, .LC21[rip]
	call	puts@PLT
	lea	rdi, .LC22[rip]
	call	puts@PLT
	cmp	QWORD PTR 48[rbp], 0
	je	.L37
	mov	QWORD PTR 8[rsp], 0
	lea	r15, .LC26[rip]
	lea	r14, .LC27[rip]
	lea	r13, .LC28[rip]
	jmp	.L42
	.p2align 4,,10
	.p2align 3
.L49:
	lea	rdi, .LC24[rip]
	call	puts@PLT
.L39:
	add	QWORD PTR 8[rsp], 1
	mov	rax, QWORD PTR 8[rsp]
	cmp	QWORD PTR 48[rbp], rax
	jbe	.L37
.L42:
	mov	rbx, QWORD PTR 8[rsp]
	lea	rdi, .LC23[rip]
	xor	eax, eax
	mov	rsi, rbx
	call	printf@PLT
	mov	rax, QWORD PTR 32[rbp]
	mov	rax, QWORD PTR [rax+rbx*8]
	test	rax, rax
	je	.L49
	sal	rax, 6
	add	rax, QWORD PTR 24[rbp]
	lea	rdi, .LC25[rip]
	mov	rsi, QWORD PTR 52[rax]
	xor	eax, eax
	call	printf@PLT
	mov	rax, QWORD PTR 32[rbp]
	mov	rcx, QWORD PTR 8[rsp]
	mov	rdx, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR [rax+rcx*8]
	sal	rax, 6
	mov	rsi, QWORD PTR 40[rdx+rax]
	mov	rbx, rsi
	sal	rbx, 6
	mov	edx, DWORD PTR 48[rdx+rbx]
	test	edx, edx
	jne	.L39
	lea	r12, .LC29[rip]
	.p2align 4,,10
	.p2align 3
.L41:
	mov	rdi, r15
	xor	eax, eax
	call	printf@PLT
	mov	rdi, r14
	xor	eax, eax
	call	printf@PLT
	mov	rdi, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR 16[rsp]
	add	rdi, rbx
	call	rax
	mov	rdi, r13
	xor	eax, eax
	call	printf@PLT
	mov	rdi, QWORD PTR 24[rbp]
	mov	rax, QWORD PTR 24[rsp]
	add	rdi, rbx
	add	rdi, 32
	call	rax
	mov	rdi, r12
	call	puts@PLT
	mov	rax, QWORD PTR 24[rbp]
	mov	rsi, QWORD PTR 40[rax+rbx]
	mov	rbx, rsi
	sal	rbx, 6
	mov	eax, DWORD PTR 48[rax+rbx]
	test	eax, eax
	je	.L41
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L37:
	add	rsp, 40
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	lea	rdi, .LC30[rip]
	pop	rbx
	.cfi_def_cfa_offset 48
	pop	rbp
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	jmp	puts@PLT
.L46:
	.cfi_restore_state
	lea	rcx, .LC8[rip]
	mov	edx, 92
	lea	rsi, .LC1[rip]
	lea	rdi, .LC9[rip]
	call	__assert_fail@PLT
.L48:
	lea	rcx, .LC8[rip]
	mov	edx, 94
	lea	rsi, .LC1[rip]
	lea	rdi, .LC11[rip]
	call	__assert_fail@PLT
.L47:
	lea	rcx, .LC8[rip]
	mov	edx, 93
	lea	rsi, .LC1[rip]
	lea	rdi, .LC10[rip]
	call	__assert_fail@PLT
	.cfi_endproc
.LFE5517:
	.size	_Z13dumpHashtablePK9HashtablePFvPK4wordEPFvPKmE, .-_Z13dumpHashtablePK9HashtablePFvPK4wordEPFvPKmE
	.p2align 4
	.globl	_Z17freeHashtableListP13HashtableList
	.type	_Z17freeHashtableListP13HashtableList, @function
_Z17freeHashtableListP13HashtableList:
.LFB5518:
	.cfi_startproc
	test	rdi, rdi
	je	.L57
	push	rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	mov	rbx, rdi
	mov	rdi, QWORD PTR 24[rdi]
	call	free@PLT
	vpxor	xmm0, xmm0, xmm0
	mov	QWORD PTR 16[rbx], 0
	vmovdqu	XMMWORD PTR [rbx], xmm0
	pop	rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L57:
	.cfi_restore 3
	ret
	.cfi_endproc
.LFE5518:
	.size	_Z17freeHashtableListP13HashtableList, .-_Z17freeHashtableListP13HashtableList
	.p2align 4
	.globl	_Z23deleteNextHashtableNodeP13HashtableListm
	.type	_Z23deleteNextHashtableNodeP13HashtableListm, @function
_Z23deleteNextHashtableNodeP13HashtableListm:
.LFB5519:
	.cfi_startproc
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	test	rdi, rdi
	je	.L64
	mov	rax, QWORD PTR 24[rdi]
	sal	rsi, 6
	add	rsi, rax
	mov	rdx, QWORD PTR 40[rsi]
	test	rdx, rdx
	je	.L65
	mov	rcx, rdx
	sal	rcx, 6
	add	rax, rcx
	mov	rcx, QWORD PTR 40[rax]
	mov	QWORD PTR 40[rsi], rcx
	mov	rcx, QWORD PTR 8[rdi]
	mov	QWORD PTR 40[rax], rcx
	mov	QWORD PTR 8[rdi], rdx
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L64:
	.cfi_restore_state
	lea	rcx, .LC0[rip]
	mov	edx, 138
	lea	rsi, .LC1[rip]
	lea	rdi, .LC4[rip]
	call	__assert_fail@PLT
.L65:
	call	_Z23deleteNextHashtableNodeP13HashtableListm.part.0
	.cfi_endproc
.LFE5519:
	.size	_Z23deleteNextHashtableNodeP13HashtableListm, .-_Z23deleteNextHashtableNodeP13HashtableListm
	.section	.rodata.str1.8
	.align 8
.LC31:
	.string	"Hashtable* createHashtable(size_t)"
	.section	.rodata.str1.1
.LC32:
	.string	"ht->data != NULL"
	.text
	.p2align 4
	.globl	_Z15createHashtablem
	.type	_Z15createHashtablem, @function
_Z15createHashtablem:
.LFB5520:
	.cfi_startproc
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	mov	esi, 56
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	mov	rbx, rdi
	mov	edi, 1
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	calloc@PLT
	test	rax, rax
	je	.L72
	mov	esi, 64000
	mov	edi, 32
	mov	r12, rax
	call	aligned_alloc@PLT
	mov	edx, 64000
	xor	esi, esi
	mov	QWORD PTR 24[r12], rax
	mov	rdi, rax
	call	memset@PLT
	mov	QWORD PTR 16[r12], 1000
	mov	rcx, rax
	xor	eax, eax
	.p2align 4,,10
	.p2align 3
.L68:
	mov	rdx, rax
	sal	rdx, 6
	mov	QWORD PTR 104[rcx+rdx], rax
	add	rax, 1
	cmp	rax, 999
	jne	.L68
	mov	DWORD PTR 48[rcx], 1
	mov	esi, 8
	mov	rdi, rbx
	mov	QWORD PTR 8[r12], 999
	mov	QWORD PTR 52[rcx], 0
	mov	QWORD PTR 40[rcx], 0
	call	calloc@PLT
	mov	QWORD PTR 32[r12], rax
	test	rax, rax
	je	.L73
	mov	QWORD PTR 48[r12], rbx
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	mov	rax, r12
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret
.L72:
	.cfi_restore_state
	lea	rcx, .LC31[rip]
	mov	edx, 148
	lea	rsi, .LC1[rip]
	lea	rdi, .LC9[rip]
	call	__assert_fail@PLT
.L73:
	lea	rcx, .LC31[rip]
	mov	edx, 151
	lea	rsi, .LC1[rip]
	lea	rdi, .LC32[rip]
	call	__assert_fail@PLT
	.cfi_endproc
.LFE5520:
	.size	_Z15createHashtablem, .-_Z15createHashtablem
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"void deleteHashtable(Hashtable*)"
	.text
	.p2align 4
	.globl	_Z15deleteHashtableP9Hashtable
	.type	_Z15deleteHashtableP9Hashtable, @function
_Z15deleteHashtableP9Hashtable:
.LFB5521:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	test	rdi, rdi
	je	.L77
	mov	rbp, rdi
	mov	rdi, QWORD PTR 24[rdi]
	call	free@PLT
	mov	rdi, QWORD PTR 32[rbp]
	call	free@PLT
	mov	rdi, rbp
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	free@PLT
.L77:
	.cfi_restore_state
	lea	rcx, .LC33[rip]
	mov	edx, 157
	lea	rsi, .LC1[rip]
	lea	rdi, .LC9[rip]
	call	__assert_fail@PLT
	.cfi_endproc
.LFE5521:
	.size	_Z15deleteHashtableP9Hashtable, .-_Z15deleteHashtableP9Hashtable
	.p2align 4
	.globl	_Z13findHashtablePK9HashtablePK4word
	.type	_Z13findHashtablePK9HashtablePK4word, @function
_Z13findHashtablePK9HashtablePK4word:
.LFB5524:
	.cfi_startproc
	mov	r8, rdi
	mov	r9, rsi
#APP
# 284 "src/Hashtable/Hashtable.cpp" 1
	.intel_syntax noprefix
	mov rsi, r9
	xor rdi, rdi
	xor rax, rax
	mov rcx, 32
	abobalopper694:
	scasb
	add rdi, rax
	loop abobalopper694
	mov rdx, rdi
	.att_syntax
	
# 0 "" 2
#NO_APP
	mov	rax, rdx
	xor	edx, edx
	div	QWORD PTR 48[r8]
	mov	rax, QWORD PTR 32[r8]
	mov	rax, QWORD PTR [rax+rdx*8]
	test	rax, rax
	je	.L83
	mov	rcx, QWORD PTR 24[r8]
	sal	rax, 6
	mov	rax, QWORD PTR 40[rcx+rax]
	sal	rax, 6
	add	rax, rcx
	mov	esi, DWORD PTR 48[rax]
	test	esi, esi
	jne	.L83
	vmovdqa	ymm1, YMMWORD PTR [r9]
	jmp	.L81
	.p2align 4,,10
	.p2align 3
.L80:
	mov	rax, QWORD PTR 40[rax]
	sal	rax, 6
	add	rax, rcx
	mov	edx, DWORD PTR 48[rax]
	test	edx, edx
	jne	.L85
.L81:
	vpcmpeqb	ymm0, ymm1, YMMWORD PTR [rax]
	vpmovmskb	edx, ymm0
	cmp	edx, -1
	jne	.L80
	add	rax, 32
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L85:
	xor	eax, eax
	vzeroupper
	ret
	.p2align 4,,10
	.p2align 3
.L83:
	xor	eax, eax
	ret
	.cfi_endproc
.LFE5524:
	.size	_Z13findHashtablePK9HashtablePK4word, .-_Z13findHashtablePK9HashtablePK4word
	.p2align 4
	.globl	_Z15insertHashtableP9HashtablePK4wordPKm
	.type	_Z15insertHashtableP9HashtablePK4wordPKm, @function
_Z15insertHashtableP9HashtablePK4wordPKm:
.LFB5525:
	.cfi_startproc
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r15
	push	r14
	push	r13
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	mov	r13, rdx
	push	r12
	.cfi_offset 12, -48
	mov	r12, rsi
	push	rbx
	.cfi_offset 3, -56
	mov	rbx, rdi
#APP
# 284 "src/Hashtable/Hashtable.cpp" 1
	.intel_syntax noprefix
	mov rsi, r12
	xor rdi, rdi
	xor rax, rax
	mov rcx, 32
	abobalopper774:
	scasb
	add rdi, rax
	loop abobalopper774
	mov rdx, rdi
	.att_syntax
	
# 0 "" 2
#NO_APP
	mov	rax, rdx
	xor	edx, edx
	and	rsp, -32
	sub	rsp, 32
	mov	r15, QWORD PTR 32[rbx]
	div	QWORD PTR 48[rbx]
	mov	r14, rdx
	sal	rdx, 3
	add	r15, rdx
	mov	rax, QWORD PTR [r15]
	test	rax, rax
	je	.L87
	mov	rcx, QWORD PTR 24[rbx]
.L88:
	sal	rax, 6
	mov	rax, QWORD PTR 40[rcx+rax]
	sal	rax, 6
	add	rax, rcx
	mov	r8d, DWORD PTR 48[rax]
	test	r8d, r8d
	jne	.L90
	vmovdqa	ymm1, YMMWORD PTR [r12]
	jmp	.L93
	.p2align 4,,10
	.p2align 3
.L91:
	mov	rax, QWORD PTR 40[rax]
	sal	rax, 6
	add	rax, rcx
	mov	edx, DWORD PTR 48[rax]
	test	edx, edx
	jne	.L97
.L93:
	vpcmpeqb	ymm0, ymm1, YMMWORD PTR [rax]
	vpmovmskb	edx, ymm0
	cmp	edx, -1
	jne	.L91
	mov	rdx, QWORD PTR 0[r13]
	mov	QWORD PTR 32[rax], rdx
	vzeroupper
	jmp	.L86
	.p2align 4,,10
	.p2align 3
.L97:
	vzeroupper
.L90:
	mov	rsi, QWORD PTR [r15]
	mov	rcx, r13
	mov	rdx, r12
	mov	rdi, rbx
	call	_Z23insertHashtableListNodeP13HashtableListmPK4wordPKm
	mov	rax, QWORD PTR 32[rbx]
	add	QWORD PTR 40[rbx], 1
	mov	r8d, 1
	mov	rax, QWORD PTR [rax+r14*8]
	sal	rax, 6
	add	rax, QWORD PTR 24[rbx]
	add	QWORD PTR 52[rax], 1
.L86:
	lea	rsp, -40[rbp]
	mov	eax, r8d
	pop	rbx
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L87:
	.cfi_restore_state
	mov	rsi, QWORD PTR 8[rbx]
	mov	rdi, r15
	test	rsi, rsi
	je	.L98
.L89:
	mov	rcx, QWORD PTR 24[rbx]
	mov	rdx, rsi
	sal	rdx, 6
	add	rdx, rcx
	mov	r8, QWORD PTR 40[rdx]
	mov	QWORD PTR 8[rbx], r8
	mov	r8, QWORD PTR [rbx]
	mov	DWORD PTR 48[rdx], 1
	mov	QWORD PTR 40[rdx], r8
	mov	QWORD PTR [rbx], rsi
	mov	QWORD PTR [r15], rsi
	mov	rdx, QWORD PTR [rdi]
	mov	r15, rdi
	sal	rdx, 6
	mov	QWORD PTR 52[rcx+rdx], 1
	jmp	.L88
	.p2align 4,,10
	.p2align 3
.L98:
	mov	rdi, rbx
	mov	QWORD PTR 16[rsp], rax
	mov	QWORD PTR 24[rsp], rdx
	call	_Z19expandHashtableListP13HashtableList
	mov	rdi, QWORD PTR 24[rsp]
	mov	rsi, QWORD PTR 8[rbx]
	mov	rax, QWORD PTR 16[rsp]
	add	rdi, QWORD PTR 32[rbx]
	jmp	.L89
	.cfi_endproc
.LFE5525:
	.size	_Z15insertHashtableP9HashtablePK4wordPKm, .-_Z15insertHashtableP9HashtablePK4wordPKm
	.p2align 4
	.globl	_Z15removeHashtableP9HashtablePK4word
	.type	_Z15removeHashtableP9HashtablePK4word, @function
_Z15removeHashtableP9HashtablePK4word:
.LFB5526:
	.cfi_startproc
	mov	r8, rdi
	mov	r9, rsi
#APP
# 284 "src/Hashtable/Hashtable.cpp" 1
	.intel_syntax noprefix
	mov rsi, r9
	xor rdi, rdi
	xor rax, rax
	mov rcx, 32
	abobalopper906:
	scasb
	add rdi, rax
	loop abobalopper906
	mov rdx, rdi
	.att_syntax
	
# 0 "" 2
#NO_APP
	mov	rax, rdx
	xor	edx, edx
	div	QWORD PTR 48[r8]
	mov	rax, QWORD PTR 32[r8]
	mov	rsi, QWORD PTR [rax+rdx*8]
	test	rsi, rsi
	je	.L105
	mov	rdi, QWORD PTR 24[r8]
	mov	rax, rsi
	sal	rax, 6
	mov	rcx, QWORD PTR 40[rdi+rax]
	mov	rax, rcx
	sal	rax, 6
	add	rax, rdi
	mov	r10d, DWORD PTR 48[rax]
	test	r10d, r10d
	jne	.L105
	vmovdqa	ymm1, YMMWORD PTR [r9]
	jmp	.L103
	.p2align 4,,10
	.p2align 3
.L101:
	mov	rdx, QWORD PTR 40[rax]
	mov	rsi, rcx
	mov	rax, rdx
	sal	rax, 6
	add	rax, rdi
	mov	ecx, DWORD PTR 48[rax]
	test	ecx, ecx
	jne	.L110
	mov	rcx, rdx
.L103:
	vpcmpeqb	ymm0, ymm1, YMMWORD PTR [rax]
	vpmovmskb	edx, ymm0
	cmp	edx, -1
	jne	.L101
	sal	rsi, 6
	add	rsi, rdi
	mov	rax, QWORD PTR 40[rsi]
	test	rax, rax
	je	.L111
	mov	rdx, rax
	mov	r10d, 1
	sal	rdx, 6
	add	rdi, rdx
	mov	rdx, QWORD PTR 40[rdi]
	mov	QWORD PTR 40[rsi], rdx
	mov	rdx, QWORD PTR 8[r8]
	mov	QWORD PTR 40[rdi], rdx
	sub	QWORD PTR 40[r8], 1
	mov	QWORD PTR 8[r8], rax
	vzeroupper
	mov	eax, r10d
	ret
	.p2align 4,,10
	.p2align 3
.L105:
	xor	r10d, r10d
	mov	eax, r10d
	ret
	.p2align 4,,10
	.p2align 3
.L110:
	vzeroupper
	mov	eax, r10d
	ret
.L111:
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	and	rsp, -32
	vzeroupper
	call	_Z23deleteNextHashtableNodeP13HashtableListm.part.0
	.cfi_endproc
.LFE5526:
	.size	_Z15removeHashtableP9HashtablePK4word, .-_Z15removeHashtableP9HashtablePK4word
	.section	.rodata.str1.8
	.align 8
.LC34:
	.string	"void clearHashtable(Hashtable*)"
	.text
	.p2align 4
	.globl	_Z14clearHashtableP9Hashtable
	.type	_Z14clearHashtableP9Hashtable, @function
_Z14clearHashtableP9Hashtable:
.LFB5527:
	.cfi_startproc
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	test	rdi, rdi
	je	.L129
	mov	rdx, QWORD PTR [rdi]
	test	rdx, rdx
	je	.L114
	mov	r8, QWORD PTR 24[rdi]
	.p2align 4,,10
	.p2align 3
.L115:
	sal	rdx, 6
	lea	rcx, [r8+rdx]
	jmp	.L128
	.p2align 4,,10
	.p2align 3
.L117:
	test	rdx, rdx
	je	.L130
	mov	rsi, QWORD PTR 40[rax]
	mov	QWORD PTR 40[rcx], rsi
	mov	rsi, QWORD PTR 8[rdi]
	mov	QWORD PTR 40[rax], rsi
	mov	QWORD PTR 8[rdi], rdx
.L128:
	mov	rdx, QWORD PTR 40[rcx]
	mov	rax, rdx
	sal	rax, 6
	add	rax, r8
	mov	esi, DWORD PTR 48[rax]
	test	esi, esi
	je	.L117
	test	rdx, rdx
	jne	.L115
.L114:
	mov	QWORD PTR 40[rdi], 0
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L130:
	.cfi_restore_state
	lea	rcx, .LC0[rip]
	mov	edx, 139
	lea	rsi, .LC1[rip]
	lea	rdi, .LC2[rip]
	call	__assert_fail@PLT
.L129:
	lea	rcx, .LC34[rip]
	mov	edx, 264
	lea	rsi, .LC1[rip]
	lea	rdi, .LC9[rip]
	call	__assert_fail@PLT
	.cfi_endproc
.LFE5527:
	.size	_Z14clearHashtableP9Hashtable, .-_Z14clearHashtableP9Hashtable
	.p2align 4
	.globl	_Z6EsHashPK4word
	.type	_Z6EsHashPK4word, @function
_Z6EsHashPK4word:
.LFB5530:
	.cfi_startproc
	mov	r8, rdi
#APP
# 284 "src/Hashtable/Hashtable.cpp" 1
	.intel_syntax noprefix
	mov rsi, r8
	xor rdi, rdi
	xor rax, rax
	mov rcx, 32
	abobalopper1073:
	scasb
	add rdi, rax
	loop abobalopper1073
	mov r8, rdi
	.att_syntax
	
# 0 "" 2
#NO_APP
	mov	rax, r8
	ret
	.cfi_endproc
.LFE5530:
	.size	_Z6EsHashPK4word, .-_Z6EsHashPK4word
	.ident	"GCC: (GNU) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
