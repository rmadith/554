
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	96018193          	add	gp,gp,-1696 # 960 <__global_pointer$>
   8:	00002117          	auipc	sp,0x2
   c:	ff810113          	add	sp,sp,-8 # 2000 <__stack_top>
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
  30:	16402783          	lw	a5,356(zero) # 164 <joystick>
  34:	0007a783          	lw	a5,0(a5)
  38:	00a7d793          	srl	a5,a5,0xa
  3c:	0037f713          	and	a4,a5,3
  40:	16e02623          	sw	a4,364(zero) # 16c <x1_val>
  44:	16402783          	lw	a5,356(zero) # 164 <joystick>
  48:	0007a783          	lw	a5,0(a5)
  4c:	0087d793          	srl	a5,a5,0x8
  50:	0037f713          	and	a4,a5,3
  54:	16e02823          	sw	a4,368(zero) # 170 <y1_val>
  58:	16402783          	lw	a5,356(zero) # 164 <joystick>
  5c:	0007a783          	lw	a5,0(a5)
  60:	0067d793          	srl	a5,a5,0x6
  64:	0037f713          	and	a4,a5,3
  68:	16e02a23          	sw	a4,372(zero) # 174 <ps1_val>
  6c:	16402783          	lw	a5,356(zero) # 164 <joystick>
  70:	0007a783          	lw	a5,0(a5)
  74:	0047d793          	srl	a5,a5,0x4
  78:	0037f713          	and	a4,a5,3
  7c:	16e02c23          	sw	a4,376(zero) # 178 <x2_val>
  80:	16402783          	lw	a5,356(zero) # 164 <joystick>
  84:	0007a783          	lw	a5,0(a5)
  88:	0027d793          	srl	a5,a5,0x2
  8c:	0037f713          	and	a4,a5,3
  90:	16e02e23          	sw	a4,380(zero) # 17c <y2_val>
  94:	16402783          	lw	a5,356(zero) # 164 <joystick>
  98:	0007a783          	lw	a5,0(a5)
  9c:	0037f713          	and	a4,a5,3
  a0:	18e02023          	sw	a4,384(zero) # 180 <ps2_val>
  a4:	16402783          	lw	a5,356(zero) # 164 <joystick>
  a8:	03f00713          	li	a4,63
  ac:	00e7a023          	sw	a4,0(a5)
  b0:	16c02783          	lw	a5,364(zero) # 16c <x1_val>
  b4:	00f027b3          	sgtz	a5,a5
  b8:	0ff7f793          	zext.b	a5,a5
  bc:	fef42623          	sw	a5,-20(s0)
  c0:	17002783          	lw	a5,368(zero) # 170 <y1_val>
  c4:	00f027b3          	sgtz	a5,a5
  c8:	0ff7f793          	zext.b	a5,a5
  cc:	fef42423          	sw	a5,-24(s0)
  d0:	fec42703          	lw	a4,-20(s0)
  d4:	fe842783          	lw	a5,-24(s0)
  d8:	00f777b3          	and	a5,a4,a5
  dc:	f4078ae3          	beqz	a5,30 <main+0xc>
  e0:	03600713          	li	a4,54
  e4:	16e02823          	sw	a4,368(zero) # 170 <y1_val>
  e8:	00000013          	nop
  ec:	17002703          	lw	a4,368(zero) # 170 <y1_val>
  f0:	16002783          	lw	a5,352(zero) # 160 <debug>
  f4:	00e7a023          	sw	a4,0(a5)
  f8:	00000793          	li	a5,0
  fc:	00078513          	mv	a0,a5
 100:	01c12403          	lw	s0,28(sp)
 104:	02010113          	add	sp,sp,32
 108:	00008067          	ret

Disassembly of section .eh_frame:

0000010c <.eh_frame>:
 10c:	0014                	.insn	2, 0x0014
 10e:	0000                	.insn	2, 0x
 110:	0000                	.insn	2, 0x
 112:	0000                	.insn	2, 0x
 114:	00527a03          	.insn	4, 0x00527a03
 118:	7c01                	.insn	2, 0x7c01
 11a:	0101                	.insn	2, 0x0101
 11c:	07020d1b          	.insn	4, 0x07020d1b
 120:	0001                	.insn	2, 0x0001
 122:	0000                	.insn	2, 0x
 124:	0010                	.insn	2, 0x0010
 126:	0000                	.insn	2, 0x
 128:	001c                	.insn	2, 0x001c
 12a:	0000                	.insn	2, 0x
 12c:	fed4                	.insn	2, 0xfed4
 12e:	ffff                	.insn	2, 0xffff
 130:	001c                	.insn	2, 0x001c
 132:	0000                	.insn	2, 0x
 134:	0000                	.insn	2, 0x
 136:	0000                	.insn	2, 0x
 138:	0010                	.insn	2, 0x0010
 13a:	0000                	.insn	2, 0x
 13c:	0000                	.insn	2, 0x
 13e:	0000                	.insn	2, 0x
 140:	00527a03          	.insn	4, 0x00527a03
 144:	7c01                	.insn	2, 0x7c01
 146:	0101                	.insn	2, 0x0101
 148:	00020d1b          	.insn	4, 0x00020d1b
 14c:	0010                	.insn	2, 0x0010
 14e:	0000                	.insn	2, 0x
 150:	0018                	.insn	2, 0x0018
 152:	0000                	.insn	2, 0x
 154:	fec8                	.insn	2, 0xfec8
 156:	ffff                	.insn	2, 0xffff
 158:	0008                	.insn	2, 0x0008
 15a:	0000                	.insn	2, 0x
 15c:	0000                	.insn	2, 0x
	...

Disassembly of section .sdata:

00000160 <debug>:
 160:	c001                	.insn	2, 0xc001
 162:	ffff                	.insn	2, 0xffff

00000164 <joystick>:
 164:	c002                	.insn	2, 0xc002
 166:	ffff                	.insn	2, 0xffff

00000168 <VGA>:
 168:	ffffc003          	lbu	zero,-1(t6)

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
