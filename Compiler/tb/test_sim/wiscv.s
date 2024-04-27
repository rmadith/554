
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	e9418193          	add	gp,gp,-364 # e94 <__global_pointer$>
   8:	00002117          	auipc	sp,0x2
   c:	ff810113          	add	sp,sp,-8 # 2000 <__stack_top>
  10:	00010433          	add	s0,sp,zero
  14:	5ec000ef          	jal	600 <main>
  18:	004000ef          	jal	1c <_exit>

0000001c <_exit>:
  1c:	05d00893          	li	a7,93
  20:	00000073          	ecall

00000024 <read_joystick>:
  24:	ff010113          	add	sp,sp,-16
  28:	00812623          	sw	s0,12(sp)
  2c:	01010413          	add	s0,sp,16
  30:	69802783          	lw	a5,1688(zero) # 698 <joystick>
  34:	0007a783          	lw	a5,0(a5)
  38:	00a7d793          	srl	a5,a5,0xa
  3c:	0037f713          	and	a4,a5,3
  40:	6ae02823          	sw	a4,1712(zero) # 6b0 <x1_val>
  44:	69802783          	lw	a5,1688(zero) # 698 <joystick>
  48:	0007a783          	lw	a5,0(a5)
  4c:	0087d793          	srl	a5,a5,0x8
  50:	0037f713          	and	a4,a5,3
  54:	6ae02a23          	sw	a4,1716(zero) # 6b4 <y1_val>
  58:	69802783          	lw	a5,1688(zero) # 698 <joystick>
  5c:	0007a783          	lw	a5,0(a5)
  60:	0067d793          	srl	a5,a5,0x6
  64:	0037f713          	and	a4,a5,3
  68:	6ae02c23          	sw	a4,1720(zero) # 6b8 <ps1_val>
  6c:	69802783          	lw	a5,1688(zero) # 698 <joystick>
  70:	0007a783          	lw	a5,0(a5)
  74:	0047d793          	srl	a5,a5,0x4
  78:	0037f713          	and	a4,a5,3
  7c:	6ae02e23          	sw	a4,1724(zero) # 6bc <x2_val>
  80:	69802783          	lw	a5,1688(zero) # 698 <joystick>
  84:	0007a783          	lw	a5,0(a5)
  88:	0027d793          	srl	a5,a5,0x2
  8c:	0037f713          	and	a4,a5,3
  90:	6ce02023          	sw	a4,1728(zero) # 6c0 <y2_val>
  94:	69802783          	lw	a5,1688(zero) # 698 <joystick>
  98:	0007a783          	lw	a5,0(a5)
  9c:	0037f713          	and	a4,a5,3
  a0:	6ce02223          	sw	a4,1732(zero) # 6c4 <ps2_val>
  a4:	69802783          	lw	a5,1688(zero) # 698 <joystick>
  a8:	03f00713          	li	a4,63
  ac:	00e7a023          	sw	a4,0(a5)
  b0:	00000013          	nop
  b4:	00c12403          	lw	s0,12(sp)
  b8:	01010113          	add	sp,sp,16
  bc:	00008067          	ret

000000c0 <wait_for_vga>:
  c0:	ff010113          	add	sp,sp,-16
  c4:	00812623          	sw	s0,12(sp)
  c8:	01010413          	add	s0,sp,16
  cc:	00000013          	nop
  d0:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
  d4:	0007a783          	lw	a5,0(a5)
  d8:	fe07cce3          	bltz	a5,d0 <wait_for_vga+0x10>
  dc:	00000013          	nop
  e0:	00000013          	nop
  e4:	00c12403          	lw	s0,12(sp)
  e8:	01010113          	add	sp,sp,16
  ec:	00008067          	ret

000000f0 <update_tank>:
  f0:	fe010113          	add	sp,sp,-32
  f4:	00112e23          	sw	ra,28(sp)
  f8:	00812c23          	sw	s0,24(sp)
  fc:	02010413          	add	s0,sp,32
 100:	00100793          	li	a5,1
 104:	fef42623          	sw	a5,-20(s0)
 108:	00100793          	li	a5,1
 10c:	fef42423          	sw	a5,-24(s0)
 110:	fb1ff0ef          	jal	c0 <wait_for_vga>
 114:	6bc02703          	lw	a4,1724(zero) # 6bc <x2_val>
 118:	00200793          	li	a5,2
 11c:	04f71863          	bne	a4,a5,16c <update_tank+0x7c>
 120:	6c002783          	lw	a5,1728(zero) # 6c0 <y2_val>
 124:	04079463          	bnez	a5,16c <update_tank+0x7c>
 128:	6ac02703          	lw	a4,1708(zero) # 6ac <gun_index>
 12c:	02900793          	li	a5,41
 130:	02f70e63          	beq	a4,a5,16c <update_tank+0x7c>
 134:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 138:	01679713          	sll	a4,a5,0x16
 13c:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 140:	00c79793          	sll	a5,a5,0xc
 144:	00f76733          	or	a4,a4,a5
 148:	6ac02783          	lw	a5,1708(zero) # 6ac <gun_index>
 14c:	00279793          	sll	a5,a5,0x2
 150:	00f767b3          	or	a5,a4,a5
 154:	0027e713          	or	a4,a5,2
 158:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 15c:	00e7a023          	sw	a4,0(a5)
 160:	02900713          	li	a4,41
 164:	6ae02623          	sw	a4,1708(zero) # 6ac <gun_index>
 168:	2800006f          	j	3e8 <update_tank+0x2f8>
 16c:	6bc02703          	lw	a4,1724(zero) # 6bc <x2_val>
 170:	00100793          	li	a5,1
 174:	04f71863          	bne	a4,a5,1c4 <update_tank+0xd4>
 178:	6c002783          	lw	a5,1728(zero) # 6c0 <y2_val>
 17c:	04079463          	bnez	a5,1c4 <update_tank+0xd4>
 180:	6ac02703          	lw	a4,1708(zero) # 6ac <gun_index>
 184:	02200793          	li	a5,34
 188:	02f70e63          	beq	a4,a5,1c4 <update_tank+0xd4>
 18c:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 190:	01679713          	sll	a4,a5,0x16
 194:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 198:	00c79793          	sll	a5,a5,0xc
 19c:	00f76733          	or	a4,a4,a5
 1a0:	6ac02783          	lw	a5,1708(zero) # 6ac <gun_index>
 1a4:	00279793          	sll	a5,a5,0x2
 1a8:	00f767b3          	or	a5,a4,a5
 1ac:	0027e713          	or	a4,a5,2
 1b0:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 1b4:	00e7a023          	sw	a4,0(a5)
 1b8:	02200713          	li	a4,34
 1bc:	6ae02623          	sw	a4,1708(zero) # 6ac <gun_index>
 1c0:	2280006f          	j	3e8 <update_tank+0x2f8>
 1c4:	6c002703          	lw	a4,1728(zero) # 6c0 <y2_val>
 1c8:	00200793          	li	a5,2
 1cc:	04f71863          	bne	a4,a5,21c <update_tank+0x12c>
 1d0:	6bc02783          	lw	a5,1724(zero) # 6bc <x2_val>
 1d4:	04079463          	bnez	a5,21c <update_tank+0x12c>
 1d8:	6ac02703          	lw	a4,1708(zero) # 6ac <gun_index>
 1dc:	02300793          	li	a5,35
 1e0:	02f70e63          	beq	a4,a5,21c <update_tank+0x12c>
 1e4:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 1e8:	01679713          	sll	a4,a5,0x16
 1ec:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 1f0:	00c79793          	sll	a5,a5,0xc
 1f4:	00f76733          	or	a4,a4,a5
 1f8:	6ac02783          	lw	a5,1708(zero) # 6ac <gun_index>
 1fc:	00279793          	sll	a5,a5,0x2
 200:	00f767b3          	or	a5,a4,a5
 204:	0027e713          	or	a4,a5,2
 208:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 20c:	00e7a023          	sw	a4,0(a5)
 210:	02300713          	li	a4,35
 214:	6ae02623          	sw	a4,1708(zero) # 6ac <gun_index>
 218:	1d00006f          	j	3e8 <update_tank+0x2f8>
 21c:	6c002703          	lw	a4,1728(zero) # 6c0 <y2_val>
 220:	00100793          	li	a5,1
 224:	04f71863          	bne	a4,a5,274 <update_tank+0x184>
 228:	6bc02783          	lw	a5,1724(zero) # 6bc <x2_val>
 22c:	04079463          	bnez	a5,274 <update_tank+0x184>
 230:	6ac02703          	lw	a4,1708(zero) # 6ac <gun_index>
 234:	02600793          	li	a5,38
 238:	02f70e63          	beq	a4,a5,274 <update_tank+0x184>
 23c:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 240:	01679713          	sll	a4,a5,0x16
 244:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 248:	00c79793          	sll	a5,a5,0xc
 24c:	00f76733          	or	a4,a4,a5
 250:	6ac02783          	lw	a5,1708(zero) # 6ac <gun_index>
 254:	00279793          	sll	a5,a5,0x2
 258:	00f767b3          	or	a5,a4,a5
 25c:	0027e713          	or	a4,a5,2
 260:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 264:	00e7a023          	sw	a4,0(a5)
 268:	02600713          	li	a4,38
 26c:	6ae02623          	sw	a4,1708(zero) # 6ac <gun_index>
 270:	1780006f          	j	3e8 <update_tank+0x2f8>
 274:	6bc02703          	lw	a4,1724(zero) # 6bc <x2_val>
 278:	00100793          	li	a5,1
 27c:	04f71a63          	bne	a4,a5,2d0 <update_tank+0x1e0>
 280:	6c002703          	lw	a4,1728(zero) # 6c0 <y2_val>
 284:	00200793          	li	a5,2
 288:	04f71463          	bne	a4,a5,2d0 <update_tank+0x1e0>
 28c:	6ac02703          	lw	a4,1708(zero) # 6ac <gun_index>
 290:	02400793          	li	a5,36
 294:	02f70e63          	beq	a4,a5,2d0 <update_tank+0x1e0>
 298:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 29c:	01679713          	sll	a4,a5,0x16
 2a0:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 2a4:	00c79793          	sll	a5,a5,0xc
 2a8:	00f76733          	or	a4,a4,a5
 2ac:	6ac02783          	lw	a5,1708(zero) # 6ac <gun_index>
 2b0:	00279793          	sll	a5,a5,0x2
 2b4:	00f767b3          	or	a5,a4,a5
 2b8:	0027e713          	or	a4,a5,2
 2bc:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 2c0:	00e7a023          	sw	a4,0(a5)
 2c4:	02400713          	li	a4,36
 2c8:	6ae02623          	sw	a4,1708(zero) # 6ac <gun_index>
 2cc:	11c0006f          	j	3e8 <update_tank+0x2f8>
 2d0:	6bc02703          	lw	a4,1724(zero) # 6bc <x2_val>
 2d4:	00200793          	li	a5,2
 2d8:	04f71a63          	bne	a4,a5,32c <update_tank+0x23c>
 2dc:	6c002703          	lw	a4,1728(zero) # 6c0 <y2_val>
 2e0:	00200793          	li	a5,2
 2e4:	04f71463          	bne	a4,a5,32c <update_tank+0x23c>
 2e8:	6ac02703          	lw	a4,1708(zero) # 6ac <gun_index>
 2ec:	02500793          	li	a5,37
 2f0:	02f70e63          	beq	a4,a5,32c <update_tank+0x23c>
 2f4:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 2f8:	01679713          	sll	a4,a5,0x16
 2fc:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 300:	00c79793          	sll	a5,a5,0xc
 304:	00f76733          	or	a4,a4,a5
 308:	6ac02783          	lw	a5,1708(zero) # 6ac <gun_index>
 30c:	00279793          	sll	a5,a5,0x2
 310:	00f767b3          	or	a5,a4,a5
 314:	0027e713          	or	a4,a5,2
 318:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 31c:	00e7a023          	sw	a4,0(a5)
 320:	02500713          	li	a4,37
 324:	6ae02623          	sw	a4,1708(zero) # 6ac <gun_index>
 328:	0c00006f          	j	3e8 <update_tank+0x2f8>
 32c:	6bc02703          	lw	a4,1724(zero) # 6bc <x2_val>
 330:	00100793          	li	a5,1
 334:	04f71a63          	bne	a4,a5,388 <update_tank+0x298>
 338:	6c002703          	lw	a4,1728(zero) # 6c0 <y2_val>
 33c:	00100793          	li	a5,1
 340:	04f71463          	bne	a4,a5,388 <update_tank+0x298>
 344:	6ac02703          	lw	a4,1708(zero) # 6ac <gun_index>
 348:	02700793          	li	a5,39
 34c:	02f70e63          	beq	a4,a5,388 <update_tank+0x298>
 350:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 354:	01679713          	sll	a4,a5,0x16
 358:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 35c:	00c79793          	sll	a5,a5,0xc
 360:	00f76733          	or	a4,a4,a5
 364:	6ac02783          	lw	a5,1708(zero) # 6ac <gun_index>
 368:	00279793          	sll	a5,a5,0x2
 36c:	00f767b3          	or	a5,a4,a5
 370:	0027e713          	or	a4,a5,2
 374:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 378:	00e7a023          	sw	a4,0(a5)
 37c:	02700713          	li	a4,39
 380:	6ae02623          	sw	a4,1708(zero) # 6ac <gun_index>
 384:	0640006f          	j	3e8 <update_tank+0x2f8>
 388:	6bc02703          	lw	a4,1724(zero) # 6bc <x2_val>
 38c:	00200793          	li	a5,2
 390:	04f71a63          	bne	a4,a5,3e4 <update_tank+0x2f4>
 394:	6c002703          	lw	a4,1728(zero) # 6c0 <y2_val>
 398:	00100793          	li	a5,1
 39c:	04f71463          	bne	a4,a5,3e4 <update_tank+0x2f4>
 3a0:	6ac02703          	lw	a4,1708(zero) # 6ac <gun_index>
 3a4:	02800793          	li	a5,40
 3a8:	02f70e63          	beq	a4,a5,3e4 <update_tank+0x2f4>
 3ac:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 3b0:	01679713          	sll	a4,a5,0x16
 3b4:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 3b8:	00c79793          	sll	a5,a5,0xc
 3bc:	00f76733          	or	a4,a4,a5
 3c0:	6ac02783          	lw	a5,1708(zero) # 6ac <gun_index>
 3c4:	00279793          	sll	a5,a5,0x2
 3c8:	00f767b3          	or	a5,a4,a5
 3cc:	0027e713          	or	a4,a5,2
 3d0:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 3d4:	00e7a023          	sw	a4,0(a5)
 3d8:	02800713          	li	a4,40
 3dc:	6ae02623          	sw	a4,1708(zero) # 6ac <gun_index>
 3e0:	0080006f          	j	3e8 <update_tank+0x2f8>
 3e4:	fe042423          	sw	zero,-24(s0)
 3e8:	fe842783          	lw	a5,-24(s0)
 3ec:	18079663          	bnez	a5,578 <update_tank+0x488>
 3f0:	6b002703          	lw	a4,1712(zero) # 6b0 <x1_val>
 3f4:	00200793          	li	a5,2
 3f8:	04f71c63          	bne	a4,a5,450 <update_tank+0x360>
 3fc:	6a002703          	lw	a4,1696(zero) # 6a0 <tank_xloc>
 400:	00100793          	li	a5,1
 404:	16e7dc63          	bge	a5,a4,57c <update_tank+0x48c>
 408:	cb9ff0ef          	jal	c0 <wait_for_vga>
 40c:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 410:	01679713          	sll	a4,a5,0x16
 414:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 418:	00c79793          	sll	a5,a5,0xc
 41c:	00f76733          	or	a4,a4,a5
 420:	6a802783          	lw	a5,1704(zero) # 6a8 <tank_index>
 424:	00279793          	sll	a5,a5,0x2
 428:	00f767b3          	or	a5,a4,a5
 42c:	0027e713          	or	a4,a5,2
 430:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 434:	00e7a023          	sw	a4,0(a5)
 438:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 43c:	fff78713          	add	a4,a5,-1
 440:	6ae02023          	sw	a4,1696(zero) # 6a0 <tank_xloc>
 444:	02100713          	li	a4,33
 448:	6ae02423          	sw	a4,1704(zero) # 6a8 <tank_index>
 44c:	1300006f          	j	57c <update_tank+0x48c>
 450:	6b002703          	lw	a4,1712(zero) # 6b0 <x1_val>
 454:	00100793          	li	a5,1
 458:	04f71c63          	bne	a4,a5,4b0 <update_tank+0x3c0>
 45c:	6a002703          	lw	a4,1696(zero) # 6a0 <tank_xloc>
 460:	23f00793          	li	a5,575
 464:	10e7cc63          	blt	a5,a4,57c <update_tank+0x48c>
 468:	c59ff0ef          	jal	c0 <wait_for_vga>
 46c:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 470:	01679713          	sll	a4,a5,0x16
 474:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 478:	00c79793          	sll	a5,a5,0xc
 47c:	00f76733          	or	a4,a4,a5
 480:	6a802783          	lw	a5,1704(zero) # 6a8 <tank_index>
 484:	00279793          	sll	a5,a5,0x2
 488:	00f767b3          	or	a5,a4,a5
 48c:	0027e713          	or	a4,a5,2
 490:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 494:	00e7a023          	sw	a4,0(a5)
 498:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 49c:	00178713          	add	a4,a5,1
 4a0:	6ae02023          	sw	a4,1696(zero) # 6a0 <tank_xloc>
 4a4:	01e00713          	li	a4,30
 4a8:	6ae02423          	sw	a4,1704(zero) # 6a8 <tank_index>
 4ac:	0d00006f          	j	57c <update_tank+0x48c>
 4b0:	6b402703          	lw	a4,1716(zero) # 6b4 <y1_val>
 4b4:	00200793          	li	a5,2
 4b8:	04f71c63          	bne	a4,a5,510 <update_tank+0x420>
 4bc:	6a402703          	lw	a4,1700(zero) # 6a4 <tank_yloc>
 4c0:	00100793          	li	a5,1
 4c4:	0ae7dc63          	bge	a5,a4,57c <update_tank+0x48c>
 4c8:	bf9ff0ef          	jal	c0 <wait_for_vga>
 4cc:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 4d0:	01679713          	sll	a4,a5,0x16
 4d4:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 4d8:	00c79793          	sll	a5,a5,0xc
 4dc:	00f76733          	or	a4,a4,a5
 4e0:	6a802783          	lw	a5,1704(zero) # 6a8 <tank_index>
 4e4:	00279793          	sll	a5,a5,0x2
 4e8:	00f767b3          	or	a5,a4,a5
 4ec:	0027e713          	or	a4,a5,2
 4f0:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 4f4:	00e7a023          	sw	a4,0(a5)
 4f8:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 4fc:	ffe78713          	add	a4,a5,-2
 500:	6ae02223          	sw	a4,1700(zero) # 6a4 <tank_yloc>
 504:	01f00713          	li	a4,31
 508:	6ae02423          	sw	a4,1704(zero) # 6a8 <tank_index>
 50c:	0700006f          	j	57c <update_tank+0x48c>
 510:	6b402703          	lw	a4,1716(zero) # 6b4 <y1_val>
 514:	00100793          	li	a5,1
 518:	04f71c63          	bne	a4,a5,570 <update_tank+0x480>
 51c:	6a402703          	lw	a4,1700(zero) # 6a4 <tank_yloc>
 520:	34300793          	li	a5,835
 524:	04e7cc63          	blt	a5,a4,57c <update_tank+0x48c>
 528:	b99ff0ef          	jal	c0 <wait_for_vga>
 52c:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 530:	01679713          	sll	a4,a5,0x16
 534:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 538:	00c79793          	sll	a5,a5,0xc
 53c:	00f76733          	or	a4,a4,a5
 540:	6a802783          	lw	a5,1704(zero) # 6a8 <tank_index>
 544:	00279793          	sll	a5,a5,0x2
 548:	00f767b3          	or	a5,a4,a5
 54c:	0027e713          	or	a4,a5,2
 550:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 554:	00e7a023          	sw	a4,0(a5)
 558:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 55c:	00278713          	add	a4,a5,2
 560:	6ae02223          	sw	a4,1700(zero) # 6a4 <tank_yloc>
 564:	02000713          	li	a4,32
 568:	6ae02423          	sw	a4,1704(zero) # 6a8 <tank_index>
 56c:	0100006f          	j	57c <update_tank+0x48c>
 570:	fe042623          	sw	zero,-20(s0)
 574:	0080006f          	j	57c <update_tank+0x48c>
 578:	fe042623          	sw	zero,-20(s0)
 57c:	fec42703          	lw	a4,-20(s0)
 580:	fe842783          	lw	a5,-24(s0)
 584:	00f767b3          	or	a5,a4,a5
 588:	06078263          	beqz	a5,5ec <update_tank+0x4fc>
 58c:	b35ff0ef          	jal	c0 <wait_for_vga>
 590:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 594:	01679713          	sll	a4,a5,0x16
 598:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 59c:	00c79793          	sll	a5,a5,0xc
 5a0:	00f76733          	or	a4,a4,a5
 5a4:	6a802783          	lw	a5,1704(zero) # 6a8 <tank_index>
 5a8:	00279793          	sll	a5,a5,0x2
 5ac:	00f767b3          	or	a5,a4,a5
 5b0:	0017e713          	or	a4,a5,1
 5b4:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 5b8:	00e7a023          	sw	a4,0(a5)
 5bc:	b05ff0ef          	jal	c0 <wait_for_vga>
 5c0:	6a002783          	lw	a5,1696(zero) # 6a0 <tank_xloc>
 5c4:	01679713          	sll	a4,a5,0x16
 5c8:	6a402783          	lw	a5,1700(zero) # 6a4 <tank_yloc>
 5cc:	00c79793          	sll	a5,a5,0xc
 5d0:	00f76733          	or	a4,a4,a5
 5d4:	6ac02783          	lw	a5,1708(zero) # 6ac <gun_index>
 5d8:	00279793          	sll	a5,a5,0x2
 5dc:	00f767b3          	or	a5,a4,a5
 5e0:	0017e713          	or	a4,a5,1
 5e4:	69c02783          	lw	a5,1692(zero) # 69c <VGA>
 5e8:	00e7a023          	sw	a4,0(a5)
 5ec:	00000013          	nop
 5f0:	01c12083          	lw	ra,28(sp)
 5f4:	01812403          	lw	s0,24(sp)
 5f8:	02010113          	add	sp,sp,32
 5fc:	00008067          	ret

00000600 <main>:
 600:	fe010113          	add	sp,sp,-32
 604:	00112e23          	sw	ra,28(sp)
 608:	00812c23          	sw	s0,24(sp)
 60c:	02010413          	add	s0,sp,32
 610:	a15ff0ef          	jal	24 <read_joystick>
 614:	addff0ef          	jal	f0 <update_tank>
 618:	fe042623          	sw	zero,-20(s0)
 61c:	0100006f          	j	62c <main+0x2c>
 620:	fec42783          	lw	a5,-20(s0)
 624:	00178793          	add	a5,a5,1
 628:	fef42623          	sw	a5,-20(s0)
 62c:	fec42703          	lw	a4,-20(s0)
 630:	000027b7          	lui	a5,0x2
 634:	70f78793          	add	a5,a5,1807 # 270f <__stack_top+0x70f>
 638:	fee7d4e3          	bge	a5,a4,620 <main+0x20>
 63c:	fd5ff06f          	j	610 <main+0x10>

Disassembly of section .eh_frame:

00000640 <.eh_frame>:
 640:	0014                	.insn	2, 0x0014
 642:	0000                	.insn	2, 0x
 644:	0000                	.insn	2, 0x
 646:	0000                	.insn	2, 0x
 648:	00527a03          	.insn	4, 0x00527a03
 64c:	7c01                	.insn	2, 0x7c01
 64e:	0101                	.insn	2, 0x0101
 650:	07020d1b          	.insn	4, 0x07020d1b
 654:	0001                	.insn	2, 0x0001
 656:	0000                	.insn	2, 0x
 658:	0010                	.insn	2, 0x0010
 65a:	0000                	.insn	2, 0x
 65c:	001c                	.insn	2, 0x001c
 65e:	0000                	.insn	2, 0x
 660:	f9a0                	.insn	2, 0xf9a0
 662:	ffff                	.insn	2, 0xffff
 664:	001c                	.insn	2, 0x001c
 666:	0000                	.insn	2, 0x
 668:	0000                	.insn	2, 0x
 66a:	0000                	.insn	2, 0x
 66c:	0010                	.insn	2, 0x0010
 66e:	0000                	.insn	2, 0x
 670:	0000                	.insn	2, 0x
 672:	0000                	.insn	2, 0x
 674:	00527a03          	.insn	4, 0x00527a03
 678:	7c01                	.insn	2, 0x7c01
 67a:	0101                	.insn	2, 0x0101
 67c:	00020d1b          	.insn	4, 0x00020d1b
 680:	0010                	.insn	2, 0x0010
 682:	0000                	.insn	2, 0x
 684:	0018                	.insn	2, 0x0018
 686:	0000                	.insn	2, 0x
 688:	f994                	.insn	2, 0xf994
 68a:	ffff                	.insn	2, 0xffff
 68c:	0008                	.insn	2, 0x0008
 68e:	0000                	.insn	2, 0x
 690:	0000                	.insn	2, 0x
	...

Disassembly of section .sdata:

00000694 <debug>:
 694:	c001                	.insn	2, 0xc001
 696:	ffff                	.insn	2, 0xffff

00000698 <joystick>:
 698:	c002                	.insn	2, 0xc002
 69a:	ffff                	.insn	2, 0xffff

0000069c <VGA>:
 69c:	ffffc003          	lbu	zero,-1(t6)

000006a0 <tank_xloc>:
 6a0:	012c                	.insn	2, 0x012c
	...

000006a4 <tank_yloc>:
 6a4:	012c                	.insn	2, 0x012c
	...

000006a8 <tank_index>:
 6a8:	001f 0000       	.insn	6, 0x00220000001f

000006ac <gun_index>:
 6ac:	0022                	.insn	2, 0x0022
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
