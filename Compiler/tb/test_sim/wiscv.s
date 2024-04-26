
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	b5018193          	add	gp,gp,-1200 # b50 <__global_pointer$>
   8:	00002117          	auipc	sp,0x2
   c:	ff810113          	add	sp,sp,-8 # 2000 <__stack_top>
  10:	00010433          	add	s0,sp,zero
  14:	29c000ef          	jal	2b0 <main>
  18:	004000ef          	jal	1c <_exit>

0000001c <_exit>:
  1c:	05d00893          	li	a7,93
  20:	00000073          	ecall

00000024 <read_joystick>:
  24:	ff010113          	add	sp,sp,-16
  28:	00812623          	sw	s0,12(sp)
  2c:	01010413          	add	s0,sp,16
  30:	35402783          	lw	a5,852(zero) # 354 <joystick>
  34:	0007a783          	lw	a5,0(a5)
  38:	00a7d793          	srl	a5,a5,0xa
  3c:	0037f713          	and	a4,a5,3
  40:	36e02423          	sw	a4,872(zero) # 368 <x1_val>
  44:	35402783          	lw	a5,852(zero) # 354 <joystick>
  48:	0007a783          	lw	a5,0(a5)
  4c:	0087d793          	srl	a5,a5,0x8
  50:	0037f713          	and	a4,a5,3
  54:	36e02623          	sw	a4,876(zero) # 36c <y1_val>
  58:	35402783          	lw	a5,852(zero) # 354 <joystick>
  5c:	0007a783          	lw	a5,0(a5)
  60:	0067d793          	srl	a5,a5,0x6
  64:	0037f713          	and	a4,a5,3
  68:	36e02823          	sw	a4,880(zero) # 370 <ps1_val>
  6c:	35402783          	lw	a5,852(zero) # 354 <joystick>
  70:	0007a783          	lw	a5,0(a5)
  74:	0047d793          	srl	a5,a5,0x4
  78:	0037f713          	and	a4,a5,3
  7c:	36e02a23          	sw	a4,884(zero) # 374 <x2_val>
  80:	35402783          	lw	a5,852(zero) # 354 <joystick>
  84:	0007a783          	lw	a5,0(a5)
  88:	0027d793          	srl	a5,a5,0x2
  8c:	0037f713          	and	a4,a5,3
  90:	36e02c23          	sw	a4,888(zero) # 378 <y2_val>
  94:	35402783          	lw	a5,852(zero) # 354 <joystick>
  98:	0007a783          	lw	a5,0(a5)
  9c:	0037f713          	and	a4,a5,3
  a0:	36e02e23          	sw	a4,892(zero) # 37c <ps2_val>
  a4:	35402783          	lw	a5,852(zero) # 354 <joystick>
  a8:	03f00713          	li	a4,63
  ac:	00e7a023          	sw	a4,0(a5)
  b0:	36c02783          	lw	a5,876(zero) # 36c <y1_val>
  b4:	00f05663          	blez	a5,c0 <read_joystick+0x9c>
  b8:	36002423          	sw	zero,872(zero) # 368 <x1_val>
  bc:	0100006f          	j	cc <read_joystick+0xa8>
  c0:	36802783          	lw	a5,872(zero) # 368 <x1_val>
  c4:	00f05463          	blez	a5,cc <read_joystick+0xa8>
  c8:	36002623          	sw	zero,876(zero) # 36c <y1_val>
  cc:	00000013          	nop
  d0:	00c12403          	lw	s0,12(sp)
  d4:	01010113          	add	sp,sp,16
  d8:	00008067          	ret

000000dc <update_tank>:
  dc:	ff010113          	add	sp,sp,-16
  e0:	00812623          	sw	s0,12(sp)
  e4:	01010413          	add	s0,sp,16
  e8:	00000013          	nop
  ec:	35802783          	lw	a5,856(zero) # 358 <VGA>
  f0:	0007a783          	lw	a5,0(a5)
  f4:	fe07cce3          	bltz	a5,ec <update_tank+0x10>
  f8:	36802703          	lw	a4,872(zero) # 368 <x1_val>
  fc:	00200793          	li	a5,2
 100:	04f71a63          	bne	a4,a5,154 <update_tank+0x78>
 104:	35c02703          	lw	a4,860(zero) # 35c <tank_xloc>
 108:	00100793          	li	a5,1
 10c:	14e7dc63          	bge	a5,a4,264 <update_tank+0x188>
 110:	35c02783          	lw	a5,860(zero) # 35c <tank_xloc>
 114:	01679713          	sll	a4,a5,0x16
 118:	36002783          	lw	a5,864(zero) # 360 <tank_yloc>
 11c:	00c79793          	sll	a5,a5,0xc
 120:	00f76733          	or	a4,a4,a5
 124:	36402783          	lw	a5,868(zero) # 364 <tank_index>
 128:	00279793          	sll	a5,a5,0x2
 12c:	00f767b3          	or	a5,a4,a5
 130:	0027e713          	or	a4,a5,2
 134:	35802783          	lw	a5,856(zero) # 358 <VGA>
 138:	00e7a023          	sw	a4,0(a5)
 13c:	35c02783          	lw	a5,860(zero) # 35c <tank_xloc>
 140:	fff78713          	add	a4,a5,-1
 144:	34e02e23          	sw	a4,860(zero) # 35c <tank_xloc>
 148:	02100713          	li	a4,33
 14c:	36e02223          	sw	a4,868(zero) # 364 <tank_index>
 150:	1140006f          	j	264 <update_tank+0x188>
 154:	36802703          	lw	a4,872(zero) # 368 <x1_val>
 158:	00100793          	li	a5,1
 15c:	04f71a63          	bne	a4,a5,1b0 <update_tank+0xd4>
 160:	35c02703          	lw	a4,860(zero) # 35c <tank_xloc>
 164:	23f00793          	li	a5,575
 168:	0ee7ce63          	blt	a5,a4,264 <update_tank+0x188>
 16c:	35c02783          	lw	a5,860(zero) # 35c <tank_xloc>
 170:	01679713          	sll	a4,a5,0x16
 174:	36002783          	lw	a5,864(zero) # 360 <tank_yloc>
 178:	00c79793          	sll	a5,a5,0xc
 17c:	00f76733          	or	a4,a4,a5
 180:	36402783          	lw	a5,868(zero) # 364 <tank_index>
 184:	00279793          	sll	a5,a5,0x2
 188:	00f767b3          	or	a5,a4,a5
 18c:	0027e713          	or	a4,a5,2
 190:	35802783          	lw	a5,856(zero) # 358 <VGA>
 194:	00e7a023          	sw	a4,0(a5)
 198:	35c02783          	lw	a5,860(zero) # 35c <tank_xloc>
 19c:	00178713          	add	a4,a5,1
 1a0:	34e02e23          	sw	a4,860(zero) # 35c <tank_xloc>
 1a4:	01e00713          	li	a4,30
 1a8:	36e02223          	sw	a4,868(zero) # 364 <tank_index>
 1ac:	0b80006f          	j	264 <update_tank+0x188>
 1b0:	36c02703          	lw	a4,876(zero) # 36c <y1_val>
 1b4:	00200793          	li	a5,2
 1b8:	04f71a63          	bne	a4,a5,20c <update_tank+0x130>
 1bc:	36002703          	lw	a4,864(zero) # 360 <tank_yloc>
 1c0:	00100793          	li	a5,1
 1c4:	0ae7d063          	bge	a5,a4,264 <update_tank+0x188>
 1c8:	35c02783          	lw	a5,860(zero) # 35c <tank_xloc>
 1cc:	01679713          	sll	a4,a5,0x16
 1d0:	36002783          	lw	a5,864(zero) # 360 <tank_yloc>
 1d4:	00c79793          	sll	a5,a5,0xc
 1d8:	00f76733          	or	a4,a4,a5
 1dc:	36402783          	lw	a5,868(zero) # 364 <tank_index>
 1e0:	00279793          	sll	a5,a5,0x2
 1e4:	00f767b3          	or	a5,a4,a5
 1e8:	0027e713          	or	a4,a5,2
 1ec:	35802783          	lw	a5,856(zero) # 358 <VGA>
 1f0:	00e7a023          	sw	a4,0(a5)
 1f4:	36002783          	lw	a5,864(zero) # 360 <tank_yloc>
 1f8:	fff78713          	add	a4,a5,-1
 1fc:	36e02023          	sw	a4,864(zero) # 360 <tank_yloc>
 200:	01f00713          	li	a4,31
 204:	36e02223          	sw	a4,868(zero) # 364 <tank_index>
 208:	05c0006f          	j	264 <update_tank+0x188>
 20c:	36c02703          	lw	a4,876(zero) # 36c <y1_val>
 210:	00100793          	li	a5,1
 214:	04f71863          	bne	a4,a5,264 <update_tank+0x188>
 218:	36002703          	lw	a4,864(zero) # 360 <tank_yloc>
 21c:	34300793          	li	a5,835
 220:	04e7c263          	blt	a5,a4,264 <update_tank+0x188>
 224:	35c02783          	lw	a5,860(zero) # 35c <tank_xloc>
 228:	01679713          	sll	a4,a5,0x16
 22c:	36002783          	lw	a5,864(zero) # 360 <tank_yloc>
 230:	00c79793          	sll	a5,a5,0xc
 234:	00f76733          	or	a4,a4,a5
 238:	36402783          	lw	a5,868(zero) # 364 <tank_index>
 23c:	00279793          	sll	a5,a5,0x2
 240:	00f767b3          	or	a5,a4,a5
 244:	0027e713          	or	a4,a5,2
 248:	35802783          	lw	a5,856(zero) # 358 <VGA>
 24c:	00e7a023          	sw	a4,0(a5)
 250:	36002783          	lw	a5,864(zero) # 360 <tank_yloc>
 254:	00178713          	add	a4,a5,1
 258:	36e02023          	sw	a4,864(zero) # 360 <tank_yloc>
 25c:	02000713          	li	a4,32
 260:	36e02223          	sw	a4,868(zero) # 364 <tank_index>
 264:	00000013          	nop
 268:	35802783          	lw	a5,856(zero) # 358 <VGA>
 26c:	0007a783          	lw	a5,0(a5)
 270:	fe07cce3          	bltz	a5,268 <update_tank+0x18c>
 274:	35c02783          	lw	a5,860(zero) # 35c <tank_xloc>
 278:	01679713          	sll	a4,a5,0x16
 27c:	36002783          	lw	a5,864(zero) # 360 <tank_yloc>
 280:	00c79793          	sll	a5,a5,0xc
 284:	00f76733          	or	a4,a4,a5
 288:	36402783          	lw	a5,868(zero) # 364 <tank_index>
 28c:	00279793          	sll	a5,a5,0x2
 290:	00f767b3          	or	a5,a4,a5
 294:	0017e713          	or	a4,a5,1
 298:	35802783          	lw	a5,856(zero) # 358 <VGA>
 29c:	00e7a023          	sw	a4,0(a5)
 2a0:	00000013          	nop
 2a4:	00c12403          	lw	s0,12(sp)
 2a8:	01010113          	add	sp,sp,16
 2ac:	00008067          	ret

000002b0 <main>:
 2b0:	ff010113          	add	sp,sp,-16
 2b4:	00812623          	sw	s0,12(sp)
 2b8:	01010413          	add	s0,sp,16
 2bc:	35c02783          	lw	a5,860(zero) # 35c <tank_xloc>
 2c0:	01679713          	sll	a4,a5,0x16
 2c4:	36002783          	lw	a5,864(zero) # 360 <tank_yloc>
 2c8:	00c79793          	sll	a5,a5,0xc
 2cc:	00f76733          	or	a4,a4,a5
 2d0:	36402783          	lw	a5,868(zero) # 364 <tank_index>
 2d4:	00279793          	sll	a5,a5,0x2
 2d8:	00f767b3          	or	a5,a4,a5
 2dc:	0027e713          	or	a4,a5,2
 2e0:	35802783          	lw	a5,856(zero) # 358 <VGA>
 2e4:	00e7a023          	sw	a4,0(a5)
 2e8:	00000793          	li	a5,0
 2ec:	00078513          	mv	a0,a5
 2f0:	00c12403          	lw	s0,12(sp)
 2f4:	01010113          	add	sp,sp,16
 2f8:	00008067          	ret

Disassembly of section .eh_frame:

000002fc <.eh_frame>:
 2fc:	0014                	.insn	2, 0x0014
 2fe:	0000                	.insn	2, 0x
 300:	0000                	.insn	2, 0x
 302:	0000                	.insn	2, 0x
 304:	00527a03          	.insn	4, 0x00527a03
 308:	7c01                	.insn	2, 0x7c01
 30a:	0101                	.insn	2, 0x0101
 30c:	07020d1b          	.insn	4, 0x07020d1b
 310:	0001                	.insn	2, 0x0001
 312:	0000                	.insn	2, 0x
 314:	0010                	.insn	2, 0x0010
 316:	0000                	.insn	2, 0x
 318:	001c                	.insn	2, 0x001c
 31a:	0000                	.insn	2, 0x
 31c:	fce4                	.insn	2, 0xfce4
 31e:	ffff                	.insn	2, 0xffff
 320:	001c                	.insn	2, 0x001c
 322:	0000                	.insn	2, 0x
 324:	0000                	.insn	2, 0x
 326:	0000                	.insn	2, 0x
 328:	0010                	.insn	2, 0x0010
 32a:	0000                	.insn	2, 0x
 32c:	0000                	.insn	2, 0x
 32e:	0000                	.insn	2, 0x
 330:	00527a03          	.insn	4, 0x00527a03
 334:	7c01                	.insn	2, 0x7c01
 336:	0101                	.insn	2, 0x0101
 338:	00020d1b          	.insn	4, 0x00020d1b
 33c:	0010                	.insn	2, 0x0010
 33e:	0000                	.insn	2, 0x
 340:	0018                	.insn	2, 0x0018
 342:	0000                	.insn	2, 0x
 344:	fcd8                	.insn	2, 0xfcd8
 346:	ffff                	.insn	2, 0xffff
 348:	0008                	.insn	2, 0x0008
 34a:	0000                	.insn	2, 0x
 34c:	0000                	.insn	2, 0x
	...

Disassembly of section .sdata:

00000350 <debug>:
 350:	c001                	.insn	2, 0xc001
 352:	ffff                	.insn	2, 0xffff

00000354 <joystick>:
 354:	c002                	.insn	2, 0xc002
 356:	ffff                	.insn	2, 0xffff

00000358 <VGA>:
 358:	ffffc003          	lbu	zero,-1(t6)

0000035c <tank_xloc>:
 35c:	012c                	.insn	2, 0x012c
	...

00000360 <tank_yloc>:
 360:	012c                	.insn	2, 0x012c
	...

00000364 <tank_index>:
 364:	0020                	.insn	2, 0x0020
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
