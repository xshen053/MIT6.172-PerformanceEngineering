	.text
	.file	"loop.c"
	.globl	storeResultToFile               # -- Begin function storeResultToFile
	.p2align	4, 0x90
	.type	storeResultToFile,@function
storeResultToFile:                      # @storeResultToFile
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movss	%xmm0, 12(%rsp)                 # 4-byte Spill
	leaq	.L.str(%rip), %rdi
	leaq	.L.str.1(%rip), %rsi
	callq	fopen@PLT
	testq	%rax, %rax
	je	.LBB0_1
# %bb.2:
	movq	%rax, %rbx
	movss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	cvtss2sd	%xmm0, %xmm0
	leaq	.L.str.3(%rip), %rsi
	leaq	.L.str.4(%rip), %r8
	leaq	.L.str.5(%rip), %r9
	movq	%rax, %rdi
	movl	$1024, %edx                     # imm = 0x400
	movl	$100000, %ecx                   # imm = 0x186A0
	movb	$1, %al
	callq	fprintf@PLT
	movq	%rbx, %rdi
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	fclose@PLT                      # TAILCALL
.LBB0_1:
	.cfi_def_cfa_offset 32
	leaq	.Lstr(%rip), %rdi
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	puts@PLT                        # TAILCALL
.Lfunc_end0:
	.size	storeResultToFile, .Lfunc_end0-storeResultToFile
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3                               # -- Begin function main
.LCPI1_0:
	.quad	0x3e112e0be826d695              # double 1.0000000000000001E-9
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r12
	.cfi_def_cfa_offset 32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	subq	$12328, %rsp                    # imm = 0x3028
	.cfi_def_cfa_offset 12368
	.cfi_offset %rbx, -40
	.cfi_offset %r12, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movl	$0, 12(%rsp)
	leaq	8224(%rsp), %rdi
	xorl	%ebx, %ebx
	movl	$4096, %edx                     # imm = 0x1000
	xorl	%esi, %esi
	callq	memset@PLT
	leaq	4128(%rsp), %rdi
	movl	$4096, %edx                     # imm = 0x1000
	xorl	%esi, %esi
	callq	memset@PLT
	leaq	32(%rsp), %rdi
	movl	$4096, %edx                     # imm = 0x1000
	xorl	%esi, %esi
	callq	memset@PLT
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	callq	clock_gettime@PLT
	movq	16(%rsp), %r15
	movq	24(%rsp), %r14
	.p2align	4, 0x90
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	xorl	%eax, %eax
	.p2align	4, 0x90
.LBB1_2:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movdqa	4128(%rsp,%rax,4), %xmm0
	movdqa	4144(%rsp,%rax,4), %xmm1
	movdqa	4160(%rsp,%rax,4), %xmm2
	movdqa	4176(%rsp,%rax,4), %xmm3
	paddd	8224(%rsp,%rax,4), %xmm0
	paddd	8240(%rsp,%rax,4), %xmm1
	movdqa	%xmm0, 32(%rsp,%rax,4)
	movdqa	%xmm1, 48(%rsp,%rax,4)
	paddd	8256(%rsp,%rax,4), %xmm2
	paddd	8272(%rsp,%rax,4), %xmm3
	movdqa	%xmm2, 64(%rsp,%rax,4)
	movdqa	%xmm3, 80(%rsp,%rax,4)
	addq	$16, %rax
	cmpq	$1024, %rax                     # imm = 0x400
	jne	.LBB1_2
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	addl	$1, %ebx
	cmpl	$100000, %ebx                   # imm = 0x186A0
	jne	.LBB1_1
# %bb.4:
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	callq	clock_gettime@PLT
	movq	16(%rsp), %rbx
	movq	24(%rsp), %r12
	leaq	12(%rsp), %rdi
	callq	rand_r@PLT
                                        # kill: def $eax killed $eax def $rax
	leal	1023(%rax), %ecx
	testl	%eax, %eax
	cmovnsl	%eax, %ecx
	andl	$-1024, %ecx                    # imm = 0xFC00
	subl	%ecx, %eax
	subq	%r15, %rbx
	xorps	%xmm1, %xmm1
	cvtsi2sd	%rbx, %xmm1
	cltq
	subq	%r14, %r12
	xorps	%xmm0, %xmm0
	cvtsi2sd	%r12, %xmm0
	movl	32(%rsp,%rax,4), %ebx
	mulsd	.LCPI1_0(%rip), %xmm0
	addsd	%xmm1, %xmm0
	leaq	.L.str.3(%rip), %rdi
	leaq	.L.str.4(%rip), %rcx
	leaq	.L.str.5(%rip), %r8
	movl	$1024, %esi                     # imm = 0x400
	movl	$100000, %edx                   # imm = 0x186A0
	movb	$1, %al
	callq	printf@PLT
	movl	%ebx, %eax
	addq	$12328, %rsp                    # imm = 0x3028
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"vectorize_avx2.txt"
	.size	.L.str, 19

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"a"
	.size	.L.str.1, 2

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Elapsed execution time: %f sec; N: %d, I: %d, __OP__: %s, __TYPE__: %s\n"
	.size	.L.str.3, 72

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"+"
	.size	.L.str.4, 2

	.type	.L.str.5,@object                # @.str.5
.L.str.5:
	.asciz	"uint32_t"
	.size	.L.str.5, 9

	.type	.Lstr,@object                   # @str
.Lstr:
	.asciz	"Failed to open the file."
	.size	.Lstr, 25

	.ident	"Ubuntu clang version 14.0.0-1ubuntu1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
