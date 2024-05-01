
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00002197          	auipc	gp,0x2
       4:	cb818193          	add	gp,gp,-840 # 1cb8 <__global_pointer$>
       8:	34818113          	add	sp,gp,840 # 2000 <__stack_top>
       c:	00010433          	add	s0,sp,zero
      10:	3b0010ef          	jal	13c0 <main>
      14:	004000ef          	jal	18 <_exit>

00000018 <_exit>:
      18:	05d00893          	li	a7,93
      1c:	00000073          	ecall

00000020 <read_joystick>:
      20:	fe010113          	add	sp,sp,-32
      24:	00812e23          	sw	s0,28(sp)
      28:	02010413          	add	s0,sp,32
      2c:	fea42623          	sw	a0,-20(s0)
      30:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
      34:	0007a783          	lw	a5,0(a5)
      38:	00a7d793          	srl	a5,a5,0xa
      3c:	0037f713          	and	a4,a5,3
      40:	fec42783          	lw	a5,-20(s0)
      44:	00e7a023          	sw	a4,0(a5)
      48:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
      4c:	0007a783          	lw	a5,0(a5)
      50:	0087d793          	srl	a5,a5,0x8
      54:	0037f713          	and	a4,a5,3
      58:	fec42783          	lw	a5,-20(s0)
      5c:	00e7a223          	sw	a4,4(a5)
      60:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
      64:	0007a783          	lw	a5,0(a5)
      68:	0067d793          	srl	a5,a5,0x6
      6c:	0037f713          	and	a4,a5,3
      70:	fec42783          	lw	a5,-20(s0)
      74:	00e7a423          	sw	a4,8(a5)
      78:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
      7c:	0007a783          	lw	a5,0(a5)
      80:	0047d793          	srl	a5,a5,0x4
      84:	0037f713          	and	a4,a5,3
      88:	fec42783          	lw	a5,-20(s0)
      8c:	00e7a623          	sw	a4,12(a5)
      90:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
      94:	0007a783          	lw	a5,0(a5)
      98:	0027d793          	srl	a5,a5,0x2
      9c:	0037f713          	and	a4,a5,3
      a0:	fec42783          	lw	a5,-20(s0)
      a4:	00e7a823          	sw	a4,16(a5)
      a8:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
      ac:	0007a783          	lw	a5,0(a5)
      b0:	0037f713          	and	a4,a5,3
      b4:	fec42783          	lw	a5,-20(s0)
      b8:	00e7aa23          	sw	a4,20(a5)
      bc:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
      c0:	03f00713          	li	a4,63
      c4:	00e7a023          	sw	a4,0(a5)
      c8:	00000013          	nop
      cc:	01c12403          	lw	s0,28(sp)
      d0:	02010113          	add	sp,sp,32
      d4:	00008067          	ret

000000d8 <read_joystick_2>:
      d8:	fd010113          	add	sp,sp,-48
      dc:	02812623          	sw	s0,44(sp)
      e0:	03010413          	add	s0,sp,48
      e4:	fca42e23          	sw	a0,-36(s0)
      e8:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
      ec:	0007a783          	lw	a5,0(a5)
      f0:	0167d793          	srl	a5,a5,0x16
      f4:	0037f713          	and	a4,a5,3
      f8:	fdc42783          	lw	a5,-36(s0)
      fc:	00e7a023          	sw	a4,0(a5)
     100:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
     104:	0007a783          	lw	a5,0(a5)
     108:	0147d793          	srl	a5,a5,0x14
     10c:	0037f713          	and	a4,a5,3
     110:	fdc42783          	lw	a5,-36(s0)
     114:	00e7a223          	sw	a4,4(a5)
     118:	fdc42783          	lw	a5,-36(s0)
     11c:	0007a423          	sw	zero,8(a5)
     120:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
     124:	0007a783          	lw	a5,0(a5)
     128:	0107d793          	srl	a5,a5,0x10
     12c:	0037f713          	and	a4,a5,3
     130:	fdc42783          	lw	a5,-36(s0)
     134:	00e7a623          	sw	a4,12(a5)
     138:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
     13c:	0007a783          	lw	a5,0(a5)
     140:	00e7d793          	srl	a5,a5,0xe
     144:	0037f713          	and	a4,a5,3
     148:	fdc42783          	lw	a5,-36(s0)
     14c:	00e7a823          	sw	a4,16(a5)
     150:	8cc1a783          	lw	a5,-1844(gp) # 1584 <joystick>
     154:	0007a783          	lw	a5,0(a5)
     158:	00c7d793          	srl	a5,a5,0xc
     15c:	0037f713          	and	a4,a5,3
     160:	fdc42783          	lw	a5,-36(s0)
     164:	00e7aa23          	sw	a4,20(a5)
     168:	fe042623          	sw	zero,-20(s0)
     16c:	01c0006f          	j	188 <read_joystick_2+0xb0>
     170:	8d41a783          	lw	a5,-1836(gp) # 158c <joystick2>
     174:	00100713          	li	a4,1
     178:	00e7a023          	sw	a4,0(a5)
     17c:	fec42783          	lw	a5,-20(s0)
     180:	00178793          	add	a5,a5,1
     184:	fef42623          	sw	a5,-20(s0)
     188:	fec42703          	lw	a4,-20(s0)
     18c:	1f300793          	li	a5,499
     190:	fee7d0e3          	bge	a5,a4,170 <read_joystick_2+0x98>
     194:	00000013          	nop
     198:	02c12403          	lw	s0,44(sp)
     19c:	03010113          	add	sp,sp,48
     1a0:	00008067          	ret

000001a4 <wait_for_vga>:
     1a4:	ff010113          	add	sp,sp,-16
     1a8:	00812623          	sw	s0,12(sp)
     1ac:	01010413          	add	s0,sp,16
     1b0:	00000013          	nop
     1b4:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     1b8:	0007a783          	lw	a5,0(a5)
     1bc:	fe07cce3          	bltz	a5,1b4 <wait_for_vga+0x10>
     1c0:	00000013          	nop
     1c4:	00000013          	nop
     1c8:	00c12403          	lw	s0,12(sp)
     1cc:	01010113          	add	sp,sp,16
     1d0:	00008067          	ret

000001d4 <init>:
     1d4:	fe010113          	add	sp,sp,-32
     1d8:	00112e23          	sw	ra,28(sp)
     1dc:	00812c23          	sw	s0,24(sp)
     1e0:	02010413          	add	s0,sp,32
     1e4:	88818793          	add	a5,gp,-1912 # 1540 <player>
     1e8:	00500713          	li	a4,5
     1ec:	00e7a023          	sw	a4,0(a5)
     1f0:	88818793          	add	a5,gp,-1912 # 1540 <player>
     1f4:	33400713          	li	a4,820
     1f8:	00e7a223          	sw	a4,4(a5)
     1fc:	88818793          	add	a5,gp,-1912 # 1540 <player>
     200:	01f00713          	li	a4,31
     204:	00e7a423          	sw	a4,8(a5)
     208:	88818793          	add	a5,gp,-1912 # 1540 <player>
     20c:	02300713          	li	a4,35
     210:	00e7a623          	sw	a4,12(a5)
     214:	8a818793          	add	a5,gp,-1880 # 1560 <player_bullet>
     218:	00100713          	li	a4,1
     21c:	00e7a023          	sw	a4,0(a5)
     220:	8a818793          	add	a5,gp,-1880 # 1560 <player_bullet>
     224:	00200713          	li	a4,2
     228:	00e7a223          	sw	a4,4(a5)
     22c:	8a818793          	add	a5,gp,-1880 # 1560 <player_bullet>
     230:	00100713          	li	a4,1
     234:	00e7a423          	sw	a4,8(a5)
     238:	8a818793          	add	a5,gp,-1880 # 1560 <player_bullet>
     23c:	00100713          	li	a4,1
     240:	00e7a623          	sw	a4,12(a5)
     244:	8d818793          	add	a5,gp,-1832 # 1590 <joy1>
     248:	0007a423          	sw	zero,8(a5)
     24c:	8d818793          	add	a5,gp,-1832 # 1590 <joy1>
     250:	0007aa23          	sw	zero,20(a5)
     254:	8d818793          	add	a5,gp,-1832 # 1590 <joy1>
     258:	0007a023          	sw	zero,0(a5)
     25c:	8d818793          	add	a5,gp,-1832 # 1590 <joy1>
     260:	0007a623          	sw	zero,12(a5)
     264:	8d818793          	add	a5,gp,-1832 # 1590 <joy1>
     268:	0007a223          	sw	zero,4(a5)
     26c:	8d818793          	add	a5,gp,-1832 # 1590 <joy1>
     270:	0007a823          	sw	zero,16(a5)
     274:	8d818793          	add	a5,gp,-1832 # 1590 <joy1>
     278:	ffffc737          	lui	a4,0xffffc
     27c:	00270713          	add	a4,a4,2 # ffffc002 <__stack_top+0xffffa002>
     280:	00e7ac23          	sw	a4,24(a5)
     284:	f21ff0ef          	jal	1a4 <wait_for_vga>
     288:	88818793          	add	a5,gp,-1912 # 1540 <player>
     28c:	0007a783          	lw	a5,0(a5)
     290:	01679713          	sll	a4,a5,0x16
     294:	88818793          	add	a5,gp,-1912 # 1540 <player>
     298:	0047a783          	lw	a5,4(a5)
     29c:	00c79793          	sll	a5,a5,0xc
     2a0:	00f76733          	or	a4,a4,a5
     2a4:	88818793          	add	a5,gp,-1912 # 1540 <player>
     2a8:	0087a783          	lw	a5,8(a5)
     2ac:	00279793          	sll	a5,a5,0x2
     2b0:	00f767b3          	or	a5,a4,a5
     2b4:	0017e713          	or	a4,a5,1
     2b8:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     2bc:	00e7a023          	sw	a4,0(a5)
     2c0:	ee5ff0ef          	jal	1a4 <wait_for_vga>
     2c4:	88818793          	add	a5,gp,-1912 # 1540 <player>
     2c8:	0007a783          	lw	a5,0(a5)
     2cc:	01679713          	sll	a4,a5,0x16
     2d0:	88818793          	add	a5,gp,-1912 # 1540 <player>
     2d4:	0047a783          	lw	a5,4(a5)
     2d8:	00c79793          	sll	a5,a5,0xc
     2dc:	00f76733          	or	a4,a4,a5
     2e0:	88818793          	add	a5,gp,-1912 # 1540 <player>
     2e4:	00c7a783          	lw	a5,12(a5)
     2e8:	00279793          	sll	a5,a5,0x2
     2ec:	00f767b3          	or	a5,a4,a5
     2f0:	0017e713          	or	a4,a5,1
     2f4:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     2f8:	00e7a023          	sw	a4,0(a5)
     2fc:	fe042623          	sw	zero,-20(s0)
     300:	05c0006f          	j	35c <init+0x188>
     304:	ea1ff0ef          	jal	1a4 <wait_for_vga>
     308:	000017b7          	lui	a5,0x1
     30c:	4d878713          	add	a4,a5,1240 # 14d8 <blocks>
     310:	fec42783          	lw	a5,-20(s0)
     314:	00379793          	sll	a5,a5,0x3
     318:	00f707b3          	add	a5,a4,a5
     31c:	0007a783          	lw	a5,0(a5)
     320:	01679713          	sll	a4,a5,0x16
     324:	000017b7          	lui	a5,0x1
     328:	4d878693          	add	a3,a5,1240 # 14d8 <blocks>
     32c:	fec42783          	lw	a5,-20(s0)
     330:	00379793          	sll	a5,a5,0x3
     334:	00f687b3          	add	a5,a3,a5
     338:	0047a783          	lw	a5,4(a5)
     33c:	00c79793          	sll	a5,a5,0xc
     340:	00f767b3          	or	a5,a4,a5
     344:	0017e713          	or	a4,a5,1
     348:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     34c:	00e7a023          	sw	a4,0(a5)
     350:	fec42783          	lw	a5,-20(s0)
     354:	00178793          	add	a5,a5,1
     358:	fef42623          	sw	a5,-20(s0)
     35c:	fec42703          	lw	a4,-20(s0)
     360:	00c00793          	li	a5,12
     364:	fae7d0e3          	bge	a5,a4,304 <init+0x130>
     368:	89818793          	add	a5,gp,-1896 # 1550 <enemy>
     36c:	01300713          	li	a4,19
     370:	00e7a423          	sw	a4,8(a5)
     374:	89818793          	add	a5,gp,-1896 # 1550 <enemy>
     378:	02600713          	li	a4,38
     37c:	00e7a623          	sw	a4,12(a5)
     380:	89818793          	add	a5,gp,-1896 # 1550 <enemy>
     384:	23f00713          	li	a4,575
     388:	00e7a023          	sw	a4,0(a5)
     38c:	89818793          	add	a5,gp,-1896 # 1550 <enemy>
     390:	00200713          	li	a4,2
     394:	00e7a223          	sw	a4,4(a5)
     398:	8b818793          	add	a5,gp,-1864 # 1570 <enemy_bullet>
     39c:	00100713          	li	a4,1
     3a0:	00e7a023          	sw	a4,0(a5)
     3a4:	8b818793          	add	a5,gp,-1864 # 1570 <enemy_bullet>
     3a8:	00200713          	li	a4,2
     3ac:	00e7a223          	sw	a4,4(a5)
     3b0:	8b818793          	add	a5,gp,-1864 # 1570 <enemy_bullet>
     3b4:	00100713          	li	a4,1
     3b8:	00e7a423          	sw	a4,8(a5)
     3bc:	8b818793          	add	a5,gp,-1864 # 1570 <enemy_bullet>
     3c0:	00100713          	li	a4,1
     3c4:	00e7a623          	sw	a4,12(a5)
     3c8:	8f418793          	add	a5,gp,-1804 # 15ac <joy2>
     3cc:	0007a423          	sw	zero,8(a5)
     3d0:	8f418793          	add	a5,gp,-1804 # 15ac <joy2>
     3d4:	0007aa23          	sw	zero,20(a5)
     3d8:	8f418793          	add	a5,gp,-1804 # 15ac <joy2>
     3dc:	0007a023          	sw	zero,0(a5)
     3e0:	8f418793          	add	a5,gp,-1804 # 15ac <joy2>
     3e4:	0007a623          	sw	zero,12(a5)
     3e8:	8f418793          	add	a5,gp,-1804 # 15ac <joy2>
     3ec:	0007a223          	sw	zero,4(a5)
     3f0:	8f418793          	add	a5,gp,-1804 # 15ac <joy2>
     3f4:	0007a823          	sw	zero,16(a5)
     3f8:	8f418793          	add	a5,gp,-1804 # 15ac <joy2>
     3fc:	ffffc737          	lui	a4,0xffffc
     400:	00470713          	add	a4,a4,4 # ffffc004 <__stack_top+0xffffa004>
     404:	00e7ac23          	sw	a4,24(a5)
     408:	d9dff0ef          	jal	1a4 <wait_for_vga>
     40c:	89818793          	add	a5,gp,-1896 # 1550 <enemy>
     410:	0007a783          	lw	a5,0(a5)
     414:	01679713          	sll	a4,a5,0x16
     418:	89818793          	add	a5,gp,-1896 # 1550 <enemy>
     41c:	0047a783          	lw	a5,4(a5)
     420:	00c79793          	sll	a5,a5,0xc
     424:	00f76733          	or	a4,a4,a5
     428:	89818793          	add	a5,gp,-1896 # 1550 <enemy>
     42c:	0087a783          	lw	a5,8(a5)
     430:	00279793          	sll	a5,a5,0x2
     434:	00f767b3          	or	a5,a4,a5
     438:	0017e713          	or	a4,a5,1
     43c:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     440:	00e7a023          	sw	a4,0(a5)
     444:	d61ff0ef          	jal	1a4 <wait_for_vga>
     448:	89818793          	add	a5,gp,-1896 # 1550 <enemy>
     44c:	0007a783          	lw	a5,0(a5)
     450:	01679713          	sll	a4,a5,0x16
     454:	89818793          	add	a5,gp,-1896 # 1550 <enemy>
     458:	0047a783          	lw	a5,4(a5)
     45c:	00c79793          	sll	a5,a5,0xc
     460:	00f76733          	or	a4,a4,a5
     464:	89818793          	add	a5,gp,-1896 # 1550 <enemy>
     468:	00c7a783          	lw	a5,12(a5)
     46c:	00279793          	sll	a5,a5,0x2
     470:	00f767b3          	or	a5,a4,a5
     474:	0017e713          	or	a4,a5,1
     478:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     47c:	00e7a023          	sw	a4,0(a5)
     480:	00000013          	nop
     484:	01c12083          	lw	ra,28(sp)
     488:	01812403          	lw	s0,24(sp)
     48c:	02010113          	add	sp,sp,32
     490:	00008067          	ret

00000494 <wall_collision>:
     494:	fd010113          	add	sp,sp,-48
     498:	02812623          	sw	s0,44(sp)
     49c:	03010413          	add	s0,sp,48
     4a0:	fca42e23          	sw	a0,-36(s0)
     4a4:	fcb42c23          	sw	a1,-40(s0)
     4a8:	fe042623          	sw	zero,-20(s0)
     4ac:	0a80006f          	j	554 <wall_collision+0xc0>
     4b0:	000017b7          	lui	a5,0x1
     4b4:	4d878713          	add	a4,a5,1240 # 14d8 <blocks>
     4b8:	fec42783          	lw	a5,-20(s0)
     4bc:	00379793          	sll	a5,a5,0x3
     4c0:	00f707b3          	add	a5,a4,a5
     4c4:	0007a783          	lw	a5,0(a5)
     4c8:	03e78793          	add	a5,a5,62
     4cc:	fdc42703          	lw	a4,-36(s0)
     4d0:	06e7cc63          	blt	a5,a4,548 <wall_collision+0xb4>
     4d4:	fdc42783          	lw	a5,-36(s0)
     4d8:	03f78713          	add	a4,a5,63
     4dc:	000017b7          	lui	a5,0x1
     4e0:	4d878693          	add	a3,a5,1240 # 14d8 <blocks>
     4e4:	fec42783          	lw	a5,-20(s0)
     4e8:	00379793          	sll	a5,a5,0x3
     4ec:	00f687b3          	add	a5,a3,a5
     4f0:	0007a783          	lw	a5,0(a5)
     4f4:	04f74a63          	blt	a4,a5,548 <wall_collision+0xb4>
     4f8:	000017b7          	lui	a5,0x1
     4fc:	4d878713          	add	a4,a5,1240 # 14d8 <blocks>
     500:	fec42783          	lw	a5,-20(s0)
     504:	00379793          	sll	a5,a5,0x3
     508:	00f707b3          	add	a5,a4,a5
     50c:	0047a783          	lw	a5,4(a5)
     510:	07d78793          	add	a5,a5,125
     514:	fd842703          	lw	a4,-40(s0)
     518:	02e7c863          	blt	a5,a4,548 <wall_collision+0xb4>
     51c:	fd842783          	lw	a5,-40(s0)
     520:	07f78713          	add	a4,a5,127
     524:	000017b7          	lui	a5,0x1
     528:	4d878693          	add	a3,a5,1240 # 14d8 <blocks>
     52c:	fec42783          	lw	a5,-20(s0)
     530:	00379793          	sll	a5,a5,0x3
     534:	00f687b3          	add	a5,a3,a5
     538:	0047a783          	lw	a5,4(a5)
     53c:	00f74663          	blt	a4,a5,548 <wall_collision+0xb4>
     540:	fff00793          	li	a5,-1
     544:	0200006f          	j	564 <wall_collision+0xd0>
     548:	fec42783          	lw	a5,-20(s0)
     54c:	00178793          	add	a5,a5,1
     550:	fef42623          	sw	a5,-20(s0)
     554:	fec42703          	lw	a4,-20(s0)
     558:	00c00793          	li	a5,12
     55c:	f4e7dae3          	bge	a5,a4,4b0 <wall_collision+0x1c>
     560:	00000793          	li	a5,0
     564:	00078513          	mv	a0,a5
     568:	02c12403          	lw	s0,44(sp)
     56c:	03010113          	add	sp,sp,48
     570:	00008067          	ret

00000574 <bullet_collision>:
     574:	fd010113          	add	sp,sp,-48
     578:	02812623          	sw	s0,44(sp)
     57c:	03010413          	add	s0,sp,48
     580:	fca42e23          	sw	a0,-36(s0)
     584:	fcb42c23          	sw	a1,-40(s0)
     588:	fe042623          	sw	zero,-20(s0)
     58c:	0a80006f          	j	634 <bullet_collision+0xc0>
     590:	000017b7          	lui	a5,0x1
     594:	4d878713          	add	a4,a5,1240 # 14d8 <blocks>
     598:	fec42783          	lw	a5,-20(s0)
     59c:	00379793          	sll	a5,a5,0x3
     5a0:	00f707b3          	add	a5,a4,a5
     5a4:	0007a783          	lw	a5,0(a5)
     5a8:	03e78793          	add	a5,a5,62
     5ac:	fdc42703          	lw	a4,-36(s0)
     5b0:	06e7cc63          	blt	a5,a4,628 <bullet_collision+0xb4>
     5b4:	fdc42783          	lw	a5,-36(s0)
     5b8:	01f78713          	add	a4,a5,31
     5bc:	000017b7          	lui	a5,0x1
     5c0:	4d878693          	add	a3,a5,1240 # 14d8 <blocks>
     5c4:	fec42783          	lw	a5,-20(s0)
     5c8:	00379793          	sll	a5,a5,0x3
     5cc:	00f687b3          	add	a5,a3,a5
     5d0:	0007a783          	lw	a5,0(a5)
     5d4:	04f74a63          	blt	a4,a5,628 <bullet_collision+0xb4>
     5d8:	000017b7          	lui	a5,0x1
     5dc:	4d878713          	add	a4,a5,1240 # 14d8 <blocks>
     5e0:	fec42783          	lw	a5,-20(s0)
     5e4:	00379793          	sll	a5,a5,0x3
     5e8:	00f707b3          	add	a5,a4,a5
     5ec:	0047a783          	lw	a5,4(a5)
     5f0:	07d78793          	add	a5,a5,125
     5f4:	fd842703          	lw	a4,-40(s0)
     5f8:	02e7c863          	blt	a5,a4,628 <bullet_collision+0xb4>
     5fc:	fd842783          	lw	a5,-40(s0)
     600:	03f78713          	add	a4,a5,63
     604:	000017b7          	lui	a5,0x1
     608:	4d878693          	add	a3,a5,1240 # 14d8 <blocks>
     60c:	fec42783          	lw	a5,-20(s0)
     610:	00379793          	sll	a5,a5,0x3
     614:	00f687b3          	add	a5,a3,a5
     618:	0047a783          	lw	a5,4(a5)
     61c:	00f74663          	blt	a4,a5,628 <bullet_collision+0xb4>
     620:	fff00793          	li	a5,-1
     624:	0200006f          	j	644 <bullet_collision+0xd0>
     628:	fec42783          	lw	a5,-20(s0)
     62c:	00178793          	add	a5,a5,1
     630:	fef42623          	sw	a5,-20(s0)
     634:	fec42703          	lw	a4,-20(s0)
     638:	00c00793          	li	a5,12
     63c:	f4e7dae3          	bge	a5,a4,590 <bullet_collision+0x1c>
     640:	00000793          	li	a5,0
     644:	00078513          	mv	a0,a5
     648:	02c12403          	lw	s0,44(sp)
     64c:	03010113          	add	sp,sp,48
     650:	00008067          	ret

00000654 <update_player_tank>:
     654:	fd010113          	add	sp,sp,-48
     658:	02112623          	sw	ra,44(sp)
     65c:	02812423          	sw	s0,40(sp)
     660:	03010413          	add	s0,sp,48
     664:	fca42e23          	sw	a0,-36(s0)
     668:	fcb42c23          	sw	a1,-40(s0)
     66c:	fcc42a23          	sw	a2,-44(s0)
     670:	fe042623          	sw	zero,-20(s0)
     674:	00100793          	li	a5,1
     678:	fef42423          	sw	a5,-24(s0)
     67c:	b29ff0ef          	jal	1a4 <wait_for_vga>
     680:	fd842783          	lw	a5,-40(s0)
     684:	00c7a703          	lw	a4,12(a5)
     688:	00200793          	li	a5,2
     68c:	06f71463          	bne	a4,a5,6f4 <update_player_tank+0xa0>
     690:	fd842783          	lw	a5,-40(s0)
     694:	0107a783          	lw	a5,16(a5)
     698:	04079e63          	bnez	a5,6f4 <update_player_tank+0xa0>
     69c:	88818793          	add	a5,gp,-1912 # 1540 <player>
     6a0:	00c7a703          	lw	a4,12(a5)
     6a4:	02900793          	li	a5,41
     6a8:	04f70663          	beq	a4,a5,6f4 <update_player_tank+0xa0>
     6ac:	fdc42783          	lw	a5,-36(s0)
     6b0:	0007a783          	lw	a5,0(a5)
     6b4:	01679713          	sll	a4,a5,0x16
     6b8:	fdc42783          	lw	a5,-36(s0)
     6bc:	0047a783          	lw	a5,4(a5)
     6c0:	00c79793          	sll	a5,a5,0xc
     6c4:	00f76733          	or	a4,a4,a5
     6c8:	fdc42783          	lw	a5,-36(s0)
     6cc:	00c7a783          	lw	a5,12(a5)
     6d0:	00279793          	sll	a5,a5,0x2
     6d4:	00f767b3          	or	a5,a4,a5
     6d8:	0027e713          	or	a4,a5,2
     6dc:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     6e0:	00e7a023          	sw	a4,0(a5)
     6e4:	fdc42783          	lw	a5,-36(s0)
     6e8:	02900713          	li	a4,41
     6ec:	00e7a623          	sw	a4,12(a5)
     6f0:	3440006f          	j	a34 <update_player_tank+0x3e0>
     6f4:	fd842783          	lw	a5,-40(s0)
     6f8:	00c7a703          	lw	a4,12(a5)
     6fc:	00100793          	li	a5,1
     700:	06f71463          	bne	a4,a5,768 <update_player_tank+0x114>
     704:	fd842783          	lw	a5,-40(s0)
     708:	0107a783          	lw	a5,16(a5)
     70c:	04079e63          	bnez	a5,768 <update_player_tank+0x114>
     710:	fdc42783          	lw	a5,-36(s0)
     714:	00c7a703          	lw	a4,12(a5)
     718:	02200793          	li	a5,34
     71c:	04f70663          	beq	a4,a5,768 <update_player_tank+0x114>
     720:	fdc42783          	lw	a5,-36(s0)
     724:	0007a783          	lw	a5,0(a5)
     728:	01679713          	sll	a4,a5,0x16
     72c:	fdc42783          	lw	a5,-36(s0)
     730:	0047a783          	lw	a5,4(a5)
     734:	00c79793          	sll	a5,a5,0xc
     738:	00f76733          	or	a4,a4,a5
     73c:	fdc42783          	lw	a5,-36(s0)
     740:	00c7a783          	lw	a5,12(a5)
     744:	00279793          	sll	a5,a5,0x2
     748:	00f767b3          	or	a5,a4,a5
     74c:	0027e713          	or	a4,a5,2
     750:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     754:	00e7a023          	sw	a4,0(a5)
     758:	fdc42783          	lw	a5,-36(s0)
     75c:	02200713          	li	a4,34
     760:	00e7a623          	sw	a4,12(a5)
     764:	2d00006f          	j	a34 <update_player_tank+0x3e0>
     768:	fd842783          	lw	a5,-40(s0)
     76c:	0107a703          	lw	a4,16(a5)
     770:	00200793          	li	a5,2
     774:	06f71463          	bne	a4,a5,7dc <update_player_tank+0x188>
     778:	fd842783          	lw	a5,-40(s0)
     77c:	00c7a783          	lw	a5,12(a5)
     780:	04079e63          	bnez	a5,7dc <update_player_tank+0x188>
     784:	fdc42783          	lw	a5,-36(s0)
     788:	00c7a703          	lw	a4,12(a5)
     78c:	02300793          	li	a5,35
     790:	04f70663          	beq	a4,a5,7dc <update_player_tank+0x188>
     794:	fdc42783          	lw	a5,-36(s0)
     798:	0007a783          	lw	a5,0(a5)
     79c:	01679713          	sll	a4,a5,0x16
     7a0:	fdc42783          	lw	a5,-36(s0)
     7a4:	0047a783          	lw	a5,4(a5)
     7a8:	00c79793          	sll	a5,a5,0xc
     7ac:	00f76733          	or	a4,a4,a5
     7b0:	fdc42783          	lw	a5,-36(s0)
     7b4:	00c7a783          	lw	a5,12(a5)
     7b8:	00279793          	sll	a5,a5,0x2
     7bc:	00f767b3          	or	a5,a4,a5
     7c0:	0027e713          	or	a4,a5,2
     7c4:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     7c8:	00e7a023          	sw	a4,0(a5)
     7cc:	fdc42783          	lw	a5,-36(s0)
     7d0:	02300713          	li	a4,35
     7d4:	00e7a623          	sw	a4,12(a5)
     7d8:	25c0006f          	j	a34 <update_player_tank+0x3e0>
     7dc:	fd842783          	lw	a5,-40(s0)
     7e0:	0107a703          	lw	a4,16(a5)
     7e4:	00100793          	li	a5,1
     7e8:	06f71463          	bne	a4,a5,850 <update_player_tank+0x1fc>
     7ec:	fd842783          	lw	a5,-40(s0)
     7f0:	00c7a783          	lw	a5,12(a5)
     7f4:	04079e63          	bnez	a5,850 <update_player_tank+0x1fc>
     7f8:	fdc42783          	lw	a5,-36(s0)
     7fc:	00c7a703          	lw	a4,12(a5)
     800:	02600793          	li	a5,38
     804:	04f70663          	beq	a4,a5,850 <update_player_tank+0x1fc>
     808:	fdc42783          	lw	a5,-36(s0)
     80c:	0007a783          	lw	a5,0(a5)
     810:	01679713          	sll	a4,a5,0x16
     814:	fdc42783          	lw	a5,-36(s0)
     818:	0047a783          	lw	a5,4(a5)
     81c:	00c79793          	sll	a5,a5,0xc
     820:	00f76733          	or	a4,a4,a5
     824:	fdc42783          	lw	a5,-36(s0)
     828:	00c7a783          	lw	a5,12(a5)
     82c:	00279793          	sll	a5,a5,0x2
     830:	00f767b3          	or	a5,a4,a5
     834:	0027e713          	or	a4,a5,2
     838:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     83c:	00e7a023          	sw	a4,0(a5)
     840:	fdc42783          	lw	a5,-36(s0)
     844:	02600713          	li	a4,38
     848:	00e7a623          	sw	a4,12(a5)
     84c:	1e80006f          	j	a34 <update_player_tank+0x3e0>
     850:	fd842783          	lw	a5,-40(s0)
     854:	00c7a703          	lw	a4,12(a5)
     858:	00100793          	li	a5,1
     85c:	06f71663          	bne	a4,a5,8c8 <update_player_tank+0x274>
     860:	fd842783          	lw	a5,-40(s0)
     864:	0107a703          	lw	a4,16(a5)
     868:	00200793          	li	a5,2
     86c:	04f71e63          	bne	a4,a5,8c8 <update_player_tank+0x274>
     870:	fdc42783          	lw	a5,-36(s0)
     874:	00c7a703          	lw	a4,12(a5)
     878:	02400793          	li	a5,36
     87c:	04f70663          	beq	a4,a5,8c8 <update_player_tank+0x274>
     880:	fdc42783          	lw	a5,-36(s0)
     884:	0007a783          	lw	a5,0(a5)
     888:	01679713          	sll	a4,a5,0x16
     88c:	fdc42783          	lw	a5,-36(s0)
     890:	0047a783          	lw	a5,4(a5)
     894:	00c79793          	sll	a5,a5,0xc
     898:	00f76733          	or	a4,a4,a5
     89c:	fdc42783          	lw	a5,-36(s0)
     8a0:	00c7a783          	lw	a5,12(a5)
     8a4:	00279793          	sll	a5,a5,0x2
     8a8:	00f767b3          	or	a5,a4,a5
     8ac:	0027e713          	or	a4,a5,2
     8b0:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     8b4:	00e7a023          	sw	a4,0(a5)
     8b8:	fdc42783          	lw	a5,-36(s0)
     8bc:	02400713          	li	a4,36
     8c0:	00e7a623          	sw	a4,12(a5)
     8c4:	1700006f          	j	a34 <update_player_tank+0x3e0>
     8c8:	fd842783          	lw	a5,-40(s0)
     8cc:	00c7a703          	lw	a4,12(a5)
     8d0:	00200793          	li	a5,2
     8d4:	06f71663          	bne	a4,a5,940 <update_player_tank+0x2ec>
     8d8:	fd842783          	lw	a5,-40(s0)
     8dc:	0107a703          	lw	a4,16(a5)
     8e0:	00200793          	li	a5,2
     8e4:	04f71e63          	bne	a4,a5,940 <update_player_tank+0x2ec>
     8e8:	fdc42783          	lw	a5,-36(s0)
     8ec:	00c7a703          	lw	a4,12(a5)
     8f0:	02500793          	li	a5,37
     8f4:	04f70663          	beq	a4,a5,940 <update_player_tank+0x2ec>
     8f8:	fdc42783          	lw	a5,-36(s0)
     8fc:	0007a783          	lw	a5,0(a5)
     900:	01679713          	sll	a4,a5,0x16
     904:	fdc42783          	lw	a5,-36(s0)
     908:	0047a783          	lw	a5,4(a5)
     90c:	00c79793          	sll	a5,a5,0xc
     910:	00f76733          	or	a4,a4,a5
     914:	fdc42783          	lw	a5,-36(s0)
     918:	00c7a783          	lw	a5,12(a5)
     91c:	00279793          	sll	a5,a5,0x2
     920:	00f767b3          	or	a5,a4,a5
     924:	0027e713          	or	a4,a5,2
     928:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     92c:	00e7a023          	sw	a4,0(a5)
     930:	fdc42783          	lw	a5,-36(s0)
     934:	02500713          	li	a4,37
     938:	00e7a623          	sw	a4,12(a5)
     93c:	0f80006f          	j	a34 <update_player_tank+0x3e0>
     940:	fd842783          	lw	a5,-40(s0)
     944:	00c7a703          	lw	a4,12(a5)
     948:	00100793          	li	a5,1
     94c:	06f71663          	bne	a4,a5,9b8 <update_player_tank+0x364>
     950:	fd842783          	lw	a5,-40(s0)
     954:	0107a703          	lw	a4,16(a5)
     958:	00100793          	li	a5,1
     95c:	04f71e63          	bne	a4,a5,9b8 <update_player_tank+0x364>
     960:	fdc42783          	lw	a5,-36(s0)
     964:	00c7a703          	lw	a4,12(a5)
     968:	02700793          	li	a5,39
     96c:	04f70663          	beq	a4,a5,9b8 <update_player_tank+0x364>
     970:	fdc42783          	lw	a5,-36(s0)
     974:	0007a783          	lw	a5,0(a5)
     978:	01679713          	sll	a4,a5,0x16
     97c:	fdc42783          	lw	a5,-36(s0)
     980:	0047a783          	lw	a5,4(a5)
     984:	00c79793          	sll	a5,a5,0xc
     988:	00f76733          	or	a4,a4,a5
     98c:	fdc42783          	lw	a5,-36(s0)
     990:	00c7a783          	lw	a5,12(a5)
     994:	00279793          	sll	a5,a5,0x2
     998:	00f767b3          	or	a5,a4,a5
     99c:	0027e713          	or	a4,a5,2
     9a0:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     9a4:	00e7a023          	sw	a4,0(a5)
     9a8:	fdc42783          	lw	a5,-36(s0)
     9ac:	02700713          	li	a4,39
     9b0:	00e7a623          	sw	a4,12(a5)
     9b4:	0800006f          	j	a34 <update_player_tank+0x3e0>
     9b8:	fd842783          	lw	a5,-40(s0)
     9bc:	00c7a703          	lw	a4,12(a5)
     9c0:	00200793          	li	a5,2
     9c4:	06f71663          	bne	a4,a5,a30 <update_player_tank+0x3dc>
     9c8:	fd842783          	lw	a5,-40(s0)
     9cc:	0107a703          	lw	a4,16(a5)
     9d0:	00100793          	li	a5,1
     9d4:	04f71e63          	bne	a4,a5,a30 <update_player_tank+0x3dc>
     9d8:	fdc42783          	lw	a5,-36(s0)
     9dc:	00c7a703          	lw	a4,12(a5)
     9e0:	02800793          	li	a5,40
     9e4:	04f70663          	beq	a4,a5,a30 <update_player_tank+0x3dc>
     9e8:	fdc42783          	lw	a5,-36(s0)
     9ec:	0007a783          	lw	a5,0(a5)
     9f0:	01679713          	sll	a4,a5,0x16
     9f4:	fdc42783          	lw	a5,-36(s0)
     9f8:	0047a783          	lw	a5,4(a5)
     9fc:	00c79793          	sll	a5,a5,0xc
     a00:	00f76733          	or	a4,a4,a5
     a04:	fdc42783          	lw	a5,-36(s0)
     a08:	00c7a783          	lw	a5,12(a5)
     a0c:	00279793          	sll	a5,a5,0x2
     a10:	00f767b3          	or	a5,a4,a5
     a14:	0027e713          	or	a4,a5,2
     a18:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     a1c:	00e7a023          	sw	a4,0(a5)
     a20:	fdc42783          	lw	a5,-36(s0)
     a24:	02800713          	li	a4,40
     a28:	00e7a623          	sw	a4,12(a5)
     a2c:	0080006f          	j	a34 <update_player_tank+0x3e0>
     a30:	fe042423          	sw	zero,-24(s0)
     a34:	fe842783          	lw	a5,-24(s0)
     a38:	2c079863          	bnez	a5,d08 <update_player_tank+0x6b4>
     a3c:	fd842783          	lw	a5,-40(s0)
     a40:	0007a703          	lw	a4,0(a5)
     a44:	00200793          	li	a5,2
     a48:	0af71463          	bne	a4,a5,af0 <update_player_tank+0x49c>
     a4c:	fdc42783          	lw	a5,-36(s0)
     a50:	0007a703          	lw	a4,0(a5)
     a54:	00100793          	li	a5,1
     a58:	2ae7d863          	bge	a5,a4,d08 <update_player_tank+0x6b4>
     a5c:	fdc42783          	lw	a5,-36(s0)
     a60:	0007a783          	lw	a5,0(a5)
     a64:	fff78713          	add	a4,a5,-1
     a68:	fdc42783          	lw	a5,-36(s0)
     a6c:	0047a783          	lw	a5,4(a5)
     a70:	00078593          	mv	a1,a5
     a74:	00070513          	mv	a0,a4
     a78:	a1dff0ef          	jal	494 <wall_collision>
     a7c:	00050793          	mv	a5,a0
     a80:	28079463          	bnez	a5,d08 <update_player_tank+0x6b4>
     a84:	f20ff0ef          	jal	1a4 <wait_for_vga>
     a88:	fdc42783          	lw	a5,-36(s0)
     a8c:	0007a783          	lw	a5,0(a5)
     a90:	01679713          	sll	a4,a5,0x16
     a94:	fdc42783          	lw	a5,-36(s0)
     a98:	0047a783          	lw	a5,4(a5)
     a9c:	00c79793          	sll	a5,a5,0xc
     aa0:	00f76733          	or	a4,a4,a5
     aa4:	fdc42783          	lw	a5,-36(s0)
     aa8:	0087a783          	lw	a5,8(a5)
     aac:	00279793          	sll	a5,a5,0x2
     ab0:	00f767b3          	or	a5,a4,a5
     ab4:	0027e713          	or	a4,a5,2
     ab8:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     abc:	00e7a023          	sw	a4,0(a5)
     ac0:	fdc42783          	lw	a5,-36(s0)
     ac4:	0007a783          	lw	a5,0(a5)
     ac8:	fff78713          	add	a4,a5,-1
     acc:	fdc42783          	lw	a5,-36(s0)
     ad0:	00e7a023          	sw	a4,0(a5)
     ad4:	fd442783          	lw	a5,-44(s0)
     ad8:	0047a703          	lw	a4,4(a5)
     adc:	fdc42783          	lw	a5,-36(s0)
     ae0:	00e7a423          	sw	a4,8(a5)
     ae4:	00100793          	li	a5,1
     ae8:	fef42623          	sw	a5,-20(s0)
     aec:	21c0006f          	j	d08 <update_player_tank+0x6b4>
     af0:	fd842783          	lw	a5,-40(s0)
     af4:	0007a703          	lw	a4,0(a5)
     af8:	00100793          	li	a5,1
     afc:	0af71463          	bne	a4,a5,ba4 <update_player_tank+0x550>
     b00:	fdc42783          	lw	a5,-36(s0)
     b04:	0007a703          	lw	a4,0(a5)
     b08:	23f00793          	li	a5,575
     b0c:	1ee7ce63          	blt	a5,a4,d08 <update_player_tank+0x6b4>
     b10:	fdc42783          	lw	a5,-36(s0)
     b14:	0007a783          	lw	a5,0(a5)
     b18:	00178713          	add	a4,a5,1
     b1c:	fdc42783          	lw	a5,-36(s0)
     b20:	0047a783          	lw	a5,4(a5)
     b24:	00078593          	mv	a1,a5
     b28:	00070513          	mv	a0,a4
     b2c:	969ff0ef          	jal	494 <wall_collision>
     b30:	00050793          	mv	a5,a0
     b34:	1c079a63          	bnez	a5,d08 <update_player_tank+0x6b4>
     b38:	e6cff0ef          	jal	1a4 <wait_for_vga>
     b3c:	fdc42783          	lw	a5,-36(s0)
     b40:	0007a783          	lw	a5,0(a5)
     b44:	01679713          	sll	a4,a5,0x16
     b48:	fdc42783          	lw	a5,-36(s0)
     b4c:	0047a783          	lw	a5,4(a5)
     b50:	00c79793          	sll	a5,a5,0xc
     b54:	00f76733          	or	a4,a4,a5
     b58:	fdc42783          	lw	a5,-36(s0)
     b5c:	0087a783          	lw	a5,8(a5)
     b60:	00279793          	sll	a5,a5,0x2
     b64:	00f767b3          	or	a5,a4,a5
     b68:	0027e713          	or	a4,a5,2
     b6c:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     b70:	00e7a023          	sw	a4,0(a5)
     b74:	fdc42783          	lw	a5,-36(s0)
     b78:	0007a783          	lw	a5,0(a5)
     b7c:	00178713          	add	a4,a5,1
     b80:	fdc42783          	lw	a5,-36(s0)
     b84:	00e7a023          	sw	a4,0(a5)
     b88:	fd442783          	lw	a5,-44(s0)
     b8c:	0087a703          	lw	a4,8(a5)
     b90:	fdc42783          	lw	a5,-36(s0)
     b94:	00e7a423          	sw	a4,8(a5)
     b98:	00100793          	li	a5,1
     b9c:	fef42623          	sw	a5,-20(s0)
     ba0:	1680006f          	j	d08 <update_player_tank+0x6b4>
     ba4:	fd842783          	lw	a5,-40(s0)
     ba8:	0047a703          	lw	a4,4(a5)
     bac:	00200793          	li	a5,2
     bb0:	0af71463          	bne	a4,a5,c58 <update_player_tank+0x604>
     bb4:	fdc42783          	lw	a5,-36(s0)
     bb8:	0047a703          	lw	a4,4(a5)
     bbc:	00100793          	li	a5,1
     bc0:	14e7d463          	bge	a5,a4,d08 <update_player_tank+0x6b4>
     bc4:	fdc42783          	lw	a5,-36(s0)
     bc8:	0007a703          	lw	a4,0(a5)
     bcc:	fdc42783          	lw	a5,-36(s0)
     bd0:	0047a783          	lw	a5,4(a5)
     bd4:	ffe78793          	add	a5,a5,-2
     bd8:	00078593          	mv	a1,a5
     bdc:	00070513          	mv	a0,a4
     be0:	8b5ff0ef          	jal	494 <wall_collision>
     be4:	00050793          	mv	a5,a0
     be8:	12079063          	bnez	a5,d08 <update_player_tank+0x6b4>
     bec:	db8ff0ef          	jal	1a4 <wait_for_vga>
     bf0:	fdc42783          	lw	a5,-36(s0)
     bf4:	0007a783          	lw	a5,0(a5)
     bf8:	01679713          	sll	a4,a5,0x16
     bfc:	fdc42783          	lw	a5,-36(s0)
     c00:	0047a783          	lw	a5,4(a5)
     c04:	00c79793          	sll	a5,a5,0xc
     c08:	00f76733          	or	a4,a4,a5
     c0c:	fdc42783          	lw	a5,-36(s0)
     c10:	0087a783          	lw	a5,8(a5)
     c14:	00279793          	sll	a5,a5,0x2
     c18:	00f767b3          	or	a5,a4,a5
     c1c:	0027e713          	or	a4,a5,2
     c20:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     c24:	00e7a023          	sw	a4,0(a5)
     c28:	fdc42783          	lw	a5,-36(s0)
     c2c:	0047a783          	lw	a5,4(a5)
     c30:	ffe78713          	add	a4,a5,-2
     c34:	fdc42783          	lw	a5,-36(s0)
     c38:	00e7a223          	sw	a4,4(a5)
     c3c:	fd442783          	lw	a5,-44(s0)
     c40:	0007a703          	lw	a4,0(a5)
     c44:	fdc42783          	lw	a5,-36(s0)
     c48:	00e7a423          	sw	a4,8(a5)
     c4c:	00100793          	li	a5,1
     c50:	fef42623          	sw	a5,-20(s0)
     c54:	0b40006f          	j	d08 <update_player_tank+0x6b4>
     c58:	fd842783          	lw	a5,-40(s0)
     c5c:	0047a703          	lw	a4,4(a5)
     c60:	00100793          	li	a5,1
     c64:	0af71263          	bne	a4,a5,d08 <update_player_tank+0x6b4>
     c68:	fdc42783          	lw	a5,-36(s0)
     c6c:	0047a703          	lw	a4,4(a5)
     c70:	34300793          	li	a5,835
     c74:	08e7ca63          	blt	a5,a4,d08 <update_player_tank+0x6b4>
     c78:	fdc42783          	lw	a5,-36(s0)
     c7c:	0007a703          	lw	a4,0(a5)
     c80:	fdc42783          	lw	a5,-36(s0)
     c84:	0047a783          	lw	a5,4(a5)
     c88:	00278793          	add	a5,a5,2
     c8c:	00078593          	mv	a1,a5
     c90:	00070513          	mv	a0,a4
     c94:	801ff0ef          	jal	494 <wall_collision>
     c98:	00050793          	mv	a5,a0
     c9c:	06079663          	bnez	a5,d08 <update_player_tank+0x6b4>
     ca0:	d04ff0ef          	jal	1a4 <wait_for_vga>
     ca4:	fdc42783          	lw	a5,-36(s0)
     ca8:	0007a783          	lw	a5,0(a5)
     cac:	01679713          	sll	a4,a5,0x16
     cb0:	fdc42783          	lw	a5,-36(s0)
     cb4:	0047a783          	lw	a5,4(a5)
     cb8:	00c79793          	sll	a5,a5,0xc
     cbc:	00f76733          	or	a4,a4,a5
     cc0:	fdc42783          	lw	a5,-36(s0)
     cc4:	0087a783          	lw	a5,8(a5)
     cc8:	00279793          	sll	a5,a5,0x2
     ccc:	00f767b3          	or	a5,a4,a5
     cd0:	0027e713          	or	a4,a5,2
     cd4:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     cd8:	00e7a023          	sw	a4,0(a5)
     cdc:	fdc42783          	lw	a5,-36(s0)
     ce0:	0047a783          	lw	a5,4(a5)
     ce4:	00278713          	add	a4,a5,2
     ce8:	fdc42783          	lw	a5,-36(s0)
     cec:	00e7a223          	sw	a4,4(a5)
     cf0:	fd442783          	lw	a5,-44(s0)
     cf4:	00c7a703          	lw	a4,12(a5)
     cf8:	fdc42783          	lw	a5,-36(s0)
     cfc:	00e7a423          	sw	a4,8(a5)
     d00:	00100793          	li	a5,1
     d04:	fef42623          	sw	a5,-20(s0)
     d08:	fec42703          	lw	a4,-20(s0)
     d0c:	fe842783          	lw	a5,-24(s0)
     d10:	00f767b3          	or	a5,a4,a5
     d14:	06078e63          	beqz	a5,d90 <update_player_tank+0x73c>
     d18:	c8cff0ef          	jal	1a4 <wait_for_vga>
     d1c:	fdc42783          	lw	a5,-36(s0)
     d20:	0007a783          	lw	a5,0(a5)
     d24:	01679713          	sll	a4,a5,0x16
     d28:	fdc42783          	lw	a5,-36(s0)
     d2c:	0047a783          	lw	a5,4(a5)
     d30:	00c79793          	sll	a5,a5,0xc
     d34:	00f76733          	or	a4,a4,a5
     d38:	fdc42783          	lw	a5,-36(s0)
     d3c:	0087a783          	lw	a5,8(a5)
     d40:	00279793          	sll	a5,a5,0x2
     d44:	00f767b3          	or	a5,a4,a5
     d48:	0017e713          	or	a4,a5,1
     d4c:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     d50:	00e7a023          	sw	a4,0(a5)
     d54:	c50ff0ef          	jal	1a4 <wait_for_vga>
     d58:	fdc42783          	lw	a5,-36(s0)
     d5c:	0007a783          	lw	a5,0(a5)
     d60:	01679713          	sll	a4,a5,0x16
     d64:	fdc42783          	lw	a5,-36(s0)
     d68:	0047a783          	lw	a5,4(a5)
     d6c:	00c79793          	sll	a5,a5,0xc
     d70:	00f76733          	or	a4,a4,a5
     d74:	fdc42783          	lw	a5,-36(s0)
     d78:	00c7a783          	lw	a5,12(a5)
     d7c:	00279793          	sll	a5,a5,0x2
     d80:	00f767b3          	or	a5,a4,a5
     d84:	0017e713          	or	a4,a5,1
     d88:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
     d8c:	00e7a023          	sw	a4,0(a5)
     d90:	00000013          	nop
     d94:	02c12083          	lw	ra,44(sp)
     d98:	02812403          	lw	s0,40(sp)
     d9c:	03010113          	add	sp,sp,48
     da0:	00008067          	ret

00000da4 <update_bullet>:
     da4:	fe010113          	add	sp,sp,-32
     da8:	00112e23          	sw	ra,28(sp)
     dac:	00812c23          	sw	s0,24(sp)
     db0:	02010413          	add	s0,sp,32
     db4:	fea42623          	sw	a0,-20(s0)
     db8:	feb42423          	sw	a1,-24(s0)
     dbc:	fec42223          	sw	a2,-28(s0)
     dc0:	fe842783          	lw	a5,-24(s0)
     dc4:	0007a703          	lw	a4,0(a5)
     dc8:	00100793          	li	a5,1
     dcc:	30f71063          	bne	a4,a5,10cc <update_bullet+0x328>
     dd0:	fe442783          	lw	a5,-28(s0)
     dd4:	0147a703          	lw	a4,20(a5)
     dd8:	00200793          	li	a5,2
     ddc:	5cf71a63          	bne	a4,a5,13b0 <update_bullet+0x60c>
     de0:	fec42783          	lw	a5,-20(s0)
     de4:	00c7a703          	lw	a4,12(a5)
     de8:	02200793          	li	a5,34
     dec:	02f71e63          	bne	a4,a5,e28 <update_bullet+0x84>
     df0:	fe842783          	lw	a5,-24(s0)
     df4:	00100713          	li	a4,1
     df8:	00e7a223          	sw	a4,4(a5)
     dfc:	fec42783          	lw	a5,-20(s0)
     e00:	0007a783          	lw	a5,0(a5)
     e04:	04078713          	add	a4,a5,64
     e08:	fe842783          	lw	a5,-24(s0)
     e0c:	00e7a423          	sw	a4,8(a5)
     e10:	fec42783          	lw	a5,-20(s0)
     e14:	0047a783          	lw	a5,4(a5)
     e18:	02078713          	add	a4,a5,32
     e1c:	fe842783          	lw	a5,-24(s0)
     e20:	00e7a623          	sw	a4,12(a5)
     e24:	1f80006f          	j	101c <update_bullet+0x278>
     e28:	fec42783          	lw	a5,-20(s0)
     e2c:	00c7a703          	lw	a4,12(a5)
     e30:	02300793          	li	a5,35
     e34:	02f71e63          	bne	a4,a5,e70 <update_bullet+0xcc>
     e38:	fe842783          	lw	a5,-24(s0)
     e3c:	00200713          	li	a4,2
     e40:	00e7a223          	sw	a4,4(a5)
     e44:	fec42783          	lw	a5,-20(s0)
     e48:	0007a783          	lw	a5,0(a5)
     e4c:	01078713          	add	a4,a5,16
     e50:	fe842783          	lw	a5,-24(s0)
     e54:	00e7a423          	sw	a4,8(a5)
     e58:	fec42783          	lw	a5,-20(s0)
     e5c:	0047a783          	lw	a5,4(a5)
     e60:	fd878713          	add	a4,a5,-40
     e64:	fe842783          	lw	a5,-24(s0)
     e68:	00e7a623          	sw	a4,12(a5)
     e6c:	1b00006f          	j	101c <update_bullet+0x278>
     e70:	fec42783          	lw	a5,-20(s0)
     e74:	00c7a703          	lw	a4,12(a5)
     e78:	02400793          	li	a5,36
     e7c:	02f71e63          	bne	a4,a5,eb8 <update_bullet+0x114>
     e80:	fe842783          	lw	a5,-24(s0)
     e84:	00300713          	li	a4,3
     e88:	00e7a223          	sw	a4,4(a5)
     e8c:	fec42783          	lw	a5,-20(s0)
     e90:	0007a783          	lw	a5,0(a5)
     e94:	04078713          	add	a4,a5,64
     e98:	fe842783          	lw	a5,-24(s0)
     e9c:	00e7a423          	sw	a4,8(a5)
     ea0:	fec42783          	lw	a5,-20(s0)
     ea4:	0047a783          	lw	a5,4(a5)
     ea8:	fdc78713          	add	a4,a5,-36
     eac:	fe842783          	lw	a5,-24(s0)
     eb0:	00e7a623          	sw	a4,12(a5)
     eb4:	1680006f          	j	101c <update_bullet+0x278>
     eb8:	fec42783          	lw	a5,-20(s0)
     ebc:	00c7a703          	lw	a4,12(a5)
     ec0:	02500793          	li	a5,37
     ec4:	02f71e63          	bne	a4,a5,f00 <update_bullet+0x15c>
     ec8:	fe842783          	lw	a5,-24(s0)
     ecc:	00400713          	li	a4,4
     ed0:	00e7a223          	sw	a4,4(a5)
     ed4:	fec42783          	lw	a5,-20(s0)
     ed8:	0007a783          	lw	a5,0(a5)
     edc:	fe078713          	add	a4,a5,-32
     ee0:	fe842783          	lw	a5,-24(s0)
     ee4:	00e7a423          	sw	a4,8(a5)
     ee8:	fec42783          	lw	a5,-20(s0)
     eec:	0047a783          	lw	a5,4(a5)
     ef0:	fde78713          	add	a4,a5,-34
     ef4:	fe842783          	lw	a5,-24(s0)
     ef8:	00e7a623          	sw	a4,12(a5)
     efc:	1200006f          	j	101c <update_bullet+0x278>
     f00:	fec42783          	lw	a5,-20(s0)
     f04:	00c7a703          	lw	a4,12(a5)
     f08:	02600793          	li	a5,38
     f0c:	02f71e63          	bne	a4,a5,f48 <update_bullet+0x1a4>
     f10:	fe842783          	lw	a5,-24(s0)
     f14:	00500713          	li	a4,5
     f18:	00e7a223          	sw	a4,4(a5)
     f1c:	fec42783          	lw	a5,-20(s0)
     f20:	0007a783          	lw	a5,0(a5)
     f24:	01078713          	add	a4,a5,16
     f28:	fe842783          	lw	a5,-24(s0)
     f2c:	00e7a423          	sw	a4,8(a5)
     f30:	fec42783          	lw	a5,-20(s0)
     f34:	0047a783          	lw	a5,4(a5)
     f38:	06a78713          	add	a4,a5,106
     f3c:	fe842783          	lw	a5,-24(s0)
     f40:	00e7a623          	sw	a4,12(a5)
     f44:	0d80006f          	j	101c <update_bullet+0x278>
     f48:	fec42783          	lw	a5,-20(s0)
     f4c:	00c7a703          	lw	a4,12(a5)
     f50:	02700793          	li	a5,39
     f54:	02f71e63          	bne	a4,a5,f90 <update_bullet+0x1ec>
     f58:	fe842783          	lw	a5,-24(s0)
     f5c:	00600713          	li	a4,6
     f60:	00e7a223          	sw	a4,4(a5)
     f64:	fec42783          	lw	a5,-20(s0)
     f68:	0007a783          	lw	a5,0(a5)
     f6c:	04078713          	add	a4,a5,64
     f70:	fe842783          	lw	a5,-24(s0)
     f74:	00e7a423          	sw	a4,8(a5)
     f78:	fec42783          	lw	a5,-20(s0)
     f7c:	0047a783          	lw	a5,4(a5)
     f80:	06a78713          	add	a4,a5,106
     f84:	fe842783          	lw	a5,-24(s0)
     f88:	00e7a623          	sw	a4,12(a5)
     f8c:	0900006f          	j	101c <update_bullet+0x278>
     f90:	fec42783          	lw	a5,-20(s0)
     f94:	00c7a703          	lw	a4,12(a5)
     f98:	02800793          	li	a5,40
     f9c:	02f71e63          	bne	a4,a5,fd8 <update_bullet+0x234>
     fa0:	fe842783          	lw	a5,-24(s0)
     fa4:	00700713          	li	a4,7
     fa8:	00e7a223          	sw	a4,4(a5)
     fac:	fec42783          	lw	a5,-20(s0)
     fb0:	0007a783          	lw	a5,0(a5)
     fb4:	fe078713          	add	a4,a5,-32
     fb8:	fe842783          	lw	a5,-24(s0)
     fbc:	00e7a423          	sw	a4,8(a5)
     fc0:	fec42783          	lw	a5,-20(s0)
     fc4:	0047a783          	lw	a5,4(a5)
     fc8:	06a78713          	add	a4,a5,106
     fcc:	fe842783          	lw	a5,-24(s0)
     fd0:	00e7a623          	sw	a4,12(a5)
     fd4:	0480006f          	j	101c <update_bullet+0x278>
     fd8:	fec42783          	lw	a5,-20(s0)
     fdc:	00c7a703          	lw	a4,12(a5)
     fe0:	02900793          	li	a5,41
     fe4:	02f71c63          	bne	a4,a5,101c <update_bullet+0x278>
     fe8:	fe842783          	lw	a5,-24(s0)
     fec:	00800713          	li	a4,8
     ff0:	00e7a223          	sw	a4,4(a5)
     ff4:	fec42783          	lw	a5,-20(s0)
     ff8:	0007a783          	lw	a5,0(a5)
     ffc:	fe078713          	add	a4,a5,-32
    1000:	fe842783          	lw	a5,-24(s0)
    1004:	00e7a423          	sw	a4,8(a5)
    1008:	fec42783          	lw	a5,-20(s0)
    100c:	0047a783          	lw	a5,4(a5)
    1010:	02078713          	add	a4,a5,32
    1014:	fe842783          	lw	a5,-24(s0)
    1018:	00e7a623          	sw	a4,12(a5)
    101c:	fe842783          	lw	a5,-24(s0)
    1020:	0087a703          	lw	a4,8(a5)
    1024:	fe842783          	lw	a5,-24(s0)
    1028:	00c7a783          	lw	a5,12(a5)
    102c:	00078593          	mv	a1,a5
    1030:	00070513          	mv	a0,a4
    1034:	d40ff0ef          	jal	574 <bullet_collision>
    1038:	00050793          	mv	a5,a0
    103c:	36079463          	bnez	a5,13a4 <update_bullet+0x600>
    1040:	fe842783          	lw	a5,-24(s0)
    1044:	0087a703          	lw	a4,8(a5)
    1048:	26700793          	li	a5,615
    104c:	36e7c063          	blt	a5,a4,13ac <update_bullet+0x608>
    1050:	fe842783          	lw	a5,-24(s0)
    1054:	0087a703          	lw	a4,8(a5)
    1058:	00100793          	li	a5,1
    105c:	34e7d863          	bge	a5,a4,13ac <update_bullet+0x608>
    1060:	fe842783          	lw	a5,-24(s0)
    1064:	00c7a703          	lw	a4,12(a5)
    1068:	37300793          	li	a5,883
    106c:	34e7c063          	blt	a5,a4,13ac <update_bullet+0x608>
    1070:	fe842783          	lw	a5,-24(s0)
    1074:	00c7a703          	lw	a4,12(a5)
    1078:	00100793          	li	a5,1
    107c:	32e7d863          	bge	a5,a4,13ac <update_bullet+0x608>
    1080:	fe842783          	lw	a5,-24(s0)
    1084:	00200713          	li	a4,2
    1088:	00e7a023          	sw	a4,0(a5)
    108c:	918ff0ef          	jal	1a4 <wait_for_vga>
    1090:	fe842783          	lw	a5,-24(s0)
    1094:	0087a783          	lw	a5,8(a5)
    1098:	01679713          	sll	a4,a5,0x16
    109c:	fe842783          	lw	a5,-24(s0)
    10a0:	00c7a783          	lw	a5,12(a5)
    10a4:	00c79793          	sll	a5,a5,0xc
    10a8:	00f76733          	or	a4,a4,a5
    10ac:	fe842783          	lw	a5,-24(s0)
    10b0:	0047a783          	lw	a5,4(a5)
    10b4:	00279793          	sll	a5,a5,0x2
    10b8:	00f767b3          	or	a5,a4,a5
    10bc:	0017e713          	or	a4,a5,1
    10c0:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
    10c4:	00e7a023          	sw	a4,0(a5)
    10c8:	2e80006f          	j	13b0 <update_bullet+0x60c>
    10cc:	fe842783          	lw	a5,-24(s0)
    10d0:	0007a703          	lw	a4,0(a5)
    10d4:	00200793          	li	a5,2
    10d8:	2cf71c63          	bne	a4,a5,13b0 <update_bullet+0x60c>
    10dc:	fe842783          	lw	a5,-24(s0)
    10e0:	0087a703          	lw	a4,8(a5)
    10e4:	26700793          	li	a5,615
    10e8:	02e7ca63          	blt	a5,a4,111c <update_bullet+0x378>
    10ec:	fe842783          	lw	a5,-24(s0)
    10f0:	0087a703          	lw	a4,8(a5)
    10f4:	00100793          	li	a5,1
    10f8:	02e7d263          	bge	a5,a4,111c <update_bullet+0x378>
    10fc:	fe842783          	lw	a5,-24(s0)
    1100:	00c7a703          	lw	a4,12(a5)
    1104:	37300793          	li	a5,883
    1108:	00e7ca63          	blt	a5,a4,111c <update_bullet+0x378>
    110c:	fe842783          	lw	a5,-24(s0)
    1110:	00c7a703          	lw	a4,12(a5)
    1114:	00100793          	li	a5,1
    1118:	04e7c863          	blt	a5,a4,1168 <update_bullet+0x3c4>
    111c:	fe842783          	lw	a5,-24(s0)
    1120:	00100713          	li	a4,1
    1124:	00e7a023          	sw	a4,0(a5)
    1128:	87cff0ef          	jal	1a4 <wait_for_vga>
    112c:	fe842783          	lw	a5,-24(s0)
    1130:	0087a783          	lw	a5,8(a5)
    1134:	01679713          	sll	a4,a5,0x16
    1138:	fe842783          	lw	a5,-24(s0)
    113c:	00c7a783          	lw	a5,12(a5)
    1140:	00c79793          	sll	a5,a5,0xc
    1144:	00f76733          	or	a4,a4,a5
    1148:	fe842783          	lw	a5,-24(s0)
    114c:	0047a783          	lw	a5,4(a5)
    1150:	00279793          	sll	a5,a5,0x2
    1154:	00f767b3          	or	a5,a4,a5
    1158:	0027e713          	or	a4,a5,2
    115c:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
    1160:	00e7a023          	sw	a4,0(a5)
    1164:	24c0006f          	j	13b0 <update_bullet+0x60c>
    1168:	fe842783          	lw	a5,-24(s0)
    116c:	0087a703          	lw	a4,8(a5)
    1170:	fe842783          	lw	a5,-24(s0)
    1174:	00c7a783          	lw	a5,12(a5)
    1178:	00078593          	mv	a1,a5
    117c:	00070513          	mv	a0,a4
    1180:	bf4ff0ef          	jal	574 <bullet_collision>
    1184:	00050793          	mv	a5,a0
    1188:	04078863          	beqz	a5,11d8 <update_bullet+0x434>
    118c:	fe842783          	lw	a5,-24(s0)
    1190:	00100713          	li	a4,1
    1194:	00e7a023          	sw	a4,0(a5)
    1198:	80cff0ef          	jal	1a4 <wait_for_vga>
    119c:	fe842783          	lw	a5,-24(s0)
    11a0:	0087a783          	lw	a5,8(a5)
    11a4:	01679713          	sll	a4,a5,0x16
    11a8:	fe842783          	lw	a5,-24(s0)
    11ac:	00c7a783          	lw	a5,12(a5)
    11b0:	00c79793          	sll	a5,a5,0xc
    11b4:	00f76733          	or	a4,a4,a5
    11b8:	fe842783          	lw	a5,-24(s0)
    11bc:	0047a783          	lw	a5,4(a5)
    11c0:	00279793          	sll	a5,a5,0x2
    11c4:	00f767b3          	or	a5,a4,a5
    11c8:	0027e713          	or	a4,a5,2
    11cc:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
    11d0:	00e7a023          	sw	a4,0(a5)
    11d4:	1dc0006f          	j	13b0 <update_bullet+0x60c>
    11d8:	fe842783          	lw	a5,-24(s0)
    11dc:	0047a703          	lw	a4,4(a5)
    11e0:	00100793          	li	a5,1
    11e4:	00f71e63          	bne	a4,a5,1200 <update_bullet+0x45c>
    11e8:	fe842783          	lw	a5,-24(s0)
    11ec:	0087a783          	lw	a5,8(a5)
    11f0:	00178713          	add	a4,a5,1
    11f4:	fe842783          	lw	a5,-24(s0)
    11f8:	00e7a423          	sw	a4,8(a5)
    11fc:	1680006f          	j	1364 <update_bullet+0x5c0>
    1200:	fe842783          	lw	a5,-24(s0)
    1204:	0047a703          	lw	a4,4(a5)
    1208:	00200793          	li	a5,2
    120c:	00f71e63          	bne	a4,a5,1228 <update_bullet+0x484>
    1210:	fe842783          	lw	a5,-24(s0)
    1214:	00c7a783          	lw	a5,12(a5)
    1218:	ffe78713          	add	a4,a5,-2
    121c:	fe842783          	lw	a5,-24(s0)
    1220:	00e7a623          	sw	a4,12(a5)
    1224:	1400006f          	j	1364 <update_bullet+0x5c0>
    1228:	fe842783          	lw	a5,-24(s0)
    122c:	0047a703          	lw	a4,4(a5)
    1230:	00300793          	li	a5,3
    1234:	02f71863          	bne	a4,a5,1264 <update_bullet+0x4c0>
    1238:	fe842783          	lw	a5,-24(s0)
    123c:	00c7a783          	lw	a5,12(a5)
    1240:	ffe78713          	add	a4,a5,-2
    1244:	fe842783          	lw	a5,-24(s0)
    1248:	00e7a623          	sw	a4,12(a5)
    124c:	fe842783          	lw	a5,-24(s0)
    1250:	0087a783          	lw	a5,8(a5)
    1254:	00178713          	add	a4,a5,1
    1258:	fe842783          	lw	a5,-24(s0)
    125c:	00e7a423          	sw	a4,8(a5)
    1260:	1040006f          	j	1364 <update_bullet+0x5c0>
    1264:	fe842783          	lw	a5,-24(s0)
    1268:	0047a703          	lw	a4,4(a5)
    126c:	00400793          	li	a5,4
    1270:	02f71863          	bne	a4,a5,12a0 <update_bullet+0x4fc>
    1274:	fe842783          	lw	a5,-24(s0)
    1278:	0087a783          	lw	a5,8(a5)
    127c:	fff78713          	add	a4,a5,-1
    1280:	fe842783          	lw	a5,-24(s0)
    1284:	00e7a423          	sw	a4,8(a5)
    1288:	fe842783          	lw	a5,-24(s0)
    128c:	00c7a783          	lw	a5,12(a5)
    1290:	ffe78713          	add	a4,a5,-2
    1294:	fe842783          	lw	a5,-24(s0)
    1298:	00e7a623          	sw	a4,12(a5)
    129c:	0c80006f          	j	1364 <update_bullet+0x5c0>
    12a0:	fe842783          	lw	a5,-24(s0)
    12a4:	0047a703          	lw	a4,4(a5)
    12a8:	00500793          	li	a5,5
    12ac:	00f71e63          	bne	a4,a5,12c8 <update_bullet+0x524>
    12b0:	fe842783          	lw	a5,-24(s0)
    12b4:	00c7a783          	lw	a5,12(a5)
    12b8:	00278713          	add	a4,a5,2
    12bc:	fe842783          	lw	a5,-24(s0)
    12c0:	00e7a623          	sw	a4,12(a5)
    12c4:	0a00006f          	j	1364 <update_bullet+0x5c0>
    12c8:	fe842783          	lw	a5,-24(s0)
    12cc:	0047a703          	lw	a4,4(a5)
    12d0:	00600793          	li	a5,6
    12d4:	02f71863          	bne	a4,a5,1304 <update_bullet+0x560>
    12d8:	fe842783          	lw	a5,-24(s0)
    12dc:	0087a783          	lw	a5,8(a5)
    12e0:	00178713          	add	a4,a5,1
    12e4:	fe842783          	lw	a5,-24(s0)
    12e8:	00e7a423          	sw	a4,8(a5)
    12ec:	fe842783          	lw	a5,-24(s0)
    12f0:	00c7a783          	lw	a5,12(a5)
    12f4:	00278713          	add	a4,a5,2
    12f8:	fe842783          	lw	a5,-24(s0)
    12fc:	00e7a623          	sw	a4,12(a5)
    1300:	0640006f          	j	1364 <update_bullet+0x5c0>
    1304:	fe842783          	lw	a5,-24(s0)
    1308:	0047a703          	lw	a4,4(a5)
    130c:	00700793          	li	a5,7
    1310:	02f71863          	bne	a4,a5,1340 <update_bullet+0x59c>
    1314:	fe842783          	lw	a5,-24(s0)
    1318:	0087a783          	lw	a5,8(a5)
    131c:	fff78713          	add	a4,a5,-1
    1320:	fe842783          	lw	a5,-24(s0)
    1324:	00e7a423          	sw	a4,8(a5)
    1328:	fe842783          	lw	a5,-24(s0)
    132c:	00c7a783          	lw	a5,12(a5)
    1330:	00278713          	add	a4,a5,2
    1334:	fe842783          	lw	a5,-24(s0)
    1338:	00e7a623          	sw	a4,12(a5)
    133c:	0280006f          	j	1364 <update_bullet+0x5c0>
    1340:	fe842783          	lw	a5,-24(s0)
    1344:	0047a703          	lw	a4,4(a5)
    1348:	00800793          	li	a5,8
    134c:	00f71c63          	bne	a4,a5,1364 <update_bullet+0x5c0>
    1350:	fe842783          	lw	a5,-24(s0)
    1354:	0087a783          	lw	a5,8(a5)
    1358:	fff78713          	add	a4,a5,-1
    135c:	fe842783          	lw	a5,-24(s0)
    1360:	00e7a423          	sw	a4,8(a5)
    1364:	e41fe0ef          	jal	1a4 <wait_for_vga>
    1368:	fe842783          	lw	a5,-24(s0)
    136c:	0087a783          	lw	a5,8(a5)
    1370:	01679713          	sll	a4,a5,0x16
    1374:	fe842783          	lw	a5,-24(s0)
    1378:	00c7a783          	lw	a5,12(a5)
    137c:	00c79793          	sll	a5,a5,0xc
    1380:	00f76733          	or	a4,a4,a5
    1384:	fe842783          	lw	a5,-24(s0)
    1388:	0047a783          	lw	a5,4(a5)
    138c:	00279793          	sll	a5,a5,0x2
    1390:	00f767b3          	or	a5,a4,a5
    1394:	0017e713          	or	a4,a5,1
    1398:	8d01a783          	lw	a5,-1840(gp) # 1588 <VGA>
    139c:	00e7a023          	sw	a4,0(a5)
    13a0:	0100006f          	j	13b0 <update_bullet+0x60c>
    13a4:	00000013          	nop
    13a8:	0080006f          	j	13b0 <update_bullet+0x60c>
    13ac:	00000013          	nop
    13b0:	01c12083          	lw	ra,28(sp)
    13b4:	01812403          	lw	s0,24(sp)
    13b8:	02010113          	add	sp,sp,32
    13bc:	00008067          	ret

000013c0 <main>:
    13c0:	fe010113          	add	sp,sp,-32
    13c4:	00112e23          	sw	ra,28(sp)
    13c8:	00812c23          	sw	s0,24(sp)
    13cc:	02010413          	add	s0,sp,32
    13d0:	e05fe0ef          	jal	1d4 <init>
    13d4:	8d818513          	add	a0,gp,-1832 # 1590 <joy1>
    13d8:	c49fe0ef          	jal	20 <read_joystick>
    13dc:	8f418513          	add	a0,gp,-1804 # 15ac <joy2>
    13e0:	cf9fe0ef          	jal	d8 <read_joystick_2>
    13e4:	000017b7          	lui	a5,0x1
    13e8:	4b878613          	add	a2,a5,1208 # 14b8 <player_direct>
    13ec:	8d818593          	add	a1,gp,-1832 # 1590 <joy1>
    13f0:	88818513          	add	a0,gp,-1912 # 1540 <player>
    13f4:	a60ff0ef          	jal	654 <update_player_tank>
    13f8:	000017b7          	lui	a5,0x1
    13fc:	4c878613          	add	a2,a5,1224 # 14c8 <enemy_direct>
    1400:	8f418593          	add	a1,gp,-1804 # 15ac <joy2>
    1404:	89818513          	add	a0,gp,-1896 # 1550 <enemy>
    1408:	a4cff0ef          	jal	654 <update_player_tank>
    140c:	8d818613          	add	a2,gp,-1832 # 1590 <joy1>
    1410:	8a818593          	add	a1,gp,-1880 # 1560 <player_bullet>
    1414:	88818513          	add	a0,gp,-1912 # 1540 <player>
    1418:	98dff0ef          	jal	da4 <update_bullet>
    141c:	8f418613          	add	a2,gp,-1804 # 15ac <joy2>
    1420:	8b818593          	add	a1,gp,-1864 # 1570 <enemy_bullet>
    1424:	89818513          	add	a0,gp,-1896 # 1550 <enemy>
    1428:	97dff0ef          	jal	da4 <update_bullet>
    142c:	8f418793          	add	a5,gp,-1804 # 15ac <joy2>
    1430:	0047a703          	lw	a4,4(a5)
    1434:	8c81a783          	lw	a5,-1848(gp) # 1580 <debug>
    1438:	00e7a023          	sw	a4,0(a5)
    143c:	fe042623          	sw	zero,-20(s0)
    1440:	0100006f          	j	1450 <main+0x90>
    1444:	fec42783          	lw	a5,-20(s0)
    1448:	00178793          	add	a5,a5,1
    144c:	fef42623          	sw	a5,-20(s0)
    1450:	fec42703          	lw	a4,-20(s0)
    1454:	000027b7          	lui	a5,0x2
    1458:	70f78793          	add	a5,a5,1807 # 270f <__stack_top+0x70f>
    145c:	fee7d4e3          	bge	a5,a4,1444 <main+0x84>
    1460:	f75ff06f          	j	13d4 <main+0x14>

Disassembly of section .eh_frame:

00001464 <.eh_frame>:
    1464:	0014                	.insn	2, 0x0014
    1466:	0000                	.insn	2, 0x
    1468:	0000                	.insn	2, 0x
    146a:	0000                	.insn	2, 0x
    146c:	00527a03          	.insn	4, 0x00527a03
    1470:	7c01                	.insn	2, 0x7c01
    1472:	0101                	.insn	2, 0x0101
    1474:	07020d1b          	.insn	4, 0x07020d1b
    1478:	0001                	.insn	2, 0x0001
    147a:	0000                	.insn	2, 0x
    147c:	0010                	.insn	2, 0x0010
    147e:	0000                	.insn	2, 0x
    1480:	001c                	.insn	2, 0x001c
    1482:	0000                	.insn	2, 0x
    1484:	eb7c                	.insn	2, 0xeb7c
    1486:	ffff                	.insn	2, 0xffff
    1488:	0018                	.insn	2, 0x0018
    148a:	0000                	.insn	2, 0x
    148c:	0000                	.insn	2, 0x
    148e:	0000                	.insn	2, 0x
    1490:	0010                	.insn	2, 0x0010
    1492:	0000                	.insn	2, 0x
    1494:	0000                	.insn	2, 0x
    1496:	0000                	.insn	2, 0x
    1498:	00527a03          	.insn	4, 0x00527a03
    149c:	7c01                	.insn	2, 0x7c01
    149e:	0101                	.insn	2, 0x0101
    14a0:	00020d1b          	.insn	4, 0x00020d1b
    14a4:	0010                	.insn	2, 0x0010
    14a6:	0000                	.insn	2, 0x
    14a8:	0018                	.insn	2, 0x0018
    14aa:	0000                	.insn	2, 0x
    14ac:	eb6c                	.insn	2, 0xeb6c
    14ae:	ffff                	.insn	2, 0xffff
    14b0:	0008                	.insn	2, 0x0008
    14b2:	0000                	.insn	2, 0x
    14b4:	0000                	.insn	2, 0x
	...

Disassembly of section .data:

000014b8 <player_direct>:
    14b8:	001f 0000 0021      	.insn	6, 0x00210000001f
    14be:	0000                	.insn	2, 0x
    14c0:	001e                	.insn	2, 0x001e
    14c2:	0000                	.insn	2, 0x
    14c4:	0020                	.insn	2, 0x0020
	...

000014c8 <enemy_direct>:
    14c8:	00000013          	nop
    14cc:	0015                	.insn	2, 0x0015
    14ce:	0000                	.insn	2, 0x
    14d0:	0012                	.insn	2, 0x0012
    14d2:	0000                	.insn	2, 0x
    14d4:	0014                	.insn	2, 0x0014
	...

000014d8 <blocks>:
    14d8:	0046                	.insn	2, 0x0046
    14da:	0000                	.insn	2, 0x
    14dc:	0344                	.insn	2, 0x0344
    14de:	0000                	.insn	2, 0x
    14e0:	0046                	.insn	2, 0x0046
    14e2:	0000                	.insn	2, 0x
    14e4:	02c4                	.insn	2, 0x02c4
    14e6:	0000                	.insn	2, 0x
    14e8:	0046                	.insn	2, 0x0046
    14ea:	0000                	.insn	2, 0x
    14ec:	0244                	.insn	2, 0x0244
    14ee:	0000                	.insn	2, 0x
    14f0:	0005                	.insn	2, 0x0005
    14f2:	0000                	.insn	2, 0x
    14f4:	0005                	.insn	2, 0x0005
    14f6:	0000                	.insn	2, 0x
    14f8:	0000004b          	.insn	4, 0x004b
    14fc:	0000004b          	.insn	4, 0x004b
    1500:	0091                	.insn	2, 0x0091
    1502:	0000                	.insn	2, 0x
    1504:	0091                	.insn	2, 0x0091
    1506:	0000                	.insn	2, 0x
    1508:	012c                	.insn	2, 0x012c
    150a:	0000                	.insn	2, 0x
    150c:	012c                	.insn	2, 0x012c
    150e:	0000                	.insn	2, 0x
    1510:	012c                	.insn	2, 0x012c
    1512:	0000                	.insn	2, 0x
    1514:	01ac                	.insn	2, 0x01ac
    1516:	0000                	.insn	2, 0x
    1518:	016c                	.insn	2, 0x016c
    151a:	0000                	.insn	2, 0x
    151c:	012c                	.insn	2, 0x012c
    151e:	0000                	.insn	2, 0x
    1520:	01f4                	.insn	2, 0x01f4
    1522:	0000                	.insn	2, 0x
    1524:	0344                	.insn	2, 0x0344
    1526:	0000                	.insn	2, 0x
    1528:	01f4                	.insn	2, 0x01f4
    152a:	0000                	.insn	2, 0x
    152c:	02c4                	.insn	2, 0x02c4
    152e:	0000                	.insn	2, 0x
    1530:	01b4                	.insn	2, 0x01b4
    1532:	0000                	.insn	2, 0x
    1534:	02c4                	.insn	2, 0x02c4
    1536:	0000                	.insn	2, 0x
    1538:	01f4                	.insn	2, 0x01f4
    153a:	0000                	.insn	2, 0x
    153c:	0005                	.insn	2, 0x0005
	...

00001540 <player>:
    1540:	0005                	.insn	2, 0x0005
    1542:	0000                	.insn	2, 0x
    1544:	0334                	.insn	2, 0x0334
    1546:	0000                	.insn	2, 0x
    1548:	001f 0000 0023      	.insn	6, 0x00230000001f
	...

00001550 <enemy>:
    1550:	00000013          	nop
    1554:	0026                	.insn	2, 0x0026
    1556:	0000                	.insn	2, 0x
    1558:	023e                	.insn	2, 0x023e
    155a:	0000                	.insn	2, 0x
    155c:	0005                	.insn	2, 0x0005
	...

00001560 <player_bullet>:
    1560:	0001                	.insn	2, 0x0001
    1562:	0000                	.insn	2, 0x
    1564:	0002                	.insn	2, 0x0002
    1566:	0000                	.insn	2, 0x
    1568:	0001                	.insn	2, 0x0001
    156a:	0000                	.insn	2, 0x
    156c:	0001                	.insn	2, 0x0001
	...

00001570 <enemy_bullet>:
    1570:	0001                	.insn	2, 0x0001
    1572:	0000                	.insn	2, 0x
    1574:	0002                	.insn	2, 0x0002
    1576:	0000                	.insn	2, 0x
    1578:	0001                	.insn	2, 0x0001
    157a:	0000                	.insn	2, 0x
    157c:	0001                	.insn	2, 0x0001
	...

Disassembly of section .sdata:

00001580 <debug>:
    1580:	c001                	.insn	2, 0xc001
    1582:	ffff                	.insn	2, 0xffff

00001584 <joystick>:
    1584:	c002                	.insn	2, 0xc002
    1586:	ffff                	.insn	2, 0xffff

00001588 <VGA>:
    1588:	ffffc003          	lbu	zero,-1(t6)

0000158c <joystick2>:
    158c:	c004                	.insn	2, 0xc004
    158e:	ffff                	.insn	2, 0xffff

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
