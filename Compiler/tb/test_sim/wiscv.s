
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	e2c18193          	add	gp,gp,-468 # e2c <__global_pointer$>
   8:	00002117          	auipc	sp,0x2
   c:	ff810113          	add	sp,sp,-8 # 2000 <__stack_top>
  10:	00010433          	add	s0,sp,zero
  14:	584000ef          	jal	598 <main>
  18:	004000ef          	jal	1c <_exit>

0000001c <_exit>:
  1c:	05d00893          	li	a7,93
  20:	00000073          	ecall

00000024 <read_joystick>:
  24:	ff010113          	add	sp,sp,-16
  28:	00812623          	sw	s0,12(sp)
  2c:	01010413          	add	s0,sp,16
  30:	63002783          	lw	a5,1584(zero) # 630 <joystick>
  34:	0007a783          	lw	a5,0(a5)
  38:	00a7d793          	srl	a5,a5,0xa
  3c:	0037f713          	and	a4,a5,3
  40:	64e02423          	sw	a4,1608(zero) # 648 <x1_val>
  44:	63002783          	lw	a5,1584(zero) # 630 <joystick>
  48:	0007a783          	lw	a5,0(a5)
  4c:	0087d793          	srl	a5,a5,0x8
  50:	0037f713          	and	a4,a5,3
  54:	64e02623          	sw	a4,1612(zero) # 64c <y1_val>
  58:	63002783          	lw	a5,1584(zero) # 630 <joystick>
  5c:	0007a783          	lw	a5,0(a5)
  60:	0067d793          	srl	a5,a5,0x6
  64:	0037f713          	and	a4,a5,3
  68:	64e02823          	sw	a4,1616(zero) # 650 <ps1_val>
  6c:	63002783          	lw	a5,1584(zero) # 630 <joystick>
  70:	0007a783          	lw	a5,0(a5)
  74:	0047d793          	srl	a5,a5,0x4
  78:	0037f713          	and	a4,a5,3
  7c:	64e02a23          	sw	a4,1620(zero) # 654 <x2_val>
  80:	63002783          	lw	a5,1584(zero) # 630 <joystick>
  84:	0007a783          	lw	a5,0(a5)
  88:	0027d793          	srl	a5,a5,0x2
  8c:	0037f713          	and	a4,a5,3
  90:	64e02c23          	sw	a4,1624(zero) # 658 <y2_val>
  94:	63002783          	lw	a5,1584(zero) # 630 <joystick>
  98:	0007a783          	lw	a5,0(a5)
  9c:	0037f713          	and	a4,a5,3
  a0:	64e02e23          	sw	a4,1628(zero) # 65c <ps2_val>
  a4:	63002783          	lw	a5,1584(zero) # 630 <joystick>
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
  d0:	63402783          	lw	a5,1588(zero) # 634 <VGA>
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
 114:	65402703          	lw	a4,1620(zero) # 654 <x2_val>
 118:	00200793          	li	a5,2
 11c:	04f71263          	bne	a4,a5,160 <update_tank+0x70>
 120:	65802783          	lw	a5,1624(zero) # 658 <y2_val>
 124:	02079e63          	bnez	a5,160 <update_tank+0x70>
 128:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 12c:	01679713          	sll	a4,a5,0x16
 130:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 134:	00c79793          	sll	a5,a5,0xc
 138:	00f76733          	or	a4,a4,a5
 13c:	64402783          	lw	a5,1604(zero) # 644 <gun_index>
 140:	00279793          	sll	a5,a5,0x2
 144:	00f767b3          	or	a5,a4,a5
 148:	0027e713          	or	a4,a5,2
 14c:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 150:	00e7a023          	sw	a4,0(a5)
 154:	02900713          	li	a4,41
 158:	64e02223          	sw	a4,1604(zero) # 644 <gun_index>
 15c:	22c0006f          	j	388 <update_tank+0x298>
 160:	65402703          	lw	a4,1620(zero) # 654 <x2_val>
 164:	00100793          	li	a5,1
 168:	04f71263          	bne	a4,a5,1ac <update_tank+0xbc>
 16c:	65802783          	lw	a5,1624(zero) # 658 <y2_val>
 170:	02079e63          	bnez	a5,1ac <update_tank+0xbc>
 174:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 178:	01679713          	sll	a4,a5,0x16
 17c:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 180:	00c79793          	sll	a5,a5,0xc
 184:	00f76733          	or	a4,a4,a5
 188:	64402783          	lw	a5,1604(zero) # 644 <gun_index>
 18c:	00279793          	sll	a5,a5,0x2
 190:	00f767b3          	or	a5,a4,a5
 194:	0027e713          	or	a4,a5,2
 198:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 19c:	00e7a023          	sw	a4,0(a5)
 1a0:	02200713          	li	a4,34
 1a4:	64e02223          	sw	a4,1604(zero) # 644 <gun_index>
 1a8:	1e00006f          	j	388 <update_tank+0x298>
 1ac:	65802703          	lw	a4,1624(zero) # 658 <y2_val>
 1b0:	00200793          	li	a5,2
 1b4:	04f71263          	bne	a4,a5,1f8 <update_tank+0x108>
 1b8:	65402783          	lw	a5,1620(zero) # 654 <x2_val>
 1bc:	02079e63          	bnez	a5,1f8 <update_tank+0x108>
 1c0:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 1c4:	01679713          	sll	a4,a5,0x16
 1c8:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 1cc:	00c79793          	sll	a5,a5,0xc
 1d0:	00f76733          	or	a4,a4,a5
 1d4:	64402783          	lw	a5,1604(zero) # 644 <gun_index>
 1d8:	00279793          	sll	a5,a5,0x2
 1dc:	00f767b3          	or	a5,a4,a5
 1e0:	0027e713          	or	a4,a5,2
 1e4:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 1e8:	00e7a023          	sw	a4,0(a5)
 1ec:	02300713          	li	a4,35
 1f0:	64e02223          	sw	a4,1604(zero) # 644 <gun_index>
 1f4:	1940006f          	j	388 <update_tank+0x298>
 1f8:	65802703          	lw	a4,1624(zero) # 658 <y2_val>
 1fc:	00100793          	li	a5,1
 200:	04f71263          	bne	a4,a5,244 <update_tank+0x154>
 204:	65402783          	lw	a5,1620(zero) # 654 <x2_val>
 208:	02079e63          	bnez	a5,244 <update_tank+0x154>
 20c:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 210:	01679713          	sll	a4,a5,0x16
 214:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 218:	00c79793          	sll	a5,a5,0xc
 21c:	00f76733          	or	a4,a4,a5
 220:	64402783          	lw	a5,1604(zero) # 644 <gun_index>
 224:	00279793          	sll	a5,a5,0x2
 228:	00f767b3          	or	a5,a4,a5
 22c:	0027e713          	or	a4,a5,2
 230:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 234:	00e7a023          	sw	a4,0(a5)
 238:	02600713          	li	a4,38
 23c:	64e02223          	sw	a4,1604(zero) # 644 <gun_index>
 240:	1480006f          	j	388 <update_tank+0x298>
 244:	65402703          	lw	a4,1620(zero) # 654 <x2_val>
 248:	00100793          	li	a5,1
 24c:	04f71463          	bne	a4,a5,294 <update_tank+0x1a4>
 250:	65802703          	lw	a4,1624(zero) # 658 <y2_val>
 254:	00200793          	li	a5,2
 258:	02f71e63          	bne	a4,a5,294 <update_tank+0x1a4>
 25c:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 260:	01679713          	sll	a4,a5,0x16
 264:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 268:	00c79793          	sll	a5,a5,0xc
 26c:	00f76733          	or	a4,a4,a5
 270:	64402783          	lw	a5,1604(zero) # 644 <gun_index>
 274:	00279793          	sll	a5,a5,0x2
 278:	00f767b3          	or	a5,a4,a5
 27c:	0027e713          	or	a4,a5,2
 280:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 284:	00e7a023          	sw	a4,0(a5)
 288:	02400713          	li	a4,36
 28c:	64e02223          	sw	a4,1604(zero) # 644 <gun_index>
 290:	0f80006f          	j	388 <update_tank+0x298>
 294:	65402703          	lw	a4,1620(zero) # 654 <x2_val>
 298:	00200793          	li	a5,2
 29c:	04f71463          	bne	a4,a5,2e4 <update_tank+0x1f4>
 2a0:	65802703          	lw	a4,1624(zero) # 658 <y2_val>
 2a4:	00200793          	li	a5,2
 2a8:	02f71e63          	bne	a4,a5,2e4 <update_tank+0x1f4>
 2ac:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 2b0:	01679713          	sll	a4,a5,0x16
 2b4:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 2b8:	00c79793          	sll	a5,a5,0xc
 2bc:	00f76733          	or	a4,a4,a5
 2c0:	64402783          	lw	a5,1604(zero) # 644 <gun_index>
 2c4:	00279793          	sll	a5,a5,0x2
 2c8:	00f767b3          	or	a5,a4,a5
 2cc:	0027e713          	or	a4,a5,2
 2d0:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 2d4:	00e7a023          	sw	a4,0(a5)
 2d8:	02500713          	li	a4,37
 2dc:	64e02223          	sw	a4,1604(zero) # 644 <gun_index>
 2e0:	0a80006f          	j	388 <update_tank+0x298>
 2e4:	65402703          	lw	a4,1620(zero) # 654 <x2_val>
 2e8:	00100793          	li	a5,1
 2ec:	04f71463          	bne	a4,a5,334 <update_tank+0x244>
 2f0:	65802703          	lw	a4,1624(zero) # 658 <y2_val>
 2f4:	00100793          	li	a5,1
 2f8:	02f71e63          	bne	a4,a5,334 <update_tank+0x244>
 2fc:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 300:	01679713          	sll	a4,a5,0x16
 304:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 308:	00c79793          	sll	a5,a5,0xc
 30c:	00f76733          	or	a4,a4,a5
 310:	64402783          	lw	a5,1604(zero) # 644 <gun_index>
 314:	00279793          	sll	a5,a5,0x2
 318:	00f767b3          	or	a5,a4,a5
 31c:	0027e713          	or	a4,a5,2
 320:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 324:	00e7a023          	sw	a4,0(a5)
 328:	02700713          	li	a4,39
 32c:	64e02223          	sw	a4,1604(zero) # 644 <gun_index>
 330:	0580006f          	j	388 <update_tank+0x298>
 334:	65402703          	lw	a4,1620(zero) # 654 <x2_val>
 338:	00200793          	li	a5,2
 33c:	04f71463          	bne	a4,a5,384 <update_tank+0x294>
 340:	65802703          	lw	a4,1624(zero) # 658 <y2_val>
 344:	00100793          	li	a5,1
 348:	02f71e63          	bne	a4,a5,384 <update_tank+0x294>
 34c:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 350:	01679713          	sll	a4,a5,0x16
 354:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 358:	00c79793          	sll	a5,a5,0xc
 35c:	00f76733          	or	a4,a4,a5
 360:	64402783          	lw	a5,1604(zero) # 644 <gun_index>
 364:	00279793          	sll	a5,a5,0x2
 368:	00f767b3          	or	a5,a4,a5
 36c:	0027e713          	or	a4,a5,2
 370:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 374:	00e7a023          	sw	a4,0(a5)
 378:	02800713          	li	a4,40
 37c:	64e02223          	sw	a4,1604(zero) # 644 <gun_index>
 380:	0080006f          	j	388 <update_tank+0x298>
 384:	fe042423          	sw	zero,-24(s0)
 388:	fe842783          	lw	a5,-24(s0)
 38c:	18079463          	bnez	a5,514 <update_tank+0x424>
 390:	64802703          	lw	a4,1608(zero) # 648 <x1_val>
 394:	00200793          	li	a5,2
 398:	04f71c63          	bne	a4,a5,3f0 <update_tank+0x300>
 39c:	63802703          	lw	a4,1592(zero) # 638 <tank_xloc>
 3a0:	00100793          	li	a5,1
 3a4:	16e7d863          	bge	a5,a4,514 <update_tank+0x424>
 3a8:	d19ff0ef          	jal	c0 <wait_for_vga>
 3ac:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 3b0:	01679713          	sll	a4,a5,0x16
 3b4:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 3b8:	00c79793          	sll	a5,a5,0xc
 3bc:	00f76733          	or	a4,a4,a5
 3c0:	64002783          	lw	a5,1600(zero) # 640 <tank_index>
 3c4:	00279793          	sll	a5,a5,0x2
 3c8:	00f767b3          	or	a5,a4,a5
 3cc:	0027e713          	or	a4,a5,2
 3d0:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 3d4:	00e7a023          	sw	a4,0(a5)
 3d8:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 3dc:	fff78713          	add	a4,a5,-1
 3e0:	62e02c23          	sw	a4,1592(zero) # 638 <tank_xloc>
 3e4:	02100713          	li	a4,33
 3e8:	64e02023          	sw	a4,1600(zero) # 640 <tank_index>
 3ec:	1280006f          	j	514 <update_tank+0x424>
 3f0:	64802703          	lw	a4,1608(zero) # 648 <x1_val>
 3f4:	00100793          	li	a5,1
 3f8:	04f71c63          	bne	a4,a5,450 <update_tank+0x360>
 3fc:	63802703          	lw	a4,1592(zero) # 638 <tank_xloc>
 400:	23f00793          	li	a5,575
 404:	10e7c863          	blt	a5,a4,514 <update_tank+0x424>
 408:	cb9ff0ef          	jal	c0 <wait_for_vga>
 40c:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 410:	01679713          	sll	a4,a5,0x16
 414:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 418:	00c79793          	sll	a5,a5,0xc
 41c:	00f76733          	or	a4,a4,a5
 420:	64002783          	lw	a5,1600(zero) # 640 <tank_index>
 424:	00279793          	sll	a5,a5,0x2
 428:	00f767b3          	or	a5,a4,a5
 42c:	0027e713          	or	a4,a5,2
 430:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 434:	00e7a023          	sw	a4,0(a5)
 438:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 43c:	00178713          	add	a4,a5,1
 440:	62e02c23          	sw	a4,1592(zero) # 638 <tank_xloc>
 444:	01e00713          	li	a4,30
 448:	64e02023          	sw	a4,1600(zero) # 640 <tank_index>
 44c:	0c80006f          	j	514 <update_tank+0x424>
 450:	64c02703          	lw	a4,1612(zero) # 64c <y1_val>
 454:	00200793          	li	a5,2
 458:	04f71c63          	bne	a4,a5,4b0 <update_tank+0x3c0>
 45c:	63c02703          	lw	a4,1596(zero) # 63c <tank_yloc>
 460:	00100793          	li	a5,1
 464:	0ae7d863          	bge	a5,a4,514 <update_tank+0x424>
 468:	c59ff0ef          	jal	c0 <wait_for_vga>
 46c:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 470:	01679713          	sll	a4,a5,0x16
 474:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 478:	00c79793          	sll	a5,a5,0xc
 47c:	00f76733          	or	a4,a4,a5
 480:	64002783          	lw	a5,1600(zero) # 640 <tank_index>
 484:	00279793          	sll	a5,a5,0x2
 488:	00f767b3          	or	a5,a4,a5
 48c:	0027e713          	or	a4,a5,2
 490:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 494:	00e7a023          	sw	a4,0(a5)
 498:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 49c:	fff78713          	add	a4,a5,-1
 4a0:	62e02e23          	sw	a4,1596(zero) # 63c <tank_yloc>
 4a4:	01f00713          	li	a4,31
 4a8:	64e02023          	sw	a4,1600(zero) # 640 <tank_index>
 4ac:	0680006f          	j	514 <update_tank+0x424>
 4b0:	64c02703          	lw	a4,1612(zero) # 64c <y1_val>
 4b4:	00100793          	li	a5,1
 4b8:	04f71c63          	bne	a4,a5,510 <update_tank+0x420>
 4bc:	63c02703          	lw	a4,1596(zero) # 63c <tank_yloc>
 4c0:	34300793          	li	a5,835
 4c4:	04e7c863          	blt	a5,a4,514 <update_tank+0x424>
 4c8:	bf9ff0ef          	jal	c0 <wait_for_vga>
 4cc:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 4d0:	01679713          	sll	a4,a5,0x16
 4d4:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 4d8:	00c79793          	sll	a5,a5,0xc
 4dc:	00f76733          	or	a4,a4,a5
 4e0:	64002783          	lw	a5,1600(zero) # 640 <tank_index>
 4e4:	00279793          	sll	a5,a5,0x2
 4e8:	00f767b3          	or	a5,a4,a5
 4ec:	0027e713          	or	a4,a5,2
 4f0:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 4f4:	00e7a023          	sw	a4,0(a5)
 4f8:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 4fc:	00178713          	add	a4,a5,1
 500:	62e02e23          	sw	a4,1596(zero) # 63c <tank_yloc>
 504:	02000713          	li	a4,32
 508:	64e02023          	sw	a4,1600(zero) # 640 <tank_index>
 50c:	0080006f          	j	514 <update_tank+0x424>
 510:	fe042623          	sw	zero,-20(s0)
 514:	fec42703          	lw	a4,-20(s0)
 518:	fe842783          	lw	a5,-24(s0)
 51c:	00f767b3          	or	a5,a4,a5
 520:	06078263          	beqz	a5,584 <update_tank+0x494>
 524:	b9dff0ef          	jal	c0 <wait_for_vga>
 528:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 52c:	01679713          	sll	a4,a5,0x16
 530:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 534:	00c79793          	sll	a5,a5,0xc
 538:	00f76733          	or	a4,a4,a5
 53c:	64002783          	lw	a5,1600(zero) # 640 <tank_index>
 540:	00279793          	sll	a5,a5,0x2
 544:	00f767b3          	or	a5,a4,a5
 548:	0017e713          	or	a4,a5,1
 54c:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 550:	00e7a023          	sw	a4,0(a5)
 554:	b6dff0ef          	jal	c0 <wait_for_vga>
 558:	63802783          	lw	a5,1592(zero) # 638 <tank_xloc>
 55c:	01679713          	sll	a4,a5,0x16
 560:	63c02783          	lw	a5,1596(zero) # 63c <tank_yloc>
 564:	00c79793          	sll	a5,a5,0xc
 568:	00f76733          	or	a4,a4,a5
 56c:	64402783          	lw	a5,1604(zero) # 644 <gun_index>
 570:	00279793          	sll	a5,a5,0x2
 574:	00f767b3          	or	a5,a4,a5
 578:	0017e713          	or	a4,a5,1
 57c:	63402783          	lw	a5,1588(zero) # 634 <VGA>
 580:	00e7a023          	sw	a4,0(a5)
 584:	00000013          	nop
 588:	01c12083          	lw	ra,28(sp)
 58c:	01812403          	lw	s0,24(sp)
 590:	02010113          	add	sp,sp,32
 594:	00008067          	ret

00000598 <main>:
 598:	fe010113          	add	sp,sp,-32
 59c:	00112e23          	sw	ra,28(sp)
 5a0:	00812c23          	sw	s0,24(sp)
 5a4:	02010413          	add	s0,sp,32
 5a8:	a7dff0ef          	jal	24 <read_joystick>
 5ac:	b45ff0ef          	jal	f0 <update_tank>
 5b0:	fe042623          	sw	zero,-20(s0)
 5b4:	0100006f          	j	5c4 <main+0x2c>
 5b8:	fec42783          	lw	a5,-20(s0)
 5bc:	00178793          	add	a5,a5,1
 5c0:	fef42623          	sw	a5,-20(s0)
 5c4:	fec42703          	lw	a4,-20(s0)
 5c8:	000027b7          	lui	a5,0x2
 5cc:	70f78793          	add	a5,a5,1807 # 270f <__stack_top+0x70f>
 5d0:	fee7d4e3          	bge	a5,a4,5b8 <main+0x20>
 5d4:	fd5ff06f          	j	5a8 <main+0x10>

Disassembly of section .eh_frame:

000005d8 <.eh_frame>:
 5d8:	0014                	.insn	2, 0x0014
 5da:	0000                	.insn	2, 0x
 5dc:	0000                	.insn	2, 0x
 5de:	0000                	.insn	2, 0x
 5e0:	00527a03          	.insn	4, 0x00527a03
 5e4:	7c01                	.insn	2, 0x7c01
 5e6:	0101                	.insn	2, 0x0101
 5e8:	07020d1b          	.insn	4, 0x07020d1b
 5ec:	0001                	.insn	2, 0x0001
 5ee:	0000                	.insn	2, 0x
 5f0:	0010                	.insn	2, 0x0010
 5f2:	0000                	.insn	2, 0x
 5f4:	001c                	.insn	2, 0x001c
 5f6:	0000                	.insn	2, 0x
 5f8:	fa08                	.insn	2, 0xfa08
 5fa:	ffff                	.insn	2, 0xffff
 5fc:	001c                	.insn	2, 0x001c
 5fe:	0000                	.insn	2, 0x
 600:	0000                	.insn	2, 0x
 602:	0000                	.insn	2, 0x
 604:	0010                	.insn	2, 0x0010
 606:	0000                	.insn	2, 0x
 608:	0000                	.insn	2, 0x
 60a:	0000                	.insn	2, 0x
 60c:	00527a03          	.insn	4, 0x00527a03
 610:	7c01                	.insn	2, 0x7c01
 612:	0101                	.insn	2, 0x0101
 614:	00020d1b          	.insn	4, 0x00020d1b
 618:	0010                	.insn	2, 0x0010
 61a:	0000                	.insn	2, 0x
 61c:	0018                	.insn	2, 0x0018
 61e:	0000                	.insn	2, 0x
 620:	f9fc                	.insn	2, 0xf9fc
 622:	ffff                	.insn	2, 0xffff
 624:	0008                	.insn	2, 0x0008
 626:	0000                	.insn	2, 0x
 628:	0000                	.insn	2, 0x
	...

Disassembly of section .sdata:

0000062c <debug>:
 62c:	c001                	.insn	2, 0xc001
 62e:	ffff                	.insn	2, 0xffff

00000630 <joystick>:
 630:	c002                	.insn	2, 0xc002
 632:	ffff                	.insn	2, 0xffff

00000634 <VGA>:
 634:	ffffc003          	lbu	zero,-1(t6)

00000638 <tank_xloc>:
 638:	012c                	.insn	2, 0x012c
	...

0000063c <tank_yloc>:
 63c:	012c                	.insn	2, 0x012c
	...

00000640 <tank_index>:
 640:	001f 0000       	.insn	6, 0x00220000001f

00000644 <gun_index>:
 644:	0022                	.insn	2, 0x0022
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
