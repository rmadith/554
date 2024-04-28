
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00001197          	auipc	gp,0x1
   4:	2f018193          	add	gp,gp,752 # 12f0 <__global_pointer$>
   8:	00002117          	auipc	sp,0x2
   c:	ff810113          	add	sp,sp,-8 # 2000 <__stack_top>
  10:	00010433          	add	s0,sp,zero
  14:	1e9000ef          	jal	9fc <main>
  18:	004000ef          	jal	1c <_exit>

0000001c <_exit>:
  1c:	05d00893          	li	a7,93
  20:	00000073          	ecall

00000024 <read_joystick>:
  24:	ff010113          	add	sp,sp,-16
  28:	00812623          	sw	s0,12(sp)
  2c:	01010413          	add	s0,sp,16
  30:	000017b7          	lui	a5,0x1
  34:	af47a783          	lw	a5,-1292(a5) # af4 <joystick>
  38:	0007a783          	lw	a5,0(a5)
  3c:	00a7d793          	srl	a5,a5,0xa
  40:	0037f713          	and	a4,a5,3
  44:	82e1a623          	sw	a4,-2004(gp) # b1c <x1_val>
  48:	000017b7          	lui	a5,0x1
  4c:	af47a783          	lw	a5,-1292(a5) # af4 <joystick>
  50:	0007a783          	lw	a5,0(a5)
  54:	0087d793          	srl	a5,a5,0x8
  58:	0037f713          	and	a4,a5,3
  5c:	82e1a823          	sw	a4,-2000(gp) # b20 <y1_val>
  60:	000017b7          	lui	a5,0x1
  64:	af47a783          	lw	a5,-1292(a5) # af4 <joystick>
  68:	0007a783          	lw	a5,0(a5)
  6c:	0067d793          	srl	a5,a5,0x6
  70:	0037f713          	and	a4,a5,3
  74:	82e1aa23          	sw	a4,-1996(gp) # b24 <ps1_val>
  78:	000017b7          	lui	a5,0x1
  7c:	af47a783          	lw	a5,-1292(a5) # af4 <joystick>
  80:	0007a783          	lw	a5,0(a5)
  84:	0047d793          	srl	a5,a5,0x4
  88:	0037f713          	and	a4,a5,3
  8c:	82e1ac23          	sw	a4,-1992(gp) # b28 <x2_val>
  90:	000017b7          	lui	a5,0x1
  94:	af47a783          	lw	a5,-1292(a5) # af4 <joystick>
  98:	0007a783          	lw	a5,0(a5)
  9c:	0027d793          	srl	a5,a5,0x2
  a0:	0037f713          	and	a4,a5,3
  a4:	82e1ae23          	sw	a4,-1988(gp) # b2c <y2_val>
  a8:	000017b7          	lui	a5,0x1
  ac:	af47a783          	lw	a5,-1292(a5) # af4 <joystick>
  b0:	0007a783          	lw	a5,0(a5)
  b4:	0037f713          	and	a4,a5,3
  b8:	84e1a023          	sw	a4,-1984(gp) # b30 <ps2_val>
  bc:	000017b7          	lui	a5,0x1
  c0:	af47a783          	lw	a5,-1292(a5) # af4 <joystick>
  c4:	03f00713          	li	a4,63
  c8:	00e7a023          	sw	a4,0(a5)
  cc:	00000013          	nop
  d0:	00c12403          	lw	s0,12(sp)
  d4:	01010113          	add	sp,sp,16
  d8:	00008067          	ret

000000dc <wait_for_vga>:
  dc:	ff010113          	add	sp,sp,-16
  e0:	00812623          	sw	s0,12(sp)
  e4:	01010413          	add	s0,sp,16
  e8:	00000013          	nop
  ec:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
  f0:	0007a783          	lw	a5,0(a5)
  f4:	fe07cce3          	bltz	a5,ec <wait_for_vga+0x10>
  f8:	00000013          	nop
  fc:	00000013          	nop
 100:	00c12403          	lw	s0,12(sp)
 104:	01010113          	add	sp,sp,16
 108:	00008067          	ret

0000010c <update_tank>:
 10c:	fe010113          	add	sp,sp,-32
 110:	00112e23          	sw	ra,28(sp)
 114:	00812c23          	sw	s0,24(sp)
 118:	02010413          	add	s0,sp,32
 11c:	00100793          	li	a5,1
 120:	fef42623          	sw	a5,-20(s0)
 124:	00100793          	li	a5,1
 128:	fef42423          	sw	a5,-24(s0)
 12c:	fb1ff0ef          	jal	dc <wait_for_vga>
 130:	8381a703          	lw	a4,-1992(gp) # b28 <x2_val>
 134:	00200793          	li	a5,2
 138:	04f71863          	bne	a4,a5,188 <update_tank+0x7c>
 13c:	83c1a783          	lw	a5,-1988(gp) # b2c <y2_val>
 140:	04079463          	bnez	a5,188 <update_tank+0x7c>
 144:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 148:	02900793          	li	a5,41
 14c:	02f70e63          	beq	a4,a5,188 <update_tank+0x7c>
 150:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 154:	01679713          	sll	a4,a5,0x16
 158:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 15c:	00c79793          	sll	a5,a5,0xc
 160:	00f76733          	or	a4,a4,a5
 164:	8181a783          	lw	a5,-2024(gp) # b08 <gun_index>
 168:	00279793          	sll	a5,a5,0x2
 16c:	00f767b3          	or	a5,a4,a5
 170:	0027e713          	or	a4,a5,2
 174:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 178:	00e7a023          	sw	a4,0(a5)
 17c:	02900713          	li	a4,41
 180:	80e1ac23          	sw	a4,-2024(gp) # b08 <gun_index>
 184:	2800006f          	j	404 <update_tank+0x2f8>
 188:	8381a703          	lw	a4,-1992(gp) # b28 <x2_val>
 18c:	00100793          	li	a5,1
 190:	04f71863          	bne	a4,a5,1e0 <update_tank+0xd4>
 194:	83c1a783          	lw	a5,-1988(gp) # b2c <y2_val>
 198:	04079463          	bnez	a5,1e0 <update_tank+0xd4>
 19c:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 1a0:	02200793          	li	a5,34
 1a4:	02f70e63          	beq	a4,a5,1e0 <update_tank+0xd4>
 1a8:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 1ac:	01679713          	sll	a4,a5,0x16
 1b0:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 1b4:	00c79793          	sll	a5,a5,0xc
 1b8:	00f76733          	or	a4,a4,a5
 1bc:	8181a783          	lw	a5,-2024(gp) # b08 <gun_index>
 1c0:	00279793          	sll	a5,a5,0x2
 1c4:	00f767b3          	or	a5,a4,a5
 1c8:	0027e713          	or	a4,a5,2
 1cc:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 1d0:	00e7a023          	sw	a4,0(a5)
 1d4:	02200713          	li	a4,34
 1d8:	80e1ac23          	sw	a4,-2024(gp) # b08 <gun_index>
 1dc:	2280006f          	j	404 <update_tank+0x2f8>
 1e0:	83c1a703          	lw	a4,-1988(gp) # b2c <y2_val>
 1e4:	00200793          	li	a5,2
 1e8:	04f71863          	bne	a4,a5,238 <update_tank+0x12c>
 1ec:	8381a783          	lw	a5,-1992(gp) # b28 <x2_val>
 1f0:	04079463          	bnez	a5,238 <update_tank+0x12c>
 1f4:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 1f8:	02300793          	li	a5,35
 1fc:	02f70e63          	beq	a4,a5,238 <update_tank+0x12c>
 200:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 204:	01679713          	sll	a4,a5,0x16
 208:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 20c:	00c79793          	sll	a5,a5,0xc
 210:	00f76733          	or	a4,a4,a5
 214:	8181a783          	lw	a5,-2024(gp) # b08 <gun_index>
 218:	00279793          	sll	a5,a5,0x2
 21c:	00f767b3          	or	a5,a4,a5
 220:	0027e713          	or	a4,a5,2
 224:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 228:	00e7a023          	sw	a4,0(a5)
 22c:	02300713          	li	a4,35
 230:	80e1ac23          	sw	a4,-2024(gp) # b08 <gun_index>
 234:	1d00006f          	j	404 <update_tank+0x2f8>
 238:	83c1a703          	lw	a4,-1988(gp) # b2c <y2_val>
 23c:	00100793          	li	a5,1
 240:	04f71863          	bne	a4,a5,290 <update_tank+0x184>
 244:	8381a783          	lw	a5,-1992(gp) # b28 <x2_val>
 248:	04079463          	bnez	a5,290 <update_tank+0x184>
 24c:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 250:	02600793          	li	a5,38
 254:	02f70e63          	beq	a4,a5,290 <update_tank+0x184>
 258:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 25c:	01679713          	sll	a4,a5,0x16
 260:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 264:	00c79793          	sll	a5,a5,0xc
 268:	00f76733          	or	a4,a4,a5
 26c:	8181a783          	lw	a5,-2024(gp) # b08 <gun_index>
 270:	00279793          	sll	a5,a5,0x2
 274:	00f767b3          	or	a5,a4,a5
 278:	0027e713          	or	a4,a5,2
 27c:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 280:	00e7a023          	sw	a4,0(a5)
 284:	02600713          	li	a4,38
 288:	80e1ac23          	sw	a4,-2024(gp) # b08 <gun_index>
 28c:	1780006f          	j	404 <update_tank+0x2f8>
 290:	8381a703          	lw	a4,-1992(gp) # b28 <x2_val>
 294:	00100793          	li	a5,1
 298:	04f71a63          	bne	a4,a5,2ec <update_tank+0x1e0>
 29c:	83c1a703          	lw	a4,-1988(gp) # b2c <y2_val>
 2a0:	00200793          	li	a5,2
 2a4:	04f71463          	bne	a4,a5,2ec <update_tank+0x1e0>
 2a8:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 2ac:	02400793          	li	a5,36
 2b0:	02f70e63          	beq	a4,a5,2ec <update_tank+0x1e0>
 2b4:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 2b8:	01679713          	sll	a4,a5,0x16
 2bc:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 2c0:	00c79793          	sll	a5,a5,0xc
 2c4:	00f76733          	or	a4,a4,a5
 2c8:	8181a783          	lw	a5,-2024(gp) # b08 <gun_index>
 2cc:	00279793          	sll	a5,a5,0x2
 2d0:	00f767b3          	or	a5,a4,a5
 2d4:	0027e713          	or	a4,a5,2
 2d8:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 2dc:	00e7a023          	sw	a4,0(a5)
 2e0:	02400713          	li	a4,36
 2e4:	80e1ac23          	sw	a4,-2024(gp) # b08 <gun_index>
 2e8:	11c0006f          	j	404 <update_tank+0x2f8>
 2ec:	8381a703          	lw	a4,-1992(gp) # b28 <x2_val>
 2f0:	00200793          	li	a5,2
 2f4:	04f71a63          	bne	a4,a5,348 <update_tank+0x23c>
 2f8:	83c1a703          	lw	a4,-1988(gp) # b2c <y2_val>
 2fc:	00200793          	li	a5,2
 300:	04f71463          	bne	a4,a5,348 <update_tank+0x23c>
 304:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 308:	02500793          	li	a5,37
 30c:	02f70e63          	beq	a4,a5,348 <update_tank+0x23c>
 310:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 314:	01679713          	sll	a4,a5,0x16
 318:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 31c:	00c79793          	sll	a5,a5,0xc
 320:	00f76733          	or	a4,a4,a5
 324:	8181a783          	lw	a5,-2024(gp) # b08 <gun_index>
 328:	00279793          	sll	a5,a5,0x2
 32c:	00f767b3          	or	a5,a4,a5
 330:	0027e713          	or	a4,a5,2
 334:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 338:	00e7a023          	sw	a4,0(a5)
 33c:	02500713          	li	a4,37
 340:	80e1ac23          	sw	a4,-2024(gp) # b08 <gun_index>
 344:	0c00006f          	j	404 <update_tank+0x2f8>
 348:	8381a703          	lw	a4,-1992(gp) # b28 <x2_val>
 34c:	00100793          	li	a5,1
 350:	04f71a63          	bne	a4,a5,3a4 <update_tank+0x298>
 354:	83c1a703          	lw	a4,-1988(gp) # b2c <y2_val>
 358:	00100793          	li	a5,1
 35c:	04f71463          	bne	a4,a5,3a4 <update_tank+0x298>
 360:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 364:	02700793          	li	a5,39
 368:	02f70e63          	beq	a4,a5,3a4 <update_tank+0x298>
 36c:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 370:	01679713          	sll	a4,a5,0x16
 374:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 378:	00c79793          	sll	a5,a5,0xc
 37c:	00f76733          	or	a4,a4,a5
 380:	8181a783          	lw	a5,-2024(gp) # b08 <gun_index>
 384:	00279793          	sll	a5,a5,0x2
 388:	00f767b3          	or	a5,a4,a5
 38c:	0027e713          	or	a4,a5,2
 390:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 394:	00e7a023          	sw	a4,0(a5)
 398:	02700713          	li	a4,39
 39c:	80e1ac23          	sw	a4,-2024(gp) # b08 <gun_index>
 3a0:	0640006f          	j	404 <update_tank+0x2f8>
 3a4:	8381a703          	lw	a4,-1992(gp) # b28 <x2_val>
 3a8:	00200793          	li	a5,2
 3ac:	04f71a63          	bne	a4,a5,400 <update_tank+0x2f4>
 3b0:	83c1a703          	lw	a4,-1988(gp) # b2c <y2_val>
 3b4:	00100793          	li	a5,1
 3b8:	04f71463          	bne	a4,a5,400 <update_tank+0x2f4>
 3bc:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 3c0:	02800793          	li	a5,40
 3c4:	02f70e63          	beq	a4,a5,400 <update_tank+0x2f4>
 3c8:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 3cc:	01679713          	sll	a4,a5,0x16
 3d0:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 3d4:	00c79793          	sll	a5,a5,0xc
 3d8:	00f76733          	or	a4,a4,a5
 3dc:	8181a783          	lw	a5,-2024(gp) # b08 <gun_index>
 3e0:	00279793          	sll	a5,a5,0x2
 3e4:	00f767b3          	or	a5,a4,a5
 3e8:	0027e713          	or	a4,a5,2
 3ec:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 3f0:	00e7a023          	sw	a4,0(a5)
 3f4:	02800713          	li	a4,40
 3f8:	80e1ac23          	sw	a4,-2024(gp) # b08 <gun_index>
 3fc:	0080006f          	j	404 <update_tank+0x2f8>
 400:	fe042423          	sw	zero,-24(s0)
 404:	fe842783          	lw	a5,-24(s0)
 408:	18079663          	bnez	a5,594 <update_tank+0x488>
 40c:	82c1a703          	lw	a4,-2004(gp) # b1c <x1_val>
 410:	00200793          	li	a5,2
 414:	04f71c63          	bne	a4,a5,46c <update_tank+0x360>
 418:	80c1a703          	lw	a4,-2036(gp) # afc <tank_xloc>
 41c:	00100793          	li	a5,1
 420:	16e7dc63          	bge	a5,a4,598 <update_tank+0x48c>
 424:	cb9ff0ef          	jal	dc <wait_for_vga>
 428:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 42c:	01679713          	sll	a4,a5,0x16
 430:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 434:	00c79793          	sll	a5,a5,0xc
 438:	00f76733          	or	a4,a4,a5
 43c:	8141a783          	lw	a5,-2028(gp) # b04 <tank_index>
 440:	00279793          	sll	a5,a5,0x2
 444:	00f767b3          	or	a5,a4,a5
 448:	0027e713          	or	a4,a5,2
 44c:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 450:	00e7a023          	sw	a4,0(a5)
 454:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 458:	fff78713          	add	a4,a5,-1
 45c:	80e1a623          	sw	a4,-2036(gp) # afc <tank_xloc>
 460:	02100713          	li	a4,33
 464:	80e1aa23          	sw	a4,-2028(gp) # b04 <tank_index>
 468:	1300006f          	j	598 <update_tank+0x48c>
 46c:	82c1a703          	lw	a4,-2004(gp) # b1c <x1_val>
 470:	00100793          	li	a5,1
 474:	04f71c63          	bne	a4,a5,4cc <update_tank+0x3c0>
 478:	80c1a703          	lw	a4,-2036(gp) # afc <tank_xloc>
 47c:	23f00793          	li	a5,575
 480:	10e7cc63          	blt	a5,a4,598 <update_tank+0x48c>
 484:	c59ff0ef          	jal	dc <wait_for_vga>
 488:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 48c:	01679713          	sll	a4,a5,0x16
 490:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 494:	00c79793          	sll	a5,a5,0xc
 498:	00f76733          	or	a4,a4,a5
 49c:	8141a783          	lw	a5,-2028(gp) # b04 <tank_index>
 4a0:	00279793          	sll	a5,a5,0x2
 4a4:	00f767b3          	or	a5,a4,a5
 4a8:	0027e713          	or	a4,a5,2
 4ac:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 4b0:	00e7a023          	sw	a4,0(a5)
 4b4:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 4b8:	00178713          	add	a4,a5,1
 4bc:	80e1a623          	sw	a4,-2036(gp) # afc <tank_xloc>
 4c0:	01e00713          	li	a4,30
 4c4:	80e1aa23          	sw	a4,-2028(gp) # b04 <tank_index>
 4c8:	0d00006f          	j	598 <update_tank+0x48c>
 4cc:	8301a703          	lw	a4,-2000(gp) # b20 <y1_val>
 4d0:	00200793          	li	a5,2
 4d4:	04f71c63          	bne	a4,a5,52c <update_tank+0x420>
 4d8:	8101a703          	lw	a4,-2032(gp) # b00 <tank_yloc>
 4dc:	00100793          	li	a5,1
 4e0:	0ae7dc63          	bge	a5,a4,598 <update_tank+0x48c>
 4e4:	bf9ff0ef          	jal	dc <wait_for_vga>
 4e8:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 4ec:	01679713          	sll	a4,a5,0x16
 4f0:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 4f4:	00c79793          	sll	a5,a5,0xc
 4f8:	00f76733          	or	a4,a4,a5
 4fc:	8141a783          	lw	a5,-2028(gp) # b04 <tank_index>
 500:	00279793          	sll	a5,a5,0x2
 504:	00f767b3          	or	a5,a4,a5
 508:	0027e713          	or	a4,a5,2
 50c:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 510:	00e7a023          	sw	a4,0(a5)
 514:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 518:	ffe78713          	add	a4,a5,-2
 51c:	80e1a823          	sw	a4,-2032(gp) # b00 <tank_yloc>
 520:	01f00713          	li	a4,31
 524:	80e1aa23          	sw	a4,-2028(gp) # b04 <tank_index>
 528:	0700006f          	j	598 <update_tank+0x48c>
 52c:	8301a703          	lw	a4,-2000(gp) # b20 <y1_val>
 530:	00100793          	li	a5,1
 534:	04f71c63          	bne	a4,a5,58c <update_tank+0x480>
 538:	8101a703          	lw	a4,-2032(gp) # b00 <tank_yloc>
 53c:	34300793          	li	a5,835
 540:	04e7cc63          	blt	a5,a4,598 <update_tank+0x48c>
 544:	b99ff0ef          	jal	dc <wait_for_vga>
 548:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 54c:	01679713          	sll	a4,a5,0x16
 550:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 554:	00c79793          	sll	a5,a5,0xc
 558:	00f76733          	or	a4,a4,a5
 55c:	8141a783          	lw	a5,-2028(gp) # b04 <tank_index>
 560:	00279793          	sll	a5,a5,0x2
 564:	00f767b3          	or	a5,a4,a5
 568:	0027e713          	or	a4,a5,2
 56c:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 570:	00e7a023          	sw	a4,0(a5)
 574:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 578:	00278713          	add	a4,a5,2
 57c:	80e1a823          	sw	a4,-2032(gp) # b00 <tank_yloc>
 580:	02000713          	li	a4,32
 584:	80e1aa23          	sw	a4,-2028(gp) # b04 <tank_index>
 588:	0100006f          	j	598 <update_tank+0x48c>
 58c:	fe042623          	sw	zero,-20(s0)
 590:	0080006f          	j	598 <update_tank+0x48c>
 594:	fe042623          	sw	zero,-20(s0)
 598:	fec42703          	lw	a4,-20(s0)
 59c:	fe842783          	lw	a5,-24(s0)
 5a0:	00f767b3          	or	a5,a4,a5
 5a4:	06078263          	beqz	a5,608 <update_tank+0x4fc>
 5a8:	b35ff0ef          	jal	dc <wait_for_vga>
 5ac:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 5b0:	01679713          	sll	a4,a5,0x16
 5b4:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 5b8:	00c79793          	sll	a5,a5,0xc
 5bc:	00f76733          	or	a4,a4,a5
 5c0:	8141a783          	lw	a5,-2028(gp) # b04 <tank_index>
 5c4:	00279793          	sll	a5,a5,0x2
 5c8:	00f767b3          	or	a5,a4,a5
 5cc:	0017e713          	or	a4,a5,1
 5d0:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 5d4:	00e7a023          	sw	a4,0(a5)
 5d8:	b05ff0ef          	jal	dc <wait_for_vga>
 5dc:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 5e0:	01679713          	sll	a4,a5,0x16
 5e4:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 5e8:	00c79793          	sll	a5,a5,0xc
 5ec:	00f76733          	or	a4,a4,a5
 5f0:	8181a783          	lw	a5,-2024(gp) # b08 <gun_index>
 5f4:	00279793          	sll	a5,a5,0x2
 5f8:	00f767b3          	or	a5,a4,a5
 5fc:	0017e713          	or	a4,a5,1
 600:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 604:	00e7a023          	sw	a4,0(a5)
 608:	00000013          	nop
 60c:	01c12083          	lw	ra,28(sp)
 610:	01812403          	lw	s0,24(sp)
 614:	02010113          	add	sp,sp,32
 618:	00008067          	ret

0000061c <update_bullet>:
 61c:	ff010113          	add	sp,sp,-16
 620:	00112623          	sw	ra,12(sp)
 624:	00812423          	sw	s0,8(sp)
 628:	01010413          	add	s0,sp,16
 62c:	81c1a703          	lw	a4,-2020(gp) # b0c <bullet_move>
 630:	00100793          	li	a5,1
 634:	20f71063          	bne	a4,a5,834 <update_bullet+0x218>
 638:	8401a703          	lw	a4,-1984(gp) # b30 <ps2_val>
 63c:	00200793          	li	a5,2
 640:	3af71463          	bne	a4,a5,9e8 <update_bullet+0x3cc>
 644:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 648:	02200793          	li	a5,34
 64c:	02f71863          	bne	a4,a5,67c <update_bullet+0x60>
 650:	00200713          	li	a4,2
 654:	80e1ae23          	sw	a4,-2020(gp) # b0c <bullet_move>
 658:	00100713          	li	a4,1
 65c:	82e1a023          	sw	a4,-2016(gp) # b10 <bullet_index>
 660:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 664:	04078713          	add	a4,a5,64
 668:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 66c:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 670:	02078713          	add	a4,a5,32
 674:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 678:	1880006f          	j	800 <update_bullet+0x1e4>
 67c:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 680:	02300793          	li	a5,35
 684:	02f71863          	bne	a4,a5,6b4 <update_bullet+0x98>
 688:	00200713          	li	a4,2
 68c:	80e1ae23          	sw	a4,-2020(gp) # b0c <bullet_move>
 690:	00200713          	li	a4,2
 694:	82e1a023          	sw	a4,-2016(gp) # b10 <bullet_index>
 698:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 69c:	01078713          	add	a4,a5,16
 6a0:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 6a4:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 6a8:	fd878713          	add	a4,a5,-40
 6ac:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 6b0:	1500006f          	j	800 <update_bullet+0x1e4>
 6b4:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 6b8:	02400793          	li	a5,36
 6bc:	02f71863          	bne	a4,a5,6ec <update_bullet+0xd0>
 6c0:	00200713          	li	a4,2
 6c4:	80e1ae23          	sw	a4,-2020(gp) # b0c <bullet_move>
 6c8:	00300713          	li	a4,3
 6cc:	82e1a023          	sw	a4,-2016(gp) # b10 <bullet_index>
 6d0:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 6d4:	04078713          	add	a4,a5,64
 6d8:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 6dc:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 6e0:	fe078713          	add	a4,a5,-32
 6e4:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 6e8:	1180006f          	j	800 <update_bullet+0x1e4>
 6ec:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 6f0:	02500793          	li	a5,37
 6f4:	02f71863          	bne	a4,a5,724 <update_bullet+0x108>
 6f8:	00200713          	li	a4,2
 6fc:	80e1ae23          	sw	a4,-2020(gp) # b0c <bullet_move>
 700:	00400713          	li	a4,4
 704:	82e1a023          	sw	a4,-2016(gp) # b10 <bullet_index>
 708:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 70c:	fe078713          	add	a4,a5,-32
 710:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 714:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 718:	fe078713          	add	a4,a5,-32
 71c:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 720:	0e00006f          	j	800 <update_bullet+0x1e4>
 724:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 728:	02600793          	li	a5,38
 72c:	02f71863          	bne	a4,a5,75c <update_bullet+0x140>
 730:	00200713          	li	a4,2
 734:	80e1ae23          	sw	a4,-2020(gp) # b0c <bullet_move>
 738:	00500713          	li	a4,5
 73c:	82e1a023          	sw	a4,-2016(gp) # b10 <bullet_index>
 740:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 744:	01078713          	add	a4,a5,16
 748:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 74c:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 750:	06a78713          	add	a4,a5,106
 754:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 758:	0a80006f          	j	800 <update_bullet+0x1e4>
 75c:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 760:	02700793          	li	a5,39
 764:	02f71863          	bne	a4,a5,794 <update_bullet+0x178>
 768:	00200713          	li	a4,2
 76c:	80e1ae23          	sw	a4,-2020(gp) # b0c <bullet_move>
 770:	00600713          	li	a4,6
 774:	82e1a023          	sw	a4,-2016(gp) # b10 <bullet_index>
 778:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 77c:	04078713          	add	a4,a5,64
 780:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 784:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 788:	04078713          	add	a4,a5,64
 78c:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 790:	0700006f          	j	800 <update_bullet+0x1e4>
 794:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 798:	02800793          	li	a5,40
 79c:	02f71863          	bne	a4,a5,7cc <update_bullet+0x1b0>
 7a0:	00200713          	li	a4,2
 7a4:	80e1ae23          	sw	a4,-2020(gp) # b0c <bullet_move>
 7a8:	00700713          	li	a4,7
 7ac:	82e1a023          	sw	a4,-2016(gp) # b10 <bullet_index>
 7b0:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 7b4:	fe078713          	add	a4,a5,-32
 7b8:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 7bc:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 7c0:	04078713          	add	a4,a5,64
 7c4:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 7c8:	0380006f          	j	800 <update_bullet+0x1e4>
 7cc:	8181a703          	lw	a4,-2024(gp) # b08 <gun_index>
 7d0:	02900793          	li	a5,41
 7d4:	02f71663          	bne	a4,a5,800 <update_bullet+0x1e4>
 7d8:	00200713          	li	a4,2
 7dc:	80e1ae23          	sw	a4,-2020(gp) # b0c <bullet_move>
 7e0:	00800713          	li	a4,8
 7e4:	82e1a023          	sw	a4,-2016(gp) # b10 <bullet_index>
 7e8:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 7ec:	fe078713          	add	a4,a5,-32
 7f0:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 7f4:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 7f8:	02078713          	add	a4,a5,32
 7fc:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 800:	8ddff0ef          	jal	dc <wait_for_vga>
 804:	8241a783          	lw	a5,-2012(gp) # b14 <bullet_x>
 808:	01679713          	sll	a4,a5,0x16
 80c:	8281a783          	lw	a5,-2008(gp) # b18 <bullet_y>
 810:	00c79793          	sll	a5,a5,0xc
 814:	00f76733          	or	a4,a4,a5
 818:	8201a783          	lw	a5,-2016(gp) # b10 <bullet_index>
 81c:	00279793          	sll	a5,a5,0x2
 820:	00f767b3          	or	a5,a4,a5
 824:	0017e713          	or	a4,a5,1
 828:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 82c:	00e7a023          	sw	a4,0(a5)
 830:	1b80006f          	j	9e8 <update_bullet+0x3cc>
 834:	81c1a703          	lw	a4,-2020(gp) # b0c <bullet_move>
 838:	00200793          	li	a5,2
 83c:	1af71663          	bne	a4,a5,9e8 <update_bullet+0x3cc>
 840:	8241a703          	lw	a4,-2012(gp) # b14 <bullet_x>
 844:	23f00793          	li	a5,575
 848:	02e7c463          	blt	a5,a4,870 <update_bullet+0x254>
 84c:	8241a703          	lw	a4,-2012(gp) # b14 <bullet_x>
 850:	00100793          	li	a5,1
 854:	00e7de63          	bge	a5,a4,870 <update_bullet+0x254>
 858:	8281a703          	lw	a4,-2008(gp) # b18 <bullet_y>
 85c:	34300793          	li	a5,835
 860:	00e7c863          	blt	a5,a4,870 <update_bullet+0x254>
 864:	8281a703          	lw	a4,-2008(gp) # b18 <bullet_y>
 868:	00100793          	li	a5,1
 86c:	04e7c063          	blt	a5,a4,8ac <update_bullet+0x290>
 870:	00100713          	li	a4,1
 874:	80e1ae23          	sw	a4,-2020(gp) # b0c <bullet_move>
 878:	865ff0ef          	jal	dc <wait_for_vga>
 87c:	8241a783          	lw	a5,-2012(gp) # b14 <bullet_x>
 880:	01679713          	sll	a4,a5,0x16
 884:	8281a783          	lw	a5,-2008(gp) # b18 <bullet_y>
 888:	00c79793          	sll	a5,a5,0xc
 88c:	00f76733          	or	a4,a4,a5
 890:	8201a783          	lw	a5,-2016(gp) # b10 <bullet_index>
 894:	00279793          	sll	a5,a5,0x2
 898:	00f767b3          	or	a5,a4,a5
 89c:	0027e713          	or	a4,a5,2
 8a0:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 8a4:	00e7a023          	sw	a4,0(a5)
 8a8:	1400006f          	j	9e8 <update_bullet+0x3cc>
 8ac:	8201a703          	lw	a4,-2016(gp) # b10 <bullet_index>
 8b0:	00100793          	li	a5,1
 8b4:	00f71a63          	bne	a4,a5,8c8 <update_bullet+0x2ac>
 8b8:	8241a783          	lw	a5,-2012(gp) # b14 <bullet_x>
 8bc:	00178713          	add	a4,a5,1
 8c0:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 8c4:	0f40006f          	j	9b8 <update_bullet+0x39c>
 8c8:	8201a703          	lw	a4,-2016(gp) # b10 <bullet_index>
 8cc:	00200793          	li	a5,2
 8d0:	00f71a63          	bne	a4,a5,8e4 <update_bullet+0x2c8>
 8d4:	8281a783          	lw	a5,-2008(gp) # b18 <bullet_y>
 8d8:	ffe78713          	add	a4,a5,-2
 8dc:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 8e0:	0d80006f          	j	9b8 <update_bullet+0x39c>
 8e4:	8201a703          	lw	a4,-2016(gp) # b10 <bullet_index>
 8e8:	00300793          	li	a5,3
 8ec:	02f71063          	bne	a4,a5,90c <update_bullet+0x2f0>
 8f0:	8281a783          	lw	a5,-2008(gp) # b18 <bullet_y>
 8f4:	fff78713          	add	a4,a5,-1
 8f8:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 8fc:	8241a783          	lw	a5,-2012(gp) # b14 <bullet_x>
 900:	00178713          	add	a4,a5,1
 904:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 908:	0b00006f          	j	9b8 <update_bullet+0x39c>
 90c:	8201a703          	lw	a4,-2016(gp) # b10 <bullet_index>
 910:	00400793          	li	a5,4
 914:	02f71063          	bne	a4,a5,934 <update_bullet+0x318>
 918:	8241a783          	lw	a5,-2012(gp) # b14 <bullet_x>
 91c:	fff78713          	add	a4,a5,-1
 920:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 924:	8281a783          	lw	a5,-2008(gp) # b18 <bullet_y>
 928:	fff78713          	add	a4,a5,-1
 92c:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 930:	0880006f          	j	9b8 <update_bullet+0x39c>
 934:	8201a703          	lw	a4,-2016(gp) # b10 <bullet_index>
 938:	00500793          	li	a5,5
 93c:	00f71a63          	bne	a4,a5,950 <update_bullet+0x334>
 940:	8281a783          	lw	a5,-2008(gp) # b18 <bullet_y>
 944:	00278713          	add	a4,a5,2
 948:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 94c:	06c0006f          	j	9b8 <update_bullet+0x39c>
 950:	8201a703          	lw	a4,-2016(gp) # b10 <bullet_index>
 954:	00600793          	li	a5,6
 958:	02f71063          	bne	a4,a5,978 <update_bullet+0x35c>
 95c:	8241a783          	lw	a5,-2012(gp) # b14 <bullet_x>
 960:	00178713          	add	a4,a5,1
 964:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 968:	8281a783          	lw	a5,-2008(gp) # b18 <bullet_y>
 96c:	00178713          	add	a4,a5,1
 970:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 974:	0440006f          	j	9b8 <update_bullet+0x39c>
 978:	8201a703          	lw	a4,-2016(gp) # b10 <bullet_index>
 97c:	00700793          	li	a5,7
 980:	02f71063          	bne	a4,a5,9a0 <update_bullet+0x384>
 984:	8241a783          	lw	a5,-2012(gp) # b14 <bullet_x>
 988:	fff78713          	add	a4,a5,-1
 98c:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 990:	8281a783          	lw	a5,-2008(gp) # b18 <bullet_y>
 994:	00178713          	add	a4,a5,1
 998:	82e1a423          	sw	a4,-2008(gp) # b18 <bullet_y>
 99c:	01c0006f          	j	9b8 <update_bullet+0x39c>
 9a0:	8201a703          	lw	a4,-2016(gp) # b10 <bullet_index>
 9a4:	00800793          	li	a5,8
 9a8:	00f71863          	bne	a4,a5,9b8 <update_bullet+0x39c>
 9ac:	8241a783          	lw	a5,-2012(gp) # b14 <bullet_x>
 9b0:	fff78713          	add	a4,a5,-1
 9b4:	82e1a223          	sw	a4,-2012(gp) # b14 <bullet_x>
 9b8:	f24ff0ef          	jal	dc <wait_for_vga>
 9bc:	8241a783          	lw	a5,-2012(gp) # b14 <bullet_x>
 9c0:	01679713          	sll	a4,a5,0x16
 9c4:	8281a783          	lw	a5,-2008(gp) # b18 <bullet_y>
 9c8:	00c79793          	sll	a5,a5,0xc
 9cc:	00f76733          	or	a4,a4,a5
 9d0:	8201a783          	lw	a5,-2016(gp) # b10 <bullet_index>
 9d4:	00279793          	sll	a5,a5,0x2
 9d8:	00f767b3          	or	a5,a4,a5
 9dc:	0017e713          	or	a4,a5,1
 9e0:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 9e4:	00e7a023          	sw	a4,0(a5)
 9e8:	00000013          	nop
 9ec:	00c12083          	lw	ra,12(sp)
 9f0:	00812403          	lw	s0,8(sp)
 9f4:	01010113          	add	sp,sp,16
 9f8:	00008067          	ret

000009fc <main>:
 9fc:	fe010113          	add	sp,sp,-32
 a00:	00112e23          	sw	ra,28(sp)
 a04:	00812c23          	sw	s0,24(sp)
 a08:	02010413          	add	s0,sp,32
 a0c:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 a10:	01679713          	sll	a4,a5,0x16
 a14:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 a18:	00c79793          	sll	a5,a5,0xc
 a1c:	00f76733          	or	a4,a4,a5
 a20:	8141a783          	lw	a5,-2028(gp) # b04 <tank_index>
 a24:	00279793          	sll	a5,a5,0x2
 a28:	00f767b3          	or	a5,a4,a5
 a2c:	0017e713          	or	a4,a5,1
 a30:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 a34:	00e7a023          	sw	a4,0(a5)
 a38:	ea4ff0ef          	jal	dc <wait_for_vga>
 a3c:	80c1a783          	lw	a5,-2036(gp) # afc <tank_xloc>
 a40:	01679713          	sll	a4,a5,0x16
 a44:	8101a783          	lw	a5,-2032(gp) # b00 <tank_yloc>
 a48:	00c79793          	sll	a5,a5,0xc
 a4c:	00f76733          	or	a4,a4,a5
 a50:	8181a783          	lw	a5,-2024(gp) # b08 <gun_index>
 a54:	00279793          	sll	a5,a5,0x2
 a58:	00f767b3          	or	a5,a4,a5
 a5c:	0017e713          	or	a4,a5,1
 a60:	8081a783          	lw	a5,-2040(gp) # af8 <VGA>
 a64:	00e7a023          	sw	a4,0(a5)
 a68:	dbcff0ef          	jal	24 <read_joystick>
 a6c:	ea0ff0ef          	jal	10c <update_tank>
 a70:	badff0ef          	jal	61c <update_bullet>
 a74:	fe042623          	sw	zero,-20(s0)
 a78:	0100006f          	j	a88 <main+0x8c>
 a7c:	fec42783          	lw	a5,-20(s0)
 a80:	00178793          	add	a5,a5,1
 a84:	fef42623          	sw	a5,-20(s0)
 a88:	fec42703          	lw	a4,-20(s0)
 a8c:	000027b7          	lui	a5,0x2
 a90:	70f78793          	add	a5,a5,1807 # 270f <__stack_top+0x70f>
 a94:	fee7d4e3          	bge	a5,a4,a7c <main+0x80>
 a98:	fd1ff06f          	j	a68 <main+0x6c>

Disassembly of section .eh_frame:

00000a9c <.eh_frame>:
 a9c:	0014                	.insn	2, 0x0014
 a9e:	0000                	.insn	2, 0x
 aa0:	0000                	.insn	2, 0x
 aa2:	0000                	.insn	2, 0x
 aa4:	00527a03          	.insn	4, 0x00527a03
 aa8:	7c01                	.insn	2, 0x7c01
 aaa:	0101                	.insn	2, 0x0101
 aac:	07020d1b          	.insn	4, 0x07020d1b
 ab0:	0001                	.insn	2, 0x0001
 ab2:	0000                	.insn	2, 0x
 ab4:	0010                	.insn	2, 0x0010
 ab6:	0000                	.insn	2, 0x
 ab8:	001c                	.insn	2, 0x001c
 aba:	0000                	.insn	2, 0x
 abc:	f544                	.insn	2, 0xf544
 abe:	ffff                	.insn	2, 0xffff
 ac0:	001c                	.insn	2, 0x001c
 ac2:	0000                	.insn	2, 0x
 ac4:	0000                	.insn	2, 0x
 ac6:	0000                	.insn	2, 0x
 ac8:	0010                	.insn	2, 0x0010
 aca:	0000                	.insn	2, 0x
 acc:	0000                	.insn	2, 0x
 ace:	0000                	.insn	2, 0x
 ad0:	00527a03          	.insn	4, 0x00527a03
 ad4:	7c01                	.insn	2, 0x7c01
 ad6:	0101                	.insn	2, 0x0101
 ad8:	00020d1b          	.insn	4, 0x00020d1b
 adc:	0010                	.insn	2, 0x0010
 ade:	0000                	.insn	2, 0x
 ae0:	0018                	.insn	2, 0x0018
 ae2:	0000                	.insn	2, 0x
 ae4:	f538                	.insn	2, 0xf538
 ae6:	ffff                	.insn	2, 0xffff
 ae8:	0008                	.insn	2, 0x0008
 aea:	0000                	.insn	2, 0x
 aec:	0000                	.insn	2, 0x
	...

Disassembly of section .sdata:

00000af0 <debug>:
 af0:	c001                	.insn	2, 0xc001
 af2:	ffff                	.insn	2, 0xffff

00000af4 <joystick>:
 af4:	c002                	.insn	2, 0xc002
 af6:	ffff                	.insn	2, 0xffff

00000af8 <VGA>:
 af8:	ffffc003          	lbu	zero,-1(t6)

00000afc <tank_xloc>:
 afc:	012c                	.insn	2, 0x012c
	...

00000b00 <tank_yloc>:
 b00:	012c                	.insn	2, 0x012c
	...

00000b04 <tank_index>:
 b04:	001f 0000       	.insn	6, 0x00220000001f

00000b08 <gun_index>:
 b08:	0022                	.insn	2, 0x0022
	...

00000b0c <bullet_move>:
 b0c:	0001                	.insn	2, 0x0001
	...

00000b10 <bullet_index>:
 b10:	0002                	.insn	2, 0x0002
	...

00000b14 <bullet_x>:
 b14:	0001                	.insn	2, 0x0001
	...

00000b18 <bullet_y>:
 b18:	0001                	.insn	2, 0x0001
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
