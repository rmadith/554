
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00002197          	auipc	gp,0x2
   4:	8e018193          	add	gp,gp,-1824 # 18e0 <__global_pointer$>
   8:	08000117          	auipc	sp,0x8000
   c:	ff810113          	add	sp,sp,-8 # 8000000 <__stack_top>
  10:	00010433          	add	s0,sp,zero
  14:	010000ef          	jal	24 <main>
  18:	004000ef          	jal	1c <_exit>

0000001c <_exit>:
  1c:	05d00893          	li	a7,93
  20:	00000073          	ecall

00000024 <main>:
  24:	fe010113          	add	sp,sp,-32
  28:	00812e23          	sw	s0,28(sp)
  2c:	02010413          	add	s0,sp,32
  30:	0fffc737          	lui	a4,0xfffc
  34:	00170713          	add	a4,a4,1 # fffc001 <__stack_top+0x7ffc001>
  38:	0ee02023          	sw	a4,224(zero) # e0 <x>
  3c:	06800793          	li	a5,104
  40:	fef42223          	sw	a5,-28(s0)
  44:	06900793          	li	a5,105
  48:	fef42423          	sw	a5,-24(s0)
  4c:	fe042623          	sw	zero,-20(s0)
  50:	02c0006f          	j	7c <main+0x58>
  54:	fec42783          	lw	a5,-20(s0)
  58:	00279793          	sll	a5,a5,0x2
  5c:	ff078793          	add	a5,a5,-16
  60:	008787b3          	add	a5,a5,s0
  64:	ff47a703          	lw	a4,-12(a5)
  68:	0e002783          	lw	a5,224(zero) # e0 <x>
  6c:	00e7a023          	sw	a4,0(a5)
  70:	fec42783          	lw	a5,-20(s0)
  74:	00178793          	add	a5,a5,1
  78:	fef42623          	sw	a5,-20(s0)
  7c:	fec42703          	lw	a4,-20(s0)
  80:	00100793          	li	a5,1
  84:	fce7d8e3          	bge	a5,a4,54 <main+0x30>
  88:	0000006f          	j	88 <main+0x64>

Disassembly of section .eh_frame:

0000008c <__DATA_BEGIN__-0x54>:
  8c:	0014                	.insn	2, 0x0014
  8e:	0000                	.insn	2, 0x
  90:	0000                	.insn	2, 0x
  92:	0000                	.insn	2, 0x
  94:	00527a03          	.insn	4, 0x00527a03
  98:	7c01                	.insn	2, 0x7c01
  9a:	0101                	.insn	2, 0x0101
  9c:	07020d1b          	.insn	4, 0x07020d1b
  a0:	0001                	.insn	2, 0x0001
  a2:	0000                	.insn	2, 0x
  a4:	0010                	.insn	2, 0x0010
  a6:	0000                	.insn	2, 0x
  a8:	001c                	.insn	2, 0x001c
  aa:	0000                	.insn	2, 0x
  ac:	ff54                	.insn	2, 0xff54
  ae:	ffff                	.insn	2, 0xffff
  b0:	001c                	.insn	2, 0x001c
  b2:	0000                	.insn	2, 0x
  b4:	0000                	.insn	2, 0x
  b6:	0000                	.insn	2, 0x
  b8:	0010                	.insn	2, 0x0010
  ba:	0000                	.insn	2, 0x
  bc:	0000                	.insn	2, 0x
  be:	0000                	.insn	2, 0x
  c0:	00527a03          	.insn	4, 0x00527a03
  c4:	7c01                	.insn	2, 0x7c01
  c6:	0101                	.insn	2, 0x0101
  c8:	00020d1b          	.insn	4, 0x00020d1b
  cc:	0010                	.insn	2, 0x0010
  ce:	0000                	.insn	2, 0x
  d0:	0018                	.insn	2, 0x0018
  d2:	0000                	.insn	2, 0x
  d4:	ff48                	.insn	2, 0xff48
  d6:	ffff                	.insn	2, 0xffff
  d8:	0008                	.insn	2, 0x0008
  da:	0000                	.insn	2, 0x
  dc:	0000                	.insn	2, 0x
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
