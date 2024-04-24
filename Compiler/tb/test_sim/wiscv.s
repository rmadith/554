
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	9ac18193          	add	gp,gp,-1620 # 9ac <__global_pointer$>
   8:	00002117          	auipc	sp,0x2
   c:	ff810113          	add	sp,sp,-8 # 2000 <__stack_top>
  10:	00010433          	add	s0,sp,zero
  14:	0cc000ef          	jal	e0 <main>
  18:	004000ef          	jal	1c <_exit>

0000001c <_exit>:
  1c:	05d00893          	li	a7,93
  20:	00000073          	ecall

00000024 <read_joystick>:
  24:	ff010113          	add	sp,sp,-16
  28:	00812623          	sw	s0,12(sp)
  2c:	01010413          	add	s0,sp,16
  30:	1b002783          	lw	a5,432(zero) # 1b0 <joystick>
  34:	03f00713          	li	a4,63
  38:	00e7a023          	sw	a4,0(a5)
  3c:	1b002783          	lw	a5,432(zero) # 1b0 <joystick>
  40:	0007a783          	lw	a5,0(a5)
  44:	00a7d793          	srl	a5,a5,0xa
  48:	0037f713          	and	a4,a5,3
  4c:	1ce02023          	sw	a4,448(zero) # 1c0 <x1_val>
  50:	1b002783          	lw	a5,432(zero) # 1b0 <joystick>
  54:	0007a783          	lw	a5,0(a5)
  58:	0087d793          	srl	a5,a5,0x8
  5c:	0037f713          	and	a4,a5,3
  60:	1ce02223          	sw	a4,452(zero) # 1c4 <y1_val>
  64:	1b002783          	lw	a5,432(zero) # 1b0 <joystick>
  68:	0007a783          	lw	a5,0(a5)
  6c:	0067d793          	srl	a5,a5,0x6
  70:	0037f713          	and	a4,a5,3
  74:	1ce02423          	sw	a4,456(zero) # 1c8 <ps1_val>
  78:	1b002783          	lw	a5,432(zero) # 1b0 <joystick>
  7c:	0007a783          	lw	a5,0(a5)
  80:	0047d793          	srl	a5,a5,0x4
  84:	0037f713          	and	a4,a5,3
  88:	1ce02623          	sw	a4,460(zero) # 1cc <x2_val>
  8c:	1b002783          	lw	a5,432(zero) # 1b0 <joystick>
  90:	0007a783          	lw	a5,0(a5)
  94:	0027d793          	srl	a5,a5,0x2
  98:	0037f713          	and	a4,a5,3
  9c:	1ce02823          	sw	a4,464(zero) # 1d0 <y2_val>
  a0:	1b002783          	lw	a5,432(zero) # 1b0 <joystick>
  a4:	0007a783          	lw	a5,0(a5)
  a8:	0037f713          	and	a4,a5,3
  ac:	1ce02a23          	sw	a4,468(zero) # 1d4 <ps2_val>
  b0:	1b002703          	lw	a4,432(zero) # 1b0 <joystick>
  b4:	1ac02783          	lw	a5,428(zero) # 1ac <debug>
  b8:	00072703          	lw	a4,0(a4)
  bc:	00e7a023          	sw	a4,0(a5)
  c0:	1b002783          	lw	a5,432(zero) # 1b0 <joystick>
  c4:	03f00713          	li	a4,63
  c8:	00e7a023          	sw	a4,0(a5)
  cc:	00000793          	li	a5,0
  d0:	00078513          	mv	a0,a5
  d4:	00c12403          	lw	s0,12(sp)
  d8:	01010113          	add	sp,sp,16
  dc:	00008067          	ret

000000e0 <main>:
  e0:	fe010113          	add	sp,sp,-32
  e4:	00112e23          	sw	ra,28(sp)
  e8:	00812c23          	sw	s0,24(sp)
  ec:	02010413          	add	s0,sp,32
  f0:	f35ff0ef          	jal	24 <read_joystick>
  f4:	1c002703          	lw	a4,448(zero) # 1c0 <x1_val>
  f8:	00200793          	li	a5,2
  fc:	00f71863          	bne	a4,a5,10c <main+0x2c>
 100:	1bc02783          	lw	a5,444(zero) # 1bc <tank_yloc>
 104:	00178713          	add	a4,a5,1
 108:	1ae02e23          	sw	a4,444(zero) # 1bc <tank_yloc>
 10c:	00000013          	nop
 110:	1b402783          	lw	a5,436(zero) # 1b4 <VGA>
 114:	0007a703          	lw	a4,0(a5)
 118:	02000793          	li	a5,32
 11c:	00f757b3          	srl	a5,a4,a5
 120:	fe0798e3          	bnez	a5,110 <main+0x30>
 124:	1b802783          	lw	a5,440(zero) # 1b8 <tank_xloc>
 128:	01679793          	sll	a5,a5,0x16
 12c:	fef42623          	sw	a5,-20(s0)
 130:	1bc02783          	lw	a5,444(zero) # 1bc <tank_yloc>
 134:	00c79793          	sll	a5,a5,0xc
 138:	fef42423          	sw	a5,-24(s0)
 13c:	fec42703          	lw	a4,-20(s0)
 140:	fe842783          	lw	a5,-24(s0)
 144:	00f767b3          	or	a5,a4,a5
 148:	07d7e713          	or	a4,a5,125
 14c:	1b402783          	lw	a5,436(zero) # 1b4 <VGA>
 150:	00e7a023          	sw	a4,0(a5)
 154:	fa1ff06f          	j	f4 <main+0x14>

Disassembly of section .eh_frame:

00000158 <.eh_frame>:
 158:	0014                	.insn	2, 0x0014
 15a:	0000                	.insn	2, 0x
 15c:	0000                	.insn	2, 0x
 15e:	0000                	.insn	2, 0x
 160:	00527a03          	.insn	4, 0x00527a03
 164:	7c01                	.insn	2, 0x7c01
 166:	0101                	.insn	2, 0x0101
 168:	07020d1b          	.insn	4, 0x07020d1b
 16c:	0001                	.insn	2, 0x0001
 16e:	0000                	.insn	2, 0x
 170:	0010                	.insn	2, 0x0010
 172:	0000                	.insn	2, 0x
 174:	001c                	.insn	2, 0x001c
 176:	0000                	.insn	2, 0x
 178:	fe88                	.insn	2, 0xfe88
 17a:	ffff                	.insn	2, 0xffff
 17c:	001c                	.insn	2, 0x001c
 17e:	0000                	.insn	2, 0x
 180:	0000                	.insn	2, 0x
 182:	0000                	.insn	2, 0x
 184:	0010                	.insn	2, 0x0010
 186:	0000                	.insn	2, 0x
 188:	0000                	.insn	2, 0x
 18a:	0000                	.insn	2, 0x
 18c:	00527a03          	.insn	4, 0x00527a03
 190:	7c01                	.insn	2, 0x7c01
 192:	0101                	.insn	2, 0x0101
 194:	00020d1b          	.insn	4, 0x00020d1b
 198:	0010                	.insn	2, 0x0010
 19a:	0000                	.insn	2, 0x
 19c:	0018                	.insn	2, 0x0018
 19e:	0000                	.insn	2, 0x
 1a0:	fe7c                	.insn	2, 0xfe7c
 1a2:	ffff                	.insn	2, 0xffff
 1a4:	0008                	.insn	2, 0x0008
 1a6:	0000                	.insn	2, 0x
 1a8:	0000                	.insn	2, 0x
	...

Disassembly of section .sdata:

000001ac <debug>:
 1ac:	c001                	.insn	2, 0xc001
 1ae:	ffff                	.insn	2, 0xffff

000001b0 <joystick>:
 1b0:	c002                	.insn	2, 0xc002
 1b2:	ffff                	.insn	2, 0xffff

000001b4 <VGA>:
 1b4:	ffffc003          	lbu	zero,-1(t6)

000001b8 <tank_xloc>:
 1b8:	0154                	.insn	2, 0x0154
	...

000001bc <tank_yloc>:
 1bc:	0154                	.insn	2, 0x0154
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
