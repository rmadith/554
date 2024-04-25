
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	b0818193          	add	gp,gp,-1272 # b08 <__global_pointer$>
   8:	00002117          	auipc	sp,0x2
   c:	ff810113          	add	sp,sp,-8 # 2000 <__stack_top>
  10:	00010433          	add	s0,sp,zero
  14:	284000ef          	jal	298 <main>
  18:	004000ef          	jal	1c <_exit>

0000001c <_exit>:
  1c:	05d00893          	li	a7,93
  20:	00000073          	ecall

00000024 <read_joystick>:
  24:	ff010113          	add	sp,sp,-16
  28:	00812623          	sw	s0,12(sp)
  2c:	01010413          	add	s0,sp,16
  30:	30c02783          	lw	a5,780(zero) # 30c <joystick>
  34:	0007a783          	lw	a5,0(a5)
  38:	00a7d793          	srl	a5,a5,0xa
  3c:	0037f713          	and	a4,a5,3
  40:	32e02023          	sw	a4,800(zero) # 320 <x1_val>
  44:	30c02783          	lw	a5,780(zero) # 30c <joystick>
  48:	0007a783          	lw	a5,0(a5)
  4c:	0087d793          	srl	a5,a5,0x8
  50:	0037f713          	and	a4,a5,3
  54:	32e02223          	sw	a4,804(zero) # 324 <y1_val>
  58:	30c02783          	lw	a5,780(zero) # 30c <joystick>
  5c:	0007a783          	lw	a5,0(a5)
  60:	0067d793          	srl	a5,a5,0x6
  64:	0037f713          	and	a4,a5,3
  68:	32e02423          	sw	a4,808(zero) # 328 <ps1_val>
  6c:	30c02783          	lw	a5,780(zero) # 30c <joystick>
  70:	0007a783          	lw	a5,0(a5)
  74:	0047d793          	srl	a5,a5,0x4
  78:	0037f713          	and	a4,a5,3
  7c:	32e02623          	sw	a4,812(zero) # 32c <x2_val>
  80:	30c02783          	lw	a5,780(zero) # 30c <joystick>
  84:	0007a783          	lw	a5,0(a5)
  88:	0027d793          	srl	a5,a5,0x2
  8c:	0037f713          	and	a4,a5,3
  90:	32e02823          	sw	a4,816(zero) # 330 <y2_val>
  94:	30c02783          	lw	a5,780(zero) # 30c <joystick>
  98:	0007a783          	lw	a5,0(a5)
  9c:	0037f713          	and	a4,a5,3
  a0:	32e02a23          	sw	a4,820(zero) # 334 <ps2_val>
  a4:	30c02783          	lw	a5,780(zero) # 30c <joystick>
  a8:	03f00713          	li	a4,63
  ac:	00e7a023          	sw	a4,0(a5)
  b0:	00000793          	li	a5,0
  b4:	00078513          	mv	a0,a5
  b8:	00c12403          	lw	s0,12(sp)
  bc:	01010113          	add	sp,sp,16
  c0:	00008067          	ret

000000c4 <update_tank>:
  c4:	ff010113          	add	sp,sp,-16
  c8:	00812623          	sw	s0,12(sp)
  cc:	01010413          	add	s0,sp,16
  d0:	00000013          	nop
  d4:	31002783          	lw	a5,784(zero) # 310 <VGA>
  d8:	0007a783          	lw	a5,0(a5)
  dc:	fe07cce3          	bltz	a5,d4 <update_tank+0x10>
  e0:	32002703          	lw	a4,800(zero) # 320 <x1_val>
  e4:	00200793          	li	a5,2
  e8:	04f71a63          	bne	a4,a5,13c <update_tank+0x78>
  ec:	31402703          	lw	a4,788(zero) # 314 <tank_xloc>
  f0:	00100793          	li	a5,1
  f4:	14e7dc63          	bge	a5,a4,24c <update_tank+0x188>
  f8:	31402783          	lw	a5,788(zero) # 314 <tank_xloc>
  fc:	01679713          	sll	a4,a5,0x16
 100:	31802783          	lw	a5,792(zero) # 318 <tank_yloc>
 104:	00c79793          	sll	a5,a5,0xc
 108:	00f76733          	or	a4,a4,a5
 10c:	31c02783          	lw	a5,796(zero) # 31c <tank_index>
 110:	00279793          	sll	a5,a5,0x2
 114:	00f767b3          	or	a5,a4,a5
 118:	0027e713          	or	a4,a5,2
 11c:	31002783          	lw	a5,784(zero) # 310 <VGA>
 120:	00e7a023          	sw	a4,0(a5)
 124:	31402783          	lw	a5,788(zero) # 314 <tank_xloc>
 128:	fff78713          	add	a4,a5,-1
 12c:	30e02a23          	sw	a4,788(zero) # 314 <tank_xloc>
 130:	02100713          	li	a4,33
 134:	30e02e23          	sw	a4,796(zero) # 31c <tank_index>
 138:	1140006f          	j	24c <update_tank+0x188>
 13c:	32002703          	lw	a4,800(zero) # 320 <x1_val>
 140:	00100793          	li	a5,1
 144:	04f71a63          	bne	a4,a5,198 <update_tank+0xd4>
 148:	31402703          	lw	a4,788(zero) # 314 <tank_xloc>
 14c:	23f00793          	li	a5,575
 150:	0ee7ce63          	blt	a5,a4,24c <update_tank+0x188>
 154:	31402783          	lw	a5,788(zero) # 314 <tank_xloc>
 158:	01679713          	sll	a4,a5,0x16
 15c:	31802783          	lw	a5,792(zero) # 318 <tank_yloc>
 160:	00c79793          	sll	a5,a5,0xc
 164:	00f76733          	or	a4,a4,a5
 168:	31c02783          	lw	a5,796(zero) # 31c <tank_index>
 16c:	00279793          	sll	a5,a5,0x2
 170:	00f767b3          	or	a5,a4,a5
 174:	0027e713          	or	a4,a5,2
 178:	31002783          	lw	a5,784(zero) # 310 <VGA>
 17c:	00e7a023          	sw	a4,0(a5)
 180:	31402783          	lw	a5,788(zero) # 314 <tank_xloc>
 184:	00178713          	add	a4,a5,1
 188:	30e02a23          	sw	a4,788(zero) # 314 <tank_xloc>
 18c:	01e00713          	li	a4,30
 190:	30e02e23          	sw	a4,796(zero) # 31c <tank_index>
 194:	0b80006f          	j	24c <update_tank+0x188>
 198:	32402703          	lw	a4,804(zero) # 324 <y1_val>
 19c:	00200793          	li	a5,2
 1a0:	04f71a63          	bne	a4,a5,1f4 <update_tank+0x130>
 1a4:	31802703          	lw	a4,792(zero) # 318 <tank_yloc>
 1a8:	00100793          	li	a5,1
 1ac:	0ae7d063          	bge	a5,a4,24c <update_tank+0x188>
 1b0:	31402783          	lw	a5,788(zero) # 314 <tank_xloc>
 1b4:	01679713          	sll	a4,a5,0x16
 1b8:	31802783          	lw	a5,792(zero) # 318 <tank_yloc>
 1bc:	00c79793          	sll	a5,a5,0xc
 1c0:	00f76733          	or	a4,a4,a5
 1c4:	31c02783          	lw	a5,796(zero) # 31c <tank_index>
 1c8:	00279793          	sll	a5,a5,0x2
 1cc:	00f767b3          	or	a5,a4,a5
 1d0:	0027e713          	or	a4,a5,2
 1d4:	31002783          	lw	a5,784(zero) # 310 <VGA>
 1d8:	00e7a023          	sw	a4,0(a5)
 1dc:	31802783          	lw	a5,792(zero) # 318 <tank_yloc>
 1e0:	fff78713          	add	a4,a5,-1
 1e4:	30e02c23          	sw	a4,792(zero) # 318 <tank_yloc>
 1e8:	01f00713          	li	a4,31
 1ec:	30e02e23          	sw	a4,796(zero) # 31c <tank_index>
 1f0:	05c0006f          	j	24c <update_tank+0x188>
 1f4:	32402703          	lw	a4,804(zero) # 324 <y1_val>
 1f8:	00100793          	li	a5,1
 1fc:	04f71863          	bne	a4,a5,24c <update_tank+0x188>
 200:	31802703          	lw	a4,792(zero) # 318 <tank_yloc>
 204:	34300793          	li	a5,835
 208:	04e7c263          	blt	a5,a4,24c <update_tank+0x188>
 20c:	31402783          	lw	a5,788(zero) # 314 <tank_xloc>
 210:	01679713          	sll	a4,a5,0x16
 214:	31802783          	lw	a5,792(zero) # 318 <tank_yloc>
 218:	00c79793          	sll	a5,a5,0xc
 21c:	00f76733          	or	a4,a4,a5
 220:	31c02783          	lw	a5,796(zero) # 31c <tank_index>
 224:	00279793          	sll	a5,a5,0x2
 228:	00f767b3          	or	a5,a4,a5
 22c:	0027e713          	or	a4,a5,2
 230:	31002783          	lw	a5,784(zero) # 310 <VGA>
 234:	00e7a023          	sw	a4,0(a5)
 238:	31802783          	lw	a5,792(zero) # 318 <tank_yloc>
 23c:	00178713          	add	a4,a5,1
 240:	30e02c23          	sw	a4,792(zero) # 318 <tank_yloc>
 244:	02000713          	li	a4,32
 248:	30e02e23          	sw	a4,796(zero) # 31c <tank_index>
 24c:	00000013          	nop
 250:	31002783          	lw	a5,784(zero) # 310 <VGA>
 254:	0007a783          	lw	a5,0(a5)
 258:	fe07cce3          	bltz	a5,250 <update_tank+0x18c>
 25c:	31402783          	lw	a5,788(zero) # 314 <tank_xloc>
 260:	01679713          	sll	a4,a5,0x16
 264:	31802783          	lw	a5,792(zero) # 318 <tank_yloc>
 268:	00c79793          	sll	a5,a5,0xc
 26c:	00f76733          	or	a4,a4,a5
 270:	31c02783          	lw	a5,796(zero) # 31c <tank_index>
 274:	00279793          	sll	a5,a5,0x2
 278:	00f767b3          	or	a5,a4,a5
 27c:	0017e713          	or	a4,a5,1
 280:	31002783          	lw	a5,784(zero) # 310 <VGA>
 284:	00e7a023          	sw	a4,0(a5)
 288:	00000013          	nop
 28c:	00c12403          	lw	s0,12(sp)
 290:	01010113          	add	sp,sp,16
 294:	00008067          	ret

00000298 <main>:
 298:	ff010113          	add	sp,sp,-16
 29c:	00112623          	sw	ra,12(sp)
 2a0:	00812423          	sw	s0,8(sp)
 2a4:	01010413          	add	s0,sp,16
 2a8:	d7dff0ef          	jal	24 <read_joystick>
 2ac:	e19ff0ef          	jal	c4 <update_tank>
 2b0:	ff9ff06f          	j	2a8 <main+0x10>

Disassembly of section .eh_frame:

000002b4 <.eh_frame>:
 2b4:	0014                	.insn	2, 0x0014
 2b6:	0000                	.insn	2, 0x
 2b8:	0000                	.insn	2, 0x
 2ba:	0000                	.insn	2, 0x
 2bc:	00527a03          	.insn	4, 0x00527a03
 2c0:	7c01                	.insn	2, 0x7c01
 2c2:	0101                	.insn	2, 0x0101
 2c4:	07020d1b          	.insn	4, 0x07020d1b
 2c8:	0001                	.insn	2, 0x0001
 2ca:	0000                	.insn	2, 0x
 2cc:	0010                	.insn	2, 0x0010
 2ce:	0000                	.insn	2, 0x
 2d0:	001c                	.insn	2, 0x001c
 2d2:	0000                	.insn	2, 0x
 2d4:	fd2c                	.insn	2, 0xfd2c
 2d6:	ffff                	.insn	2, 0xffff
 2d8:	001c                	.insn	2, 0x001c
 2da:	0000                	.insn	2, 0x
 2dc:	0000                	.insn	2, 0x
 2de:	0000                	.insn	2, 0x
 2e0:	0010                	.insn	2, 0x0010
 2e2:	0000                	.insn	2, 0x
 2e4:	0000                	.insn	2, 0x
 2e6:	0000                	.insn	2, 0x
 2e8:	00527a03          	.insn	4, 0x00527a03
 2ec:	7c01                	.insn	2, 0x7c01
 2ee:	0101                	.insn	2, 0x0101
 2f0:	00020d1b          	.insn	4, 0x00020d1b
 2f4:	0010                	.insn	2, 0x0010
 2f6:	0000                	.insn	2, 0x
 2f8:	0018                	.insn	2, 0x0018
 2fa:	0000                	.insn	2, 0x
 2fc:	fd20                	.insn	2, 0xfd20
 2fe:	ffff                	.insn	2, 0xffff
 300:	0008                	.insn	2, 0x0008
 302:	0000                	.insn	2, 0x
 304:	0000                	.insn	2, 0x
	...

Disassembly of section .sdata:

00000308 <debug>:
 308:	c001                	.insn	2, 0xc001
 30a:	ffff                	.insn	2, 0xffff

0000030c <joystick>:
 30c:	c002                	.insn	2, 0xc002
 30e:	ffff                	.insn	2, 0xffff

00000310 <VGA>:
 310:	ffffc003          	lbu	zero,-1(t6)

00000314 <tank_xloc>:
 314:	012c                	.insn	2, 0x012c
	...

00000318 <tank_yloc>:
 318:	012c                	.insn	2, 0x012c
	...

0000031c <tank_index>:
 31c:	0020                	.insn	2, 0x0020
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
