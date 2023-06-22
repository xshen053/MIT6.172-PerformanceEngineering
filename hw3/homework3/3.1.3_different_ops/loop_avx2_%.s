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
	vmovss	%xmm0, 12(%rsp)                 # 4-byte Spill
	leaq	.L.str(%rip), %rdi
	leaq	.L.str.1(%rip), %rsi
	callq	fopen@PLT
	testq	%rax, %rax
	je	.LBB0_1
# %bb.2:
	movq	%rax, %rbx
	vmovss	12(%rsp), %xmm0                 # 4-byte Reload
                                        # xmm0 = mem[0],zero,zero,zero
	vcvtss2sd	%xmm0, %xmm0, %xmm0
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
	.section	.rodata.cst4,"aM",@progbits,4
	.p2align	2                               # -- Begin function main
.LCPI1_0:
	.long	1                               # 0x1
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3
.LCPI1_1:
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
	vbroadcastss	.LCPI1_0(%rip), %ymm0   # ymm0 = [1,1,1,1,1,1,1,1]
	vmovupd	%ymm0, 32(%rsp)
	vmovupd	%ymm0, 64(%rsp)
	vmovupd	%ymm0, 96(%rsp)
	vmovupd	%ymm0, 128(%rsp)
	vmovupd	%ymm0, 160(%rsp)
	vmovupd	%ymm0, 192(%rsp)
	vmovupd	%ymm0, 224(%rsp)
	vmovupd	%ymm0, 256(%rsp)
	vmovupd	%ymm0, 288(%rsp)
	vmovupd	%ymm0, 320(%rsp)
	vmovupd	%ymm0, 352(%rsp)
	vmovupd	%ymm0, 384(%rsp)
	vmovupd	%ymm0, 416(%rsp)
	vmovupd	%ymm0, 448(%rsp)
	vmovupd	%ymm0, 480(%rsp)
	vmovupd	%ymm0, 512(%rsp)
	vmovupd	%ymm0, 544(%rsp)
	vmovupd	%ymm0, 576(%rsp)
	vmovupd	%ymm0, 608(%rsp)
	vmovupd	%ymm0, 640(%rsp)
	vmovupd	%ymm0, 672(%rsp)
	vmovupd	%ymm0, 704(%rsp)
	vmovupd	%ymm0, 736(%rsp)
	vmovupd	%ymm0, 768(%rsp)
	vmovupd	%ymm0, 800(%rsp)
	vmovupd	%ymm0, 832(%rsp)
	vmovupd	%ymm0, 864(%rsp)
	vmovupd	%ymm0, 896(%rsp)
	vmovupd	%ymm0, 928(%rsp)
	vmovupd	%ymm0, 960(%rsp)
	vmovupd	%ymm0, 992(%rsp)
	vmovupd	%ymm0, 1024(%rsp)
	vmovupd	%ymm0, 1056(%rsp)
	vmovupd	%ymm0, 1088(%rsp)
	vmovupd	%ymm0, 1120(%rsp)
	vmovupd	%ymm0, 1152(%rsp)
	vmovupd	%ymm0, 1184(%rsp)
	vmovupd	%ymm0, 1216(%rsp)
	vmovupd	%ymm0, 1248(%rsp)
	vmovupd	%ymm0, 1280(%rsp)
	vmovupd	%ymm0, 1312(%rsp)
	vmovupd	%ymm0, 1344(%rsp)
	vmovupd	%ymm0, 1376(%rsp)
	vmovupd	%ymm0, 1408(%rsp)
	vmovupd	%ymm0, 1440(%rsp)
	vmovupd	%ymm0, 1472(%rsp)
	vmovupd	%ymm0, 1504(%rsp)
	vmovupd	%ymm0, 1536(%rsp)
	vmovupd	%ymm0, 1568(%rsp)
	vmovupd	%ymm0, 1600(%rsp)
	vmovupd	%ymm0, 1632(%rsp)
	vmovupd	%ymm0, 1664(%rsp)
	vmovupd	%ymm0, 1696(%rsp)
	vmovupd	%ymm0, 1728(%rsp)
	vmovupd	%ymm0, 1760(%rsp)
	vmovupd	%ymm0, 1792(%rsp)
	vmovupd	%ymm0, 1824(%rsp)
	vmovupd	%ymm0, 1856(%rsp)
	vmovupd	%ymm0, 1888(%rsp)
	vmovupd	%ymm0, 1920(%rsp)
	vmovupd	%ymm0, 1952(%rsp)
	vmovupd	%ymm0, 1984(%rsp)
	vmovupd	%ymm0, 2016(%rsp)
	vmovupd	%ymm0, 2048(%rsp)
	vmovupd	%ymm0, 2080(%rsp)
	vmovupd	%ymm0, 2112(%rsp)
	vmovupd	%ymm0, 2144(%rsp)
	vmovupd	%ymm0, 2176(%rsp)
	vmovupd	%ymm0, 2208(%rsp)
	vmovupd	%ymm0, 2240(%rsp)
	vmovupd	%ymm0, 2272(%rsp)
	vmovupd	%ymm0, 2304(%rsp)
	vmovupd	%ymm0, 2336(%rsp)
	vmovupd	%ymm0, 2368(%rsp)
	vmovupd	%ymm0, 2400(%rsp)
	vmovupd	%ymm0, 2432(%rsp)
	vmovupd	%ymm0, 2464(%rsp)
	vmovupd	%ymm0, 2496(%rsp)
	vmovupd	%ymm0, 2528(%rsp)
	vmovupd	%ymm0, 2560(%rsp)
	vmovupd	%ymm0, 2592(%rsp)
	vmovupd	%ymm0, 2624(%rsp)
	vmovupd	%ymm0, 2656(%rsp)
	vmovupd	%ymm0, 2688(%rsp)
	vmovupd	%ymm0, 2720(%rsp)
	vmovupd	%ymm0, 2752(%rsp)
	vmovupd	%ymm0, 2784(%rsp)
	vmovupd	%ymm0, 2816(%rsp)
	vmovupd	%ymm0, 2848(%rsp)
	vmovupd	%ymm0, 2880(%rsp)
	vmovupd	%ymm0, 2912(%rsp)
	vmovupd	%ymm0, 2944(%rsp)
	vmovupd	%ymm0, 2976(%rsp)
	vmovupd	%ymm0, 3008(%rsp)
	vmovupd	%ymm0, 3040(%rsp)
	vmovupd	%ymm0, 3072(%rsp)
	vmovupd	%ymm0, 3104(%rsp)
	vmovupd	%ymm0, 3136(%rsp)
	vmovupd	%ymm0, 3168(%rsp)
	vmovupd	%ymm0, 3200(%rsp)
	vmovupd	%ymm0, 3232(%rsp)
	vmovupd	%ymm0, 3264(%rsp)
	vmovupd	%ymm0, 3296(%rsp)
	vmovupd	%ymm0, 3328(%rsp)
	vmovupd	%ymm0, 3360(%rsp)
	vmovupd	%ymm0, 3392(%rsp)
	vmovupd	%ymm0, 3424(%rsp)
	vmovupd	%ymm0, 3456(%rsp)
	vmovupd	%ymm0, 3488(%rsp)
	vmovupd	%ymm0, 3520(%rsp)
	vmovupd	%ymm0, 3552(%rsp)
	vmovupd	%ymm0, 3584(%rsp)
	vmovupd	%ymm0, 3616(%rsp)
	vmovupd	%ymm0, 3648(%rsp)
	vmovupd	%ymm0, 3680(%rsp)
	vmovupd	%ymm0, 3712(%rsp)
	vmovupd	%ymm0, 3744(%rsp)
	vmovupd	%ymm0, 3776(%rsp)
	vmovupd	%ymm0, 3808(%rsp)
	vmovupd	%ymm0, 3840(%rsp)
	vmovupd	%ymm0, 3872(%rsp)
	vmovupd	%ymm0, 3904(%rsp)
	vmovupd	%ymm0, 3936(%rsp)
	vmovupd	%ymm0, 3968(%rsp)
	vmovupd	%ymm0, 4000(%rsp)
	vmovupd	%ymm0, 4032(%rsp)
	vmovupd	%ymm0, 4064(%rsp)
	vmovupd	%ymm0, 4096(%rsp)
	leaq	16(%rsp), %rsi
	movl	$1, %edi
	vzeroupper
	callq	clock_gettime@PLT
	movq	16(%rsp), %r15
	movq	24(%rsp), %r14
	.p2align	4, 0x90
.LBB1_1:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB1_2 Depth 2
	xorl	%esi, %esi
	.p2align	4, 0x90
.LBB1_2:                                #   Parent Loop BB1_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movl	8224(%rsp,%rsi,4), %eax
	movl	8228(%rsp,%rsi,4), %ecx
	xorl	%edx, %edx
	divl	32(%rsp,%rsi,4)
	movl	%edx, 4128(%rsp,%rsi,4)
	movl	%ecx, %eax
	xorl	%edx, %edx
	divl	36(%rsp,%rsi,4)
	movl	%edx, 4132(%rsp,%rsi,4)
	addq	$2, %rsi
	cmpq	$1024, %rsi                     # imm = 0x400
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
	vcvtsi2sd	%rbx, %xmm0, %xmm0
	cltq
	subq	%r14, %r12
	vcvtsi2sd	%r12, %xmm1, %xmm1
	movl	4128(%rsp,%rax,4), %ebx
	vmulsd	.LCPI1_1(%rip), %xmm1, %xmm1
	vaddsd	%xmm0, %xmm1, %xmm0
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
	.asciz	"%"
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
