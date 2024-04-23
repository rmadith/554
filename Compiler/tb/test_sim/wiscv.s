
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00002197          	auipc	gp,0x2
   4:	8cc18193          	add	gp,gp,-1844 # 18cc <__global_pointer$>
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
  30:	ffffc737          	lui	a4,0xffffc
  34:	00270713          	add	a4,a4,2 # ffffc002 <__stack_top+0xf7ffc002>
  38:	0ce02823          	sw	a4,208(zero) # d0 <y>
  3c:	ffffc737          	lui	a4,0xffffc
  40:	00370713          	add	a4,a4,3 # ffffc003 <__stack_top+0xf7ffc003>
  44:	0ce02a23          	sw	a4,212(zero) # d4 <z>
  48:	0d002783          	lw	a5,208(zero) # d0 <y>
  4c:	03f00713          	li	a4,63
  50:	00e7a023          	sw	a4,0(a5)
  54:	0d402783          	lw	a5,212(zero) # d4 <z>
  58:	500f0737          	lui	a4,0x500f0
  5c:	00570713          	add	a4,a4,5 # 500f0005 <__stack_top+0x480f0005>
  60:	00e7a023          	sw	a4,0(a5)
  64:	00000793          	li	a5,0
  68:	00078513          	mv	a0,a5
  6c:	00c12403          	lw	s0,12(sp)
  70:	01010113          	add	sp,sp,16
  74:	00008067          	ret

Disassembly of section .eh_frame:

00000078 <__DATA_BEGIN__-0x54>:
  78:	0014                	.insn	2, 0x0014
  7a:	0000                	.insn	2, 0x
  7c:	0000                	.insn	2, 0x
  7e:	0000                	.insn	2, 0x
  80:	00527a03          	.insn	4, 0x00527a03
  84:	7c01                	.insn	2, 0x7c01
  86:	0101                	.insn	2, 0x0101
  88:	07020d1b          	.insn	4, 0x07020d1b
  8c:	0001                	.insn	2, 0x0001
  8e:	0000                	.insn	2, 0x
  90:	0010                	.insn	2, 0x0010
  92:	0000                	.insn	2, 0x
  94:	001c                	.insn	2, 0x001c
  96:	0000                	.insn	2, 0x
  98:	ff68                	.insn	2, 0xff68
  9a:	ffff                	.insn	2, 0xffff
  9c:	001c                	.insn	2, 0x001c
  9e:	0000                	.insn	2, 0x
  a0:	0000                	.insn	2, 0x
  a2:	0000                	.insn	2, 0x
  a4:	0010                	.insn	2, 0x0010
  a6:	0000                	.insn	2, 0x
  a8:	0000                	.insn	2, 0x
  aa:	0000                	.insn	2, 0x
  ac:	00527a03          	.insn	4, 0x00527a03
  b0:	7c01                	.insn	2, 0x7c01
  b2:	0101                	.insn	2, 0x0101
  b4:	00020d1b          	.insn	4, 0x00020d1b
  b8:	0010                	.insn	2, 0x0010
  ba:	0000                	.insn	2, 0x
  bc:	0018                	.insn	2, 0x0018
  be:	0000                	.insn	2, 0x
  c0:	ff5c                	.insn	2, 0xff5c
  c2:	ffff                	.insn	2, 0xffff
  c4:	0008                	.insn	2, 0x0008
  c6:	0000                	.insn	2, 0x
  c8:	0000                	.insn	2, 0x
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
