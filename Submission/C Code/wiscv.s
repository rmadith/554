
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00002197          	auipc	gp,0x2
       4:	0d418193          	add	gp,gp,212 # 20d4 <__global_pointer$>
       8:	f2c18113          	add	sp,gp,-212 # 2000 <__stack_top>
       c:	00010433          	add	s0,sp,zero
      10:	730010ef          	jal	1740 <main>
      14:	004000ef          	jal	18 <_exit>

00000018 <_exit>:
      18:	05d00893          	li	a7,93
      1c:	00000073          	ecall

00000020 <read_joystick>:
      20:	fe010113          	add	sp,sp,-32
      24:	00812e23          	sw	s0,28(sp)
      28:	02010413          	add	s0,sp,32
      2c:	fea42623          	sw	a0,-20(s0)
      30:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
      34:	0007a783          	lw	a5,0(a5)
      38:	00a7d793          	srl	a5,a5,0xa
      3c:	0037f713          	and	a4,a5,3
      40:	fec42783          	lw	a5,-20(s0)
      44:	00e7a023          	sw	a4,0(a5)
      48:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
      4c:	0007a783          	lw	a5,0(a5)
      50:	0087d793          	srl	a5,a5,0x8
      54:	0037f713          	and	a4,a5,3
      58:	fec42783          	lw	a5,-20(s0)
      5c:	00e7a223          	sw	a4,4(a5)
      60:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
      64:	0007a783          	lw	a5,0(a5)
      68:	0067d793          	srl	a5,a5,0x6
      6c:	0037f713          	and	a4,a5,3
      70:	fec42783          	lw	a5,-20(s0)
      74:	00e7a423          	sw	a4,8(a5)
      78:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
      7c:	0007a783          	lw	a5,0(a5)
      80:	0047d793          	srl	a5,a5,0x4
      84:	0037f713          	and	a4,a5,3
      88:	fec42783          	lw	a5,-20(s0)
      8c:	00e7a623          	sw	a4,12(a5)
      90:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
      94:	0007a783          	lw	a5,0(a5)
      98:	0027d793          	srl	a5,a5,0x2
      9c:	0037f713          	and	a4,a5,3
      a0:	fec42783          	lw	a5,-20(s0)
      a4:	00e7a823          	sw	a4,16(a5)
      a8:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
      ac:	0007a783          	lw	a5,0(a5)
      b0:	0037f713          	and	a4,a5,3
      b4:	fec42783          	lw	a5,-20(s0)
      b8:	00e7aa23          	sw	a4,20(a5)
      bc:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
      c0:	03f00713          	li	a4,63
      c4:	00e7a023          	sw	a4,0(a5)
      c8:	00000013          	nop
      cc:	01c12403          	lw	s0,28(sp)
      d0:	02010113          	add	sp,sp,32
      d4:	00008067          	ret

000000d8 <read_joystick_2>:
      d8:	fe010113          	add	sp,sp,-32
      dc:	00812e23          	sw	s0,28(sp)
      e0:	02010413          	add	s0,sp,32
      e4:	fea42623          	sw	a0,-20(s0)
      e8:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
      ec:	0007a703          	lw	a4,0(a5)
      f0:	004007b7          	lui	a5,0x400
      f4:	00f777b3          	and	a5,a4,a5
      f8:	08078a63          	beqz	a5,18c <read_joystick_2+0xb4>
      fc:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
     100:	0007a783          	lw	a5,0(a5) # 400000 <__global_pointer$+0x3fdf2c>
     104:	0147d793          	srl	a5,a5,0x14
     108:	0037f713          	and	a4,a5,3
     10c:	fec42783          	lw	a5,-20(s0)
     110:	00e7a023          	sw	a4,0(a5)
     114:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
     118:	0007a783          	lw	a5,0(a5)
     11c:	0127d793          	srl	a5,a5,0x12
     120:	0037f713          	and	a4,a5,3
     124:	fec42783          	lw	a5,-20(s0)
     128:	00e7a223          	sw	a4,4(a5)
     12c:	fec42783          	lw	a5,-20(s0)
     130:	0007a423          	sw	zero,8(a5)
     134:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
     138:	0007a783          	lw	a5,0(a5)
     13c:	0107d793          	srl	a5,a5,0x10
     140:	0037f713          	and	a4,a5,3
     144:	fec42783          	lw	a5,-20(s0)
     148:	00e7a623          	sw	a4,12(a5)
     14c:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
     150:	0007a783          	lw	a5,0(a5)
     154:	00e7d793          	srl	a5,a5,0xe
     158:	0037f713          	and	a4,a5,3
     15c:	fec42783          	lw	a5,-20(s0)
     160:	00e7a823          	sw	a4,16(a5)
     164:	8cc1a783          	lw	a5,-1844(gp) # 19a0 <joystick>
     168:	0007a783          	lw	a5,0(a5)
     16c:	00c7d793          	srl	a5,a5,0xc
     170:	0037f713          	and	a4,a5,3
     174:	fec42783          	lw	a5,-20(s0)
     178:	00e7aa23          	sw	a4,20(a5)
     17c:	8d41a783          	lw	a5,-1836(gp) # 19a8 <joystick2>
     180:	00100713          	li	a4,1
     184:	00e7a023          	sw	a4,0(a5)
     188:	00000013          	nop
     18c:	00000013          	nop
     190:	01c12403          	lw	s0,28(sp)
     194:	02010113          	add	sp,sp,32
     198:	00008067          	ret

0000019c <wait_for_vga>:
     19c:	ff010113          	add	sp,sp,-16
     1a0:	00812623          	sw	s0,12(sp)
     1a4:	01010413          	add	s0,sp,16
     1a8:	00000013          	nop
     1ac:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     1b0:	0007a783          	lw	a5,0(a5)
     1b4:	fe07cce3          	bltz	a5,1ac <wait_for_vga+0x10>
     1b8:	00000013          	nop
     1bc:	00000013          	nop
     1c0:	00c12403          	lw	s0,12(sp)
     1c4:	01010113          	add	sp,sp,16
     1c8:	00008067          	ret

000001cc <init>:
     1cc:	fe010113          	add	sp,sp,-32
     1d0:	00112e23          	sw	ra,28(sp)
     1d4:	00812c23          	sw	s0,24(sp)
     1d8:	02010413          	add	s0,sp,32
     1dc:	88818793          	add	a5,gp,-1912 # 195c <player>
     1e0:	00500713          	li	a4,5
     1e4:	00e7a023          	sw	a4,0(a5)
     1e8:	88818793          	add	a5,gp,-1912 # 195c <player>
     1ec:	33400713          	li	a4,820
     1f0:	00e7a223          	sw	a4,4(a5)
     1f4:	88818793          	add	a5,gp,-1912 # 195c <player>
     1f8:	01f00713          	li	a4,31
     1fc:	00e7a423          	sw	a4,8(a5)
     200:	88818793          	add	a5,gp,-1912 # 195c <player>
     204:	02300713          	li	a4,35
     208:	00e7a623          	sw	a4,12(a5)
     20c:	8a818793          	add	a5,gp,-1880 # 197c <player_bullet>
     210:	00100713          	li	a4,1
     214:	00e7a023          	sw	a4,0(a5)
     218:	8a818793          	add	a5,gp,-1880 # 197c <player_bullet>
     21c:	00200713          	li	a4,2
     220:	00e7a223          	sw	a4,4(a5)
     224:	8a818793          	add	a5,gp,-1880 # 197c <player_bullet>
     228:	00100713          	li	a4,1
     22c:	00e7a423          	sw	a4,8(a5)
     230:	8a818793          	add	a5,gp,-1880 # 197c <player_bullet>
     234:	00100713          	li	a4,1
     238:	00e7a623          	sw	a4,12(a5)
     23c:	8d818793          	add	a5,gp,-1832 # 19ac <joy1>
     240:	0007a423          	sw	zero,8(a5)
     244:	8d818793          	add	a5,gp,-1832 # 19ac <joy1>
     248:	0007aa23          	sw	zero,20(a5)
     24c:	8d818793          	add	a5,gp,-1832 # 19ac <joy1>
     250:	0007a023          	sw	zero,0(a5)
     254:	8d818793          	add	a5,gp,-1832 # 19ac <joy1>
     258:	0007a623          	sw	zero,12(a5)
     25c:	8d818793          	add	a5,gp,-1832 # 19ac <joy1>
     260:	0007a223          	sw	zero,4(a5)
     264:	8d818793          	add	a5,gp,-1832 # 19ac <joy1>
     268:	0007a823          	sw	zero,16(a5)
     26c:	8d818793          	add	a5,gp,-1832 # 19ac <joy1>
     270:	ffffc737          	lui	a4,0xffffc
     274:	00270713          	add	a4,a4,2 # ffffc002 <__global_pointer$+0xffff9f2e>
     278:	00e7ac23          	sw	a4,24(a5)
     27c:	f21ff0ef          	jal	19c <wait_for_vga>
     280:	88818793          	add	a5,gp,-1912 # 195c <player>
     284:	0007a783          	lw	a5,0(a5)
     288:	01679713          	sll	a4,a5,0x16
     28c:	88818793          	add	a5,gp,-1912 # 195c <player>
     290:	0047a783          	lw	a5,4(a5)
     294:	00c79793          	sll	a5,a5,0xc
     298:	00f76733          	or	a4,a4,a5
     29c:	88818793          	add	a5,gp,-1912 # 195c <player>
     2a0:	0087a783          	lw	a5,8(a5)
     2a4:	00279793          	sll	a5,a5,0x2
     2a8:	00f767b3          	or	a5,a4,a5
     2ac:	0017e713          	or	a4,a5,1
     2b0:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     2b4:	00e7a023          	sw	a4,0(a5)
     2b8:	ee5ff0ef          	jal	19c <wait_for_vga>
     2bc:	88818793          	add	a5,gp,-1912 # 195c <player>
     2c0:	0007a783          	lw	a5,0(a5)
     2c4:	01679713          	sll	a4,a5,0x16
     2c8:	88818793          	add	a5,gp,-1912 # 195c <player>
     2cc:	0047a783          	lw	a5,4(a5)
     2d0:	00c79793          	sll	a5,a5,0xc
     2d4:	00f76733          	or	a4,a4,a5
     2d8:	88818793          	add	a5,gp,-1912 # 195c <player>
     2dc:	00c7a783          	lw	a5,12(a5)
     2e0:	00279793          	sll	a5,a5,0x2
     2e4:	00f767b3          	or	a5,a4,a5
     2e8:	0017e713          	or	a4,a5,1
     2ec:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     2f0:	00e7a023          	sw	a4,0(a5)
     2f4:	fe042623          	sw	zero,-20(s0)
     2f8:	05c0006f          	j	354 <init+0x188>
     2fc:	ea1ff0ef          	jal	19c <wait_for_vga>
     300:	000027b7          	lui	a5,0x2
     304:	8f478713          	add	a4,a5,-1804 # 18f4 <blocks>
     308:	fec42783          	lw	a5,-20(s0)
     30c:	00379793          	sll	a5,a5,0x3
     310:	00f707b3          	add	a5,a4,a5
     314:	0007a783          	lw	a5,0(a5)
     318:	01679713          	sll	a4,a5,0x16
     31c:	000027b7          	lui	a5,0x2
     320:	8f478693          	add	a3,a5,-1804 # 18f4 <blocks>
     324:	fec42783          	lw	a5,-20(s0)
     328:	00379793          	sll	a5,a5,0x3
     32c:	00f687b3          	add	a5,a3,a5
     330:	0047a783          	lw	a5,4(a5)
     334:	00c79793          	sll	a5,a5,0xc
     338:	00f767b3          	or	a5,a4,a5
     33c:	0017e713          	or	a4,a5,1
     340:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     344:	00e7a023          	sw	a4,0(a5)
     348:	fec42783          	lw	a5,-20(s0)
     34c:	00178793          	add	a5,a5,1
     350:	fef42623          	sw	a5,-20(s0)
     354:	fec42703          	lw	a4,-20(s0)
     358:	00c00793          	li	a5,12
     35c:	fae7d0e3          	bge	a5,a4,2fc <init+0x130>
     360:	89818793          	add	a5,gp,-1896 # 196c <enemy>
     364:	01300713          	li	a4,19
     368:	00e7a423          	sw	a4,8(a5)
     36c:	89818793          	add	a5,gp,-1896 # 196c <enemy>
     370:	02600713          	li	a4,38
     374:	00e7a623          	sw	a4,12(a5)
     378:	89818793          	add	a5,gp,-1896 # 196c <enemy>
     37c:	23f00713          	li	a4,575
     380:	00e7a023          	sw	a4,0(a5)
     384:	89818793          	add	a5,gp,-1896 # 196c <enemy>
     388:	00200713          	li	a4,2
     38c:	00e7a223          	sw	a4,4(a5)
     390:	8b818793          	add	a5,gp,-1864 # 198c <enemy_bullet>
     394:	00100713          	li	a4,1
     398:	00e7a023          	sw	a4,0(a5)
     39c:	8b818793          	add	a5,gp,-1864 # 198c <enemy_bullet>
     3a0:	00200713          	li	a4,2
     3a4:	00e7a223          	sw	a4,4(a5)
     3a8:	8b818793          	add	a5,gp,-1864 # 198c <enemy_bullet>
     3ac:	00100713          	li	a4,1
     3b0:	00e7a423          	sw	a4,8(a5)
     3b4:	8b818793          	add	a5,gp,-1864 # 198c <enemy_bullet>
     3b8:	00100713          	li	a4,1
     3bc:	00e7a623          	sw	a4,12(a5)
     3c0:	8f418793          	add	a5,gp,-1804 # 19c8 <joy2>
     3c4:	0007a423          	sw	zero,8(a5)
     3c8:	8f418793          	add	a5,gp,-1804 # 19c8 <joy2>
     3cc:	0007aa23          	sw	zero,20(a5)
     3d0:	8f418793          	add	a5,gp,-1804 # 19c8 <joy2>
     3d4:	0007a023          	sw	zero,0(a5)
     3d8:	8f418793          	add	a5,gp,-1804 # 19c8 <joy2>
     3dc:	0007a623          	sw	zero,12(a5)
     3e0:	8f418793          	add	a5,gp,-1804 # 19c8 <joy2>
     3e4:	0007a223          	sw	zero,4(a5)
     3e8:	8f418793          	add	a5,gp,-1804 # 19c8 <joy2>
     3ec:	0007a823          	sw	zero,16(a5)
     3f0:	8f418793          	add	a5,gp,-1804 # 19c8 <joy2>
     3f4:	ffffc737          	lui	a4,0xffffc
     3f8:	00470713          	add	a4,a4,4 # ffffc004 <__global_pointer$+0xffff9f30>
     3fc:	00e7ac23          	sw	a4,24(a5)
     400:	d9dff0ef          	jal	19c <wait_for_vga>
     404:	89818793          	add	a5,gp,-1896 # 196c <enemy>
     408:	0007a783          	lw	a5,0(a5)
     40c:	01679713          	sll	a4,a5,0x16
     410:	89818793          	add	a5,gp,-1896 # 196c <enemy>
     414:	0047a783          	lw	a5,4(a5)
     418:	00c79793          	sll	a5,a5,0xc
     41c:	00f76733          	or	a4,a4,a5
     420:	89818793          	add	a5,gp,-1896 # 196c <enemy>
     424:	0087a783          	lw	a5,8(a5)
     428:	00279793          	sll	a5,a5,0x2
     42c:	00f767b3          	or	a5,a4,a5
     430:	0017e713          	or	a4,a5,1
     434:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     438:	00e7a023          	sw	a4,0(a5)
     43c:	d61ff0ef          	jal	19c <wait_for_vga>
     440:	89818793          	add	a5,gp,-1896 # 196c <enemy>
     444:	0007a783          	lw	a5,0(a5)
     448:	01679713          	sll	a4,a5,0x16
     44c:	89818793          	add	a5,gp,-1896 # 196c <enemy>
     450:	0047a783          	lw	a5,4(a5)
     454:	00c79793          	sll	a5,a5,0xc
     458:	00f76733          	or	a4,a4,a5
     45c:	89818793          	add	a5,gp,-1896 # 196c <enemy>
     460:	00c7a783          	lw	a5,12(a5)
     464:	00279793          	sll	a5,a5,0x2
     468:	00f767b3          	or	a5,a4,a5
     46c:	0017e713          	or	a4,a5,1
     470:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     474:	00e7a023          	sw	a4,0(a5)
     478:	8d41a783          	lw	a5,-1836(gp) # 19a8 <joystick2>
     47c:	00100713          	li	a4,1
     480:	00e7a023          	sw	a4,0(a5)
     484:	00000013          	nop
     488:	01c12083          	lw	ra,28(sp)
     48c:	01812403          	lw	s0,24(sp)
     490:	02010113          	add	sp,sp,32
     494:	00008067          	ret

00000498 <wall_collision>:
     498:	fd010113          	add	sp,sp,-48
     49c:	02812623          	sw	s0,44(sp)
     4a0:	03010413          	add	s0,sp,48
     4a4:	fca42e23          	sw	a0,-36(s0)
     4a8:	fcb42c23          	sw	a1,-40(s0)
     4ac:	fe042623          	sw	zero,-20(s0)
     4b0:	0a80006f          	j	558 <wall_collision+0xc0>
     4b4:	000027b7          	lui	a5,0x2
     4b8:	8f478713          	add	a4,a5,-1804 # 18f4 <blocks>
     4bc:	fec42783          	lw	a5,-20(s0)
     4c0:	00379793          	sll	a5,a5,0x3
     4c4:	00f707b3          	add	a5,a4,a5
     4c8:	0007a783          	lw	a5,0(a5)
     4cc:	03e78793          	add	a5,a5,62
     4d0:	fdc42703          	lw	a4,-36(s0)
     4d4:	06e7cc63          	blt	a5,a4,54c <wall_collision+0xb4>
     4d8:	fdc42783          	lw	a5,-36(s0)
     4dc:	03f78713          	add	a4,a5,63
     4e0:	000027b7          	lui	a5,0x2
     4e4:	8f478693          	add	a3,a5,-1804 # 18f4 <blocks>
     4e8:	fec42783          	lw	a5,-20(s0)
     4ec:	00379793          	sll	a5,a5,0x3
     4f0:	00f687b3          	add	a5,a3,a5
     4f4:	0007a783          	lw	a5,0(a5)
     4f8:	04f74a63          	blt	a4,a5,54c <wall_collision+0xb4>
     4fc:	000027b7          	lui	a5,0x2
     500:	8f478713          	add	a4,a5,-1804 # 18f4 <blocks>
     504:	fec42783          	lw	a5,-20(s0)
     508:	00379793          	sll	a5,a5,0x3
     50c:	00f707b3          	add	a5,a4,a5
     510:	0047a783          	lw	a5,4(a5)
     514:	07d78793          	add	a5,a5,125
     518:	fd842703          	lw	a4,-40(s0)
     51c:	02e7c863          	blt	a5,a4,54c <wall_collision+0xb4>
     520:	fd842783          	lw	a5,-40(s0)
     524:	07f78713          	add	a4,a5,127
     528:	000027b7          	lui	a5,0x2
     52c:	8f478693          	add	a3,a5,-1804 # 18f4 <blocks>
     530:	fec42783          	lw	a5,-20(s0)
     534:	00379793          	sll	a5,a5,0x3
     538:	00f687b3          	add	a5,a3,a5
     53c:	0047a783          	lw	a5,4(a5)
     540:	00f74663          	blt	a4,a5,54c <wall_collision+0xb4>
     544:	fff00793          	li	a5,-1
     548:	0200006f          	j	568 <wall_collision+0xd0>
     54c:	fec42783          	lw	a5,-20(s0)
     550:	00178793          	add	a5,a5,1
     554:	fef42623          	sw	a5,-20(s0)
     558:	fec42703          	lw	a4,-20(s0)
     55c:	00c00793          	li	a5,12
     560:	f4e7dae3          	bge	a5,a4,4b4 <wall_collision+0x1c>
     564:	00000793          	li	a5,0
     568:	00078513          	mv	a0,a5
     56c:	02c12403          	lw	s0,44(sp)
     570:	03010113          	add	sp,sp,48
     574:	00008067          	ret

00000578 <bullet_collision>:
     578:	fd010113          	add	sp,sp,-48
     57c:	02812623          	sw	s0,44(sp)
     580:	03010413          	add	s0,sp,48
     584:	fca42e23          	sw	a0,-36(s0)
     588:	fcb42c23          	sw	a1,-40(s0)
     58c:	fe042623          	sw	zero,-20(s0)
     590:	0a80006f          	j	638 <bullet_collision+0xc0>
     594:	000027b7          	lui	a5,0x2
     598:	8f478713          	add	a4,a5,-1804 # 18f4 <blocks>
     59c:	fec42783          	lw	a5,-20(s0)
     5a0:	00379793          	sll	a5,a5,0x3
     5a4:	00f707b3          	add	a5,a4,a5
     5a8:	0007a783          	lw	a5,0(a5)
     5ac:	03e78793          	add	a5,a5,62
     5b0:	fdc42703          	lw	a4,-36(s0)
     5b4:	06e7cc63          	blt	a5,a4,62c <bullet_collision+0xb4>
     5b8:	fdc42783          	lw	a5,-36(s0)
     5bc:	01f78713          	add	a4,a5,31
     5c0:	000027b7          	lui	a5,0x2
     5c4:	8f478693          	add	a3,a5,-1804 # 18f4 <blocks>
     5c8:	fec42783          	lw	a5,-20(s0)
     5cc:	00379793          	sll	a5,a5,0x3
     5d0:	00f687b3          	add	a5,a3,a5
     5d4:	0007a783          	lw	a5,0(a5)
     5d8:	04f74a63          	blt	a4,a5,62c <bullet_collision+0xb4>
     5dc:	000027b7          	lui	a5,0x2
     5e0:	8f478713          	add	a4,a5,-1804 # 18f4 <blocks>
     5e4:	fec42783          	lw	a5,-20(s0)
     5e8:	00379793          	sll	a5,a5,0x3
     5ec:	00f707b3          	add	a5,a4,a5
     5f0:	0047a783          	lw	a5,4(a5)
     5f4:	07d78793          	add	a5,a5,125
     5f8:	fd842703          	lw	a4,-40(s0)
     5fc:	02e7c863          	blt	a5,a4,62c <bullet_collision+0xb4>
     600:	fd842783          	lw	a5,-40(s0)
     604:	03f78713          	add	a4,a5,63
     608:	000027b7          	lui	a5,0x2
     60c:	8f478693          	add	a3,a5,-1804 # 18f4 <blocks>
     610:	fec42783          	lw	a5,-20(s0)
     614:	00379793          	sll	a5,a5,0x3
     618:	00f687b3          	add	a5,a3,a5
     61c:	0047a783          	lw	a5,4(a5)
     620:	00f74663          	blt	a4,a5,62c <bullet_collision+0xb4>
     624:	fff00793          	li	a5,-1
     628:	0200006f          	j	648 <bullet_collision+0xd0>
     62c:	fec42783          	lw	a5,-20(s0)
     630:	00178793          	add	a5,a5,1
     634:	fef42623          	sw	a5,-20(s0)
     638:	fec42703          	lw	a4,-20(s0)
     63c:	00c00793          	li	a5,12
     640:	f4e7dae3          	bge	a5,a4,594 <bullet_collision+0x1c>
     644:	00000793          	li	a5,0
     648:	00078513          	mv	a0,a5
     64c:	02c12403          	lw	s0,44(sp)
     650:	03010113          	add	sp,sp,48
     654:	00008067          	ret

00000658 <tank_collision>:
     658:	fe010113          	add	sp,sp,-32
     65c:	00812e23          	sw	s0,28(sp)
     660:	02010413          	add	s0,sp,32
     664:	fea42623          	sw	a0,-20(s0)
     668:	feb42423          	sw	a1,-24(s0)
     66c:	fec42223          	sw	a2,-28(s0)
     670:	fec42783          	lw	a5,-20(s0)
     674:	03e78713          	add	a4,a5,62
     678:	fe442783          	lw	a5,-28(s0)
     67c:	0007a783          	lw	a5,0(a5)
     680:	04f74463          	blt	a4,a5,6c8 <tank_collision+0x70>
     684:	fe442783          	lw	a5,-28(s0)
     688:	0007a783          	lw	a5,0(a5)
     68c:	03e78793          	add	a5,a5,62
     690:	fec42703          	lw	a4,-20(s0)
     694:	02e7ca63          	blt	a5,a4,6c8 <tank_collision+0x70>
     698:	fe842783          	lw	a5,-24(s0)
     69c:	07d78713          	add	a4,a5,125
     6a0:	fe442783          	lw	a5,-28(s0)
     6a4:	0047a783          	lw	a5,4(a5)
     6a8:	02f74063          	blt	a4,a5,6c8 <tank_collision+0x70>
     6ac:	fe442783          	lw	a5,-28(s0)
     6b0:	0047a783          	lw	a5,4(a5)
     6b4:	07d78793          	add	a5,a5,125
     6b8:	fe842703          	lw	a4,-24(s0)
     6bc:	00e7c663          	blt	a5,a4,6c8 <tank_collision+0x70>
     6c0:	fff00793          	li	a5,-1
     6c4:	0080006f          	j	6cc <tank_collision+0x74>
     6c8:	00000793          	li	a5,0
     6cc:	00078513          	mv	a0,a5
     6d0:	01c12403          	lw	s0,28(sp)
     6d4:	02010113          	add	sp,sp,32
     6d8:	00008067          	ret

000006dc <bullet_tank>:
     6dc:	fc010113          	add	sp,sp,-64
     6e0:	02812e23          	sw	s0,60(sp)
     6e4:	04010413          	add	s0,sp,64
     6e8:	fca42623          	sw	a0,-52(s0)
     6ec:	fcb42423          	sw	a1,-56(s0)
     6f0:	00500793          	li	a5,5
     6f4:	fef42623          	sw	a5,-20(s0)
     6f8:	fc842783          	lw	a5,-56(s0)
     6fc:	0007a783          	lw	a5,0(a5)
     700:	fec42703          	lw	a4,-20(s0)
     704:	00f707b3          	add	a5,a4,a5
     708:	fef42423          	sw	a5,-24(s0)
     70c:	fec42783          	lw	a5,-20(s0)
     710:	00179793          	sll	a5,a5,0x1
     714:	03f00713          	li	a4,63
     718:	40f707b3          	sub	a5,a4,a5
     71c:	fef42223          	sw	a5,-28(s0)
     720:	fc842783          	lw	a5,-56(s0)
     724:	0047a783          	lw	a5,4(a5)
     728:	fec42703          	lw	a4,-20(s0)
     72c:	00f707b3          	add	a5,a4,a5
     730:	fef42023          	sw	a5,-32(s0)
     734:	03f00713          	li	a4,63
     738:	fec42783          	lw	a5,-20(s0)
     73c:	40f707b3          	sub	a5,a4,a5
     740:	00179793          	sll	a5,a5,0x1
     744:	fcf42e23          	sw	a5,-36(s0)
     748:	01e00793          	li	a5,30
     74c:	fcf42c23          	sw	a5,-40(s0)
     750:	03c00793          	li	a5,60
     754:	fcf42a23          	sw	a5,-44(s0)
     758:	fcc42783          	lw	a5,-52(s0)
     75c:	0007a703          	lw	a4,0(a5)
     760:	00100793          	li	a5,1
     764:	06f70663          	beq	a4,a5,7d0 <bullet_tank+0xf4>
     768:	fcc42783          	lw	a5,-52(s0)
     76c:	0087a703          	lw	a4,8(a5)
     770:	fe842683          	lw	a3,-24(s0)
     774:	fe442783          	lw	a5,-28(s0)
     778:	00f687b3          	add	a5,a3,a5
     77c:	04f75a63          	bge	a4,a5,7d0 <bullet_tank+0xf4>
     780:	fcc42783          	lw	a5,-52(s0)
     784:	0087a703          	lw	a4,8(a5)
     788:	fd842783          	lw	a5,-40(s0)
     78c:	00f707b3          	add	a5,a4,a5
     790:	fe842703          	lw	a4,-24(s0)
     794:	02f75e63          	bge	a4,a5,7d0 <bullet_tank+0xf4>
     798:	fcc42783          	lw	a5,-52(s0)
     79c:	00c7a703          	lw	a4,12(a5)
     7a0:	fe042683          	lw	a3,-32(s0)
     7a4:	fdc42783          	lw	a5,-36(s0)
     7a8:	00f687b3          	add	a5,a3,a5
     7ac:	02f75263          	bge	a4,a5,7d0 <bullet_tank+0xf4>
     7b0:	fcc42783          	lw	a5,-52(s0)
     7b4:	00c7a703          	lw	a4,12(a5)
     7b8:	fd442783          	lw	a5,-44(s0)
     7bc:	00f707b3          	add	a5,a4,a5
     7c0:	fe042703          	lw	a4,-32(s0)
     7c4:	00f75663          	bge	a4,a5,7d0 <bullet_tank+0xf4>
     7c8:	00100793          	li	a5,1
     7cc:	0080006f          	j	7d4 <bullet_tank+0xf8>
     7d0:	00000793          	li	a5,0
     7d4:	00078513          	mv	a0,a5
     7d8:	03c12403          	lw	s0,60(sp)
     7dc:	04010113          	add	sp,sp,64
     7e0:	00008067          	ret

000007e4 <flash_tank>:
     7e4:	fd010113          	add	sp,sp,-48
     7e8:	02112623          	sw	ra,44(sp)
     7ec:	02812423          	sw	s0,40(sp)
     7f0:	03010413          	add	s0,sp,48
     7f4:	fca42e23          	sw	a0,-36(s0)
     7f8:	9a5ff0ef          	jal	19c <wait_for_vga>
     7fc:	fdc42783          	lw	a5,-36(s0)
     800:	0007a783          	lw	a5,0(a5)
     804:	01679713          	sll	a4,a5,0x16
     808:	fdc42783          	lw	a5,-36(s0)
     80c:	0047a783          	lw	a5,4(a5)
     810:	00c79793          	sll	a5,a5,0xc
     814:	00f76733          	or	a4,a4,a5
     818:	fdc42783          	lw	a5,-36(s0)
     81c:	0087a783          	lw	a5,8(a5)
     820:	00279793          	sll	a5,a5,0x2
     824:	00f767b3          	or	a5,a4,a5
     828:	0017e713          	or	a4,a5,1
     82c:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     830:	00e7a023          	sw	a4,0(a5)
     834:	969ff0ef          	jal	19c <wait_for_vga>
     838:	fdc42783          	lw	a5,-36(s0)
     83c:	0007a783          	lw	a5,0(a5)
     840:	01679713          	sll	a4,a5,0x16
     844:	fdc42783          	lw	a5,-36(s0)
     848:	0047a783          	lw	a5,4(a5)
     84c:	00c79793          	sll	a5,a5,0xc
     850:	00f76733          	or	a4,a4,a5
     854:	fdc42783          	lw	a5,-36(s0)
     858:	00c7a783          	lw	a5,12(a5)
     85c:	00279793          	sll	a5,a5,0x2
     860:	00f767b3          	or	a5,a4,a5
     864:	0017e713          	or	a4,a5,1
     868:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     86c:	00e7a023          	sw	a4,0(a5)
     870:	fe042623          	sw	zero,-20(s0)
     874:	0100006f          	j	884 <flash_tank+0xa0>
     878:	fec42783          	lw	a5,-20(s0)
     87c:	00178793          	add	a5,a5,1
     880:	fef42623          	sw	a5,-20(s0)
     884:	fec42703          	lw	a4,-20(s0)
     888:	000f47b7          	lui	a5,0xf4
     88c:	23f78793          	add	a5,a5,575 # f423f <__global_pointer$+0xf216b>
     890:	fee7d4e3          	bge	a5,a4,878 <flash_tank+0x94>
     894:	909ff0ef          	jal	19c <wait_for_vga>
     898:	fdc42783          	lw	a5,-36(s0)
     89c:	0007a783          	lw	a5,0(a5)
     8a0:	01679713          	sll	a4,a5,0x16
     8a4:	fdc42783          	lw	a5,-36(s0)
     8a8:	0047a783          	lw	a5,4(a5)
     8ac:	00c79793          	sll	a5,a5,0xc
     8b0:	00f76733          	or	a4,a4,a5
     8b4:	fdc42783          	lw	a5,-36(s0)
     8b8:	0087a783          	lw	a5,8(a5)
     8bc:	00279793          	sll	a5,a5,0x2
     8c0:	00f767b3          	or	a5,a4,a5
     8c4:	0027e713          	or	a4,a5,2
     8c8:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     8cc:	00e7a023          	sw	a4,0(a5)
     8d0:	fe042423          	sw	zero,-24(s0)
     8d4:	0100006f          	j	8e4 <flash_tank+0x100>
     8d8:	fe842783          	lw	a5,-24(s0)
     8dc:	00178793          	add	a5,a5,1
     8e0:	fef42423          	sw	a5,-24(s0)
     8e4:	fe842703          	lw	a4,-24(s0)
     8e8:	000f47b7          	lui	a5,0xf4
     8ec:	23f78793          	add	a5,a5,575 # f423f <__global_pointer$+0xf216b>
     8f0:	fee7d4e3          	bge	a5,a4,8d8 <flash_tank+0xf4>
     8f4:	00000013          	nop
     8f8:	00000013          	nop
     8fc:	02c12083          	lw	ra,44(sp)
     900:	02812403          	lw	s0,40(sp)
     904:	03010113          	add	sp,sp,48
     908:	00008067          	ret

0000090c <update_player_tank>:
     90c:	fd010113          	add	sp,sp,-48
     910:	02112623          	sw	ra,44(sp)
     914:	02812423          	sw	s0,40(sp)
     918:	03010413          	add	s0,sp,48
     91c:	fca42e23          	sw	a0,-36(s0)
     920:	fcb42c23          	sw	a1,-40(s0)
     924:	fcc42a23          	sw	a2,-44(s0)
     928:	fcd42823          	sw	a3,-48(s0)
     92c:	fe042623          	sw	zero,-20(s0)
     930:	00100793          	li	a5,1
     934:	fef42423          	sw	a5,-24(s0)
     938:	865ff0ef          	jal	19c <wait_for_vga>
     93c:	fd842783          	lw	a5,-40(s0)
     940:	00c7a703          	lw	a4,12(a5)
     944:	00200793          	li	a5,2
     948:	06f71463          	bne	a4,a5,9b0 <update_player_tank+0xa4>
     94c:	fd842783          	lw	a5,-40(s0)
     950:	0107a783          	lw	a5,16(a5)
     954:	04079e63          	bnez	a5,9b0 <update_player_tank+0xa4>
     958:	88818793          	add	a5,gp,-1912 # 195c <player>
     95c:	00c7a703          	lw	a4,12(a5)
     960:	02900793          	li	a5,41
     964:	04f70663          	beq	a4,a5,9b0 <update_player_tank+0xa4>
     968:	fdc42783          	lw	a5,-36(s0)
     96c:	0007a783          	lw	a5,0(a5)
     970:	01679713          	sll	a4,a5,0x16
     974:	fdc42783          	lw	a5,-36(s0)
     978:	0047a783          	lw	a5,4(a5)
     97c:	00c79793          	sll	a5,a5,0xc
     980:	00f76733          	or	a4,a4,a5
     984:	fdc42783          	lw	a5,-36(s0)
     988:	00c7a783          	lw	a5,12(a5)
     98c:	00279793          	sll	a5,a5,0x2
     990:	00f767b3          	or	a5,a4,a5
     994:	0027e713          	or	a4,a5,2
     998:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     99c:	00e7a023          	sw	a4,0(a5)
     9a0:	fdc42783          	lw	a5,-36(s0)
     9a4:	02900713          	li	a4,41
     9a8:	00e7a623          	sw	a4,12(a5)
     9ac:	3440006f          	j	cf0 <update_player_tank+0x3e4>
     9b0:	fd842783          	lw	a5,-40(s0)
     9b4:	00c7a703          	lw	a4,12(a5)
     9b8:	00100793          	li	a5,1
     9bc:	06f71463          	bne	a4,a5,a24 <update_player_tank+0x118>
     9c0:	fd842783          	lw	a5,-40(s0)
     9c4:	0107a783          	lw	a5,16(a5)
     9c8:	04079e63          	bnez	a5,a24 <update_player_tank+0x118>
     9cc:	fdc42783          	lw	a5,-36(s0)
     9d0:	00c7a703          	lw	a4,12(a5)
     9d4:	02200793          	li	a5,34
     9d8:	04f70663          	beq	a4,a5,a24 <update_player_tank+0x118>
     9dc:	fdc42783          	lw	a5,-36(s0)
     9e0:	0007a783          	lw	a5,0(a5)
     9e4:	01679713          	sll	a4,a5,0x16
     9e8:	fdc42783          	lw	a5,-36(s0)
     9ec:	0047a783          	lw	a5,4(a5)
     9f0:	00c79793          	sll	a5,a5,0xc
     9f4:	00f76733          	or	a4,a4,a5
     9f8:	fdc42783          	lw	a5,-36(s0)
     9fc:	00c7a783          	lw	a5,12(a5)
     a00:	00279793          	sll	a5,a5,0x2
     a04:	00f767b3          	or	a5,a4,a5
     a08:	0027e713          	or	a4,a5,2
     a0c:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     a10:	00e7a023          	sw	a4,0(a5)
     a14:	fdc42783          	lw	a5,-36(s0)
     a18:	02200713          	li	a4,34
     a1c:	00e7a623          	sw	a4,12(a5)
     a20:	2d00006f          	j	cf0 <update_player_tank+0x3e4>
     a24:	fd842783          	lw	a5,-40(s0)
     a28:	0107a703          	lw	a4,16(a5)
     a2c:	00200793          	li	a5,2
     a30:	06f71463          	bne	a4,a5,a98 <update_player_tank+0x18c>
     a34:	fd842783          	lw	a5,-40(s0)
     a38:	00c7a783          	lw	a5,12(a5)
     a3c:	04079e63          	bnez	a5,a98 <update_player_tank+0x18c>
     a40:	fdc42783          	lw	a5,-36(s0)
     a44:	00c7a703          	lw	a4,12(a5)
     a48:	02300793          	li	a5,35
     a4c:	04f70663          	beq	a4,a5,a98 <update_player_tank+0x18c>
     a50:	fdc42783          	lw	a5,-36(s0)
     a54:	0007a783          	lw	a5,0(a5)
     a58:	01679713          	sll	a4,a5,0x16
     a5c:	fdc42783          	lw	a5,-36(s0)
     a60:	0047a783          	lw	a5,4(a5)
     a64:	00c79793          	sll	a5,a5,0xc
     a68:	00f76733          	or	a4,a4,a5
     a6c:	fdc42783          	lw	a5,-36(s0)
     a70:	00c7a783          	lw	a5,12(a5)
     a74:	00279793          	sll	a5,a5,0x2
     a78:	00f767b3          	or	a5,a4,a5
     a7c:	0027e713          	or	a4,a5,2
     a80:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     a84:	00e7a023          	sw	a4,0(a5)
     a88:	fdc42783          	lw	a5,-36(s0)
     a8c:	02300713          	li	a4,35
     a90:	00e7a623          	sw	a4,12(a5)
     a94:	25c0006f          	j	cf0 <update_player_tank+0x3e4>
     a98:	fd842783          	lw	a5,-40(s0)
     a9c:	0107a703          	lw	a4,16(a5)
     aa0:	00100793          	li	a5,1
     aa4:	06f71463          	bne	a4,a5,b0c <update_player_tank+0x200>
     aa8:	fd842783          	lw	a5,-40(s0)
     aac:	00c7a783          	lw	a5,12(a5)
     ab0:	04079e63          	bnez	a5,b0c <update_player_tank+0x200>
     ab4:	fdc42783          	lw	a5,-36(s0)
     ab8:	00c7a703          	lw	a4,12(a5)
     abc:	02600793          	li	a5,38
     ac0:	04f70663          	beq	a4,a5,b0c <update_player_tank+0x200>
     ac4:	fdc42783          	lw	a5,-36(s0)
     ac8:	0007a783          	lw	a5,0(a5)
     acc:	01679713          	sll	a4,a5,0x16
     ad0:	fdc42783          	lw	a5,-36(s0)
     ad4:	0047a783          	lw	a5,4(a5)
     ad8:	00c79793          	sll	a5,a5,0xc
     adc:	00f76733          	or	a4,a4,a5
     ae0:	fdc42783          	lw	a5,-36(s0)
     ae4:	00c7a783          	lw	a5,12(a5)
     ae8:	00279793          	sll	a5,a5,0x2
     aec:	00f767b3          	or	a5,a4,a5
     af0:	0027e713          	or	a4,a5,2
     af4:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     af8:	00e7a023          	sw	a4,0(a5)
     afc:	fdc42783          	lw	a5,-36(s0)
     b00:	02600713          	li	a4,38
     b04:	00e7a623          	sw	a4,12(a5)
     b08:	1e80006f          	j	cf0 <update_player_tank+0x3e4>
     b0c:	fd842783          	lw	a5,-40(s0)
     b10:	00c7a703          	lw	a4,12(a5)
     b14:	00100793          	li	a5,1
     b18:	06f71663          	bne	a4,a5,b84 <update_player_tank+0x278>
     b1c:	fd842783          	lw	a5,-40(s0)
     b20:	0107a703          	lw	a4,16(a5)
     b24:	00200793          	li	a5,2
     b28:	04f71e63          	bne	a4,a5,b84 <update_player_tank+0x278>
     b2c:	fdc42783          	lw	a5,-36(s0)
     b30:	00c7a703          	lw	a4,12(a5)
     b34:	02400793          	li	a5,36
     b38:	04f70663          	beq	a4,a5,b84 <update_player_tank+0x278>
     b3c:	fdc42783          	lw	a5,-36(s0)
     b40:	0007a783          	lw	a5,0(a5)
     b44:	01679713          	sll	a4,a5,0x16
     b48:	fdc42783          	lw	a5,-36(s0)
     b4c:	0047a783          	lw	a5,4(a5)
     b50:	00c79793          	sll	a5,a5,0xc
     b54:	00f76733          	or	a4,a4,a5
     b58:	fdc42783          	lw	a5,-36(s0)
     b5c:	00c7a783          	lw	a5,12(a5)
     b60:	00279793          	sll	a5,a5,0x2
     b64:	00f767b3          	or	a5,a4,a5
     b68:	0027e713          	or	a4,a5,2
     b6c:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     b70:	00e7a023          	sw	a4,0(a5)
     b74:	fdc42783          	lw	a5,-36(s0)
     b78:	02400713          	li	a4,36
     b7c:	00e7a623          	sw	a4,12(a5)
     b80:	1700006f          	j	cf0 <update_player_tank+0x3e4>
     b84:	fd842783          	lw	a5,-40(s0)
     b88:	00c7a703          	lw	a4,12(a5)
     b8c:	00200793          	li	a5,2
     b90:	06f71663          	bne	a4,a5,bfc <update_player_tank+0x2f0>
     b94:	fd842783          	lw	a5,-40(s0)
     b98:	0107a703          	lw	a4,16(a5)
     b9c:	00200793          	li	a5,2
     ba0:	04f71e63          	bne	a4,a5,bfc <update_player_tank+0x2f0>
     ba4:	fdc42783          	lw	a5,-36(s0)
     ba8:	00c7a703          	lw	a4,12(a5)
     bac:	02500793          	li	a5,37
     bb0:	04f70663          	beq	a4,a5,bfc <update_player_tank+0x2f0>
     bb4:	fdc42783          	lw	a5,-36(s0)
     bb8:	0007a783          	lw	a5,0(a5)
     bbc:	01679713          	sll	a4,a5,0x16
     bc0:	fdc42783          	lw	a5,-36(s0)
     bc4:	0047a783          	lw	a5,4(a5)
     bc8:	00c79793          	sll	a5,a5,0xc
     bcc:	00f76733          	or	a4,a4,a5
     bd0:	fdc42783          	lw	a5,-36(s0)
     bd4:	00c7a783          	lw	a5,12(a5)
     bd8:	00279793          	sll	a5,a5,0x2
     bdc:	00f767b3          	or	a5,a4,a5
     be0:	0027e713          	or	a4,a5,2
     be4:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     be8:	00e7a023          	sw	a4,0(a5)
     bec:	fdc42783          	lw	a5,-36(s0)
     bf0:	02500713          	li	a4,37
     bf4:	00e7a623          	sw	a4,12(a5)
     bf8:	0f80006f          	j	cf0 <update_player_tank+0x3e4>
     bfc:	fd842783          	lw	a5,-40(s0)
     c00:	00c7a703          	lw	a4,12(a5)
     c04:	00100793          	li	a5,1
     c08:	06f71663          	bne	a4,a5,c74 <update_player_tank+0x368>
     c0c:	fd842783          	lw	a5,-40(s0)
     c10:	0107a703          	lw	a4,16(a5)
     c14:	00100793          	li	a5,1
     c18:	04f71e63          	bne	a4,a5,c74 <update_player_tank+0x368>
     c1c:	fdc42783          	lw	a5,-36(s0)
     c20:	00c7a703          	lw	a4,12(a5)
     c24:	02700793          	li	a5,39
     c28:	04f70663          	beq	a4,a5,c74 <update_player_tank+0x368>
     c2c:	fdc42783          	lw	a5,-36(s0)
     c30:	0007a783          	lw	a5,0(a5)
     c34:	01679713          	sll	a4,a5,0x16
     c38:	fdc42783          	lw	a5,-36(s0)
     c3c:	0047a783          	lw	a5,4(a5)
     c40:	00c79793          	sll	a5,a5,0xc
     c44:	00f76733          	or	a4,a4,a5
     c48:	fdc42783          	lw	a5,-36(s0)
     c4c:	00c7a783          	lw	a5,12(a5)
     c50:	00279793          	sll	a5,a5,0x2
     c54:	00f767b3          	or	a5,a4,a5
     c58:	0027e713          	or	a4,a5,2
     c5c:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     c60:	00e7a023          	sw	a4,0(a5)
     c64:	fdc42783          	lw	a5,-36(s0)
     c68:	02700713          	li	a4,39
     c6c:	00e7a623          	sw	a4,12(a5)
     c70:	0800006f          	j	cf0 <update_player_tank+0x3e4>
     c74:	fd842783          	lw	a5,-40(s0)
     c78:	00c7a703          	lw	a4,12(a5)
     c7c:	00200793          	li	a5,2
     c80:	06f71663          	bne	a4,a5,cec <update_player_tank+0x3e0>
     c84:	fd842783          	lw	a5,-40(s0)
     c88:	0107a703          	lw	a4,16(a5)
     c8c:	00100793          	li	a5,1
     c90:	04f71e63          	bne	a4,a5,cec <update_player_tank+0x3e0>
     c94:	fdc42783          	lw	a5,-36(s0)
     c98:	00c7a703          	lw	a4,12(a5)
     c9c:	02800793          	li	a5,40
     ca0:	04f70663          	beq	a4,a5,cec <update_player_tank+0x3e0>
     ca4:	fdc42783          	lw	a5,-36(s0)
     ca8:	0007a783          	lw	a5,0(a5)
     cac:	01679713          	sll	a4,a5,0x16
     cb0:	fdc42783          	lw	a5,-36(s0)
     cb4:	0047a783          	lw	a5,4(a5)
     cb8:	00c79793          	sll	a5,a5,0xc
     cbc:	00f76733          	or	a4,a4,a5
     cc0:	fdc42783          	lw	a5,-36(s0)
     cc4:	00c7a783          	lw	a5,12(a5)
     cc8:	00279793          	sll	a5,a5,0x2
     ccc:	00f767b3          	or	a5,a4,a5
     cd0:	0027e713          	or	a4,a5,2
     cd4:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     cd8:	00e7a023          	sw	a4,0(a5)
     cdc:	fdc42783          	lw	a5,-36(s0)
     ce0:	02800713          	li	a4,40
     ce4:	00e7a623          	sw	a4,12(a5)
     ce8:	0080006f          	j	cf0 <update_player_tank+0x3e4>
     cec:	fe042423          	sw	zero,-24(s0)
     cf0:	fe842783          	lw	a5,-24(s0)
     cf4:	38079063          	bnez	a5,1074 <update_player_tank+0x768>
     cf8:	fd842783          	lw	a5,-40(s0)
     cfc:	0007a703          	lw	a4,0(a5)
     d00:	00200793          	li	a5,2
     d04:	0cf71a63          	bne	a4,a5,dd8 <update_player_tank+0x4cc>
     d08:	fdc42783          	lw	a5,-36(s0)
     d0c:	0007a703          	lw	a4,0(a5)
     d10:	00100793          	li	a5,1
     d14:	36e7d063          	bge	a5,a4,1074 <update_player_tank+0x768>
     d18:	fdc42783          	lw	a5,-36(s0)
     d1c:	0007a783          	lw	a5,0(a5)
     d20:	fff78713          	add	a4,a5,-1
     d24:	fdc42783          	lw	a5,-36(s0)
     d28:	0047a783          	lw	a5,4(a5)
     d2c:	00078593          	mv	a1,a5
     d30:	00070513          	mv	a0,a4
     d34:	f64ff0ef          	jal	498 <wall_collision>
     d38:	00050793          	mv	a5,a0
     d3c:	32079c63          	bnez	a5,1074 <update_player_tank+0x768>
     d40:	fdc42783          	lw	a5,-36(s0)
     d44:	0007a783          	lw	a5,0(a5)
     d48:	fff78713          	add	a4,a5,-1
     d4c:	fdc42783          	lw	a5,-36(s0)
     d50:	0047a783          	lw	a5,4(a5)
     d54:	fd042603          	lw	a2,-48(s0)
     d58:	00078593          	mv	a1,a5
     d5c:	00070513          	mv	a0,a4
     d60:	8f9ff0ef          	jal	658 <tank_collision>
     d64:	00050793          	mv	a5,a0
     d68:	30079663          	bnez	a5,1074 <update_player_tank+0x768>
     d6c:	c30ff0ef          	jal	19c <wait_for_vga>
     d70:	fdc42783          	lw	a5,-36(s0)
     d74:	0007a783          	lw	a5,0(a5)
     d78:	01679713          	sll	a4,a5,0x16
     d7c:	fdc42783          	lw	a5,-36(s0)
     d80:	0047a783          	lw	a5,4(a5)
     d84:	00c79793          	sll	a5,a5,0xc
     d88:	00f76733          	or	a4,a4,a5
     d8c:	fdc42783          	lw	a5,-36(s0)
     d90:	0087a783          	lw	a5,8(a5)
     d94:	00279793          	sll	a5,a5,0x2
     d98:	00f767b3          	or	a5,a4,a5
     d9c:	0027e713          	or	a4,a5,2
     da0:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     da4:	00e7a023          	sw	a4,0(a5)
     da8:	fdc42783          	lw	a5,-36(s0)
     dac:	0007a783          	lw	a5,0(a5)
     db0:	fff78713          	add	a4,a5,-1
     db4:	fdc42783          	lw	a5,-36(s0)
     db8:	00e7a023          	sw	a4,0(a5)
     dbc:	fd442783          	lw	a5,-44(s0)
     dc0:	0047a703          	lw	a4,4(a5)
     dc4:	fdc42783          	lw	a5,-36(s0)
     dc8:	00e7a423          	sw	a4,8(a5)
     dcc:	00100793          	li	a5,1
     dd0:	fef42623          	sw	a5,-20(s0)
     dd4:	2a00006f          	j	1074 <update_player_tank+0x768>
     dd8:	fd842783          	lw	a5,-40(s0)
     ddc:	0007a703          	lw	a4,0(a5)
     de0:	00100793          	li	a5,1
     de4:	0cf71a63          	bne	a4,a5,eb8 <update_player_tank+0x5ac>
     de8:	fdc42783          	lw	a5,-36(s0)
     dec:	0007a703          	lw	a4,0(a5)
     df0:	23f00793          	li	a5,575
     df4:	28e7c063          	blt	a5,a4,1074 <update_player_tank+0x768>
     df8:	fdc42783          	lw	a5,-36(s0)
     dfc:	0007a783          	lw	a5,0(a5)
     e00:	00178713          	add	a4,a5,1
     e04:	fdc42783          	lw	a5,-36(s0)
     e08:	0047a783          	lw	a5,4(a5)
     e0c:	00078593          	mv	a1,a5
     e10:	00070513          	mv	a0,a4
     e14:	e84ff0ef          	jal	498 <wall_collision>
     e18:	00050793          	mv	a5,a0
     e1c:	24079c63          	bnez	a5,1074 <update_player_tank+0x768>
     e20:	fdc42783          	lw	a5,-36(s0)
     e24:	0007a783          	lw	a5,0(a5)
     e28:	00178713          	add	a4,a5,1
     e2c:	fdc42783          	lw	a5,-36(s0)
     e30:	0047a783          	lw	a5,4(a5)
     e34:	fd042603          	lw	a2,-48(s0)
     e38:	00078593          	mv	a1,a5
     e3c:	00070513          	mv	a0,a4
     e40:	819ff0ef          	jal	658 <tank_collision>
     e44:	00050793          	mv	a5,a0
     e48:	22079663          	bnez	a5,1074 <update_player_tank+0x768>
     e4c:	b50ff0ef          	jal	19c <wait_for_vga>
     e50:	fdc42783          	lw	a5,-36(s0)
     e54:	0007a783          	lw	a5,0(a5)
     e58:	01679713          	sll	a4,a5,0x16
     e5c:	fdc42783          	lw	a5,-36(s0)
     e60:	0047a783          	lw	a5,4(a5)
     e64:	00c79793          	sll	a5,a5,0xc
     e68:	00f76733          	or	a4,a4,a5
     e6c:	fdc42783          	lw	a5,-36(s0)
     e70:	0087a783          	lw	a5,8(a5)
     e74:	00279793          	sll	a5,a5,0x2
     e78:	00f767b3          	or	a5,a4,a5
     e7c:	0027e713          	or	a4,a5,2
     e80:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     e84:	00e7a023          	sw	a4,0(a5)
     e88:	fdc42783          	lw	a5,-36(s0)
     e8c:	0007a783          	lw	a5,0(a5)
     e90:	00178713          	add	a4,a5,1
     e94:	fdc42783          	lw	a5,-36(s0)
     e98:	00e7a023          	sw	a4,0(a5)
     e9c:	fd442783          	lw	a5,-44(s0)
     ea0:	0087a703          	lw	a4,8(a5)
     ea4:	fdc42783          	lw	a5,-36(s0)
     ea8:	00e7a423          	sw	a4,8(a5)
     eac:	00100793          	li	a5,1
     eb0:	fef42623          	sw	a5,-20(s0)
     eb4:	1c00006f          	j	1074 <update_player_tank+0x768>
     eb8:	fd842783          	lw	a5,-40(s0)
     ebc:	0047a703          	lw	a4,4(a5)
     ec0:	00200793          	li	a5,2
     ec4:	0cf71a63          	bne	a4,a5,f98 <update_player_tank+0x68c>
     ec8:	fdc42783          	lw	a5,-36(s0)
     ecc:	0047a703          	lw	a4,4(a5)
     ed0:	00100793          	li	a5,1
     ed4:	1ae7d063          	bge	a5,a4,1074 <update_player_tank+0x768>
     ed8:	fdc42783          	lw	a5,-36(s0)
     edc:	0007a703          	lw	a4,0(a5)
     ee0:	fdc42783          	lw	a5,-36(s0)
     ee4:	0047a783          	lw	a5,4(a5)
     ee8:	ffe78793          	add	a5,a5,-2
     eec:	00078593          	mv	a1,a5
     ef0:	00070513          	mv	a0,a4
     ef4:	da4ff0ef          	jal	498 <wall_collision>
     ef8:	00050793          	mv	a5,a0
     efc:	16079c63          	bnez	a5,1074 <update_player_tank+0x768>
     f00:	fdc42783          	lw	a5,-36(s0)
     f04:	0007a703          	lw	a4,0(a5)
     f08:	fdc42783          	lw	a5,-36(s0)
     f0c:	0047a783          	lw	a5,4(a5)
     f10:	ffe78793          	add	a5,a5,-2
     f14:	fd042603          	lw	a2,-48(s0)
     f18:	00078593          	mv	a1,a5
     f1c:	00070513          	mv	a0,a4
     f20:	f38ff0ef          	jal	658 <tank_collision>
     f24:	00050793          	mv	a5,a0
     f28:	14079663          	bnez	a5,1074 <update_player_tank+0x768>
     f2c:	a70ff0ef          	jal	19c <wait_for_vga>
     f30:	fdc42783          	lw	a5,-36(s0)
     f34:	0007a783          	lw	a5,0(a5)
     f38:	01679713          	sll	a4,a5,0x16
     f3c:	fdc42783          	lw	a5,-36(s0)
     f40:	0047a783          	lw	a5,4(a5)
     f44:	00c79793          	sll	a5,a5,0xc
     f48:	00f76733          	or	a4,a4,a5
     f4c:	fdc42783          	lw	a5,-36(s0)
     f50:	0087a783          	lw	a5,8(a5)
     f54:	00279793          	sll	a5,a5,0x2
     f58:	00f767b3          	or	a5,a4,a5
     f5c:	0027e713          	or	a4,a5,2
     f60:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
     f64:	00e7a023          	sw	a4,0(a5)
     f68:	fdc42783          	lw	a5,-36(s0)
     f6c:	0047a783          	lw	a5,4(a5)
     f70:	ffe78713          	add	a4,a5,-2
     f74:	fdc42783          	lw	a5,-36(s0)
     f78:	00e7a223          	sw	a4,4(a5)
     f7c:	fd442783          	lw	a5,-44(s0)
     f80:	0007a703          	lw	a4,0(a5)
     f84:	fdc42783          	lw	a5,-36(s0)
     f88:	00e7a423          	sw	a4,8(a5)
     f8c:	00100793          	li	a5,1
     f90:	fef42623          	sw	a5,-20(s0)
     f94:	0e00006f          	j	1074 <update_player_tank+0x768>
     f98:	fd842783          	lw	a5,-40(s0)
     f9c:	0047a703          	lw	a4,4(a5)
     fa0:	00100793          	li	a5,1
     fa4:	0cf71863          	bne	a4,a5,1074 <update_player_tank+0x768>
     fa8:	fdc42783          	lw	a5,-36(s0)
     fac:	0047a703          	lw	a4,4(a5)
     fb0:	34300793          	li	a5,835
     fb4:	0ce7c063          	blt	a5,a4,1074 <update_player_tank+0x768>
     fb8:	fdc42783          	lw	a5,-36(s0)
     fbc:	0007a703          	lw	a4,0(a5)
     fc0:	fdc42783          	lw	a5,-36(s0)
     fc4:	0047a783          	lw	a5,4(a5)
     fc8:	00278793          	add	a5,a5,2
     fcc:	00078593          	mv	a1,a5
     fd0:	00070513          	mv	a0,a4
     fd4:	cc4ff0ef          	jal	498 <wall_collision>
     fd8:	00050793          	mv	a5,a0
     fdc:	08079c63          	bnez	a5,1074 <update_player_tank+0x768>
     fe0:	fdc42783          	lw	a5,-36(s0)
     fe4:	0007a703          	lw	a4,0(a5)
     fe8:	fdc42783          	lw	a5,-36(s0)
     fec:	0047a783          	lw	a5,4(a5)
     ff0:	00278793          	add	a5,a5,2
     ff4:	fd042603          	lw	a2,-48(s0)
     ff8:	00078593          	mv	a1,a5
     ffc:	00070513          	mv	a0,a4
    1000:	e58ff0ef          	jal	658 <tank_collision>
    1004:	00050793          	mv	a5,a0
    1008:	06079663          	bnez	a5,1074 <update_player_tank+0x768>
    100c:	990ff0ef          	jal	19c <wait_for_vga>
    1010:	fdc42783          	lw	a5,-36(s0)
    1014:	0007a783          	lw	a5,0(a5)
    1018:	01679713          	sll	a4,a5,0x16
    101c:	fdc42783          	lw	a5,-36(s0)
    1020:	0047a783          	lw	a5,4(a5)
    1024:	00c79793          	sll	a5,a5,0xc
    1028:	00f76733          	or	a4,a4,a5
    102c:	fdc42783          	lw	a5,-36(s0)
    1030:	0087a783          	lw	a5,8(a5)
    1034:	00279793          	sll	a5,a5,0x2
    1038:	00f767b3          	or	a5,a4,a5
    103c:	0027e713          	or	a4,a5,2
    1040:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
    1044:	00e7a023          	sw	a4,0(a5)
    1048:	fdc42783          	lw	a5,-36(s0)
    104c:	0047a783          	lw	a5,4(a5)
    1050:	00278713          	add	a4,a5,2
    1054:	fdc42783          	lw	a5,-36(s0)
    1058:	00e7a223          	sw	a4,4(a5)
    105c:	fd442783          	lw	a5,-44(s0)
    1060:	00c7a703          	lw	a4,12(a5)
    1064:	fdc42783          	lw	a5,-36(s0)
    1068:	00e7a423          	sw	a4,8(a5)
    106c:	00100793          	li	a5,1
    1070:	fef42623          	sw	a5,-20(s0)
    1074:	fec42703          	lw	a4,-20(s0)
    1078:	fe842783          	lw	a5,-24(s0)
    107c:	00f767b3          	or	a5,a4,a5
    1080:	06078e63          	beqz	a5,10fc <update_player_tank+0x7f0>
    1084:	918ff0ef          	jal	19c <wait_for_vga>
    1088:	fdc42783          	lw	a5,-36(s0)
    108c:	0007a783          	lw	a5,0(a5)
    1090:	01679713          	sll	a4,a5,0x16
    1094:	fdc42783          	lw	a5,-36(s0)
    1098:	0047a783          	lw	a5,4(a5)
    109c:	00c79793          	sll	a5,a5,0xc
    10a0:	00f76733          	or	a4,a4,a5
    10a4:	fdc42783          	lw	a5,-36(s0)
    10a8:	0087a783          	lw	a5,8(a5)
    10ac:	00279793          	sll	a5,a5,0x2
    10b0:	00f767b3          	or	a5,a4,a5
    10b4:	0017e713          	or	a4,a5,1
    10b8:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
    10bc:	00e7a023          	sw	a4,0(a5)
    10c0:	8dcff0ef          	jal	19c <wait_for_vga>
    10c4:	fdc42783          	lw	a5,-36(s0)
    10c8:	0007a783          	lw	a5,0(a5)
    10cc:	01679713          	sll	a4,a5,0x16
    10d0:	fdc42783          	lw	a5,-36(s0)
    10d4:	0047a783          	lw	a5,4(a5)
    10d8:	00c79793          	sll	a5,a5,0xc
    10dc:	00f76733          	or	a4,a4,a5
    10e0:	fdc42783          	lw	a5,-36(s0)
    10e4:	00c7a783          	lw	a5,12(a5)
    10e8:	00279793          	sll	a5,a5,0x2
    10ec:	00f767b3          	or	a5,a4,a5
    10f0:	0017e713          	or	a4,a5,1
    10f4:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
    10f8:	00e7a023          	sw	a4,0(a5)
    10fc:	00000013          	nop
    1100:	02c12083          	lw	ra,44(sp)
    1104:	02812403          	lw	s0,40(sp)
    1108:	03010113          	add	sp,sp,48
    110c:	00008067          	ret

00001110 <update_bullet>:
    1110:	fe010113          	add	sp,sp,-32
    1114:	00112e23          	sw	ra,28(sp)
    1118:	00812c23          	sw	s0,24(sp)
    111c:	02010413          	add	s0,sp,32
    1120:	fea42623          	sw	a0,-20(s0)
    1124:	feb42423          	sw	a1,-24(s0)
    1128:	fec42223          	sw	a2,-28(s0)
    112c:	fe842783          	lw	a5,-24(s0)
    1130:	0007a703          	lw	a4,0(a5)
    1134:	00100793          	li	a5,1
    1138:	30f71a63          	bne	a4,a5,144c <update_bullet+0x33c>
    113c:	fe442783          	lw	a5,-28(s0)
    1140:	0147a703          	lw	a4,20(a5)
    1144:	00200793          	li	a5,2
    1148:	5ef71463          	bne	a4,a5,1730 <update_bullet+0x620>
    114c:	fec42783          	lw	a5,-20(s0)
    1150:	00c7a703          	lw	a4,12(a5)
    1154:	02200793          	li	a5,34
    1158:	02f71e63          	bne	a4,a5,1194 <update_bullet+0x84>
    115c:	fe842783          	lw	a5,-24(s0)
    1160:	00100713          	li	a4,1
    1164:	00e7a223          	sw	a4,4(a5)
    1168:	fec42783          	lw	a5,-20(s0)
    116c:	0007a783          	lw	a5,0(a5)
    1170:	04078713          	add	a4,a5,64
    1174:	fe842783          	lw	a5,-24(s0)
    1178:	00e7a423          	sw	a4,8(a5)
    117c:	fec42783          	lw	a5,-20(s0)
    1180:	0047a783          	lw	a5,4(a5)
    1184:	02078713          	add	a4,a5,32
    1188:	fe842783          	lw	a5,-24(s0)
    118c:	00e7a623          	sw	a4,12(a5)
    1190:	1f80006f          	j	1388 <update_bullet+0x278>
    1194:	fec42783          	lw	a5,-20(s0)
    1198:	00c7a703          	lw	a4,12(a5)
    119c:	02300793          	li	a5,35
    11a0:	02f71e63          	bne	a4,a5,11dc <update_bullet+0xcc>
    11a4:	fe842783          	lw	a5,-24(s0)
    11a8:	00200713          	li	a4,2
    11ac:	00e7a223          	sw	a4,4(a5)
    11b0:	fec42783          	lw	a5,-20(s0)
    11b4:	0007a783          	lw	a5,0(a5)
    11b8:	01078713          	add	a4,a5,16
    11bc:	fe842783          	lw	a5,-24(s0)
    11c0:	00e7a423          	sw	a4,8(a5)
    11c4:	fec42783          	lw	a5,-20(s0)
    11c8:	0047a783          	lw	a5,4(a5)
    11cc:	fd878713          	add	a4,a5,-40
    11d0:	fe842783          	lw	a5,-24(s0)
    11d4:	00e7a623          	sw	a4,12(a5)
    11d8:	1b00006f          	j	1388 <update_bullet+0x278>
    11dc:	fec42783          	lw	a5,-20(s0)
    11e0:	00c7a703          	lw	a4,12(a5)
    11e4:	02400793          	li	a5,36
    11e8:	02f71e63          	bne	a4,a5,1224 <update_bullet+0x114>
    11ec:	fe842783          	lw	a5,-24(s0)
    11f0:	00300713          	li	a4,3
    11f4:	00e7a223          	sw	a4,4(a5)
    11f8:	fec42783          	lw	a5,-20(s0)
    11fc:	0007a783          	lw	a5,0(a5)
    1200:	04078713          	add	a4,a5,64
    1204:	fe842783          	lw	a5,-24(s0)
    1208:	00e7a423          	sw	a4,8(a5)
    120c:	fec42783          	lw	a5,-20(s0)
    1210:	0047a783          	lw	a5,4(a5)
    1214:	fdc78713          	add	a4,a5,-36
    1218:	fe842783          	lw	a5,-24(s0)
    121c:	00e7a623          	sw	a4,12(a5)
    1220:	1680006f          	j	1388 <update_bullet+0x278>
    1224:	fec42783          	lw	a5,-20(s0)
    1228:	00c7a703          	lw	a4,12(a5)
    122c:	02500793          	li	a5,37
    1230:	02f71e63          	bne	a4,a5,126c <update_bullet+0x15c>
    1234:	fe842783          	lw	a5,-24(s0)
    1238:	00400713          	li	a4,4
    123c:	00e7a223          	sw	a4,4(a5)
    1240:	fec42783          	lw	a5,-20(s0)
    1244:	0007a783          	lw	a5,0(a5)
    1248:	fe078713          	add	a4,a5,-32
    124c:	fe842783          	lw	a5,-24(s0)
    1250:	00e7a423          	sw	a4,8(a5)
    1254:	fec42783          	lw	a5,-20(s0)
    1258:	0047a783          	lw	a5,4(a5)
    125c:	fde78713          	add	a4,a5,-34
    1260:	fe842783          	lw	a5,-24(s0)
    1264:	00e7a623          	sw	a4,12(a5)
    1268:	1200006f          	j	1388 <update_bullet+0x278>
    126c:	fec42783          	lw	a5,-20(s0)
    1270:	00c7a703          	lw	a4,12(a5)
    1274:	02600793          	li	a5,38
    1278:	02f71e63          	bne	a4,a5,12b4 <update_bullet+0x1a4>
    127c:	fe842783          	lw	a5,-24(s0)
    1280:	00500713          	li	a4,5
    1284:	00e7a223          	sw	a4,4(a5)
    1288:	fec42783          	lw	a5,-20(s0)
    128c:	0007a783          	lw	a5,0(a5)
    1290:	01078713          	add	a4,a5,16
    1294:	fe842783          	lw	a5,-24(s0)
    1298:	00e7a423          	sw	a4,8(a5)
    129c:	fec42783          	lw	a5,-20(s0)
    12a0:	0047a783          	lw	a5,4(a5)
    12a4:	06a78713          	add	a4,a5,106
    12a8:	fe842783          	lw	a5,-24(s0)
    12ac:	00e7a623          	sw	a4,12(a5)
    12b0:	0d80006f          	j	1388 <update_bullet+0x278>
    12b4:	fec42783          	lw	a5,-20(s0)
    12b8:	00c7a703          	lw	a4,12(a5)
    12bc:	02700793          	li	a5,39
    12c0:	02f71e63          	bne	a4,a5,12fc <update_bullet+0x1ec>
    12c4:	fe842783          	lw	a5,-24(s0)
    12c8:	00600713          	li	a4,6
    12cc:	00e7a223          	sw	a4,4(a5)
    12d0:	fec42783          	lw	a5,-20(s0)
    12d4:	0007a783          	lw	a5,0(a5)
    12d8:	04078713          	add	a4,a5,64
    12dc:	fe842783          	lw	a5,-24(s0)
    12e0:	00e7a423          	sw	a4,8(a5)
    12e4:	fec42783          	lw	a5,-20(s0)
    12e8:	0047a783          	lw	a5,4(a5)
    12ec:	06a78713          	add	a4,a5,106
    12f0:	fe842783          	lw	a5,-24(s0)
    12f4:	00e7a623          	sw	a4,12(a5)
    12f8:	0900006f          	j	1388 <update_bullet+0x278>
    12fc:	fec42783          	lw	a5,-20(s0)
    1300:	00c7a703          	lw	a4,12(a5)
    1304:	02800793          	li	a5,40
    1308:	02f71e63          	bne	a4,a5,1344 <update_bullet+0x234>
    130c:	fe842783          	lw	a5,-24(s0)
    1310:	00700713          	li	a4,7
    1314:	00e7a223          	sw	a4,4(a5)
    1318:	fec42783          	lw	a5,-20(s0)
    131c:	0007a783          	lw	a5,0(a5)
    1320:	fe078713          	add	a4,a5,-32
    1324:	fe842783          	lw	a5,-24(s0)
    1328:	00e7a423          	sw	a4,8(a5)
    132c:	fec42783          	lw	a5,-20(s0)
    1330:	0047a783          	lw	a5,4(a5)
    1334:	06a78713          	add	a4,a5,106
    1338:	fe842783          	lw	a5,-24(s0)
    133c:	00e7a623          	sw	a4,12(a5)
    1340:	0480006f          	j	1388 <update_bullet+0x278>
    1344:	fec42783          	lw	a5,-20(s0)
    1348:	00c7a703          	lw	a4,12(a5)
    134c:	02900793          	li	a5,41
    1350:	02f71c63          	bne	a4,a5,1388 <update_bullet+0x278>
    1354:	fe842783          	lw	a5,-24(s0)
    1358:	00800713          	li	a4,8
    135c:	00e7a223          	sw	a4,4(a5)
    1360:	fec42783          	lw	a5,-20(s0)
    1364:	0007a783          	lw	a5,0(a5)
    1368:	fe078713          	add	a4,a5,-32
    136c:	fe842783          	lw	a5,-24(s0)
    1370:	00e7a423          	sw	a4,8(a5)
    1374:	fec42783          	lw	a5,-20(s0)
    1378:	0047a783          	lw	a5,4(a5)
    137c:	02078713          	add	a4,a5,32
    1380:	fe842783          	lw	a5,-24(s0)
    1384:	00e7a623          	sw	a4,12(a5)
    1388:	fe842783          	lw	a5,-24(s0)
    138c:	0087a703          	lw	a4,8(a5)
    1390:	fe842783          	lw	a5,-24(s0)
    1394:	00c7a783          	lw	a5,12(a5)
    1398:	00078593          	mv	a1,a5
    139c:	00070513          	mv	a0,a4
    13a0:	9d8ff0ef          	jal	578 <bullet_collision>
    13a4:	00050793          	mv	a5,a0
    13a8:	36079e63          	bnez	a5,1724 <update_bullet+0x614>
    13ac:	fe842783          	lw	a5,-24(s0)
    13b0:	0087a703          	lw	a4,8(a5)
    13b4:	26700793          	li	a5,615
    13b8:	36e7ca63          	blt	a5,a4,172c <update_bullet+0x61c>
    13bc:	fe842783          	lw	a5,-24(s0)
    13c0:	0087a703          	lw	a4,8(a5)
    13c4:	00100793          	li	a5,1
    13c8:	36e7d263          	bge	a5,a4,172c <update_bullet+0x61c>
    13cc:	fe842783          	lw	a5,-24(s0)
    13d0:	00c7a703          	lw	a4,12(a5)
    13d4:	37300793          	li	a5,883
    13d8:	34e7ca63          	blt	a5,a4,172c <update_bullet+0x61c>
    13dc:	fe842783          	lw	a5,-24(s0)
    13e0:	00c7a703          	lw	a4,12(a5)
    13e4:	00100793          	li	a5,1
    13e8:	34e7d263          	bge	a5,a4,172c <update_bullet+0x61c>
    13ec:	fe842783          	lw	a5,-24(s0)
    13f0:	00200713          	li	a4,2
    13f4:	00e7a023          	sw	a4,0(a5)
    13f8:	da5fe0ef          	jal	19c <wait_for_vga>
    13fc:	fe842783          	lw	a5,-24(s0)
    1400:	0087a783          	lw	a5,8(a5)
    1404:	01679713          	sll	a4,a5,0x16
    1408:	fe842783          	lw	a5,-24(s0)
    140c:	00c7a783          	lw	a5,12(a5)
    1410:	00c79793          	sll	a5,a5,0xc
    1414:	00f76733          	or	a4,a4,a5
    1418:	fe842783          	lw	a5,-24(s0)
    141c:	0047a783          	lw	a5,4(a5)
    1420:	00279793          	sll	a5,a5,0x2
    1424:	00f767b3          	or	a5,a4,a5
    1428:	0017e713          	or	a4,a5,1
    142c:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
    1430:	00e7a023          	sw	a4,0(a5)
    1434:	8c81a783          	lw	a5,-1848(gp) # 199c <debug>
    1438:	0007a023          	sw	zero,0(a5)
    143c:	8c81a783          	lw	a5,-1848(gp) # 199c <debug>
    1440:	03700713          	li	a4,55
    1444:	00e7a023          	sw	a4,0(a5)
    1448:	2e80006f          	j	1730 <update_bullet+0x620>
    144c:	fe842783          	lw	a5,-24(s0)
    1450:	0007a703          	lw	a4,0(a5)
    1454:	00200793          	li	a5,2
    1458:	2cf71c63          	bne	a4,a5,1730 <update_bullet+0x620>
    145c:	fe842783          	lw	a5,-24(s0)
    1460:	0087a703          	lw	a4,8(a5)
    1464:	26700793          	li	a5,615
    1468:	02e7ca63          	blt	a5,a4,149c <update_bullet+0x38c>
    146c:	fe842783          	lw	a5,-24(s0)
    1470:	0087a703          	lw	a4,8(a5)
    1474:	00100793          	li	a5,1
    1478:	02e7d263          	bge	a5,a4,149c <update_bullet+0x38c>
    147c:	fe842783          	lw	a5,-24(s0)
    1480:	00c7a703          	lw	a4,12(a5)
    1484:	37300793          	li	a5,883
    1488:	00e7ca63          	blt	a5,a4,149c <update_bullet+0x38c>
    148c:	fe842783          	lw	a5,-24(s0)
    1490:	00c7a703          	lw	a4,12(a5)
    1494:	00100793          	li	a5,1
    1498:	04e7c863          	blt	a5,a4,14e8 <update_bullet+0x3d8>
    149c:	fe842783          	lw	a5,-24(s0)
    14a0:	00100713          	li	a4,1
    14a4:	00e7a023          	sw	a4,0(a5)
    14a8:	cf5fe0ef          	jal	19c <wait_for_vga>
    14ac:	fe842783          	lw	a5,-24(s0)
    14b0:	0087a783          	lw	a5,8(a5)
    14b4:	01679713          	sll	a4,a5,0x16
    14b8:	fe842783          	lw	a5,-24(s0)
    14bc:	00c7a783          	lw	a5,12(a5)
    14c0:	00c79793          	sll	a5,a5,0xc
    14c4:	00f76733          	or	a4,a4,a5
    14c8:	fe842783          	lw	a5,-24(s0)
    14cc:	0047a783          	lw	a5,4(a5)
    14d0:	00279793          	sll	a5,a5,0x2
    14d4:	00f767b3          	or	a5,a4,a5
    14d8:	0027e713          	or	a4,a5,2
    14dc:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
    14e0:	00e7a023          	sw	a4,0(a5)
    14e4:	24c0006f          	j	1730 <update_bullet+0x620>
    14e8:	fe842783          	lw	a5,-24(s0)
    14ec:	0087a703          	lw	a4,8(a5)
    14f0:	fe842783          	lw	a5,-24(s0)
    14f4:	00c7a783          	lw	a5,12(a5)
    14f8:	00078593          	mv	a1,a5
    14fc:	00070513          	mv	a0,a4
    1500:	878ff0ef          	jal	578 <bullet_collision>
    1504:	00050793          	mv	a5,a0
    1508:	04078863          	beqz	a5,1558 <update_bullet+0x448>
    150c:	fe842783          	lw	a5,-24(s0)
    1510:	00100713          	li	a4,1
    1514:	00e7a023          	sw	a4,0(a5)
    1518:	c85fe0ef          	jal	19c <wait_for_vga>
    151c:	fe842783          	lw	a5,-24(s0)
    1520:	0087a783          	lw	a5,8(a5)
    1524:	01679713          	sll	a4,a5,0x16
    1528:	fe842783          	lw	a5,-24(s0)
    152c:	00c7a783          	lw	a5,12(a5)
    1530:	00c79793          	sll	a5,a5,0xc
    1534:	00f76733          	or	a4,a4,a5
    1538:	fe842783          	lw	a5,-24(s0)
    153c:	0047a783          	lw	a5,4(a5)
    1540:	00279793          	sll	a5,a5,0x2
    1544:	00f767b3          	or	a5,a4,a5
    1548:	0027e713          	or	a4,a5,2
    154c:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
    1550:	00e7a023          	sw	a4,0(a5)
    1554:	1dc0006f          	j	1730 <update_bullet+0x620>
    1558:	fe842783          	lw	a5,-24(s0)
    155c:	0047a703          	lw	a4,4(a5)
    1560:	00100793          	li	a5,1
    1564:	00f71e63          	bne	a4,a5,1580 <update_bullet+0x470>
    1568:	fe842783          	lw	a5,-24(s0)
    156c:	0087a783          	lw	a5,8(a5)
    1570:	00178713          	add	a4,a5,1
    1574:	fe842783          	lw	a5,-24(s0)
    1578:	00e7a423          	sw	a4,8(a5)
    157c:	1680006f          	j	16e4 <update_bullet+0x5d4>
    1580:	fe842783          	lw	a5,-24(s0)
    1584:	0047a703          	lw	a4,4(a5)
    1588:	00200793          	li	a5,2
    158c:	00f71e63          	bne	a4,a5,15a8 <update_bullet+0x498>
    1590:	fe842783          	lw	a5,-24(s0)
    1594:	00c7a783          	lw	a5,12(a5)
    1598:	ffe78713          	add	a4,a5,-2
    159c:	fe842783          	lw	a5,-24(s0)
    15a0:	00e7a623          	sw	a4,12(a5)
    15a4:	1400006f          	j	16e4 <update_bullet+0x5d4>
    15a8:	fe842783          	lw	a5,-24(s0)
    15ac:	0047a703          	lw	a4,4(a5)
    15b0:	00300793          	li	a5,3
    15b4:	02f71863          	bne	a4,a5,15e4 <update_bullet+0x4d4>
    15b8:	fe842783          	lw	a5,-24(s0)
    15bc:	00c7a783          	lw	a5,12(a5)
    15c0:	ffe78713          	add	a4,a5,-2
    15c4:	fe842783          	lw	a5,-24(s0)
    15c8:	00e7a623          	sw	a4,12(a5)
    15cc:	fe842783          	lw	a5,-24(s0)
    15d0:	0087a783          	lw	a5,8(a5)
    15d4:	00178713          	add	a4,a5,1
    15d8:	fe842783          	lw	a5,-24(s0)
    15dc:	00e7a423          	sw	a4,8(a5)
    15e0:	1040006f          	j	16e4 <update_bullet+0x5d4>
    15e4:	fe842783          	lw	a5,-24(s0)
    15e8:	0047a703          	lw	a4,4(a5)
    15ec:	00400793          	li	a5,4
    15f0:	02f71863          	bne	a4,a5,1620 <update_bullet+0x510>
    15f4:	fe842783          	lw	a5,-24(s0)
    15f8:	0087a783          	lw	a5,8(a5)
    15fc:	fff78713          	add	a4,a5,-1
    1600:	fe842783          	lw	a5,-24(s0)
    1604:	00e7a423          	sw	a4,8(a5)
    1608:	fe842783          	lw	a5,-24(s0)
    160c:	00c7a783          	lw	a5,12(a5)
    1610:	ffe78713          	add	a4,a5,-2
    1614:	fe842783          	lw	a5,-24(s0)
    1618:	00e7a623          	sw	a4,12(a5)
    161c:	0c80006f          	j	16e4 <update_bullet+0x5d4>
    1620:	fe842783          	lw	a5,-24(s0)
    1624:	0047a703          	lw	a4,4(a5)
    1628:	00500793          	li	a5,5
    162c:	00f71e63          	bne	a4,a5,1648 <update_bullet+0x538>
    1630:	fe842783          	lw	a5,-24(s0)
    1634:	00c7a783          	lw	a5,12(a5)
    1638:	00278713          	add	a4,a5,2
    163c:	fe842783          	lw	a5,-24(s0)
    1640:	00e7a623          	sw	a4,12(a5)
    1644:	0a00006f          	j	16e4 <update_bullet+0x5d4>
    1648:	fe842783          	lw	a5,-24(s0)
    164c:	0047a703          	lw	a4,4(a5)
    1650:	00600793          	li	a5,6
    1654:	02f71863          	bne	a4,a5,1684 <update_bullet+0x574>
    1658:	fe842783          	lw	a5,-24(s0)
    165c:	0087a783          	lw	a5,8(a5)
    1660:	00178713          	add	a4,a5,1
    1664:	fe842783          	lw	a5,-24(s0)
    1668:	00e7a423          	sw	a4,8(a5)
    166c:	fe842783          	lw	a5,-24(s0)
    1670:	00c7a783          	lw	a5,12(a5)
    1674:	00278713          	add	a4,a5,2
    1678:	fe842783          	lw	a5,-24(s0)
    167c:	00e7a623          	sw	a4,12(a5)
    1680:	0640006f          	j	16e4 <update_bullet+0x5d4>
    1684:	fe842783          	lw	a5,-24(s0)
    1688:	0047a703          	lw	a4,4(a5)
    168c:	00700793          	li	a5,7
    1690:	02f71863          	bne	a4,a5,16c0 <update_bullet+0x5b0>
    1694:	fe842783          	lw	a5,-24(s0)
    1698:	0087a783          	lw	a5,8(a5)
    169c:	fff78713          	add	a4,a5,-1
    16a0:	fe842783          	lw	a5,-24(s0)
    16a4:	00e7a423          	sw	a4,8(a5)
    16a8:	fe842783          	lw	a5,-24(s0)
    16ac:	00c7a783          	lw	a5,12(a5)
    16b0:	00278713          	add	a4,a5,2
    16b4:	fe842783          	lw	a5,-24(s0)
    16b8:	00e7a623          	sw	a4,12(a5)
    16bc:	0280006f          	j	16e4 <update_bullet+0x5d4>
    16c0:	fe842783          	lw	a5,-24(s0)
    16c4:	0047a703          	lw	a4,4(a5)
    16c8:	00800793          	li	a5,8
    16cc:	00f71c63          	bne	a4,a5,16e4 <update_bullet+0x5d4>
    16d0:	fe842783          	lw	a5,-24(s0)
    16d4:	0087a783          	lw	a5,8(a5)
    16d8:	fff78713          	add	a4,a5,-1
    16dc:	fe842783          	lw	a5,-24(s0)
    16e0:	00e7a423          	sw	a4,8(a5)
    16e4:	ab9fe0ef          	jal	19c <wait_for_vga>
    16e8:	fe842783          	lw	a5,-24(s0)
    16ec:	0087a783          	lw	a5,8(a5)
    16f0:	01679713          	sll	a4,a5,0x16
    16f4:	fe842783          	lw	a5,-24(s0)
    16f8:	00c7a783          	lw	a5,12(a5)
    16fc:	00c79793          	sll	a5,a5,0xc
    1700:	00f76733          	or	a4,a4,a5
    1704:	fe842783          	lw	a5,-24(s0)
    1708:	0047a783          	lw	a5,4(a5)
    170c:	00279793          	sll	a5,a5,0x2
    1710:	00f767b3          	or	a5,a4,a5
    1714:	0017e713          	or	a4,a5,1
    1718:	8d01a783          	lw	a5,-1840(gp) # 19a4 <VGA>
    171c:	00e7a023          	sw	a4,0(a5)
    1720:	0100006f          	j	1730 <update_bullet+0x620>
    1724:	00000013          	nop
    1728:	0080006f          	j	1730 <update_bullet+0x620>
    172c:	00000013          	nop
    1730:	01c12083          	lw	ra,28(sp)
    1734:	01812403          	lw	s0,24(sp)
    1738:	02010113          	add	sp,sp,32
    173c:	00008067          	ret

00001740 <main>:
    1740:	fe010113          	add	sp,sp,-32
    1744:	00112e23          	sw	ra,28(sp)
    1748:	00812c23          	sw	s0,24(sp)
    174c:	02010413          	add	s0,sp,32
    1750:	a7dfe0ef          	jal	1cc <init>
    1754:	8c81a783          	lw	a5,-1848(gp) # 199c <debug>
    1758:	0007a023          	sw	zero,0(a5)
    175c:	8c81a783          	lw	a5,-1848(gp) # 199c <debug>
    1760:	03900713          	li	a4,57
    1764:	00e7a023          	sw	a4,0(a5)
    1768:	00100793          	li	a5,1
    176c:	fef42623          	sw	a5,-20(s0)
    1770:	0c80006f          	j	1838 <main+0xf8>
    1774:	8d818513          	add	a0,gp,-1832 # 19ac <joy1>
    1778:	8a9fe0ef          	jal	20 <read_joystick>
    177c:	8f418513          	add	a0,gp,-1804 # 19c8 <joy2>
    1780:	959fe0ef          	jal	d8 <read_joystick_2>
    1784:	89818693          	add	a3,gp,-1896 # 196c <enemy>
    1788:	000027b7          	lui	a5,0x2
    178c:	8d478613          	add	a2,a5,-1836 # 18d4 <player_direct>
    1790:	8d818593          	add	a1,gp,-1832 # 19ac <joy1>
    1794:	88818513          	add	a0,gp,-1912 # 195c <player>
    1798:	974ff0ef          	jal	90c <update_player_tank>
    179c:	88818693          	add	a3,gp,-1912 # 195c <player>
    17a0:	000027b7          	lui	a5,0x2
    17a4:	8e478613          	add	a2,a5,-1820 # 18e4 <enemy_direct>
    17a8:	8f418593          	add	a1,gp,-1804 # 19c8 <joy2>
    17ac:	89818513          	add	a0,gp,-1896 # 196c <enemy>
    17b0:	95cff0ef          	jal	90c <update_player_tank>
    17b4:	8d818613          	add	a2,gp,-1832 # 19ac <joy1>
    17b8:	8a818593          	add	a1,gp,-1880 # 197c <player_bullet>
    17bc:	88818513          	add	a0,gp,-1912 # 195c <player>
    17c0:	951ff0ef          	jal	1110 <update_bullet>
    17c4:	8f418613          	add	a2,gp,-1804 # 19c8 <joy2>
    17c8:	8b818593          	add	a1,gp,-1864 # 198c <enemy_bullet>
    17cc:	89818513          	add	a0,gp,-1896 # 196c <enemy>
    17d0:	941ff0ef          	jal	1110 <update_bullet>
    17d4:	89818593          	add	a1,gp,-1896 # 196c <enemy>
    17d8:	8a818513          	add	a0,gp,-1880 # 197c <player_bullet>
    17dc:	f01fe0ef          	jal	6dc <bullet_tank>
    17e0:	00050793          	mv	a5,a0
    17e4:	00079c63          	bnez	a5,17fc <main+0xbc>
    17e8:	88818593          	add	a1,gp,-1912 # 195c <player>
    17ec:	8b818513          	add	a0,gp,-1864 # 198c <enemy_bullet>
    17f0:	eedfe0ef          	jal	6dc <bullet_tank>
    17f4:	00050793          	mv	a5,a0
    17f8:	00078e63          	beqz	a5,1814 <main+0xd4>
    17fc:	fe042623          	sw	zero,-20(s0)
    1800:	8c81a783          	lw	a5,-1848(gp) # 199c <debug>
    1804:	0007a023          	sw	zero,0(a5)
    1808:	8c81a783          	lw	a5,-1848(gp) # 199c <debug>
    180c:	03800713          	li	a4,56
    1810:	00e7a023          	sw	a4,0(a5)
    1814:	fe042423          	sw	zero,-24(s0)
    1818:	0100006f          	j	1828 <main+0xe8>
    181c:	fe842783          	lw	a5,-24(s0)
    1820:	00178793          	add	a5,a5,1
    1824:	fef42423          	sw	a5,-24(s0)
    1828:	fe842703          	lw	a4,-24(s0)
    182c:	000027b7          	lui	a5,0x2
    1830:	70f78793          	add	a5,a5,1807 # 270f <__global_pointer$+0x63b>
    1834:	fee7d4e3          	bge	a5,a4,181c <main+0xdc>
    1838:	fec42783          	lw	a5,-20(s0)
    183c:	f2079ce3          	bnez	a5,1774 <main+0x34>
    1840:	89818593          	add	a1,gp,-1896 # 196c <enemy>
    1844:	8a818513          	add	a0,gp,-1880 # 197c <player_bullet>
    1848:	e95fe0ef          	jal	6dc <bullet_tank>
    184c:	00050793          	mv	a5,a0
    1850:	00078863          	beqz	a5,1860 <main+0x120>
    1854:	89818513          	add	a0,gp,-1896 # 196c <enemy>
    1858:	f8dfe0ef          	jal	7e4 <flash_tank>
    185c:	fddff06f          	j	1838 <main+0xf8>
    1860:	88818593          	add	a1,gp,-1912 # 195c <player>
    1864:	8b818513          	add	a0,gp,-1864 # 198c <enemy_bullet>
    1868:	e75fe0ef          	jal	6dc <bullet_tank>
    186c:	00050793          	mv	a5,a0
    1870:	fc0784e3          	beqz	a5,1838 <main+0xf8>
    1874:	88818513          	add	a0,gp,-1912 # 195c <player>
    1878:	f6dfe0ef          	jal	7e4 <flash_tank>
    187c:	fbdff06f          	j	1838 <main+0xf8>

Disassembly of section .eh_frame:

00001880 <.eh_frame>:
    1880:	0014                	.insn	2, 0x0014
    1882:	0000                	.insn	2, 0x
    1884:	0000                	.insn	2, 0x
    1886:	0000                	.insn	2, 0x
    1888:	00527a03          	.insn	4, 0x00527a03
    188c:	7c01                	.insn	2, 0x7c01
    188e:	0101                	.insn	2, 0x0101
    1890:	07020d1b          	.insn	4, 0x07020d1b
    1894:	0001                	.insn	2, 0x0001
    1896:	0000                	.insn	2, 0x
    1898:	0010                	.insn	2, 0x0010
    189a:	0000                	.insn	2, 0x
    189c:	001c                	.insn	2, 0x001c
    189e:	0000                	.insn	2, 0x
    18a0:	e760                	.insn	2, 0xe760
    18a2:	ffff                	.insn	2, 0xffff
    18a4:	0018                	.insn	2, 0x0018
    18a6:	0000                	.insn	2, 0x
    18a8:	0000                	.insn	2, 0x
    18aa:	0000                	.insn	2, 0x
    18ac:	0010                	.insn	2, 0x0010
    18ae:	0000                	.insn	2, 0x
    18b0:	0000                	.insn	2, 0x
    18b2:	0000                	.insn	2, 0x
    18b4:	00527a03          	.insn	4, 0x00527a03
    18b8:	7c01                	.insn	2, 0x7c01
    18ba:	0101                	.insn	2, 0x0101
    18bc:	00020d1b          	.insn	4, 0x00020d1b
    18c0:	0010                	.insn	2, 0x0010
    18c2:	0000                	.insn	2, 0x
    18c4:	0018                	.insn	2, 0x0018
    18c6:	0000                	.insn	2, 0x
    18c8:	e750                	.insn	2, 0xe750
    18ca:	ffff                	.insn	2, 0xffff
    18cc:	0008                	.insn	2, 0x0008
    18ce:	0000                	.insn	2, 0x
    18d0:	0000                	.insn	2, 0x
	...

Disassembly of section .data:

000018d4 <player_direct>:
    18d4:	001f 0000 0021      	.insn	6, 0x00210000001f
    18da:	0000                	.insn	2, 0x
    18dc:	001e                	.insn	2, 0x001e
    18de:	0000                	.insn	2, 0x
    18e0:	0020                	.insn	2, 0x0020
	...

000018e4 <enemy_direct>:
    18e4:	00000013          	nop
    18e8:	0015                	.insn	2, 0x0015
    18ea:	0000                	.insn	2, 0x
    18ec:	0012                	.insn	2, 0x0012
    18ee:	0000                	.insn	2, 0x
    18f0:	0014                	.insn	2, 0x0014
	...

000018f4 <blocks>:
    18f4:	0046                	.insn	2, 0x0046
    18f6:	0000                	.insn	2, 0x
    18f8:	0344                	.insn	2, 0x0344
    18fa:	0000                	.insn	2, 0x
    18fc:	0046                	.insn	2, 0x0046
    18fe:	0000                	.insn	2, 0x
    1900:	02c4                	.insn	2, 0x02c4
    1902:	0000                	.insn	2, 0x
    1904:	0046                	.insn	2, 0x0046
    1906:	0000                	.insn	2, 0x
    1908:	0244                	.insn	2, 0x0244
    190a:	0000                	.insn	2, 0x
    190c:	0005                	.insn	2, 0x0005
    190e:	0000                	.insn	2, 0x
    1910:	0005                	.insn	2, 0x0005
    1912:	0000                	.insn	2, 0x
    1914:	0000004b          	.insn	4, 0x004b
    1918:	0000004b          	.insn	4, 0x004b
    191c:	0091                	.insn	2, 0x0091
    191e:	0000                	.insn	2, 0x
    1920:	0091                	.insn	2, 0x0091
    1922:	0000                	.insn	2, 0x
    1924:	012c                	.insn	2, 0x012c
    1926:	0000                	.insn	2, 0x
    1928:	012c                	.insn	2, 0x012c
    192a:	0000                	.insn	2, 0x
    192c:	012c                	.insn	2, 0x012c
    192e:	0000                	.insn	2, 0x
    1930:	01ac                	.insn	2, 0x01ac
    1932:	0000                	.insn	2, 0x
    1934:	016c                	.insn	2, 0x016c
    1936:	0000                	.insn	2, 0x
    1938:	012c                	.insn	2, 0x012c
    193a:	0000                	.insn	2, 0x
    193c:	01f4                	.insn	2, 0x01f4
    193e:	0000                	.insn	2, 0x
    1940:	0344                	.insn	2, 0x0344
    1942:	0000                	.insn	2, 0x
    1944:	01f4                	.insn	2, 0x01f4
    1946:	0000                	.insn	2, 0x
    1948:	02c4                	.insn	2, 0x02c4
    194a:	0000                	.insn	2, 0x
    194c:	01b4                	.insn	2, 0x01b4
    194e:	0000                	.insn	2, 0x
    1950:	02c4                	.insn	2, 0x02c4
    1952:	0000                	.insn	2, 0x
    1954:	01f4                	.insn	2, 0x01f4
    1956:	0000                	.insn	2, 0x
    1958:	0005                	.insn	2, 0x0005
	...

0000195c <player>:
    195c:	0005                	.insn	2, 0x0005
    195e:	0000                	.insn	2, 0x
    1960:	0334                	.insn	2, 0x0334
    1962:	0000                	.insn	2, 0x
    1964:	001f 0000 0023      	.insn	6, 0x00230000001f
	...

0000196c <enemy>:
    196c:	00000013          	nop
    1970:	0026                	.insn	2, 0x0026
    1972:	0000                	.insn	2, 0x
    1974:	023e                	.insn	2, 0x023e
    1976:	0000                	.insn	2, 0x
    1978:	0005                	.insn	2, 0x0005
	...

0000197c <player_bullet>:
    197c:	0001                	.insn	2, 0x0001
    197e:	0000                	.insn	2, 0x
    1980:	0002                	.insn	2, 0x0002
    1982:	0000                	.insn	2, 0x
    1984:	0001                	.insn	2, 0x0001
    1986:	0000                	.insn	2, 0x
    1988:	0001                	.insn	2, 0x0001
	...

0000198c <enemy_bullet>:
    198c:	0001                	.insn	2, 0x0001
    198e:	0000                	.insn	2, 0x
    1990:	0002                	.insn	2, 0x0002
    1992:	0000                	.insn	2, 0x
    1994:	0001                	.insn	2, 0x0001
    1996:	0000                	.insn	2, 0x
    1998:	0001                	.insn	2, 0x0001
	...

Disassembly of section .sdata:

0000199c <debug>:
    199c:	c001                	.insn	2, 0xc001
    199e:	ffff                	.insn	2, 0xffff

000019a0 <joystick>:
    19a0:	c002                	.insn	2, 0xc002
    19a2:	ffff                	.insn	2, 0xffff

000019a4 <VGA>:
    19a4:	ffffc003          	lbu	zero,-1(t6)

000019a8 <joystick2>:
    19a8:	c004                	.insn	2, 0xc004
    19aa:	ffff                	.insn	2, 0xffff

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
