
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	8f018193          	addi	gp,gp,-1808 # 8f0 <__global_pointer$>
   8:	08000117          	auipc	sp,0x8000
   c:	ff810113          	addi	sp,sp,-8 # 8000000 <__stack_top>
  10:	00010433          	add	s0,sp,zero
  14:	010000ef          	jal	24 <main>
  18:	004000ef          	jal	1c <_exit>

0000001c <_exit>:
  1c:	05d00893          	li	a7,93
  20:	00000073          	ecall

00000024 <main>:
  24:	fe010113          	addi	sp,sp,-32
  28:	00112e23          	sw	ra,28(sp)
  2c:	00812c23          	sw	s0,24(sp)
  30:	02010413          	addi	s0,sp,32
  34:	00100793          	li	a5,1
  38:	fef42623          	sw	a5,-20(s0)
  3c:	00200793          	li	a5,2
  40:	fef42423          	sw	a5,-24(s0)
  44:	fe842583          	lw	a1,-24(s0)
  48:	fec42503          	lw	a0,-20(s0)
  4c:	020000ef          	jal	6c <add>
  50:	fea42223          	sw	a0,-28(s0)
  54:	00000793          	li	a5,0
  58:	00078513          	mv	a0,a5
  5c:	01c12083          	lw	ra,28(sp)
  60:	01812403          	lw	s0,24(sp)
  64:	02010113          	addi	sp,sp,32
  68:	00008067          	ret

0000006c <add>:
  6c:	fe010113          	addi	sp,sp,-32
  70:	00812e23          	sw	s0,28(sp)
  74:	02010413          	addi	s0,sp,32
  78:	fea42623          	sw	a0,-20(s0)
  7c:	feb42423          	sw	a1,-24(s0)
  80:	fec42703          	lw	a4,-20(s0)
  84:	fe842783          	lw	a5,-24(s0)
  88:	00f707b3          	add	a5,a4,a5
  8c:	00078513          	mv	a0,a5
  90:	01c12403          	lw	s0,28(sp)
  94:	02010113          	addi	sp,sp,32
  98:	00008067          	ret

Disassembly of section .eh_frame:

0000009c <__DATA_BEGIN__-0x54>:
  9c:	0014                	.insn	2, 0x0014
  9e:	0000                	.insn	2, 0x
  a0:	0000                	.insn	2, 0x
  a2:	0000                	.insn	2, 0x
  a4:	00527a03          	.insn	4, 0x00527a03
  a8:	7c01                	.insn	2, 0x7c01
  aa:	0101                	.insn	2, 0x0101
  ac:	07020d1b          	.insn	4, 0x07020d1b
  b0:	0001                	.insn	2, 0x0001
  b2:	0000                	.insn	2, 0x
  b4:	0010                	.insn	2, 0x0010
  b6:	0000                	.insn	2, 0x
  b8:	001c                	.insn	2, 0x001c
  ba:	0000                	.insn	2, 0x
  bc:	ff44                	.insn	2, 0xff44
  be:	ffff                	.insn	2, 0xffff
  c0:	001c                	.insn	2, 0x001c
  c2:	0000                	.insn	2, 0x
  c4:	0000                	.insn	2, 0x
  c6:	0000                	.insn	2, 0x
  c8:	0010                	.insn	2, 0x0010
  ca:	0000                	.insn	2, 0x
  cc:	0000                	.insn	2, 0x
  ce:	0000                	.insn	2, 0x
  d0:	00527a03          	.insn	4, 0x00527a03
  d4:	7c01                	.insn	2, 0x7c01
  d6:	0101                	.insn	2, 0x0101
  d8:	00020d1b          	.insn	4, 0x00020d1b
  dc:	0010                	.insn	2, 0x0010
  de:	0000                	.insn	2, 0x
  e0:	0018                	.insn	2, 0x0018
  e2:	0000                	.insn	2, 0x
  e4:	ff38                	.insn	2, 0xff38
  e6:	ffff                	.insn	2, 0xffff
  e8:	0008                	.insn	2, 0x0008
  ea:	0000                	.insn	2, 0x
  ec:	0000                	.insn	2, 0x
	...

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	2029                	.insn	2, 0x2029
   8:	3331                	.insn	2, 0x3331
   a:	322e                	.insn	2, 0x322e
   c:	302e                	.insn	2, 0x302e
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	2941                	.insn	2, 0x2941
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <_start+0x14>
   c:	001f 0000 1004      	.insn	6, 0x10040000001f
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	5f31                	.insn	2, 0x5f31
  1c:	326d                	.insn	2, 0x326d
  1e:	3070                	.insn	2, 0x3070
  20:	7a5f 6d6d 6c75      	.insn	6, 0x6c756d6d7a5f
  26:	7031                	.insn	2, 0x7031
  28:	0030                	.insn	2, 0x0030
