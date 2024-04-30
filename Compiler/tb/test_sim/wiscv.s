
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00002197          	auipc	gp,0x2
       4:	e3018193          	add	gp,gp,-464 # 1e30 <__global_pointer$>
       8:	1d018113          	add	sp,gp,464 # 2000 <__stack_top>
       c:	00010433          	add	s0,sp,zero
      10:	558010ef          	jal	1568 <main>
      14:	004000ef          	jal	18 <_exit>

00000018 <_exit>:
      18:	05d00893          	li	a7,93
      1c:	00000073          	ecall

00000020 <read_joystick>:
      20:	ff010113          	add	sp,sp,-16
      24:	00812623          	sw	s0,12(sp)
      28:	01010413          	add	s0,sp,16
      2c:	8ac1a783          	lw	a5,-1876(gp) # 16dc <joystick>
      30:	0007a783          	lw	a5,0(a5)
      34:	00a7d793          	srl	a5,a5,0xa
      38:	0037f713          	and	a4,a5,3
      3c:	8ae1aa23          	sw	a4,-1868(gp) # 16e4 <x1_val>
      40:	8ac1a783          	lw	a5,-1876(gp) # 16dc <joystick>
      44:	0007a783          	lw	a5,0(a5)
      48:	0087d793          	srl	a5,a5,0x8
      4c:	0037f713          	and	a4,a5,3
      50:	8ae1ac23          	sw	a4,-1864(gp) # 16e8 <y1_val>
      54:	8ac1a783          	lw	a5,-1876(gp) # 16dc <joystick>
      58:	0007a783          	lw	a5,0(a5)
      5c:	0067d793          	srl	a5,a5,0x6
      60:	0037f713          	and	a4,a5,3
      64:	8ae1ae23          	sw	a4,-1860(gp) # 16ec <ps1_val>
      68:	8ac1a783          	lw	a5,-1876(gp) # 16dc <joystick>
      6c:	0007a783          	lw	a5,0(a5)
      70:	0047d793          	srl	a5,a5,0x4
      74:	0037f713          	and	a4,a5,3
      78:	8ce1a023          	sw	a4,-1856(gp) # 16f0 <x2_val>
      7c:	8ac1a783          	lw	a5,-1876(gp) # 16dc <joystick>
      80:	0007a783          	lw	a5,0(a5)
      84:	0027d793          	srl	a5,a5,0x2
      88:	0037f713          	and	a4,a5,3
      8c:	8ce1a223          	sw	a4,-1852(gp) # 16f4 <y2_val>
      90:	8ac1a783          	lw	a5,-1876(gp) # 16dc <joystick>
      94:	0007a783          	lw	a5,0(a5)
      98:	0037f713          	and	a4,a5,3
      9c:	8ce1a423          	sw	a4,-1848(gp) # 16f8 <ps2_val>
      a0:	8ac1a783          	lw	a5,-1876(gp) # 16dc <joystick>
      a4:	03f00713          	li	a4,63
      a8:	00e7a023          	sw	a4,0(a5)
      ac:	00000013          	nop
      b0:	00c12403          	lw	s0,12(sp)
      b4:	01010113          	add	sp,sp,16
      b8:	00008067          	ret

000000bc <wait_for_vga>:
      bc:	ff010113          	add	sp,sp,-16
      c0:	00812623          	sw	s0,12(sp)
      c4:	01010413          	add	s0,sp,16
      c8:	00000013          	nop
      cc:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
      d0:	0007a783          	lw	a5,0(a5)
      d4:	fe07cce3          	bltz	a5,cc <wait_for_vga+0x10>
      d8:	00000013          	nop
      dc:	00000013          	nop
      e0:	00c12403          	lw	s0,12(sp)
      e4:	01010113          	add	sp,sp,16
      e8:	00008067          	ret

000000ec <init>:
      ec:	fe010113          	add	sp,sp,-32
      f0:	00112e23          	sw	ra,28(sp)
      f4:	00812c23          	sw	s0,24(sp)
      f8:	02010413          	add	s0,sp,32
      fc:	86818793          	add	a5,gp,-1944 # 1698 <player>
     100:	00500713          	li	a4,5
     104:	00e7a023          	sw	a4,0(a5)
     108:	86818793          	add	a5,gp,-1944 # 1698 <player>
     10c:	33400713          	li	a4,820
     110:	00e7a223          	sw	a4,4(a5)
     114:	86818793          	add	a5,gp,-1944 # 1698 <player>
     118:	01f00713          	li	a4,31
     11c:	00e7a423          	sw	a4,8(a5)
     120:	86818793          	add	a5,gp,-1944 # 1698 <player>
     124:	02300713          	li	a4,35
     128:	00e7a623          	sw	a4,12(a5)
     12c:	88818793          	add	a5,gp,-1912 # 16b8 <player_bullet>
     130:	00100713          	li	a4,1
     134:	00e7a023          	sw	a4,0(a5)
     138:	88818793          	add	a5,gp,-1912 # 16b8 <player_bullet>
     13c:	00200713          	li	a4,2
     140:	00e7a223          	sw	a4,4(a5)
     144:	88818793          	add	a5,gp,-1912 # 16b8 <player_bullet>
     148:	00100713          	li	a4,1
     14c:	00e7a423          	sw	a4,8(a5)
     150:	88818793          	add	a5,gp,-1912 # 16b8 <player_bullet>
     154:	00100713          	li	a4,1
     158:	00e7a623          	sw	a4,12(a5)
     15c:	f61ff0ef          	jal	bc <wait_for_vga>
     160:	86818793          	add	a5,gp,-1944 # 1698 <player>
     164:	0007a783          	lw	a5,0(a5)
     168:	01679713          	sll	a4,a5,0x16
     16c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     170:	0047a783          	lw	a5,4(a5)
     174:	00c79793          	sll	a5,a5,0xc
     178:	00f76733          	or	a4,a4,a5
     17c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     180:	0087a783          	lw	a5,8(a5)
     184:	00279793          	sll	a5,a5,0x2
     188:	00f767b3          	or	a5,a4,a5
     18c:	0017e713          	or	a4,a5,1
     190:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     194:	00e7a023          	sw	a4,0(a5)
     198:	f25ff0ef          	jal	bc <wait_for_vga>
     19c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     1a0:	0007a783          	lw	a5,0(a5)
     1a4:	01679713          	sll	a4,a5,0x16
     1a8:	86818793          	add	a5,gp,-1944 # 1698 <player>
     1ac:	0047a783          	lw	a5,4(a5)
     1b0:	00c79793          	sll	a5,a5,0xc
     1b4:	00f76733          	or	a4,a4,a5
     1b8:	86818793          	add	a5,gp,-1944 # 1698 <player>
     1bc:	00c7a783          	lw	a5,12(a5)
     1c0:	00279793          	sll	a5,a5,0x2
     1c4:	00f767b3          	or	a5,a4,a5
     1c8:	0017e713          	or	a4,a5,1
     1cc:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     1d0:	00e7a023          	sw	a4,0(a5)
     1d4:	fe042623          	sw	zero,-20(s0)
     1d8:	05c0006f          	j	234 <init+0x148>
     1dc:	ee1ff0ef          	jal	bc <wait_for_vga>
     1e0:	000017b7          	lui	a5,0x1
     1e4:	63078713          	add	a4,a5,1584 # 1630 <blocks>
     1e8:	fec42783          	lw	a5,-20(s0)
     1ec:	00379793          	sll	a5,a5,0x3
     1f0:	00f707b3          	add	a5,a4,a5
     1f4:	0007a783          	lw	a5,0(a5)
     1f8:	01679713          	sll	a4,a5,0x16
     1fc:	000017b7          	lui	a5,0x1
     200:	63078693          	add	a3,a5,1584 # 1630 <blocks>
     204:	fec42783          	lw	a5,-20(s0)
     208:	00379793          	sll	a5,a5,0x3
     20c:	00f687b3          	add	a5,a3,a5
     210:	0047a783          	lw	a5,4(a5)
     214:	00c79793          	sll	a5,a5,0xc
     218:	00f767b3          	or	a5,a4,a5
     21c:	0017e713          	or	a4,a5,1
     220:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     224:	00e7a023          	sw	a4,0(a5)
     228:	fec42783          	lw	a5,-20(s0)
     22c:	00178793          	add	a5,a5,1
     230:	fef42623          	sw	a5,-20(s0)
     234:	fec42703          	lw	a4,-20(s0)
     238:	00c00793          	li	a5,12
     23c:	fae7d0e3          	bge	a5,a4,1dc <init+0xf0>
     240:	87818793          	add	a5,gp,-1928 # 16a8 <enemy>
     244:	01300713          	li	a4,19
     248:	00e7a423          	sw	a4,8(a5)
     24c:	87818793          	add	a5,gp,-1928 # 16a8 <enemy>
     250:	02600713          	li	a4,38
     254:	00e7a623          	sw	a4,12(a5)
     258:	87818793          	add	a5,gp,-1928 # 16a8 <enemy>
     25c:	23f00713          	li	a4,575
     260:	00e7a023          	sw	a4,0(a5)
     264:	87818793          	add	a5,gp,-1928 # 16a8 <enemy>
     268:	00200713          	li	a4,2
     26c:	00e7a223          	sw	a4,4(a5)
     270:	89818793          	add	a5,gp,-1896 # 16c8 <enemy_bullet>
     274:	00100713          	li	a4,1
     278:	00e7a023          	sw	a4,0(a5)
     27c:	89818793          	add	a5,gp,-1896 # 16c8 <enemy_bullet>
     280:	00200713          	li	a4,2
     284:	00e7a223          	sw	a4,4(a5)
     288:	89818793          	add	a5,gp,-1896 # 16c8 <enemy_bullet>
     28c:	00100713          	li	a4,1
     290:	00e7a423          	sw	a4,8(a5)
     294:	89818793          	add	a5,gp,-1896 # 16c8 <enemy_bullet>
     298:	00100713          	li	a4,1
     29c:	00e7a623          	sw	a4,12(a5)
     2a0:	e1dff0ef          	jal	bc <wait_for_vga>
     2a4:	87818793          	add	a5,gp,-1928 # 16a8 <enemy>
     2a8:	0007a783          	lw	a5,0(a5)
     2ac:	01679713          	sll	a4,a5,0x16
     2b0:	87818793          	add	a5,gp,-1928 # 16a8 <enemy>
     2b4:	0047a783          	lw	a5,4(a5)
     2b8:	00c79793          	sll	a5,a5,0xc
     2bc:	00f76733          	or	a4,a4,a5
     2c0:	87818793          	add	a5,gp,-1928 # 16a8 <enemy>
     2c4:	0087a783          	lw	a5,8(a5)
     2c8:	00279793          	sll	a5,a5,0x2
     2cc:	00f767b3          	or	a5,a4,a5
     2d0:	0017e713          	or	a4,a5,1
     2d4:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     2d8:	00e7a023          	sw	a4,0(a5)
     2dc:	de1ff0ef          	jal	bc <wait_for_vga>
     2e0:	87818793          	add	a5,gp,-1928 # 16a8 <enemy>
     2e4:	0007a783          	lw	a5,0(a5)
     2e8:	01679713          	sll	a4,a5,0x16
     2ec:	87818793          	add	a5,gp,-1928 # 16a8 <enemy>
     2f0:	0047a783          	lw	a5,4(a5)
     2f4:	00c79793          	sll	a5,a5,0xc
     2f8:	00f76733          	or	a4,a4,a5
     2fc:	87818793          	add	a5,gp,-1928 # 16a8 <enemy>
     300:	00c7a783          	lw	a5,12(a5)
     304:	00279793          	sll	a5,a5,0x2
     308:	00f767b3          	or	a5,a4,a5
     30c:	0017e713          	or	a4,a5,1
     310:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     314:	00e7a023          	sw	a4,0(a5)
     318:	00000013          	nop
     31c:	01c12083          	lw	ra,28(sp)
     320:	01812403          	lw	s0,24(sp)
     324:	02010113          	add	sp,sp,32
     328:	00008067          	ret

0000032c <wall_collision>:
     32c:	fd010113          	add	sp,sp,-48
     330:	02812623          	sw	s0,44(sp)
     334:	03010413          	add	s0,sp,48
     338:	fca42e23          	sw	a0,-36(s0)
     33c:	fcb42c23          	sw	a1,-40(s0)
     340:	fe042623          	sw	zero,-20(s0)
     344:	0a80006f          	j	3ec <wall_collision+0xc0>
     348:	000017b7          	lui	a5,0x1
     34c:	63078713          	add	a4,a5,1584 # 1630 <blocks>
     350:	fec42783          	lw	a5,-20(s0)
     354:	00379793          	sll	a5,a5,0x3
     358:	00f707b3          	add	a5,a4,a5
     35c:	0007a783          	lw	a5,0(a5)
     360:	03e78793          	add	a5,a5,62
     364:	fdc42703          	lw	a4,-36(s0)
     368:	06e7cc63          	blt	a5,a4,3e0 <wall_collision+0xb4>
     36c:	fdc42783          	lw	a5,-36(s0)
     370:	03f78713          	add	a4,a5,63
     374:	000017b7          	lui	a5,0x1
     378:	63078693          	add	a3,a5,1584 # 1630 <blocks>
     37c:	fec42783          	lw	a5,-20(s0)
     380:	00379793          	sll	a5,a5,0x3
     384:	00f687b3          	add	a5,a3,a5
     388:	0007a783          	lw	a5,0(a5)
     38c:	04f74a63          	blt	a4,a5,3e0 <wall_collision+0xb4>
     390:	000017b7          	lui	a5,0x1
     394:	63078713          	add	a4,a5,1584 # 1630 <blocks>
     398:	fec42783          	lw	a5,-20(s0)
     39c:	00379793          	sll	a5,a5,0x3
     3a0:	00f707b3          	add	a5,a4,a5
     3a4:	0047a783          	lw	a5,4(a5)
     3a8:	07d78793          	add	a5,a5,125
     3ac:	fd842703          	lw	a4,-40(s0)
     3b0:	02e7c863          	blt	a5,a4,3e0 <wall_collision+0xb4>
     3b4:	fd842783          	lw	a5,-40(s0)
     3b8:	07f78713          	add	a4,a5,127
     3bc:	000017b7          	lui	a5,0x1
     3c0:	63078693          	add	a3,a5,1584 # 1630 <blocks>
     3c4:	fec42783          	lw	a5,-20(s0)
     3c8:	00379793          	sll	a5,a5,0x3
     3cc:	00f687b3          	add	a5,a3,a5
     3d0:	0047a783          	lw	a5,4(a5)
     3d4:	00f74663          	blt	a4,a5,3e0 <wall_collision+0xb4>
     3d8:	fff00793          	li	a5,-1
     3dc:	0200006f          	j	3fc <wall_collision+0xd0>
     3e0:	fec42783          	lw	a5,-20(s0)
     3e4:	00178793          	add	a5,a5,1
     3e8:	fef42623          	sw	a5,-20(s0)
     3ec:	fec42703          	lw	a4,-20(s0)
     3f0:	00c00793          	li	a5,12
     3f4:	f4e7dae3          	bge	a5,a4,348 <wall_collision+0x1c>
     3f8:	00000793          	li	a5,0
     3fc:	00078513          	mv	a0,a5
     400:	02c12403          	lw	s0,44(sp)
     404:	03010113          	add	sp,sp,48
     408:	00008067          	ret

0000040c <bullet_collision>:
     40c:	fd010113          	add	sp,sp,-48
     410:	02812623          	sw	s0,44(sp)
     414:	03010413          	add	s0,sp,48
     418:	fca42e23          	sw	a0,-36(s0)
     41c:	fcb42c23          	sw	a1,-40(s0)
     420:	fe042623          	sw	zero,-20(s0)
     424:	0a80006f          	j	4cc <bullet_collision+0xc0>
     428:	000017b7          	lui	a5,0x1
     42c:	63078713          	add	a4,a5,1584 # 1630 <blocks>
     430:	fec42783          	lw	a5,-20(s0)
     434:	00379793          	sll	a5,a5,0x3
     438:	00f707b3          	add	a5,a4,a5
     43c:	0007a783          	lw	a5,0(a5)
     440:	03e78793          	add	a5,a5,62
     444:	fdc42703          	lw	a4,-36(s0)
     448:	06e7cc63          	blt	a5,a4,4c0 <bullet_collision+0xb4>
     44c:	fdc42783          	lw	a5,-36(s0)
     450:	01f78713          	add	a4,a5,31
     454:	000017b7          	lui	a5,0x1
     458:	63078693          	add	a3,a5,1584 # 1630 <blocks>
     45c:	fec42783          	lw	a5,-20(s0)
     460:	00379793          	sll	a5,a5,0x3
     464:	00f687b3          	add	a5,a3,a5
     468:	0007a783          	lw	a5,0(a5)
     46c:	04f74a63          	blt	a4,a5,4c0 <bullet_collision+0xb4>
     470:	000017b7          	lui	a5,0x1
     474:	63078713          	add	a4,a5,1584 # 1630 <blocks>
     478:	fec42783          	lw	a5,-20(s0)
     47c:	00379793          	sll	a5,a5,0x3
     480:	00f707b3          	add	a5,a4,a5
     484:	0047a783          	lw	a5,4(a5)
     488:	07d78793          	add	a5,a5,125
     48c:	fd842703          	lw	a4,-40(s0)
     490:	02e7c863          	blt	a5,a4,4c0 <bullet_collision+0xb4>
     494:	fd842783          	lw	a5,-40(s0)
     498:	03f78713          	add	a4,a5,63
     49c:	000017b7          	lui	a5,0x1
     4a0:	63078693          	add	a3,a5,1584 # 1630 <blocks>
     4a4:	fec42783          	lw	a5,-20(s0)
     4a8:	00379793          	sll	a5,a5,0x3
     4ac:	00f687b3          	add	a5,a3,a5
     4b0:	0047a783          	lw	a5,4(a5)
     4b4:	00f74663          	blt	a4,a5,4c0 <bullet_collision+0xb4>
     4b8:	fff00793          	li	a5,-1
     4bc:	0200006f          	j	4dc <bullet_collision+0xd0>
     4c0:	fec42783          	lw	a5,-20(s0)
     4c4:	00178793          	add	a5,a5,1
     4c8:	fef42623          	sw	a5,-20(s0)
     4cc:	fec42703          	lw	a4,-20(s0)
     4d0:	00c00793          	li	a5,12
     4d4:	f4e7dae3          	bge	a5,a4,428 <bullet_collision+0x1c>
     4d8:	00000793          	li	a5,0
     4dc:	00078513          	mv	a0,a5
     4e0:	02c12403          	lw	s0,44(sp)
     4e4:	03010113          	add	sp,sp,48
     4e8:	00008067          	ret

000004ec <update_player_tank>:
     4ec:	fd010113          	add	sp,sp,-48
     4f0:	02112623          	sw	ra,44(sp)
     4f4:	02812423          	sw	s0,40(sp)
     4f8:	03010413          	add	s0,sp,48
     4fc:	fca42e23          	sw	a0,-36(s0)
     500:	fe042623          	sw	zero,-20(s0)
     504:	00100793          	li	a5,1
     508:	fef42423          	sw	a5,-24(s0)
     50c:	bb1ff0ef          	jal	bc <wait_for_vga>
     510:	8c01a703          	lw	a4,-1856(gp) # 16f0 <x2_val>
     514:	00200793          	li	a5,2
     518:	06f71263          	bne	a4,a5,57c <update_player_tank+0x90>
     51c:	8c41a783          	lw	a5,-1852(gp) # 16f4 <y2_val>
     520:	04079e63          	bnez	a5,57c <update_player_tank+0x90>
     524:	86818793          	add	a5,gp,-1944 # 1698 <player>
     528:	00c7a703          	lw	a4,12(a5)
     52c:	02900793          	li	a5,41
     530:	04f70663          	beq	a4,a5,57c <update_player_tank+0x90>
     534:	86818793          	add	a5,gp,-1944 # 1698 <player>
     538:	0007a783          	lw	a5,0(a5)
     53c:	01679713          	sll	a4,a5,0x16
     540:	86818793          	add	a5,gp,-1944 # 1698 <player>
     544:	0047a783          	lw	a5,4(a5)
     548:	00c79793          	sll	a5,a5,0xc
     54c:	00f76733          	or	a4,a4,a5
     550:	86818793          	add	a5,gp,-1944 # 1698 <player>
     554:	00c7a783          	lw	a5,12(a5)
     558:	00279793          	sll	a5,a5,0x2
     55c:	00f767b3          	or	a5,a4,a5
     560:	0027e713          	or	a4,a5,2
     564:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     568:	00e7a023          	sw	a4,0(a5)
     56c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     570:	02900713          	li	a4,41
     574:	00e7a623          	sw	a4,12(a5)
     578:	30c0006f          	j	884 <update_player_tank+0x398>
     57c:	8c01a703          	lw	a4,-1856(gp) # 16f0 <x2_val>
     580:	00100793          	li	a5,1
     584:	06f71263          	bne	a4,a5,5e8 <update_player_tank+0xfc>
     588:	8c41a783          	lw	a5,-1852(gp) # 16f4 <y2_val>
     58c:	04079e63          	bnez	a5,5e8 <update_player_tank+0xfc>
     590:	86818793          	add	a5,gp,-1944 # 1698 <player>
     594:	00c7a703          	lw	a4,12(a5)
     598:	02200793          	li	a5,34
     59c:	04f70663          	beq	a4,a5,5e8 <update_player_tank+0xfc>
     5a0:	86818793          	add	a5,gp,-1944 # 1698 <player>
     5a4:	0007a783          	lw	a5,0(a5)
     5a8:	01679713          	sll	a4,a5,0x16
     5ac:	86818793          	add	a5,gp,-1944 # 1698 <player>
     5b0:	0047a783          	lw	a5,4(a5)
     5b4:	00c79793          	sll	a5,a5,0xc
     5b8:	00f76733          	or	a4,a4,a5
     5bc:	86818793          	add	a5,gp,-1944 # 1698 <player>
     5c0:	00c7a783          	lw	a5,12(a5)
     5c4:	00279793          	sll	a5,a5,0x2
     5c8:	00f767b3          	or	a5,a4,a5
     5cc:	0027e713          	or	a4,a5,2
     5d0:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     5d4:	00e7a023          	sw	a4,0(a5)
     5d8:	86818793          	add	a5,gp,-1944 # 1698 <player>
     5dc:	02200713          	li	a4,34
     5e0:	00e7a623          	sw	a4,12(a5)
     5e4:	2a00006f          	j	884 <update_player_tank+0x398>
     5e8:	8c41a703          	lw	a4,-1852(gp) # 16f4 <y2_val>
     5ec:	00200793          	li	a5,2
     5f0:	06f71263          	bne	a4,a5,654 <update_player_tank+0x168>
     5f4:	8c01a783          	lw	a5,-1856(gp) # 16f0 <x2_val>
     5f8:	04079e63          	bnez	a5,654 <update_player_tank+0x168>
     5fc:	86818793          	add	a5,gp,-1944 # 1698 <player>
     600:	00c7a703          	lw	a4,12(a5)
     604:	02300793          	li	a5,35
     608:	04f70663          	beq	a4,a5,654 <update_player_tank+0x168>
     60c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     610:	0007a783          	lw	a5,0(a5)
     614:	01679713          	sll	a4,a5,0x16
     618:	86818793          	add	a5,gp,-1944 # 1698 <player>
     61c:	0047a783          	lw	a5,4(a5)
     620:	00c79793          	sll	a5,a5,0xc
     624:	00f76733          	or	a4,a4,a5
     628:	86818793          	add	a5,gp,-1944 # 1698 <player>
     62c:	00c7a783          	lw	a5,12(a5)
     630:	00279793          	sll	a5,a5,0x2
     634:	00f767b3          	or	a5,a4,a5
     638:	0027e713          	or	a4,a5,2
     63c:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     640:	00e7a023          	sw	a4,0(a5)
     644:	86818793          	add	a5,gp,-1944 # 1698 <player>
     648:	02300713          	li	a4,35
     64c:	00e7a623          	sw	a4,12(a5)
     650:	2340006f          	j	884 <update_player_tank+0x398>
     654:	8c41a703          	lw	a4,-1852(gp) # 16f4 <y2_val>
     658:	00100793          	li	a5,1
     65c:	06f71263          	bne	a4,a5,6c0 <update_player_tank+0x1d4>
     660:	8c01a783          	lw	a5,-1856(gp) # 16f0 <x2_val>
     664:	04079e63          	bnez	a5,6c0 <update_player_tank+0x1d4>
     668:	86818793          	add	a5,gp,-1944 # 1698 <player>
     66c:	00c7a703          	lw	a4,12(a5)
     670:	02600793          	li	a5,38
     674:	04f70663          	beq	a4,a5,6c0 <update_player_tank+0x1d4>
     678:	86818793          	add	a5,gp,-1944 # 1698 <player>
     67c:	0007a783          	lw	a5,0(a5)
     680:	01679713          	sll	a4,a5,0x16
     684:	86818793          	add	a5,gp,-1944 # 1698 <player>
     688:	0047a783          	lw	a5,4(a5)
     68c:	00c79793          	sll	a5,a5,0xc
     690:	00f76733          	or	a4,a4,a5
     694:	86818793          	add	a5,gp,-1944 # 1698 <player>
     698:	00c7a783          	lw	a5,12(a5)
     69c:	00279793          	sll	a5,a5,0x2
     6a0:	00f767b3          	or	a5,a4,a5
     6a4:	0027e713          	or	a4,a5,2
     6a8:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     6ac:	00e7a023          	sw	a4,0(a5)
     6b0:	86818793          	add	a5,gp,-1944 # 1698 <player>
     6b4:	02600713          	li	a4,38
     6b8:	00e7a623          	sw	a4,12(a5)
     6bc:	1c80006f          	j	884 <update_player_tank+0x398>
     6c0:	8c01a703          	lw	a4,-1856(gp) # 16f0 <x2_val>
     6c4:	00100793          	li	a5,1
     6c8:	06f71463          	bne	a4,a5,730 <update_player_tank+0x244>
     6cc:	8c41a703          	lw	a4,-1852(gp) # 16f4 <y2_val>
     6d0:	00200793          	li	a5,2
     6d4:	04f71e63          	bne	a4,a5,730 <update_player_tank+0x244>
     6d8:	86818793          	add	a5,gp,-1944 # 1698 <player>
     6dc:	00c7a703          	lw	a4,12(a5)
     6e0:	02400793          	li	a5,36
     6e4:	04f70663          	beq	a4,a5,730 <update_player_tank+0x244>
     6e8:	86818793          	add	a5,gp,-1944 # 1698 <player>
     6ec:	0007a783          	lw	a5,0(a5)
     6f0:	01679713          	sll	a4,a5,0x16
     6f4:	86818793          	add	a5,gp,-1944 # 1698 <player>
     6f8:	0047a783          	lw	a5,4(a5)
     6fc:	00c79793          	sll	a5,a5,0xc
     700:	00f76733          	or	a4,a4,a5
     704:	86818793          	add	a5,gp,-1944 # 1698 <player>
     708:	00c7a783          	lw	a5,12(a5)
     70c:	00279793          	sll	a5,a5,0x2
     710:	00f767b3          	or	a5,a4,a5
     714:	0027e713          	or	a4,a5,2
     718:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     71c:	00e7a023          	sw	a4,0(a5)
     720:	86818793          	add	a5,gp,-1944 # 1698 <player>
     724:	02400713          	li	a4,36
     728:	00e7a623          	sw	a4,12(a5)
     72c:	1580006f          	j	884 <update_player_tank+0x398>
     730:	8c01a703          	lw	a4,-1856(gp) # 16f0 <x2_val>
     734:	00200793          	li	a5,2
     738:	06f71463          	bne	a4,a5,7a0 <update_player_tank+0x2b4>
     73c:	8c41a703          	lw	a4,-1852(gp) # 16f4 <y2_val>
     740:	00200793          	li	a5,2
     744:	04f71e63          	bne	a4,a5,7a0 <update_player_tank+0x2b4>
     748:	86818793          	add	a5,gp,-1944 # 1698 <player>
     74c:	00c7a703          	lw	a4,12(a5)
     750:	02500793          	li	a5,37
     754:	04f70663          	beq	a4,a5,7a0 <update_player_tank+0x2b4>
     758:	86818793          	add	a5,gp,-1944 # 1698 <player>
     75c:	0007a783          	lw	a5,0(a5)
     760:	01679713          	sll	a4,a5,0x16
     764:	86818793          	add	a5,gp,-1944 # 1698 <player>
     768:	0047a783          	lw	a5,4(a5)
     76c:	00c79793          	sll	a5,a5,0xc
     770:	00f76733          	or	a4,a4,a5
     774:	86818793          	add	a5,gp,-1944 # 1698 <player>
     778:	00c7a783          	lw	a5,12(a5)
     77c:	00279793          	sll	a5,a5,0x2
     780:	00f767b3          	or	a5,a4,a5
     784:	0027e713          	or	a4,a5,2
     788:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     78c:	00e7a023          	sw	a4,0(a5)
     790:	86818793          	add	a5,gp,-1944 # 1698 <player>
     794:	02500713          	li	a4,37
     798:	00e7a623          	sw	a4,12(a5)
     79c:	0e80006f          	j	884 <update_player_tank+0x398>
     7a0:	8c01a703          	lw	a4,-1856(gp) # 16f0 <x2_val>
     7a4:	00100793          	li	a5,1
     7a8:	06f71463          	bne	a4,a5,810 <update_player_tank+0x324>
     7ac:	8c41a703          	lw	a4,-1852(gp) # 16f4 <y2_val>
     7b0:	00100793          	li	a5,1
     7b4:	04f71e63          	bne	a4,a5,810 <update_player_tank+0x324>
     7b8:	86818793          	add	a5,gp,-1944 # 1698 <player>
     7bc:	00c7a703          	lw	a4,12(a5)
     7c0:	02700793          	li	a5,39
     7c4:	04f70663          	beq	a4,a5,810 <update_player_tank+0x324>
     7c8:	86818793          	add	a5,gp,-1944 # 1698 <player>
     7cc:	0007a783          	lw	a5,0(a5)
     7d0:	01679713          	sll	a4,a5,0x16
     7d4:	86818793          	add	a5,gp,-1944 # 1698 <player>
     7d8:	0047a783          	lw	a5,4(a5)
     7dc:	00c79793          	sll	a5,a5,0xc
     7e0:	00f76733          	or	a4,a4,a5
     7e4:	86818793          	add	a5,gp,-1944 # 1698 <player>
     7e8:	00c7a783          	lw	a5,12(a5)
     7ec:	00279793          	sll	a5,a5,0x2
     7f0:	00f767b3          	or	a5,a4,a5
     7f4:	0027e713          	or	a4,a5,2
     7f8:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     7fc:	00e7a023          	sw	a4,0(a5)
     800:	86818793          	add	a5,gp,-1944 # 1698 <player>
     804:	02700713          	li	a4,39
     808:	00e7a623          	sw	a4,12(a5)
     80c:	0780006f          	j	884 <update_player_tank+0x398>
     810:	8c01a703          	lw	a4,-1856(gp) # 16f0 <x2_val>
     814:	00200793          	li	a5,2
     818:	06f71463          	bne	a4,a5,880 <update_player_tank+0x394>
     81c:	8c41a703          	lw	a4,-1852(gp) # 16f4 <y2_val>
     820:	00100793          	li	a5,1
     824:	04f71e63          	bne	a4,a5,880 <update_player_tank+0x394>
     828:	86818793          	add	a5,gp,-1944 # 1698 <player>
     82c:	00c7a703          	lw	a4,12(a5)
     830:	02800793          	li	a5,40
     834:	04f70663          	beq	a4,a5,880 <update_player_tank+0x394>
     838:	86818793          	add	a5,gp,-1944 # 1698 <player>
     83c:	0007a783          	lw	a5,0(a5)
     840:	01679713          	sll	a4,a5,0x16
     844:	86818793          	add	a5,gp,-1944 # 1698 <player>
     848:	0047a783          	lw	a5,4(a5)
     84c:	00c79793          	sll	a5,a5,0xc
     850:	00f76733          	or	a4,a4,a5
     854:	86818793          	add	a5,gp,-1944 # 1698 <player>
     858:	00c7a783          	lw	a5,12(a5)
     85c:	00279793          	sll	a5,a5,0x2
     860:	00f767b3          	or	a5,a4,a5
     864:	0027e713          	or	a4,a5,2
     868:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     86c:	00e7a023          	sw	a4,0(a5)
     870:	86818793          	add	a5,gp,-1944 # 1698 <player>
     874:	02800713          	li	a4,40
     878:	00e7a623          	sw	a4,12(a5)
     87c:	0080006f          	j	884 <update_player_tank+0x398>
     880:	fe042423          	sw	zero,-24(s0)
     884:	fe842783          	lw	a5,-24(s0)
     888:	2a079863          	bnez	a5,b38 <update_player_tank+0x64c>
     88c:	8b41a703          	lw	a4,-1868(gp) # 16e4 <x1_val>
     890:	00200793          	li	a5,2
     894:	0af71263          	bne	a4,a5,938 <update_player_tank+0x44c>
     898:	86818793          	add	a5,gp,-1944 # 1698 <player>
     89c:	0007a703          	lw	a4,0(a5)
     8a0:	00100793          	li	a5,1
     8a4:	28e7da63          	bge	a5,a4,b38 <update_player_tank+0x64c>
     8a8:	86818793          	add	a5,gp,-1944 # 1698 <player>
     8ac:	0007a783          	lw	a5,0(a5)
     8b0:	fff78713          	add	a4,a5,-1
     8b4:	86818793          	add	a5,gp,-1944 # 1698 <player>
     8b8:	0047a783          	lw	a5,4(a5)
     8bc:	00078593          	mv	a1,a5
     8c0:	00070513          	mv	a0,a4
     8c4:	a69ff0ef          	jal	32c <wall_collision>
     8c8:	00050793          	mv	a5,a0
     8cc:	26079663          	bnez	a5,b38 <update_player_tank+0x64c>
     8d0:	fecff0ef          	jal	bc <wait_for_vga>
     8d4:	86818793          	add	a5,gp,-1944 # 1698 <player>
     8d8:	0007a783          	lw	a5,0(a5)
     8dc:	01679713          	sll	a4,a5,0x16
     8e0:	86818793          	add	a5,gp,-1944 # 1698 <player>
     8e4:	0047a783          	lw	a5,4(a5)
     8e8:	00c79793          	sll	a5,a5,0xc
     8ec:	00f76733          	or	a4,a4,a5
     8f0:	86818793          	add	a5,gp,-1944 # 1698 <player>
     8f4:	0087a783          	lw	a5,8(a5)
     8f8:	00279793          	sll	a5,a5,0x2
     8fc:	00f767b3          	or	a5,a4,a5
     900:	0027e713          	or	a4,a5,2
     904:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     908:	00e7a023          	sw	a4,0(a5)
     90c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     910:	0007a783          	lw	a5,0(a5)
     914:	fff78713          	add	a4,a5,-1
     918:	86818793          	add	a5,gp,-1944 # 1698 <player>
     91c:	00e7a023          	sw	a4,0(a5)
     920:	86818793          	add	a5,gp,-1944 # 1698 <player>
     924:	02100713          	li	a4,33
     928:	00e7a423          	sw	a4,8(a5)
     92c:	00100793          	li	a5,1
     930:	fef42623          	sw	a5,-20(s0)
     934:	2040006f          	j	b38 <update_player_tank+0x64c>
     938:	8b41a703          	lw	a4,-1868(gp) # 16e4 <x1_val>
     93c:	00100793          	li	a5,1
     940:	0af71263          	bne	a4,a5,9e4 <update_player_tank+0x4f8>
     944:	86818793          	add	a5,gp,-1944 # 1698 <player>
     948:	0007a703          	lw	a4,0(a5)
     94c:	23f00793          	li	a5,575
     950:	1ee7c463          	blt	a5,a4,b38 <update_player_tank+0x64c>
     954:	86818793          	add	a5,gp,-1944 # 1698 <player>
     958:	0007a783          	lw	a5,0(a5)
     95c:	00178713          	add	a4,a5,1
     960:	86818793          	add	a5,gp,-1944 # 1698 <player>
     964:	0047a783          	lw	a5,4(a5)
     968:	00078593          	mv	a1,a5
     96c:	00070513          	mv	a0,a4
     970:	9bdff0ef          	jal	32c <wall_collision>
     974:	00050793          	mv	a5,a0
     978:	1c079063          	bnez	a5,b38 <update_player_tank+0x64c>
     97c:	f40ff0ef          	jal	bc <wait_for_vga>
     980:	86818793          	add	a5,gp,-1944 # 1698 <player>
     984:	0007a783          	lw	a5,0(a5)
     988:	01679713          	sll	a4,a5,0x16
     98c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     990:	0047a783          	lw	a5,4(a5)
     994:	00c79793          	sll	a5,a5,0xc
     998:	00f76733          	or	a4,a4,a5
     99c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     9a0:	0087a783          	lw	a5,8(a5)
     9a4:	00279793          	sll	a5,a5,0x2
     9a8:	00f767b3          	or	a5,a4,a5
     9ac:	0027e713          	or	a4,a5,2
     9b0:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     9b4:	00e7a023          	sw	a4,0(a5)
     9b8:	86818793          	add	a5,gp,-1944 # 1698 <player>
     9bc:	0007a783          	lw	a5,0(a5)
     9c0:	00178713          	add	a4,a5,1
     9c4:	86818793          	add	a5,gp,-1944 # 1698 <player>
     9c8:	00e7a023          	sw	a4,0(a5)
     9cc:	86818793          	add	a5,gp,-1944 # 1698 <player>
     9d0:	01e00713          	li	a4,30
     9d4:	00e7a423          	sw	a4,8(a5)
     9d8:	00100793          	li	a5,1
     9dc:	fef42623          	sw	a5,-20(s0)
     9e0:	1580006f          	j	b38 <update_player_tank+0x64c>
     9e4:	8b81a703          	lw	a4,-1864(gp) # 16e8 <y1_val>
     9e8:	00200793          	li	a5,2
     9ec:	0af71263          	bne	a4,a5,a90 <update_player_tank+0x5a4>
     9f0:	86818793          	add	a5,gp,-1944 # 1698 <player>
     9f4:	0047a703          	lw	a4,4(a5)
     9f8:	00100793          	li	a5,1
     9fc:	12e7de63          	bge	a5,a4,b38 <update_player_tank+0x64c>
     a00:	86818793          	add	a5,gp,-1944 # 1698 <player>
     a04:	0007a703          	lw	a4,0(a5)
     a08:	86818793          	add	a5,gp,-1944 # 1698 <player>
     a0c:	0047a783          	lw	a5,4(a5)
     a10:	ffe78793          	add	a5,a5,-2
     a14:	00078593          	mv	a1,a5
     a18:	00070513          	mv	a0,a4
     a1c:	911ff0ef          	jal	32c <wall_collision>
     a20:	00050793          	mv	a5,a0
     a24:	10079a63          	bnez	a5,b38 <update_player_tank+0x64c>
     a28:	e94ff0ef          	jal	bc <wait_for_vga>
     a2c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     a30:	0007a783          	lw	a5,0(a5)
     a34:	01679713          	sll	a4,a5,0x16
     a38:	86818793          	add	a5,gp,-1944 # 1698 <player>
     a3c:	0047a783          	lw	a5,4(a5)
     a40:	00c79793          	sll	a5,a5,0xc
     a44:	00f76733          	or	a4,a4,a5
     a48:	86818793          	add	a5,gp,-1944 # 1698 <player>
     a4c:	0087a783          	lw	a5,8(a5)
     a50:	00279793          	sll	a5,a5,0x2
     a54:	00f767b3          	or	a5,a4,a5
     a58:	0027e713          	or	a4,a5,2
     a5c:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     a60:	00e7a023          	sw	a4,0(a5)
     a64:	86818793          	add	a5,gp,-1944 # 1698 <player>
     a68:	0047a783          	lw	a5,4(a5)
     a6c:	ffe78713          	add	a4,a5,-2
     a70:	86818793          	add	a5,gp,-1944 # 1698 <player>
     a74:	00e7a223          	sw	a4,4(a5)
     a78:	86818793          	add	a5,gp,-1944 # 1698 <player>
     a7c:	01f00713          	li	a4,31
     a80:	00e7a423          	sw	a4,8(a5)
     a84:	00100793          	li	a5,1
     a88:	fef42623          	sw	a5,-20(s0)
     a8c:	0ac0006f          	j	b38 <update_player_tank+0x64c>
     a90:	8b81a703          	lw	a4,-1864(gp) # 16e8 <y1_val>
     a94:	00100793          	li	a5,1
     a98:	0af71063          	bne	a4,a5,b38 <update_player_tank+0x64c>
     a9c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     aa0:	0047a703          	lw	a4,4(a5)
     aa4:	34300793          	li	a5,835
     aa8:	08e7c863          	blt	a5,a4,b38 <update_player_tank+0x64c>
     aac:	86818793          	add	a5,gp,-1944 # 1698 <player>
     ab0:	0007a703          	lw	a4,0(a5)
     ab4:	86818793          	add	a5,gp,-1944 # 1698 <player>
     ab8:	0047a783          	lw	a5,4(a5)
     abc:	00278793          	add	a5,a5,2
     ac0:	00078593          	mv	a1,a5
     ac4:	00070513          	mv	a0,a4
     ac8:	865ff0ef          	jal	32c <wall_collision>
     acc:	00050793          	mv	a5,a0
     ad0:	06079463          	bnez	a5,b38 <update_player_tank+0x64c>
     ad4:	de8ff0ef          	jal	bc <wait_for_vga>
     ad8:	86818793          	add	a5,gp,-1944 # 1698 <player>
     adc:	0007a783          	lw	a5,0(a5)
     ae0:	01679713          	sll	a4,a5,0x16
     ae4:	86818793          	add	a5,gp,-1944 # 1698 <player>
     ae8:	0047a783          	lw	a5,4(a5)
     aec:	00c79793          	sll	a5,a5,0xc
     af0:	00f76733          	or	a4,a4,a5
     af4:	86818793          	add	a5,gp,-1944 # 1698 <player>
     af8:	0087a783          	lw	a5,8(a5)
     afc:	00279793          	sll	a5,a5,0x2
     b00:	00f767b3          	or	a5,a4,a5
     b04:	0027e713          	or	a4,a5,2
     b08:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     b0c:	00e7a023          	sw	a4,0(a5)
     b10:	86818793          	add	a5,gp,-1944 # 1698 <player>
     b14:	0047a783          	lw	a5,4(a5)
     b18:	00278713          	add	a4,a5,2
     b1c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     b20:	00e7a223          	sw	a4,4(a5)
     b24:	86818793          	add	a5,gp,-1944 # 1698 <player>
     b28:	02000713          	li	a4,32
     b2c:	00e7a423          	sw	a4,8(a5)
     b30:	00100793          	li	a5,1
     b34:	fef42623          	sw	a5,-20(s0)
     b38:	fec42703          	lw	a4,-20(s0)
     b3c:	fe842783          	lw	a5,-24(s0)
     b40:	00f767b3          	or	a5,a4,a5
     b44:	06078e63          	beqz	a5,bc0 <update_player_tank+0x6d4>
     b48:	d74ff0ef          	jal	bc <wait_for_vga>
     b4c:	86818793          	add	a5,gp,-1944 # 1698 <player>
     b50:	0007a783          	lw	a5,0(a5)
     b54:	01679713          	sll	a4,a5,0x16
     b58:	86818793          	add	a5,gp,-1944 # 1698 <player>
     b5c:	0047a783          	lw	a5,4(a5)
     b60:	00c79793          	sll	a5,a5,0xc
     b64:	00f76733          	or	a4,a4,a5
     b68:	86818793          	add	a5,gp,-1944 # 1698 <player>
     b6c:	0087a783          	lw	a5,8(a5)
     b70:	00279793          	sll	a5,a5,0x2
     b74:	00f767b3          	or	a5,a4,a5
     b78:	0017e713          	or	a4,a5,1
     b7c:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     b80:	00e7a023          	sw	a4,0(a5)
     b84:	d38ff0ef          	jal	bc <wait_for_vga>
     b88:	86818793          	add	a5,gp,-1944 # 1698 <player>
     b8c:	0007a783          	lw	a5,0(a5)
     b90:	01679713          	sll	a4,a5,0x16
     b94:	86818793          	add	a5,gp,-1944 # 1698 <player>
     b98:	0047a783          	lw	a5,4(a5)
     b9c:	00c79793          	sll	a5,a5,0xc
     ba0:	00f76733          	or	a4,a4,a5
     ba4:	86818793          	add	a5,gp,-1944 # 1698 <player>
     ba8:	00c7a783          	lw	a5,12(a5)
     bac:	00279793          	sll	a5,a5,0x2
     bb0:	00f767b3          	or	a5,a4,a5
     bb4:	0017e713          	or	a4,a5,1
     bb8:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     bbc:	00e7a023          	sw	a4,0(a5)
     bc0:	00000013          	nop
     bc4:	02c12083          	lw	ra,44(sp)
     bc8:	02812403          	lw	s0,40(sp)
     bcc:	03010113          	add	sp,sp,48
     bd0:	00008067          	ret

00000bd4 <update_bullet>:
     bd4:	fe010113          	add	sp,sp,-32
     bd8:	00112e23          	sw	ra,28(sp)
     bdc:	00812c23          	sw	s0,24(sp)
     be0:	02010413          	add	s0,sp,32
     be4:	fea42623          	sw	a0,-20(s0)
     be8:	feb42423          	sw	a1,-24(s0)
     bec:	fe842783          	lw	a5,-24(s0)
     bf0:	0007a703          	lw	a4,0(a5)
     bf4:	00100793          	li	a5,1
     bf8:	2ef71e63          	bne	a4,a5,ef4 <update_bullet+0x320>
     bfc:	8c81a703          	lw	a4,-1848(gp) # 16f8 <ps2_val>
     c00:	00200793          	li	a5,2
     c04:	5cf71a63          	bne	a4,a5,11d8 <update_bullet+0x604>
     c08:	fec42783          	lw	a5,-20(s0)
     c0c:	00c7a703          	lw	a4,12(a5)
     c10:	02200793          	li	a5,34
     c14:	02f71e63          	bne	a4,a5,c50 <update_bullet+0x7c>
     c18:	fe842783          	lw	a5,-24(s0)
     c1c:	00100713          	li	a4,1
     c20:	00e7a223          	sw	a4,4(a5)
     c24:	fec42783          	lw	a5,-20(s0)
     c28:	0007a783          	lw	a5,0(a5)
     c2c:	04078713          	add	a4,a5,64
     c30:	fe842783          	lw	a5,-24(s0)
     c34:	00e7a423          	sw	a4,8(a5)
     c38:	fec42783          	lw	a5,-20(s0)
     c3c:	0047a783          	lw	a5,4(a5)
     c40:	02078713          	add	a4,a5,32
     c44:	fe842783          	lw	a5,-24(s0)
     c48:	00e7a623          	sw	a4,12(a5)
     c4c:	1f80006f          	j	e44 <update_bullet+0x270>
     c50:	fec42783          	lw	a5,-20(s0)
     c54:	00c7a703          	lw	a4,12(a5)
     c58:	02300793          	li	a5,35
     c5c:	02f71e63          	bne	a4,a5,c98 <update_bullet+0xc4>
     c60:	fe842783          	lw	a5,-24(s0)
     c64:	00200713          	li	a4,2
     c68:	00e7a223          	sw	a4,4(a5)
     c6c:	fec42783          	lw	a5,-20(s0)
     c70:	0007a783          	lw	a5,0(a5)
     c74:	01078713          	add	a4,a5,16
     c78:	fe842783          	lw	a5,-24(s0)
     c7c:	00e7a423          	sw	a4,8(a5)
     c80:	fec42783          	lw	a5,-20(s0)
     c84:	0047a783          	lw	a5,4(a5)
     c88:	fd878713          	add	a4,a5,-40
     c8c:	fe842783          	lw	a5,-24(s0)
     c90:	00e7a623          	sw	a4,12(a5)
     c94:	1b00006f          	j	e44 <update_bullet+0x270>
     c98:	fec42783          	lw	a5,-20(s0)
     c9c:	00c7a703          	lw	a4,12(a5)
     ca0:	02400793          	li	a5,36
     ca4:	02f71e63          	bne	a4,a5,ce0 <update_bullet+0x10c>
     ca8:	fe842783          	lw	a5,-24(s0)
     cac:	00300713          	li	a4,3
     cb0:	00e7a223          	sw	a4,4(a5)
     cb4:	fec42783          	lw	a5,-20(s0)
     cb8:	0007a783          	lw	a5,0(a5)
     cbc:	04078713          	add	a4,a5,64
     cc0:	fe842783          	lw	a5,-24(s0)
     cc4:	00e7a423          	sw	a4,8(a5)
     cc8:	fec42783          	lw	a5,-20(s0)
     ccc:	0047a783          	lw	a5,4(a5)
     cd0:	fdc78713          	add	a4,a5,-36
     cd4:	fe842783          	lw	a5,-24(s0)
     cd8:	00e7a623          	sw	a4,12(a5)
     cdc:	1680006f          	j	e44 <update_bullet+0x270>
     ce0:	fec42783          	lw	a5,-20(s0)
     ce4:	00c7a703          	lw	a4,12(a5)
     ce8:	02500793          	li	a5,37
     cec:	02f71e63          	bne	a4,a5,d28 <update_bullet+0x154>
     cf0:	fe842783          	lw	a5,-24(s0)
     cf4:	00400713          	li	a4,4
     cf8:	00e7a223          	sw	a4,4(a5)
     cfc:	fec42783          	lw	a5,-20(s0)
     d00:	0007a783          	lw	a5,0(a5)
     d04:	fe078713          	add	a4,a5,-32
     d08:	fe842783          	lw	a5,-24(s0)
     d0c:	00e7a423          	sw	a4,8(a5)
     d10:	fec42783          	lw	a5,-20(s0)
     d14:	0047a783          	lw	a5,4(a5)
     d18:	fde78713          	add	a4,a5,-34
     d1c:	fe842783          	lw	a5,-24(s0)
     d20:	00e7a623          	sw	a4,12(a5)
     d24:	1200006f          	j	e44 <update_bullet+0x270>
     d28:	fec42783          	lw	a5,-20(s0)
     d2c:	00c7a703          	lw	a4,12(a5)
     d30:	02600793          	li	a5,38
     d34:	02f71e63          	bne	a4,a5,d70 <update_bullet+0x19c>
     d38:	fe842783          	lw	a5,-24(s0)
     d3c:	00500713          	li	a4,5
     d40:	00e7a223          	sw	a4,4(a5)
     d44:	fec42783          	lw	a5,-20(s0)
     d48:	0007a783          	lw	a5,0(a5)
     d4c:	01078713          	add	a4,a5,16
     d50:	fe842783          	lw	a5,-24(s0)
     d54:	00e7a423          	sw	a4,8(a5)
     d58:	fec42783          	lw	a5,-20(s0)
     d5c:	0047a783          	lw	a5,4(a5)
     d60:	06a78713          	add	a4,a5,106
     d64:	fe842783          	lw	a5,-24(s0)
     d68:	00e7a623          	sw	a4,12(a5)
     d6c:	0d80006f          	j	e44 <update_bullet+0x270>
     d70:	fec42783          	lw	a5,-20(s0)
     d74:	00c7a703          	lw	a4,12(a5)
     d78:	02700793          	li	a5,39
     d7c:	02f71e63          	bne	a4,a5,db8 <update_bullet+0x1e4>
     d80:	fe842783          	lw	a5,-24(s0)
     d84:	00600713          	li	a4,6
     d88:	00e7a223          	sw	a4,4(a5)
     d8c:	fec42783          	lw	a5,-20(s0)
     d90:	0007a783          	lw	a5,0(a5)
     d94:	04078713          	add	a4,a5,64
     d98:	fe842783          	lw	a5,-24(s0)
     d9c:	00e7a423          	sw	a4,8(a5)
     da0:	fec42783          	lw	a5,-20(s0)
     da4:	0047a783          	lw	a5,4(a5)
     da8:	06a78713          	add	a4,a5,106
     dac:	fe842783          	lw	a5,-24(s0)
     db0:	00e7a623          	sw	a4,12(a5)
     db4:	0900006f          	j	e44 <update_bullet+0x270>
     db8:	fec42783          	lw	a5,-20(s0)
     dbc:	00c7a703          	lw	a4,12(a5)
     dc0:	02800793          	li	a5,40
     dc4:	02f71e63          	bne	a4,a5,e00 <update_bullet+0x22c>
     dc8:	fe842783          	lw	a5,-24(s0)
     dcc:	00700713          	li	a4,7
     dd0:	00e7a223          	sw	a4,4(a5)
     dd4:	fec42783          	lw	a5,-20(s0)
     dd8:	0007a783          	lw	a5,0(a5)
     ddc:	fe078713          	add	a4,a5,-32
     de0:	fe842783          	lw	a5,-24(s0)
     de4:	00e7a423          	sw	a4,8(a5)
     de8:	fec42783          	lw	a5,-20(s0)
     dec:	0047a783          	lw	a5,4(a5)
     df0:	06a78713          	add	a4,a5,106
     df4:	fe842783          	lw	a5,-24(s0)
     df8:	00e7a623          	sw	a4,12(a5)
     dfc:	0480006f          	j	e44 <update_bullet+0x270>
     e00:	fec42783          	lw	a5,-20(s0)
     e04:	00c7a703          	lw	a4,12(a5)
     e08:	02900793          	li	a5,41
     e0c:	02f71c63          	bne	a4,a5,e44 <update_bullet+0x270>
     e10:	fe842783          	lw	a5,-24(s0)
     e14:	00800713          	li	a4,8
     e18:	00e7a223          	sw	a4,4(a5)
     e1c:	fec42783          	lw	a5,-20(s0)
     e20:	0007a783          	lw	a5,0(a5)
     e24:	fe078713          	add	a4,a5,-32
     e28:	fe842783          	lw	a5,-24(s0)
     e2c:	00e7a423          	sw	a4,8(a5)
     e30:	fec42783          	lw	a5,-20(s0)
     e34:	0047a783          	lw	a5,4(a5)
     e38:	02078713          	add	a4,a5,32
     e3c:	fe842783          	lw	a5,-24(s0)
     e40:	00e7a623          	sw	a4,12(a5)
     e44:	fe842783          	lw	a5,-24(s0)
     e48:	0087a703          	lw	a4,8(a5)
     e4c:	fe842783          	lw	a5,-24(s0)
     e50:	00c7a783          	lw	a5,12(a5)
     e54:	00078593          	mv	a1,a5
     e58:	00070513          	mv	a0,a4
     e5c:	db0ff0ef          	jal	40c <bullet_collision>
     e60:	00050793          	mv	a5,a0
     e64:	36079463          	bnez	a5,11cc <update_bullet+0x5f8>
     e68:	fe842783          	lw	a5,-24(s0)
     e6c:	0087a703          	lw	a4,8(a5)
     e70:	26700793          	li	a5,615
     e74:	36e7c063          	blt	a5,a4,11d4 <update_bullet+0x600>
     e78:	fe842783          	lw	a5,-24(s0)
     e7c:	0087a703          	lw	a4,8(a5)
     e80:	00100793          	li	a5,1
     e84:	34e7d863          	bge	a5,a4,11d4 <update_bullet+0x600>
     e88:	fe842783          	lw	a5,-24(s0)
     e8c:	00c7a703          	lw	a4,12(a5)
     e90:	37300793          	li	a5,883
     e94:	34e7c063          	blt	a5,a4,11d4 <update_bullet+0x600>
     e98:	fe842783          	lw	a5,-24(s0)
     e9c:	00c7a703          	lw	a4,12(a5)
     ea0:	00100793          	li	a5,1
     ea4:	32e7d863          	bge	a5,a4,11d4 <update_bullet+0x600>
     ea8:	fe842783          	lw	a5,-24(s0)
     eac:	00200713          	li	a4,2
     eb0:	00e7a023          	sw	a4,0(a5)
     eb4:	a08ff0ef          	jal	bc <wait_for_vga>
     eb8:	fe842783          	lw	a5,-24(s0)
     ebc:	0087a783          	lw	a5,8(a5)
     ec0:	01679713          	sll	a4,a5,0x16
     ec4:	fe842783          	lw	a5,-24(s0)
     ec8:	00c7a783          	lw	a5,12(a5)
     ecc:	00c79793          	sll	a5,a5,0xc
     ed0:	00f76733          	or	a4,a4,a5
     ed4:	fe842783          	lw	a5,-24(s0)
     ed8:	0047a783          	lw	a5,4(a5)
     edc:	00279793          	sll	a5,a5,0x2
     ee0:	00f767b3          	or	a5,a4,a5
     ee4:	0017e713          	or	a4,a5,1
     ee8:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     eec:	00e7a023          	sw	a4,0(a5)
     ef0:	2e80006f          	j	11d8 <update_bullet+0x604>
     ef4:	fe842783          	lw	a5,-24(s0)
     ef8:	0007a703          	lw	a4,0(a5)
     efc:	00200793          	li	a5,2
     f00:	2cf71c63          	bne	a4,a5,11d8 <update_bullet+0x604>
     f04:	fe842783          	lw	a5,-24(s0)
     f08:	0087a703          	lw	a4,8(a5)
     f0c:	26700793          	li	a5,615
     f10:	02e7ca63          	blt	a5,a4,f44 <update_bullet+0x370>
     f14:	fe842783          	lw	a5,-24(s0)
     f18:	0087a703          	lw	a4,8(a5)
     f1c:	00100793          	li	a5,1
     f20:	02e7d263          	bge	a5,a4,f44 <update_bullet+0x370>
     f24:	fe842783          	lw	a5,-24(s0)
     f28:	00c7a703          	lw	a4,12(a5)
     f2c:	37300793          	li	a5,883
     f30:	00e7ca63          	blt	a5,a4,f44 <update_bullet+0x370>
     f34:	fe842783          	lw	a5,-24(s0)
     f38:	00c7a703          	lw	a4,12(a5)
     f3c:	00100793          	li	a5,1
     f40:	04e7c863          	blt	a5,a4,f90 <update_bullet+0x3bc>
     f44:	fe842783          	lw	a5,-24(s0)
     f48:	00100713          	li	a4,1
     f4c:	00e7a023          	sw	a4,0(a5)
     f50:	96cff0ef          	jal	bc <wait_for_vga>
     f54:	fe842783          	lw	a5,-24(s0)
     f58:	0087a783          	lw	a5,8(a5)
     f5c:	01679713          	sll	a4,a5,0x16
     f60:	fe842783          	lw	a5,-24(s0)
     f64:	00c7a783          	lw	a5,12(a5)
     f68:	00c79793          	sll	a5,a5,0xc
     f6c:	00f76733          	or	a4,a4,a5
     f70:	fe842783          	lw	a5,-24(s0)
     f74:	0047a783          	lw	a5,4(a5)
     f78:	00279793          	sll	a5,a5,0x2
     f7c:	00f767b3          	or	a5,a4,a5
     f80:	0027e713          	or	a4,a5,2
     f84:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     f88:	00e7a023          	sw	a4,0(a5)
     f8c:	24c0006f          	j	11d8 <update_bullet+0x604>
     f90:	fe842783          	lw	a5,-24(s0)
     f94:	0087a703          	lw	a4,8(a5)
     f98:	fe842783          	lw	a5,-24(s0)
     f9c:	00c7a783          	lw	a5,12(a5)
     fa0:	00078593          	mv	a1,a5
     fa4:	00070513          	mv	a0,a4
     fa8:	c64ff0ef          	jal	40c <bullet_collision>
     fac:	00050793          	mv	a5,a0
     fb0:	04078863          	beqz	a5,1000 <update_bullet+0x42c>
     fb4:	fe842783          	lw	a5,-24(s0)
     fb8:	00100713          	li	a4,1
     fbc:	00e7a023          	sw	a4,0(a5)
     fc0:	8fcff0ef          	jal	bc <wait_for_vga>
     fc4:	fe842783          	lw	a5,-24(s0)
     fc8:	0087a783          	lw	a5,8(a5)
     fcc:	01679713          	sll	a4,a5,0x16
     fd0:	fe842783          	lw	a5,-24(s0)
     fd4:	00c7a783          	lw	a5,12(a5)
     fd8:	00c79793          	sll	a5,a5,0xc
     fdc:	00f76733          	or	a4,a4,a5
     fe0:	fe842783          	lw	a5,-24(s0)
     fe4:	0047a783          	lw	a5,4(a5)
     fe8:	00279793          	sll	a5,a5,0x2
     fec:	00f767b3          	or	a5,a4,a5
     ff0:	0027e713          	or	a4,a5,2
     ff4:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
     ff8:	00e7a023          	sw	a4,0(a5)
     ffc:	1dc0006f          	j	11d8 <update_bullet+0x604>
    1000:	fe842783          	lw	a5,-24(s0)
    1004:	0047a703          	lw	a4,4(a5)
    1008:	00100793          	li	a5,1
    100c:	00f71e63          	bne	a4,a5,1028 <update_bullet+0x454>
    1010:	fe842783          	lw	a5,-24(s0)
    1014:	0087a783          	lw	a5,8(a5)
    1018:	00178713          	add	a4,a5,1
    101c:	fe842783          	lw	a5,-24(s0)
    1020:	00e7a423          	sw	a4,8(a5)
    1024:	1680006f          	j	118c <update_bullet+0x5b8>
    1028:	fe842783          	lw	a5,-24(s0)
    102c:	0047a703          	lw	a4,4(a5)
    1030:	00200793          	li	a5,2
    1034:	00f71e63          	bne	a4,a5,1050 <update_bullet+0x47c>
    1038:	fe842783          	lw	a5,-24(s0)
    103c:	00c7a783          	lw	a5,12(a5)
    1040:	ffe78713          	add	a4,a5,-2
    1044:	fe842783          	lw	a5,-24(s0)
    1048:	00e7a623          	sw	a4,12(a5)
    104c:	1400006f          	j	118c <update_bullet+0x5b8>
    1050:	fe842783          	lw	a5,-24(s0)
    1054:	0047a703          	lw	a4,4(a5)
    1058:	00300793          	li	a5,3
    105c:	02f71863          	bne	a4,a5,108c <update_bullet+0x4b8>
    1060:	fe842783          	lw	a5,-24(s0)
    1064:	00c7a783          	lw	a5,12(a5)
    1068:	ffe78713          	add	a4,a5,-2
    106c:	fe842783          	lw	a5,-24(s0)
    1070:	00e7a623          	sw	a4,12(a5)
    1074:	fe842783          	lw	a5,-24(s0)
    1078:	0087a783          	lw	a5,8(a5)
    107c:	00178713          	add	a4,a5,1
    1080:	fe842783          	lw	a5,-24(s0)
    1084:	00e7a423          	sw	a4,8(a5)
    1088:	1040006f          	j	118c <update_bullet+0x5b8>
    108c:	fe842783          	lw	a5,-24(s0)
    1090:	0047a703          	lw	a4,4(a5)
    1094:	00400793          	li	a5,4
    1098:	02f71863          	bne	a4,a5,10c8 <update_bullet+0x4f4>
    109c:	fe842783          	lw	a5,-24(s0)
    10a0:	0087a783          	lw	a5,8(a5)
    10a4:	fff78713          	add	a4,a5,-1
    10a8:	fe842783          	lw	a5,-24(s0)
    10ac:	00e7a423          	sw	a4,8(a5)
    10b0:	fe842783          	lw	a5,-24(s0)
    10b4:	00c7a783          	lw	a5,12(a5)
    10b8:	ffe78713          	add	a4,a5,-2
    10bc:	fe842783          	lw	a5,-24(s0)
    10c0:	00e7a623          	sw	a4,12(a5)
    10c4:	0c80006f          	j	118c <update_bullet+0x5b8>
    10c8:	fe842783          	lw	a5,-24(s0)
    10cc:	0047a703          	lw	a4,4(a5)
    10d0:	00500793          	li	a5,5
    10d4:	00f71e63          	bne	a4,a5,10f0 <update_bullet+0x51c>
    10d8:	fe842783          	lw	a5,-24(s0)
    10dc:	00c7a783          	lw	a5,12(a5)
    10e0:	00278713          	add	a4,a5,2
    10e4:	fe842783          	lw	a5,-24(s0)
    10e8:	00e7a623          	sw	a4,12(a5)
    10ec:	0a00006f          	j	118c <update_bullet+0x5b8>
    10f0:	fe842783          	lw	a5,-24(s0)
    10f4:	0047a703          	lw	a4,4(a5)
    10f8:	00600793          	li	a5,6
    10fc:	02f71863          	bne	a4,a5,112c <update_bullet+0x558>
    1100:	fe842783          	lw	a5,-24(s0)
    1104:	0087a783          	lw	a5,8(a5)
    1108:	00178713          	add	a4,a5,1
    110c:	fe842783          	lw	a5,-24(s0)
    1110:	00e7a423          	sw	a4,8(a5)
    1114:	fe842783          	lw	a5,-24(s0)
    1118:	00c7a783          	lw	a5,12(a5)
    111c:	00278713          	add	a4,a5,2
    1120:	fe842783          	lw	a5,-24(s0)
    1124:	00e7a623          	sw	a4,12(a5)
    1128:	0640006f          	j	118c <update_bullet+0x5b8>
    112c:	fe842783          	lw	a5,-24(s0)
    1130:	0047a703          	lw	a4,4(a5)
    1134:	00700793          	li	a5,7
    1138:	02f71863          	bne	a4,a5,1168 <update_bullet+0x594>
    113c:	fe842783          	lw	a5,-24(s0)
    1140:	0087a783          	lw	a5,8(a5)
    1144:	fff78713          	add	a4,a5,-1
    1148:	fe842783          	lw	a5,-24(s0)
    114c:	00e7a423          	sw	a4,8(a5)
    1150:	fe842783          	lw	a5,-24(s0)
    1154:	00c7a783          	lw	a5,12(a5)
    1158:	00278713          	add	a4,a5,2
    115c:	fe842783          	lw	a5,-24(s0)
    1160:	00e7a623          	sw	a4,12(a5)
    1164:	0280006f          	j	118c <update_bullet+0x5b8>
    1168:	fe842783          	lw	a5,-24(s0)
    116c:	0047a703          	lw	a4,4(a5)
    1170:	00800793          	li	a5,8
    1174:	00f71c63          	bne	a4,a5,118c <update_bullet+0x5b8>
    1178:	fe842783          	lw	a5,-24(s0)
    117c:	0087a783          	lw	a5,8(a5)
    1180:	fff78713          	add	a4,a5,-1
    1184:	fe842783          	lw	a5,-24(s0)
    1188:	00e7a423          	sw	a4,8(a5)
    118c:	f31fe0ef          	jal	bc <wait_for_vga>
    1190:	fe842783          	lw	a5,-24(s0)
    1194:	0087a783          	lw	a5,8(a5)
    1198:	01679713          	sll	a4,a5,0x16
    119c:	fe842783          	lw	a5,-24(s0)
    11a0:	00c7a783          	lw	a5,12(a5)
    11a4:	00c79793          	sll	a5,a5,0xc
    11a8:	00f76733          	or	a4,a4,a5
    11ac:	fe842783          	lw	a5,-24(s0)
    11b0:	0047a783          	lw	a5,4(a5)
    11b4:	00279793          	sll	a5,a5,0x2
    11b8:	00f767b3          	or	a5,a4,a5
    11bc:	0017e713          	or	a4,a5,1
    11c0:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
    11c4:	00e7a023          	sw	a4,0(a5)
    11c8:	0100006f          	j	11d8 <update_bullet+0x604>
    11cc:	00000013          	nop
    11d0:	0080006f          	j	11d8 <update_bullet+0x604>
    11d4:	00000013          	nop
    11d8:	01c12083          	lw	ra,28(sp)
    11dc:	01812403          	lw	s0,24(sp)
    11e0:	02010113          	add	sp,sp,32
    11e4:	00008067          	ret

000011e8 <update_enemy>:
    11e8:	fc010113          	add	sp,sp,-64
    11ec:	02112e23          	sw	ra,60(sp)
    11f0:	02812c23          	sw	s0,56(sp)
    11f4:	04010413          	add	s0,sp,64
    11f8:	fca42623          	sw	a0,-52(s0)
    11fc:	fcb42423          	sw	a1,-56(s0)
    1200:	fcc42223          	sw	a2,-60(s0)
    1204:	fcd42023          	sw	a3,-64(s0)
    1208:	fcc42783          	lw	a5,-52(s0)
    120c:	0007a783          	lw	a5,0(a5)
    1210:	fc842703          	lw	a4,-56(s0)
    1214:	40f707b3          	sub	a5,a4,a5
    1218:	fef42423          	sw	a5,-24(s0)
    121c:	fcc42783          	lw	a5,-52(s0)
    1220:	0047a783          	lw	a5,4(a5)
    1224:	fc442703          	lw	a4,-60(s0)
    1228:	40f707b3          	sub	a5,a4,a5
    122c:	fef42223          	sw	a5,-28(s0)
    1230:	fe842783          	lw	a5,-24(s0)
    1234:	00f05663          	blez	a5,1240 <update_enemy+0x58>
    1238:	00100793          	li	a5,1
    123c:	0080006f          	j	1244 <update_enemy+0x5c>
    1240:	fff00793          	li	a5,-1
    1244:	fef42023          	sw	a5,-32(s0)
    1248:	fe442783          	lw	a5,-28(s0)
    124c:	00f05663          	blez	a5,1258 <update_enemy+0x70>
    1250:	00100793          	li	a5,1
    1254:	0080006f          	j	125c <update_enemy+0x74>
    1258:	fff00793          	li	a5,-1
    125c:	fcf42e23          	sw	a5,-36(s0)
    1260:	fe842783          	lw	a5,-24(s0)
    1264:	41f7d793          	sra	a5,a5,0x1f
    1268:	fe842703          	lw	a4,-24(s0)
    126c:	00e7c733          	xor	a4,a5,a4
    1270:	40f707b3          	sub	a5,a4,a5
    1274:	fcf42c23          	sw	a5,-40(s0)
    1278:	fe442783          	lw	a5,-28(s0)
    127c:	41f7d793          	sra	a5,a5,0x1f
    1280:	fe442703          	lw	a4,-28(s0)
    1284:	00e7c733          	xor	a4,a5,a4
    1288:	40f707b3          	sub	a5,a4,a5
    128c:	fcf42a23          	sw	a5,-44(s0)
    1290:	00100793          	li	a5,1
    1294:	fcf42823          	sw	a5,-48(s0)
    1298:	00100793          	li	a5,1
    129c:	fef42623          	sw	a5,-20(s0)
    12a0:	fe442783          	lw	a5,-28(s0)
    12a4:	00079e63          	bnez	a5,12c0 <update_enemy+0xd8>
    12a8:	fe842783          	lw	a5,-24(s0)
    12ac:	0007da63          	bgez	a5,12c0 <update_enemy+0xd8>
    12b0:	fcc42783          	lw	a5,-52(s0)
    12b4:	02900713          	li	a4,41
    12b8:	00e7a623          	sw	a4,12(a5)
    12bc:	0e80006f          	j	13a4 <update_enemy+0x1bc>
    12c0:	fe842783          	lw	a5,-24(s0)
    12c4:	00079e63          	bnez	a5,12e0 <update_enemy+0xf8>
    12c8:	fe442783          	lw	a5,-28(s0)
    12cc:	00f05a63          	blez	a5,12e0 <update_enemy+0xf8>
    12d0:	fcc42783          	lw	a5,-52(s0)
    12d4:	02600713          	li	a4,38
    12d8:	00e7a623          	sw	a4,12(a5)
    12dc:	0c80006f          	j	13a4 <update_enemy+0x1bc>
    12e0:	fe442783          	lw	a5,-28(s0)
    12e4:	00079e63          	bnez	a5,1300 <update_enemy+0x118>
    12e8:	fe842783          	lw	a5,-24(s0)
    12ec:	00f05a63          	blez	a5,1300 <update_enemy+0x118>
    12f0:	fcc42783          	lw	a5,-52(s0)
    12f4:	02200713          	li	a4,34
    12f8:	00e7a623          	sw	a4,12(a5)
    12fc:	0a80006f          	j	13a4 <update_enemy+0x1bc>
    1300:	fe842783          	lw	a5,-24(s0)
    1304:	00079e63          	bnez	a5,1320 <update_enemy+0x138>
    1308:	fe442783          	lw	a5,-28(s0)
    130c:	0007da63          	bgez	a5,1320 <update_enemy+0x138>
    1310:	fcc42783          	lw	a5,-52(s0)
    1314:	02300713          	li	a4,35
    1318:	00e7a623          	sw	a4,12(a5)
    131c:	0880006f          	j	13a4 <update_enemy+0x1bc>
    1320:	fe442783          	lw	a5,-28(s0)
    1324:	00f05e63          	blez	a5,1340 <update_enemy+0x158>
    1328:	fe842783          	lw	a5,-24(s0)
    132c:	0007da63          	bgez	a5,1340 <update_enemy+0x158>
    1330:	fcc42783          	lw	a5,-52(s0)
    1334:	02800713          	li	a4,40
    1338:	00e7a623          	sw	a4,12(a5)
    133c:	0680006f          	j	13a4 <update_enemy+0x1bc>
    1340:	fe842783          	lw	a5,-24(s0)
    1344:	00f05e63          	blez	a5,1360 <update_enemy+0x178>
    1348:	fe442783          	lw	a5,-28(s0)
    134c:	00f05a63          	blez	a5,1360 <update_enemy+0x178>
    1350:	fcc42783          	lw	a5,-52(s0)
    1354:	02700713          	li	a4,39
    1358:	00e7a623          	sw	a4,12(a5)
    135c:	0480006f          	j	13a4 <update_enemy+0x1bc>
    1360:	fe842783          	lw	a5,-24(s0)
    1364:	0007de63          	bgez	a5,1380 <update_enemy+0x198>
    1368:	fe442783          	lw	a5,-28(s0)
    136c:	0007da63          	bgez	a5,1380 <update_enemy+0x198>
    1370:	fcc42783          	lw	a5,-52(s0)
    1374:	02500713          	li	a4,37
    1378:	00e7a623          	sw	a4,12(a5)
    137c:	0280006f          	j	13a4 <update_enemy+0x1bc>
    1380:	fe842783          	lw	a5,-24(s0)
    1384:	00f05e63          	blez	a5,13a0 <update_enemy+0x1b8>
    1388:	fe442783          	lw	a5,-28(s0)
    138c:	0007da63          	bgez	a5,13a0 <update_enemy+0x1b8>
    1390:	fcc42783          	lw	a5,-52(s0)
    1394:	02400713          	li	a4,36
    1398:	00e7a623          	sw	a4,12(a5)
    139c:	0080006f          	j	13a4 <update_enemy+0x1bc>
    13a0:	fe042623          	sw	zero,-20(s0)
    13a4:	fd842703          	lw	a4,-40(s0)
    13a8:	fd442783          	lw	a5,-44(s0)
    13ac:	08f74a63          	blt	a4,a5,1440 <update_enemy+0x258>
    13b0:	fcc42783          	lw	a5,-52(s0)
    13b4:	0007a703          	lw	a4,0(a5)
    13b8:	fe042783          	lw	a5,-32(s0)
    13bc:	00f70733          	add	a4,a4,a5
    13c0:	fcc42783          	lw	a5,-52(s0)
    13c4:	0047a783          	lw	a5,4(a5)
    13c8:	00078593          	mv	a1,a5
    13cc:	00070513          	mv	a0,a4
    13d0:	f5dfe0ef          	jal	32c <wall_collision>
    13d4:	00050793          	mv	a5,a0
    13d8:	02079063          	bnez	a5,13f8 <update_enemy+0x210>
    13dc:	fcc42783          	lw	a5,-52(s0)
    13e0:	0007a703          	lw	a4,0(a5)
    13e4:	fe042783          	lw	a5,-32(s0)
    13e8:	00f70733          	add	a4,a4,a5
    13ec:	fcc42783          	lw	a5,-52(s0)
    13f0:	00e7a023          	sw	a4,0(a5)
    13f4:	0d80006f          	j	14cc <update_enemy+0x2e4>
    13f8:	fcc42783          	lw	a5,-52(s0)
    13fc:	0007a683          	lw	a3,0(a5)
    1400:	fcc42783          	lw	a5,-52(s0)
    1404:	0047a703          	lw	a4,4(a5)
    1408:	fdc42783          	lw	a5,-36(s0)
    140c:	00f707b3          	add	a5,a4,a5
    1410:	00078593          	mv	a1,a5
    1414:	00068513          	mv	a0,a3
    1418:	f15fe0ef          	jal	32c <wall_collision>
    141c:	00050793          	mv	a5,a0
    1420:	0a079663          	bnez	a5,14cc <update_enemy+0x2e4>
    1424:	fcc42783          	lw	a5,-52(s0)
    1428:	0047a703          	lw	a4,4(a5)
    142c:	fdc42783          	lw	a5,-36(s0)
    1430:	00f70733          	add	a4,a4,a5
    1434:	fcc42783          	lw	a5,-52(s0)
    1438:	00e7a223          	sw	a4,4(a5)
    143c:	0900006f          	j	14cc <update_enemy+0x2e4>
    1440:	fcc42783          	lw	a5,-52(s0)
    1444:	0007a683          	lw	a3,0(a5)
    1448:	fcc42783          	lw	a5,-52(s0)
    144c:	0047a703          	lw	a4,4(a5)
    1450:	fdc42783          	lw	a5,-36(s0)
    1454:	00f707b3          	add	a5,a4,a5
    1458:	00078593          	mv	a1,a5
    145c:	00068513          	mv	a0,a3
    1460:	ecdfe0ef          	jal	32c <wall_collision>
    1464:	00050793          	mv	a5,a0
    1468:	02079063          	bnez	a5,1488 <update_enemy+0x2a0>
    146c:	fcc42783          	lw	a5,-52(s0)
    1470:	0047a703          	lw	a4,4(a5)
    1474:	fdc42783          	lw	a5,-36(s0)
    1478:	00f70733          	add	a4,a4,a5
    147c:	fcc42783          	lw	a5,-52(s0)
    1480:	00e7a223          	sw	a4,4(a5)
    1484:	0480006f          	j	14cc <update_enemy+0x2e4>
    1488:	fcc42783          	lw	a5,-52(s0)
    148c:	0007a703          	lw	a4,0(a5)
    1490:	fe042783          	lw	a5,-32(s0)
    1494:	00f70733          	add	a4,a4,a5
    1498:	fcc42783          	lw	a5,-52(s0)
    149c:	0047a783          	lw	a5,4(a5)
    14a0:	00078593          	mv	a1,a5
    14a4:	00070513          	mv	a0,a4
    14a8:	e85fe0ef          	jal	32c <wall_collision>
    14ac:	00050793          	mv	a5,a0
    14b0:	00079e63          	bnez	a5,14cc <update_enemy+0x2e4>
    14b4:	fcc42783          	lw	a5,-52(s0)
    14b8:	0007a703          	lw	a4,0(a5)
    14bc:	fe042783          	lw	a5,-32(s0)
    14c0:	00f70733          	add	a4,a4,a5
    14c4:	fcc42783          	lw	a5,-52(s0)
    14c8:	00e7a023          	sw	a4,0(a5)
    14cc:	fd042703          	lw	a4,-48(s0)
    14d0:	fec42783          	lw	a5,-20(s0)
    14d4:	00f767b3          	or	a5,a4,a5
    14d8:	06078e63          	beqz	a5,1554 <update_enemy+0x36c>
    14dc:	be1fe0ef          	jal	bc <wait_for_vga>
    14e0:	fcc42783          	lw	a5,-52(s0)
    14e4:	0007a783          	lw	a5,0(a5)
    14e8:	01679713          	sll	a4,a5,0x16
    14ec:	fcc42783          	lw	a5,-52(s0)
    14f0:	0047a783          	lw	a5,4(a5)
    14f4:	00c79793          	sll	a5,a5,0xc
    14f8:	00f76733          	or	a4,a4,a5
    14fc:	fcc42783          	lw	a5,-52(s0)
    1500:	0087a783          	lw	a5,8(a5)
    1504:	00279793          	sll	a5,a5,0x2
    1508:	00f767b3          	or	a5,a4,a5
    150c:	0017e713          	or	a4,a5,1
    1510:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
    1514:	00e7a023          	sw	a4,0(a5)
    1518:	ba5fe0ef          	jal	bc <wait_for_vga>
    151c:	fcc42783          	lw	a5,-52(s0)
    1520:	0007a783          	lw	a5,0(a5)
    1524:	01679713          	sll	a4,a5,0x16
    1528:	fcc42783          	lw	a5,-52(s0)
    152c:	0047a783          	lw	a5,4(a5)
    1530:	00c79793          	sll	a5,a5,0xc
    1534:	00f76733          	or	a4,a4,a5
    1538:	fcc42783          	lw	a5,-52(s0)
    153c:	00c7a783          	lw	a5,12(a5)
    1540:	00279793          	sll	a5,a5,0x2
    1544:	00f767b3          	or	a5,a4,a5
    1548:	0017e713          	or	a4,a5,1
    154c:	8b01a783          	lw	a5,-1872(gp) # 16e0 <VGA>
    1550:	00e7a023          	sw	a4,0(a5)
    1554:	00000013          	nop
    1558:	03c12083          	lw	ra,60(sp)
    155c:	03812403          	lw	s0,56(sp)
    1560:	04010113          	add	sp,sp,64
    1564:	00008067          	ret

00001568 <main>:
    1568:	fe010113          	add	sp,sp,-32
    156c:	00112e23          	sw	ra,28(sp)
    1570:	00812c23          	sw	s0,24(sp)
    1574:	02010413          	add	s0,sp,32
    1578:	b75fe0ef          	jal	ec <init>
    157c:	aa5fe0ef          	jal	20 <read_joystick>
    1580:	86818513          	add	a0,gp,-1944 # 1698 <player>
    1584:	f69fe0ef          	jal	4ec <update_player_tank>
    1588:	88818593          	add	a1,gp,-1912 # 16b8 <player_bullet>
    158c:	86818513          	add	a0,gp,-1944 # 1698 <player>
    1590:	e44ff0ef          	jal	bd4 <update_bullet>
    1594:	86818793          	add	a5,gp,-1944 # 1698 <player>
    1598:	0007a703          	lw	a4,0(a5)
    159c:	86818793          	add	a5,gp,-1944 # 1698 <player>
    15a0:	0047a603          	lw	a2,4(a5)
    15a4:	89818693          	add	a3,gp,-1896 # 16c8 <enemy_bullet>
    15a8:	00070593          	mv	a1,a4
    15ac:	87818513          	add	a0,gp,-1928 # 16a8 <enemy>
    15b0:	c39ff0ef          	jal	11e8 <update_enemy>
    15b4:	fe042623          	sw	zero,-20(s0)
    15b8:	0100006f          	j	15c8 <main+0x60>
    15bc:	fec42783          	lw	a5,-20(s0)
    15c0:	00178793          	add	a5,a5,1
    15c4:	fef42623          	sw	a5,-20(s0)
    15c8:	fec42703          	lw	a4,-20(s0)
    15cc:	000027b7          	lui	a5,0x2
    15d0:	70f78793          	add	a5,a5,1807 # 270f <__stack_top+0x70f>
    15d4:	fee7d4e3          	bge	a5,a4,15bc <main+0x54>
    15d8:	fa5ff06f          	j	157c <main+0x14>

Disassembly of section .eh_frame:

000015dc <.eh_frame>:
    15dc:	0014                	.insn	2, 0x0014
    15de:	0000                	.insn	2, 0x
    15e0:	0000                	.insn	2, 0x
    15e2:	0000                	.insn	2, 0x
    15e4:	00527a03          	.insn	4, 0x00527a03
    15e8:	7c01                	.insn	2, 0x7c01
    15ea:	0101                	.insn	2, 0x0101
    15ec:	07020d1b          	.insn	4, 0x07020d1b
    15f0:	0001                	.insn	2, 0x0001
    15f2:	0000                	.insn	2, 0x
    15f4:	0010                	.insn	2, 0x0010
    15f6:	0000                	.insn	2, 0x
    15f8:	001c                	.insn	2, 0x001c
    15fa:	0000                	.insn	2, 0x
    15fc:	ea04                	.insn	2, 0xea04
    15fe:	ffff                	.insn	2, 0xffff
    1600:	0018                	.insn	2, 0x0018
    1602:	0000                	.insn	2, 0x
    1604:	0000                	.insn	2, 0x
    1606:	0000                	.insn	2, 0x
    1608:	0010                	.insn	2, 0x0010
    160a:	0000                	.insn	2, 0x
    160c:	0000                	.insn	2, 0x
    160e:	0000                	.insn	2, 0x
    1610:	00527a03          	.insn	4, 0x00527a03
    1614:	7c01                	.insn	2, 0x7c01
    1616:	0101                	.insn	2, 0x0101
    1618:	00020d1b          	.insn	4, 0x00020d1b
    161c:	0010                	.insn	2, 0x0010
    161e:	0000                	.insn	2, 0x
    1620:	0018                	.insn	2, 0x0018
    1622:	0000                	.insn	2, 0x
    1624:	e9f4                	.insn	2, 0xe9f4
    1626:	ffff                	.insn	2, 0xffff
    1628:	0008                	.insn	2, 0x0008
    162a:	0000                	.insn	2, 0x
    162c:	0000                	.insn	2, 0x
	...

Disassembly of section .data:

00001630 <blocks>:
    1630:	0046                	.insn	2, 0x0046
    1632:	0000                	.insn	2, 0x
    1634:	0344                	.insn	2, 0x0344
    1636:	0000                	.insn	2, 0x
    1638:	0046                	.insn	2, 0x0046
    163a:	0000                	.insn	2, 0x
    163c:	02c4                	.insn	2, 0x02c4
    163e:	0000                	.insn	2, 0x
    1640:	0046                	.insn	2, 0x0046
    1642:	0000                	.insn	2, 0x
    1644:	0244                	.insn	2, 0x0244
    1646:	0000                	.insn	2, 0x
    1648:	0005                	.insn	2, 0x0005
    164a:	0000                	.insn	2, 0x
    164c:	0005                	.insn	2, 0x0005
    164e:	0000                	.insn	2, 0x
    1650:	0000004b          	.insn	4, 0x004b
    1654:	0000004b          	.insn	4, 0x004b
    1658:	0091                	.insn	2, 0x0091
    165a:	0000                	.insn	2, 0x
    165c:	0091                	.insn	2, 0x0091
    165e:	0000                	.insn	2, 0x
    1660:	012c                	.insn	2, 0x012c
    1662:	0000                	.insn	2, 0x
    1664:	012c                	.insn	2, 0x012c
    1666:	0000                	.insn	2, 0x
    1668:	012c                	.insn	2, 0x012c
    166a:	0000                	.insn	2, 0x
    166c:	01ac                	.insn	2, 0x01ac
    166e:	0000                	.insn	2, 0x
    1670:	016c                	.insn	2, 0x016c
    1672:	0000                	.insn	2, 0x
    1674:	012c                	.insn	2, 0x012c
    1676:	0000                	.insn	2, 0x
    1678:	01f4                	.insn	2, 0x01f4
    167a:	0000                	.insn	2, 0x
    167c:	0344                	.insn	2, 0x0344
    167e:	0000                	.insn	2, 0x
    1680:	01f4                	.insn	2, 0x01f4
    1682:	0000                	.insn	2, 0x
    1684:	02c4                	.insn	2, 0x02c4
    1686:	0000                	.insn	2, 0x
    1688:	01b4                	.insn	2, 0x01b4
    168a:	0000                	.insn	2, 0x
    168c:	02c4                	.insn	2, 0x02c4
    168e:	0000                	.insn	2, 0x
    1690:	01f4                	.insn	2, 0x01f4
    1692:	0000                	.insn	2, 0x
    1694:	0005                	.insn	2, 0x0005
	...

00001698 <player>:
    1698:	0005                	.insn	2, 0x0005
    169a:	0000                	.insn	2, 0x
    169c:	0334                	.insn	2, 0x0334
    169e:	0000                	.insn	2, 0x
    16a0:	001f 0000 0023      	.insn	6, 0x00230000001f
	...

000016a8 <enemy>:
    16a8:	00000013          	nop
    16ac:	0026                	.insn	2, 0x0026
    16ae:	0000                	.insn	2, 0x
    16b0:	023e                	.insn	2, 0x023e
    16b2:	0000                	.insn	2, 0x
    16b4:	0005                	.insn	2, 0x0005
	...

000016b8 <player_bullet>:
    16b8:	0001                	.insn	2, 0x0001
    16ba:	0000                	.insn	2, 0x
    16bc:	0002                	.insn	2, 0x0002
    16be:	0000                	.insn	2, 0x
    16c0:	0001                	.insn	2, 0x0001
    16c2:	0000                	.insn	2, 0x
    16c4:	0001                	.insn	2, 0x0001
	...

000016c8 <enemy_bullet>:
    16c8:	0001                	.insn	2, 0x0001
    16ca:	0000                	.insn	2, 0x
    16cc:	0002                	.insn	2, 0x0002
    16ce:	0000                	.insn	2, 0x
    16d0:	0001                	.insn	2, 0x0001
    16d2:	0000                	.insn	2, 0x
    16d4:	0001                	.insn	2, 0x0001
	...

Disassembly of section .sdata:

000016d8 <debug>:
    16d8:	c001                	.insn	2, 0xc001
    16da:	ffff                	.insn	2, 0xffff

000016dc <joystick>:
    16dc:	c002                	.insn	2, 0xc002
    16de:	ffff                	.insn	2, 0xffff

000016e0 <VGA>:
    16e0:	ffffc003          	lbu	zero,-1(t6)

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
