
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00002197          	auipc	gp,0x2
   4:	8a418193          	add	gp,gp,-1884 # 18a4 <__global_pointer$>
   8:	08000117          	auipc	sp,0x8000
   c:	ff810113          	add	sp,sp,-8 # 8000000 <__stack_top>
  10:	00010433          	add	s0,sp,zero
  14:	010000ef          	jal	24 <main>
  18:	004000ef          	jal	1c <_exit>

0000001c <_exit>:
  1c:	05d00893          	li	a7,93
  20:	00000073          	ecall

00000024 <main>:
  24:	ff010113          	add	sp,sp,-16
  28:	00812623          	sw	s0,12(sp)
  2c:	01010413          	add	s0,sp,16
  30:	0fffc737          	lui	a4,0xfffc
  34:	00170713          	add	a4,a4,1 # fffc001 <__stack_top+0x7ffc001>
  38:	0ae02223          	sw	a4,164(zero) # a4 <x>
  3c:	0a402783          	lw	a5,164(zero) # a4 <x>
  40:	0fffc737          	lui	a4,0xfffc
  44:	00170713          	add	a4,a4,1 # fffc001 <__stack_top+0x7ffc001>
  48:	00e7a023          	sw	a4,0(a5)
  4c:	0000006f          	j	4c <main+0x28>

Disassembly of section .eh_frame:

00000050 <__DATA_BEGIN__-0x54>:
  50:	0014                	.insn	2, 0x0014
  52:	0000                	.insn	2, 0x
  54:	0000                	.insn	2, 0x
  56:	0000                	.insn	2, 0x
  58:	00527a03          	.insn	4, 0x00527a03
  5c:	7c01                	.insn	2, 0x7c01
  5e:	0101                	.insn	2, 0x0101
  60:	07020d1b          	.insn	4, 0x07020d1b
  64:	0001                	.insn	2, 0x0001
  66:	0000                	.insn	2, 0x
  68:	0010                	.insn	2, 0x0010
  6a:	0000                	.insn	2, 0x
  6c:	001c                	.insn	2, 0x001c
  6e:	0000                	.insn	2, 0x
  70:	ff90                	.insn	2, 0xff90
  72:	ffff                	.insn	2, 0xffff
  74:	001c                	.insn	2, 0x001c
  76:	0000                	.insn	2, 0x
  78:	0000                	.insn	2, 0x
  7a:	0000                	.insn	2, 0x
  7c:	0010                	.insn	2, 0x0010
  7e:	0000                	.insn	2, 0x
  80:	0000                	.insn	2, 0x
  82:	0000                	.insn	2, 0x
  84:	00527a03          	.insn	4, 0x00527a03
  88:	7c01                	.insn	2, 0x7c01
  8a:	0101                	.insn	2, 0x0101
  8c:	00020d1b          	.insn	4, 0x00020d1b
  90:	0010                	.insn	2, 0x0010
  92:	0000                	.insn	2, 0x
  94:	0018                	.insn	2, 0x0018
  96:	0000                	.insn	2, 0x
  98:	ff84                	.insn	2, 0xff84
  9a:	ffff                	.insn	2, 0xffff
  9c:	0008                	.insn	2, 0x0008
  9e:	0000                	.insn	2, 0x
  a0:	0000                	.insn	2, 0x
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	39386367          	.insn	4, 0x39386367
   a:	6431                	.insn	2, 0x6431
   c:	6438                	.insn	2, 0x6438
   e:	65333263          	.insn	4, 0x65333263
  12:	2029                	.insn	2, 0x2029
  14:	3331                	.insn	2, 0x3331
  16:	322e                	.insn	2, 0x322e
  18:	302e                	.insn	2, 0x302e
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	1b41                	.insn	2, 0x1b41
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <_start+0x14>
   c:	0011                	.insn	2, 0x0011
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	0031                	.insn	2, 0x0031
