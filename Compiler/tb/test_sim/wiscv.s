
wiscv.o:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00002197          	auipc	gp,0x2
       4:	a4018193          	add	gp,gp,-1472 # 1a40 <__global_pointer$>
       8:	5c018113          	add	sp,gp,1472 # 2000 <__stack_top>
       c:	00010433          	add	s0,sp,zero
      10:	17c010ef          	jal	118c <main>
      14:	004000ef          	jal	18 <_exit>

00000018 <_exit>:
      18:	05d00893          	li	a7,93
      1c:	00000073          	ecall

00000020 <read_joystick>:
      20:	ff010113          	add	sp,sp,-16
      24:	00812623          	sw	s0,12(sp)
      28:	01010413          	add	s0,sp,16
      2c:	86c1a783          	lw	a5,-1940(gp) # 12ac <joystick>
      30:	0007a783          	lw	a5,0(a5)
      34:	00a7d793          	srl	a5,a5,0xa
      38:	0037f713          	and	a4,a5,3
      3c:	86e1aa23          	sw	a4,-1932(gp) # 12b4 <x1_val>
      40:	86c1a783          	lw	a5,-1940(gp) # 12ac <joystick>
      44:	0007a783          	lw	a5,0(a5)
      48:	0087d793          	srl	a5,a5,0x8
      4c:	0037f713          	and	a4,a5,3
      50:	86e1ac23          	sw	a4,-1928(gp) # 12b8 <y1_val>
      54:	86c1a783          	lw	a5,-1940(gp) # 12ac <joystick>
      58:	0007a783          	lw	a5,0(a5)
      5c:	0067d793          	srl	a5,a5,0x6
      60:	0037f713          	and	a4,a5,3
      64:	86e1ae23          	sw	a4,-1924(gp) # 12bc <ps1_val>
      68:	86c1a783          	lw	a5,-1940(gp) # 12ac <joystick>
      6c:	0007a783          	lw	a5,0(a5)
      70:	0047d793          	srl	a5,a5,0x4
      74:	0037f713          	and	a4,a5,3
      78:	88e1a023          	sw	a4,-1920(gp) # 12c0 <x2_val>
      7c:	86c1a783          	lw	a5,-1940(gp) # 12ac <joystick>
      80:	0007a783          	lw	a5,0(a5)
      84:	0027d793          	srl	a5,a5,0x2
      88:	0037f713          	and	a4,a5,3
      8c:	88e1a223          	sw	a4,-1916(gp) # 12c4 <y2_val>
      90:	86c1a783          	lw	a5,-1940(gp) # 12ac <joystick>
      94:	0007a783          	lw	a5,0(a5)
      98:	0037f713          	and	a4,a5,3
      9c:	88e1a423          	sw	a4,-1912(gp) # 12c8 <ps2_val>
      a0:	86c1a783          	lw	a5,-1940(gp) # 12ac <joystick>
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
      cc:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
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
      fc:	00500713          	li	a4,5
     100:	88e1a623          	sw	a4,-1908(gp) # 12cc <tank_xloc>
     104:	33400713          	li	a4,820
     108:	88e1a823          	sw	a4,-1904(gp) # 12d0 <tank_yloc>
     10c:	01f00713          	li	a4,31
     110:	88e1aa23          	sw	a4,-1900(gp) # 12d4 <tank_index>
     114:	02300713          	li	a4,35
     118:	88e1ac23          	sw	a4,-1896(gp) # 12d8 <gun_index>
     11c:	8bc18793          	add	a5,gp,-1860 # 12fc <player_bullet>
     120:	00100713          	li	a4,1
     124:	00e7a223          	sw	a4,4(a5)
     128:	8bc18793          	add	a5,gp,-1860 # 12fc <player_bullet>
     12c:	00200713          	li	a4,2
     130:	00e7a223          	sw	a4,4(a5)
     134:	8bc18793          	add	a5,gp,-1860 # 12fc <player_bullet>
     138:	00100713          	li	a4,1
     13c:	00e7a423          	sw	a4,8(a5)
     140:	8bc18793          	add	a5,gp,-1860 # 12fc <player_bullet>
     144:	00100713          	li	a4,1
     148:	00e7a623          	sw	a4,12(a5)
     14c:	f71ff0ef          	jal	bc <wait_for_vga>
     150:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     154:	01679713          	sll	a4,a5,0x16
     158:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     15c:	00c79793          	sll	a5,a5,0xc
     160:	00f76733          	or	a4,a4,a5
     164:	8941a783          	lw	a5,-1900(gp) # 12d4 <tank_index>
     168:	00279793          	sll	a5,a5,0x2
     16c:	00f767b3          	or	a5,a4,a5
     170:	0017e713          	or	a4,a5,1
     174:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     178:	00e7a023          	sw	a4,0(a5)
     17c:	f41ff0ef          	jal	bc <wait_for_vga>
     180:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     184:	01679713          	sll	a4,a5,0x16
     188:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     18c:	00c79793          	sll	a5,a5,0xc
     190:	00f76733          	or	a4,a4,a5
     194:	8981a783          	lw	a5,-1896(gp) # 12d8 <gun_index>
     198:	00279793          	sll	a5,a5,0x2
     19c:	00f767b3          	or	a5,a4,a5
     1a0:	0017e713          	or	a4,a5,1
     1a4:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     1a8:	00e7a023          	sw	a4,0(a5)
     1ac:	fe042623          	sw	zero,-20(s0)
     1b0:	05c0006f          	j	20c <init+0x120>
     1b4:	f09ff0ef          	jal	bc <wait_for_vga>
     1b8:	000017b7          	lui	a5,0x1
     1bc:	24078713          	add	a4,a5,576 # 1240 <blocks>
     1c0:	fec42783          	lw	a5,-20(s0)
     1c4:	00379793          	sll	a5,a5,0x3
     1c8:	00f707b3          	add	a5,a4,a5
     1cc:	0007a783          	lw	a5,0(a5)
     1d0:	01679713          	sll	a4,a5,0x16
     1d4:	000017b7          	lui	a5,0x1
     1d8:	24078693          	add	a3,a5,576 # 1240 <blocks>
     1dc:	fec42783          	lw	a5,-20(s0)
     1e0:	00379793          	sll	a5,a5,0x3
     1e4:	00f687b3          	add	a5,a3,a5
     1e8:	0047a783          	lw	a5,4(a5)
     1ec:	00c79793          	sll	a5,a5,0xc
     1f0:	00f767b3          	or	a5,a4,a5
     1f4:	0017e713          	or	a4,a5,1
     1f8:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     1fc:	00e7a023          	sw	a4,0(a5)
     200:	fec42783          	lw	a5,-20(s0)
     204:	00178793          	add	a5,a5,1
     208:	fef42623          	sw	a5,-20(s0)
     20c:	fec42703          	lw	a4,-20(s0)
     210:	00c00793          	li	a5,12
     214:	fae7d0e3          	bge	a5,a4,1b4 <init+0xc8>
     218:	8ac18793          	add	a5,gp,-1876 # 12ec <enemy>
     21c:	01f00713          	li	a4,31
     220:	00e7a423          	sw	a4,8(a5)
     224:	8ac18793          	add	a5,gp,-1876 # 12ec <enemy>
     228:	02600713          	li	a4,38
     22c:	00e7a623          	sw	a4,12(a5)
     230:	8ac18793          	add	a5,gp,-1876 # 12ec <enemy>
     234:	23e00713          	li	a4,574
     238:	00e7a023          	sw	a4,0(a5)
     23c:	8ac18793          	add	a5,gp,-1876 # 12ec <enemy>
     240:	00500713          	li	a4,5
     244:	00e7a223          	sw	a4,4(a5)
     248:	e75ff0ef          	jal	bc <wait_for_vga>
     24c:	8ac18793          	add	a5,gp,-1876 # 12ec <enemy>
     250:	0007a783          	lw	a5,0(a5)
     254:	01679713          	sll	a4,a5,0x16
     258:	8ac18793          	add	a5,gp,-1876 # 12ec <enemy>
     25c:	0047a783          	lw	a5,4(a5)
     260:	00c79793          	sll	a5,a5,0xc
     264:	00f76733          	or	a4,a4,a5
     268:	8ac18793          	add	a5,gp,-1876 # 12ec <enemy>
     26c:	0087a783          	lw	a5,8(a5)
     270:	00279793          	sll	a5,a5,0x2
     274:	00f767b3          	or	a5,a4,a5
     278:	0017e713          	or	a4,a5,1
     27c:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     280:	00e7a023          	sw	a4,0(a5)
     284:	e39ff0ef          	jal	bc <wait_for_vga>
     288:	8ac18793          	add	a5,gp,-1876 # 12ec <enemy>
     28c:	0007a783          	lw	a5,0(a5)
     290:	01679713          	sll	a4,a5,0x16
     294:	8ac18793          	add	a5,gp,-1876 # 12ec <enemy>
     298:	0047a783          	lw	a5,4(a5)
     29c:	00c79793          	sll	a5,a5,0xc
     2a0:	00f76733          	or	a4,a4,a5
     2a4:	8ac18793          	add	a5,gp,-1876 # 12ec <enemy>
     2a8:	00c7a783          	lw	a5,12(a5)
     2ac:	00279793          	sll	a5,a5,0x2
     2b0:	00f767b3          	or	a5,a4,a5
     2b4:	0017e713          	or	a4,a5,1
     2b8:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     2bc:	00e7a023          	sw	a4,0(a5)
     2c0:	00000013          	nop
     2c4:	01c12083          	lw	ra,28(sp)
     2c8:	01812403          	lw	s0,24(sp)
     2cc:	02010113          	add	sp,sp,32
     2d0:	00008067          	ret

000002d4 <wall_collision>:
     2d4:	fd010113          	add	sp,sp,-48
     2d8:	02812623          	sw	s0,44(sp)
     2dc:	03010413          	add	s0,sp,48
     2e0:	fca42e23          	sw	a0,-36(s0)
     2e4:	fcb42c23          	sw	a1,-40(s0)
     2e8:	fe042623          	sw	zero,-20(s0)
     2ec:	0a80006f          	j	394 <wall_collision+0xc0>
     2f0:	000017b7          	lui	a5,0x1
     2f4:	24078713          	add	a4,a5,576 # 1240 <blocks>
     2f8:	fec42783          	lw	a5,-20(s0)
     2fc:	00379793          	sll	a5,a5,0x3
     300:	00f707b3          	add	a5,a4,a5
     304:	0007a783          	lw	a5,0(a5)
     308:	03f78793          	add	a5,a5,63
     30c:	fdc42703          	lw	a4,-36(s0)
     310:	06e7cc63          	blt	a5,a4,388 <wall_collision+0xb4>
     314:	fdc42783          	lw	a5,-36(s0)
     318:	03f78713          	add	a4,a5,63
     31c:	000017b7          	lui	a5,0x1
     320:	24078693          	add	a3,a5,576 # 1240 <blocks>
     324:	fec42783          	lw	a5,-20(s0)
     328:	00379793          	sll	a5,a5,0x3
     32c:	00f687b3          	add	a5,a3,a5
     330:	0007a783          	lw	a5,0(a5)
     334:	04f74a63          	blt	a4,a5,388 <wall_collision+0xb4>
     338:	000017b7          	lui	a5,0x1
     33c:	24078713          	add	a4,a5,576 # 1240 <blocks>
     340:	fec42783          	lw	a5,-20(s0)
     344:	00379793          	sll	a5,a5,0x3
     348:	00f707b3          	add	a5,a4,a5
     34c:	0047a783          	lw	a5,4(a5)
     350:	07f78793          	add	a5,a5,127
     354:	fd842703          	lw	a4,-40(s0)
     358:	02e7c863          	blt	a5,a4,388 <wall_collision+0xb4>
     35c:	fd842783          	lw	a5,-40(s0)
     360:	07f78713          	add	a4,a5,127
     364:	000017b7          	lui	a5,0x1
     368:	24078693          	add	a3,a5,576 # 1240 <blocks>
     36c:	fec42783          	lw	a5,-20(s0)
     370:	00379793          	sll	a5,a5,0x3
     374:	00f687b3          	add	a5,a3,a5
     378:	0047a783          	lw	a5,4(a5)
     37c:	00f74663          	blt	a4,a5,388 <wall_collision+0xb4>
     380:	fff00793          	li	a5,-1
     384:	0200006f          	j	3a4 <wall_collision+0xd0>
     388:	fec42783          	lw	a5,-20(s0)
     38c:	00178793          	add	a5,a5,1
     390:	fef42623          	sw	a5,-20(s0)
     394:	fec42703          	lw	a4,-20(s0)
     398:	00c00793          	li	a5,12
     39c:	f4e7dae3          	bge	a5,a4,2f0 <wall_collision+0x1c>
     3a0:	00000793          	li	a5,0
     3a4:	00078513          	mv	a0,a5
     3a8:	02c12403          	lw	s0,44(sp)
     3ac:	03010113          	add	sp,sp,48
     3b0:	00008067          	ret

000003b4 <update_player_tank>:
     3b4:	fd010113          	add	sp,sp,-48
     3b8:	02112623          	sw	ra,44(sp)
     3bc:	02812423          	sw	s0,40(sp)
     3c0:	03010413          	add	s0,sp,48
     3c4:	fca42e23          	sw	a0,-36(s0)
     3c8:	fe042623          	sw	zero,-20(s0)
     3cc:	00100793          	li	a5,1
     3d0:	fef42423          	sw	a5,-24(s0)
     3d4:	ce9ff0ef          	jal	bc <wait_for_vga>
     3d8:	8801a703          	lw	a4,-1920(gp) # 12c0 <x2_val>
     3dc:	00200793          	li	a5,2
     3e0:	04f71863          	bne	a4,a5,430 <update_player_tank+0x7c>
     3e4:	8841a783          	lw	a5,-1916(gp) # 12c4 <y2_val>
     3e8:	04079463          	bnez	a5,430 <update_player_tank+0x7c>
     3ec:	8981a703          	lw	a4,-1896(gp) # 12d8 <gun_index>
     3f0:	02900793          	li	a5,41
     3f4:	02f70e63          	beq	a4,a5,430 <update_player_tank+0x7c>
     3f8:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     3fc:	01679713          	sll	a4,a5,0x16
     400:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     404:	00c79793          	sll	a5,a5,0xc
     408:	00f76733          	or	a4,a4,a5
     40c:	8981a783          	lw	a5,-1896(gp) # 12d8 <gun_index>
     410:	00279793          	sll	a5,a5,0x2
     414:	00f767b3          	or	a5,a4,a5
     418:	0027e713          	or	a4,a5,2
     41c:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     420:	00e7a023          	sw	a4,0(a5)
     424:	02900713          	li	a4,41
     428:	88e1ac23          	sw	a4,-1896(gp) # 12d8 <gun_index>
     42c:	2800006f          	j	6ac <update_player_tank+0x2f8>
     430:	8801a703          	lw	a4,-1920(gp) # 12c0 <x2_val>
     434:	00100793          	li	a5,1
     438:	04f71863          	bne	a4,a5,488 <update_player_tank+0xd4>
     43c:	8841a783          	lw	a5,-1916(gp) # 12c4 <y2_val>
     440:	04079463          	bnez	a5,488 <update_player_tank+0xd4>
     444:	8981a703          	lw	a4,-1896(gp) # 12d8 <gun_index>
     448:	02200793          	li	a5,34
     44c:	02f70e63          	beq	a4,a5,488 <update_player_tank+0xd4>
     450:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     454:	01679713          	sll	a4,a5,0x16
     458:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     45c:	00c79793          	sll	a5,a5,0xc
     460:	00f76733          	or	a4,a4,a5
     464:	8981a783          	lw	a5,-1896(gp) # 12d8 <gun_index>
     468:	00279793          	sll	a5,a5,0x2
     46c:	00f767b3          	or	a5,a4,a5
     470:	0027e713          	or	a4,a5,2
     474:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     478:	00e7a023          	sw	a4,0(a5)
     47c:	02200713          	li	a4,34
     480:	88e1ac23          	sw	a4,-1896(gp) # 12d8 <gun_index>
     484:	2280006f          	j	6ac <update_player_tank+0x2f8>
     488:	8841a703          	lw	a4,-1916(gp) # 12c4 <y2_val>
     48c:	00200793          	li	a5,2
     490:	04f71863          	bne	a4,a5,4e0 <update_player_tank+0x12c>
     494:	8801a783          	lw	a5,-1920(gp) # 12c0 <x2_val>
     498:	04079463          	bnez	a5,4e0 <update_player_tank+0x12c>
     49c:	8981a703          	lw	a4,-1896(gp) # 12d8 <gun_index>
     4a0:	02300793          	li	a5,35
     4a4:	02f70e63          	beq	a4,a5,4e0 <update_player_tank+0x12c>
     4a8:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     4ac:	01679713          	sll	a4,a5,0x16
     4b0:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     4b4:	00c79793          	sll	a5,a5,0xc
     4b8:	00f76733          	or	a4,a4,a5
     4bc:	8981a783          	lw	a5,-1896(gp) # 12d8 <gun_index>
     4c0:	00279793          	sll	a5,a5,0x2
     4c4:	00f767b3          	or	a5,a4,a5
     4c8:	0027e713          	or	a4,a5,2
     4cc:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     4d0:	00e7a023          	sw	a4,0(a5)
     4d4:	02300713          	li	a4,35
     4d8:	88e1ac23          	sw	a4,-1896(gp) # 12d8 <gun_index>
     4dc:	1d00006f          	j	6ac <update_player_tank+0x2f8>
     4e0:	8841a703          	lw	a4,-1916(gp) # 12c4 <y2_val>
     4e4:	00100793          	li	a5,1
     4e8:	04f71863          	bne	a4,a5,538 <update_player_tank+0x184>
     4ec:	8801a783          	lw	a5,-1920(gp) # 12c0 <x2_val>
     4f0:	04079463          	bnez	a5,538 <update_player_tank+0x184>
     4f4:	8981a703          	lw	a4,-1896(gp) # 12d8 <gun_index>
     4f8:	02600793          	li	a5,38
     4fc:	02f70e63          	beq	a4,a5,538 <update_player_tank+0x184>
     500:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     504:	01679713          	sll	a4,a5,0x16
     508:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     50c:	00c79793          	sll	a5,a5,0xc
     510:	00f76733          	or	a4,a4,a5
     514:	8981a783          	lw	a5,-1896(gp) # 12d8 <gun_index>
     518:	00279793          	sll	a5,a5,0x2
     51c:	00f767b3          	or	a5,a4,a5
     520:	0027e713          	or	a4,a5,2
     524:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     528:	00e7a023          	sw	a4,0(a5)
     52c:	02600713          	li	a4,38
     530:	88e1ac23          	sw	a4,-1896(gp) # 12d8 <gun_index>
     534:	1780006f          	j	6ac <update_player_tank+0x2f8>
     538:	8801a703          	lw	a4,-1920(gp) # 12c0 <x2_val>
     53c:	00100793          	li	a5,1
     540:	04f71a63          	bne	a4,a5,594 <update_player_tank+0x1e0>
     544:	8841a703          	lw	a4,-1916(gp) # 12c4 <y2_val>
     548:	00200793          	li	a5,2
     54c:	04f71463          	bne	a4,a5,594 <update_player_tank+0x1e0>
     550:	8981a703          	lw	a4,-1896(gp) # 12d8 <gun_index>
     554:	02400793          	li	a5,36
     558:	02f70e63          	beq	a4,a5,594 <update_player_tank+0x1e0>
     55c:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     560:	01679713          	sll	a4,a5,0x16
     564:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     568:	00c79793          	sll	a5,a5,0xc
     56c:	00f76733          	or	a4,a4,a5
     570:	8981a783          	lw	a5,-1896(gp) # 12d8 <gun_index>
     574:	00279793          	sll	a5,a5,0x2
     578:	00f767b3          	or	a5,a4,a5
     57c:	0027e713          	or	a4,a5,2
     580:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     584:	00e7a023          	sw	a4,0(a5)
     588:	02400713          	li	a4,36
     58c:	88e1ac23          	sw	a4,-1896(gp) # 12d8 <gun_index>
     590:	11c0006f          	j	6ac <update_player_tank+0x2f8>
     594:	8801a703          	lw	a4,-1920(gp) # 12c0 <x2_val>
     598:	00200793          	li	a5,2
     59c:	04f71a63          	bne	a4,a5,5f0 <update_player_tank+0x23c>
     5a0:	8841a703          	lw	a4,-1916(gp) # 12c4 <y2_val>
     5a4:	00200793          	li	a5,2
     5a8:	04f71463          	bne	a4,a5,5f0 <update_player_tank+0x23c>
     5ac:	8981a703          	lw	a4,-1896(gp) # 12d8 <gun_index>
     5b0:	02500793          	li	a5,37
     5b4:	02f70e63          	beq	a4,a5,5f0 <update_player_tank+0x23c>
     5b8:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     5bc:	01679713          	sll	a4,a5,0x16
     5c0:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     5c4:	00c79793          	sll	a5,a5,0xc
     5c8:	00f76733          	or	a4,a4,a5
     5cc:	8981a783          	lw	a5,-1896(gp) # 12d8 <gun_index>
     5d0:	00279793          	sll	a5,a5,0x2
     5d4:	00f767b3          	or	a5,a4,a5
     5d8:	0027e713          	or	a4,a5,2
     5dc:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     5e0:	00e7a023          	sw	a4,0(a5)
     5e4:	02500713          	li	a4,37
     5e8:	88e1ac23          	sw	a4,-1896(gp) # 12d8 <gun_index>
     5ec:	0c00006f          	j	6ac <update_player_tank+0x2f8>
     5f0:	8801a703          	lw	a4,-1920(gp) # 12c0 <x2_val>
     5f4:	00100793          	li	a5,1
     5f8:	04f71a63          	bne	a4,a5,64c <update_player_tank+0x298>
     5fc:	8841a703          	lw	a4,-1916(gp) # 12c4 <y2_val>
     600:	00100793          	li	a5,1
     604:	04f71463          	bne	a4,a5,64c <update_player_tank+0x298>
     608:	8981a703          	lw	a4,-1896(gp) # 12d8 <gun_index>
     60c:	02700793          	li	a5,39
     610:	02f70e63          	beq	a4,a5,64c <update_player_tank+0x298>
     614:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     618:	01679713          	sll	a4,a5,0x16
     61c:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     620:	00c79793          	sll	a5,a5,0xc
     624:	00f76733          	or	a4,a4,a5
     628:	8981a783          	lw	a5,-1896(gp) # 12d8 <gun_index>
     62c:	00279793          	sll	a5,a5,0x2
     630:	00f767b3          	or	a5,a4,a5
     634:	0027e713          	or	a4,a5,2
     638:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     63c:	00e7a023          	sw	a4,0(a5)
     640:	02700713          	li	a4,39
     644:	88e1ac23          	sw	a4,-1896(gp) # 12d8 <gun_index>
     648:	0640006f          	j	6ac <update_player_tank+0x2f8>
     64c:	8801a703          	lw	a4,-1920(gp) # 12c0 <x2_val>
     650:	00200793          	li	a5,2
     654:	04f71a63          	bne	a4,a5,6a8 <update_player_tank+0x2f4>
     658:	8841a703          	lw	a4,-1916(gp) # 12c4 <y2_val>
     65c:	00100793          	li	a5,1
     660:	04f71463          	bne	a4,a5,6a8 <update_player_tank+0x2f4>
     664:	8981a703          	lw	a4,-1896(gp) # 12d8 <gun_index>
     668:	02800793          	li	a5,40
     66c:	02f70e63          	beq	a4,a5,6a8 <update_player_tank+0x2f4>
     670:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     674:	01679713          	sll	a4,a5,0x16
     678:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     67c:	00c79793          	sll	a5,a5,0xc
     680:	00f76733          	or	a4,a4,a5
     684:	8981a783          	lw	a5,-1896(gp) # 12d8 <gun_index>
     688:	00279793          	sll	a5,a5,0x2
     68c:	00f767b3          	or	a5,a4,a5
     690:	0027e713          	or	a4,a5,2
     694:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     698:	00e7a023          	sw	a4,0(a5)
     69c:	02800713          	li	a4,40
     6a0:	88e1ac23          	sw	a4,-1896(gp) # 12d8 <gun_index>
     6a4:	0080006f          	j	6ac <update_player_tank+0x2f8>
     6a8:	fe042423          	sw	zero,-24(s0)
     6ac:	fe842783          	lw	a5,-24(s0)
     6b0:	22079063          	bnez	a5,8d0 <update_player_tank+0x51c>
     6b4:	8741a703          	lw	a4,-1932(gp) # 12b4 <x1_val>
     6b8:	00200793          	li	a5,2
     6bc:	08f71063          	bne	a4,a5,73c <update_player_tank+0x388>
     6c0:	88c1a703          	lw	a4,-1908(gp) # 12cc <tank_xloc>
     6c4:	00100793          	li	a5,1
     6c8:	20e7d463          	bge	a5,a4,8d0 <update_player_tank+0x51c>
     6cc:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     6d0:	fff78713          	add	a4,a5,-1
     6d4:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     6d8:	00078593          	mv	a1,a5
     6dc:	00070513          	mv	a0,a4
     6e0:	bf5ff0ef          	jal	2d4 <wall_collision>
     6e4:	00050793          	mv	a5,a0
     6e8:	1e079463          	bnez	a5,8d0 <update_player_tank+0x51c>
     6ec:	9d1ff0ef          	jal	bc <wait_for_vga>
     6f0:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     6f4:	01679713          	sll	a4,a5,0x16
     6f8:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     6fc:	00c79793          	sll	a5,a5,0xc
     700:	00f76733          	or	a4,a4,a5
     704:	8941a783          	lw	a5,-1900(gp) # 12d4 <tank_index>
     708:	00279793          	sll	a5,a5,0x2
     70c:	00f767b3          	or	a5,a4,a5
     710:	0027e713          	or	a4,a5,2
     714:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     718:	00e7a023          	sw	a4,0(a5)
     71c:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     720:	fff78713          	add	a4,a5,-1
     724:	88e1a623          	sw	a4,-1908(gp) # 12cc <tank_xloc>
     728:	02100713          	li	a4,33
     72c:	88e1aa23          	sw	a4,-1900(gp) # 12d4 <tank_index>
     730:	00100793          	li	a5,1
     734:	fef42623          	sw	a5,-20(s0)
     738:	1980006f          	j	8d0 <update_player_tank+0x51c>
     73c:	8741a703          	lw	a4,-1932(gp) # 12b4 <x1_val>
     740:	00100793          	li	a5,1
     744:	08f71063          	bne	a4,a5,7c4 <update_player_tank+0x410>
     748:	88c1a703          	lw	a4,-1908(gp) # 12cc <tank_xloc>
     74c:	23f00793          	li	a5,575
     750:	18e7c063          	blt	a5,a4,8d0 <update_player_tank+0x51c>
     754:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     758:	00178713          	add	a4,a5,1
     75c:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     760:	00078593          	mv	a1,a5
     764:	00070513          	mv	a0,a4
     768:	b6dff0ef          	jal	2d4 <wall_collision>
     76c:	00050793          	mv	a5,a0
     770:	16079063          	bnez	a5,8d0 <update_player_tank+0x51c>
     774:	949ff0ef          	jal	bc <wait_for_vga>
     778:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     77c:	01679713          	sll	a4,a5,0x16
     780:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     784:	00c79793          	sll	a5,a5,0xc
     788:	00f76733          	or	a4,a4,a5
     78c:	8941a783          	lw	a5,-1900(gp) # 12d4 <tank_index>
     790:	00279793          	sll	a5,a5,0x2
     794:	00f767b3          	or	a5,a4,a5
     798:	0027e713          	or	a4,a5,2
     79c:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     7a0:	00e7a023          	sw	a4,0(a5)
     7a4:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     7a8:	00178713          	add	a4,a5,1
     7ac:	88e1a623          	sw	a4,-1908(gp) # 12cc <tank_xloc>
     7b0:	01e00713          	li	a4,30
     7b4:	88e1aa23          	sw	a4,-1900(gp) # 12d4 <tank_index>
     7b8:	00100793          	li	a5,1
     7bc:	fef42623          	sw	a5,-20(s0)
     7c0:	1100006f          	j	8d0 <update_player_tank+0x51c>
     7c4:	8781a703          	lw	a4,-1928(gp) # 12b8 <y1_val>
     7c8:	00200793          	li	a5,2
     7cc:	08f71063          	bne	a4,a5,84c <update_player_tank+0x498>
     7d0:	8901a703          	lw	a4,-1904(gp) # 12d0 <tank_yloc>
     7d4:	00100793          	li	a5,1
     7d8:	0ee7dc63          	bge	a5,a4,8d0 <update_player_tank+0x51c>
     7dc:	88c1a703          	lw	a4,-1908(gp) # 12cc <tank_xloc>
     7e0:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     7e4:	ffe78793          	add	a5,a5,-2
     7e8:	00078593          	mv	a1,a5
     7ec:	00070513          	mv	a0,a4
     7f0:	ae5ff0ef          	jal	2d4 <wall_collision>
     7f4:	00050793          	mv	a5,a0
     7f8:	0c079c63          	bnez	a5,8d0 <update_player_tank+0x51c>
     7fc:	8c1ff0ef          	jal	bc <wait_for_vga>
     800:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     804:	01679713          	sll	a4,a5,0x16
     808:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     80c:	00c79793          	sll	a5,a5,0xc
     810:	00f76733          	or	a4,a4,a5
     814:	8941a783          	lw	a5,-1900(gp) # 12d4 <tank_index>
     818:	00279793          	sll	a5,a5,0x2
     81c:	00f767b3          	or	a5,a4,a5
     820:	0027e713          	or	a4,a5,2
     824:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     828:	00e7a023          	sw	a4,0(a5)
     82c:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     830:	ffe78713          	add	a4,a5,-2
     834:	88e1a823          	sw	a4,-1904(gp) # 12d0 <tank_yloc>
     838:	01f00713          	li	a4,31
     83c:	88e1aa23          	sw	a4,-1900(gp) # 12d4 <tank_index>
     840:	00100793          	li	a5,1
     844:	fef42623          	sw	a5,-20(s0)
     848:	0880006f          	j	8d0 <update_player_tank+0x51c>
     84c:	8781a703          	lw	a4,-1928(gp) # 12b8 <y1_val>
     850:	00100793          	li	a5,1
     854:	06f71e63          	bne	a4,a5,8d0 <update_player_tank+0x51c>
     858:	8901a703          	lw	a4,-1904(gp) # 12d0 <tank_yloc>
     85c:	34300793          	li	a5,835
     860:	06e7c863          	blt	a5,a4,8d0 <update_player_tank+0x51c>
     864:	88c1a703          	lw	a4,-1908(gp) # 12cc <tank_xloc>
     868:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     86c:	00278793          	add	a5,a5,2
     870:	00078593          	mv	a1,a5
     874:	00070513          	mv	a0,a4
     878:	a5dff0ef          	jal	2d4 <wall_collision>
     87c:	00050793          	mv	a5,a0
     880:	04079863          	bnez	a5,8d0 <update_player_tank+0x51c>
     884:	839ff0ef          	jal	bc <wait_for_vga>
     888:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     88c:	01679713          	sll	a4,a5,0x16
     890:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     894:	00c79793          	sll	a5,a5,0xc
     898:	00f76733          	or	a4,a4,a5
     89c:	8941a783          	lw	a5,-1900(gp) # 12d4 <tank_index>
     8a0:	00279793          	sll	a5,a5,0x2
     8a4:	00f767b3          	or	a5,a4,a5
     8a8:	0027e713          	or	a4,a5,2
     8ac:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     8b0:	00e7a023          	sw	a4,0(a5)
     8b4:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     8b8:	00278713          	add	a4,a5,2
     8bc:	88e1a823          	sw	a4,-1904(gp) # 12d0 <tank_yloc>
     8c0:	02000713          	li	a4,32
     8c4:	88e1aa23          	sw	a4,-1900(gp) # 12d4 <tank_index>
     8c8:	00100793          	li	a5,1
     8cc:	fef42623          	sw	a5,-20(s0)
     8d0:	fec42703          	lw	a4,-20(s0)
     8d4:	fe842783          	lw	a5,-24(s0)
     8d8:	00f767b3          	or	a5,a4,a5
     8dc:	06078263          	beqz	a5,940 <update_player_tank+0x58c>
     8e0:	fdcff0ef          	jal	bc <wait_for_vga>
     8e4:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     8e8:	01679713          	sll	a4,a5,0x16
     8ec:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     8f0:	00c79793          	sll	a5,a5,0xc
     8f4:	00f76733          	or	a4,a4,a5
     8f8:	8941a783          	lw	a5,-1900(gp) # 12d4 <tank_index>
     8fc:	00279793          	sll	a5,a5,0x2
     900:	00f767b3          	or	a5,a4,a5
     904:	0017e713          	or	a4,a5,1
     908:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     90c:	00e7a023          	sw	a4,0(a5)
     910:	facff0ef          	jal	bc <wait_for_vga>
     914:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     918:	01679713          	sll	a4,a5,0x16
     91c:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     920:	00c79793          	sll	a5,a5,0xc
     924:	00f76733          	or	a4,a4,a5
     928:	8981a783          	lw	a5,-1896(gp) # 12d8 <gun_index>
     92c:	00279793          	sll	a5,a5,0x2
     930:	00f767b3          	or	a5,a4,a5
     934:	0017e713          	or	a4,a5,1
     938:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     93c:	00e7a023          	sw	a4,0(a5)
     940:	8981a703          	lw	a4,-1896(gp) # 12d8 <gun_index>
     944:	fdc42783          	lw	a5,-36(s0)
     948:	00e7a623          	sw	a4,12(a5)
     94c:	88c1a703          	lw	a4,-1908(gp) # 12cc <tank_xloc>
     950:	fdc42783          	lw	a5,-36(s0)
     954:	00e7a023          	sw	a4,0(a5)
     958:	8901a703          	lw	a4,-1904(gp) # 12d0 <tank_yloc>
     95c:	fdc42783          	lw	a5,-36(s0)
     960:	00e7a223          	sw	a4,4(a5)
     964:	8941a703          	lw	a4,-1900(gp) # 12d4 <tank_index>
     968:	fdc42783          	lw	a5,-36(s0)
     96c:	00e7a423          	sw	a4,8(a5)
     970:	00000013          	nop
     974:	02c12083          	lw	ra,44(sp)
     978:	02812403          	lw	s0,40(sp)
     97c:	03010113          	add	sp,sp,48
     980:	00008067          	ret

00000984 <update_enemy>:
     984:	fc010113          	add	sp,sp,-64
     988:	02112e23          	sw	ra,60(sp)
     98c:	02812c23          	sw	s0,56(sp)
     990:	04010413          	add	s0,sp,64
     994:	fca42623          	sw	a0,-52(s0)
     998:	fcb42423          	sw	a1,-56(s0)
     99c:	fcc42223          	sw	a2,-60(s0)
     9a0:	fcc42783          	lw	a5,-52(s0)
     9a4:	0007a783          	lw	a5,0(a5)
     9a8:	fc842703          	lw	a4,-56(s0)
     9ac:	40f707b3          	sub	a5,a4,a5
     9b0:	fef42623          	sw	a5,-20(s0)
     9b4:	fcc42783          	lw	a5,-52(s0)
     9b8:	0047a783          	lw	a5,4(a5)
     9bc:	fc442703          	lw	a4,-60(s0)
     9c0:	40f707b3          	sub	a5,a4,a5
     9c4:	fef42423          	sw	a5,-24(s0)
     9c8:	fec42783          	lw	a5,-20(s0)
     9cc:	00f05663          	blez	a5,9d8 <update_enemy+0x54>
     9d0:	00100793          	li	a5,1
     9d4:	0080006f          	j	9dc <update_enemy+0x58>
     9d8:	fff00793          	li	a5,-1
     9dc:	fef42223          	sw	a5,-28(s0)
     9e0:	fe842783          	lw	a5,-24(s0)
     9e4:	00f05663          	blez	a5,9f0 <update_enemy+0x6c>
     9e8:	00200793          	li	a5,2
     9ec:	0080006f          	j	9f4 <update_enemy+0x70>
     9f0:	ffe00793          	li	a5,-2
     9f4:	fef42023          	sw	a5,-32(s0)
     9f8:	fec42783          	lw	a5,-20(s0)
     9fc:	41f7d793          	sra	a5,a5,0x1f
     a00:	fec42703          	lw	a4,-20(s0)
     a04:	00e7c733          	xor	a4,a5,a4
     a08:	40f707b3          	sub	a5,a4,a5
     a0c:	fcf42e23          	sw	a5,-36(s0)
     a10:	fe842783          	lw	a5,-24(s0)
     a14:	41f7d793          	sra	a5,a5,0x1f
     a18:	fe842703          	lw	a4,-24(s0)
     a1c:	00e7c733          	xor	a4,a5,a4
     a20:	40f707b3          	sub	a5,a4,a5
     a24:	fcf42c23          	sw	a5,-40(s0)
     a28:	fdc42703          	lw	a4,-36(s0)
     a2c:	fd842783          	lw	a5,-40(s0)
     a30:	08f74a63          	blt	a4,a5,ac4 <update_enemy+0x140>
     a34:	fcc42783          	lw	a5,-52(s0)
     a38:	0007a703          	lw	a4,0(a5)
     a3c:	fe442783          	lw	a5,-28(s0)
     a40:	00f70733          	add	a4,a4,a5
     a44:	fcc42783          	lw	a5,-52(s0)
     a48:	0047a783          	lw	a5,4(a5)
     a4c:	00078593          	mv	a1,a5
     a50:	00070513          	mv	a0,a4
     a54:	881ff0ef          	jal	2d4 <wall_collision>
     a58:	00050793          	mv	a5,a0
     a5c:	02079063          	bnez	a5,a7c <update_enemy+0xf8>
     a60:	fcc42783          	lw	a5,-52(s0)
     a64:	0007a703          	lw	a4,0(a5)
     a68:	fe442783          	lw	a5,-28(s0)
     a6c:	00f70733          	add	a4,a4,a5
     a70:	fcc42783          	lw	a5,-52(s0)
     a74:	00e7a023          	sw	a4,0(a5)
     a78:	0d80006f          	j	b50 <update_enemy+0x1cc>
     a7c:	fcc42783          	lw	a5,-52(s0)
     a80:	0007a683          	lw	a3,0(a5)
     a84:	fcc42783          	lw	a5,-52(s0)
     a88:	0047a703          	lw	a4,4(a5)
     a8c:	fe042783          	lw	a5,-32(s0)
     a90:	00f707b3          	add	a5,a4,a5
     a94:	00078593          	mv	a1,a5
     a98:	00068513          	mv	a0,a3
     a9c:	839ff0ef          	jal	2d4 <wall_collision>
     aa0:	00050793          	mv	a5,a0
     aa4:	0a079663          	bnez	a5,b50 <update_enemy+0x1cc>
     aa8:	fcc42783          	lw	a5,-52(s0)
     aac:	0047a703          	lw	a4,4(a5)
     ab0:	fe042783          	lw	a5,-32(s0)
     ab4:	00f70733          	add	a4,a4,a5
     ab8:	fcc42783          	lw	a5,-52(s0)
     abc:	00e7a223          	sw	a4,4(a5)
     ac0:	0900006f          	j	b50 <update_enemy+0x1cc>
     ac4:	fcc42783          	lw	a5,-52(s0)
     ac8:	0007a683          	lw	a3,0(a5)
     acc:	fcc42783          	lw	a5,-52(s0)
     ad0:	0047a703          	lw	a4,4(a5)
     ad4:	fe042783          	lw	a5,-32(s0)
     ad8:	00f707b3          	add	a5,a4,a5
     adc:	00078593          	mv	a1,a5
     ae0:	00068513          	mv	a0,a3
     ae4:	ff0ff0ef          	jal	2d4 <wall_collision>
     ae8:	00050793          	mv	a5,a0
     aec:	02079063          	bnez	a5,b0c <update_enemy+0x188>
     af0:	fcc42783          	lw	a5,-52(s0)
     af4:	0047a703          	lw	a4,4(a5)
     af8:	fe042783          	lw	a5,-32(s0)
     afc:	00f70733          	add	a4,a4,a5
     b00:	fcc42783          	lw	a5,-52(s0)
     b04:	00e7a223          	sw	a4,4(a5)
     b08:	0480006f          	j	b50 <update_enemy+0x1cc>
     b0c:	fcc42783          	lw	a5,-52(s0)
     b10:	0007a703          	lw	a4,0(a5)
     b14:	fe442783          	lw	a5,-28(s0)
     b18:	00f70733          	add	a4,a4,a5
     b1c:	fcc42783          	lw	a5,-52(s0)
     b20:	0047a783          	lw	a5,4(a5)
     b24:	00078593          	mv	a1,a5
     b28:	00070513          	mv	a0,a4
     b2c:	fa8ff0ef          	jal	2d4 <wall_collision>
     b30:	00050793          	mv	a5,a0
     b34:	00079e63          	bnez	a5,b50 <update_enemy+0x1cc>
     b38:	fcc42783          	lw	a5,-52(s0)
     b3c:	0007a703          	lw	a4,0(a5)
     b40:	fe442783          	lw	a5,-28(s0)
     b44:	00f70733          	add	a4,a4,a5
     b48:	fcc42783          	lw	a5,-52(s0)
     b4c:	00e7a023          	sw	a4,0(a5)
     b50:	d6cff0ef          	jal	bc <wait_for_vga>
     b54:	fcc42783          	lw	a5,-52(s0)
     b58:	0007a783          	lw	a5,0(a5)
     b5c:	01679713          	sll	a4,a5,0x16
     b60:	fcc42783          	lw	a5,-52(s0)
     b64:	0047a783          	lw	a5,4(a5)
     b68:	00c79793          	sll	a5,a5,0xc
     b6c:	00f76733          	or	a4,a4,a5
     b70:	fcc42783          	lw	a5,-52(s0)
     b74:	0087a783          	lw	a5,8(a5)
     b78:	00279793          	sll	a5,a5,0x2
     b7c:	00f767b3          	or	a5,a4,a5
     b80:	0017e713          	or	a4,a5,1
     b84:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     b88:	00e7a023          	sw	a4,0(a5)
     b8c:	00000013          	nop
     b90:	03c12083          	lw	ra,60(sp)
     b94:	03812403          	lw	s0,56(sp)
     b98:	04010113          	add	sp,sp,64
     b9c:	00008067          	ret

00000ba0 <update_bullet>:
     ba0:	fe010113          	add	sp,sp,-32
     ba4:	00112e23          	sw	ra,28(sp)
     ba8:	00812c23          	sw	s0,24(sp)
     bac:	02010413          	add	s0,sp,32
     bb0:	fea42623          	sw	a0,-20(s0)
     bb4:	feb42423          	sw	a1,-24(s0)
     bb8:	fec42783          	lw	a5,-20(s0)
     bbc:	0007a703          	lw	a4,0(a5)
     bc0:	00100793          	li	a5,1
     bc4:	2af71c63          	bne	a4,a5,e7c <update_bullet+0x2dc>
     bc8:	8881a703          	lw	a4,-1912(gp) # 12c8 <ps2_val>
     bcc:	00200793          	li	a5,2
     bd0:	5af71463          	bne	a4,a5,1178 <update_bullet+0x5d8>
     bd4:	fe842783          	lw	a5,-24(s0)
     bd8:	00c7a703          	lw	a4,12(a5)
     bdc:	02200793          	li	a5,34
     be0:	04f71063          	bne	a4,a5,c20 <update_bullet+0x80>
     be4:	fec42783          	lw	a5,-20(s0)
     be8:	00200713          	li	a4,2
     bec:	00e7a023          	sw	a4,0(a5)
     bf0:	fec42783          	lw	a5,-20(s0)
     bf4:	00100713          	li	a4,1
     bf8:	00e7a223          	sw	a4,4(a5)
     bfc:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     c00:	04078713          	add	a4,a5,64
     c04:	fec42783          	lw	a5,-20(s0)
     c08:	00e7a423          	sw	a4,8(a5)
     c0c:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     c10:	02078713          	add	a4,a5,32
     c14:	fec42783          	lw	a5,-20(s0)
     c18:	00e7a623          	sw	a4,12(a5)
     c1c:	2140006f          	j	e30 <update_bullet+0x290>
     c20:	fe842783          	lw	a5,-24(s0)
     c24:	00c7a703          	lw	a4,12(a5)
     c28:	02300793          	li	a5,35
     c2c:	04f71063          	bne	a4,a5,c6c <update_bullet+0xcc>
     c30:	fec42783          	lw	a5,-20(s0)
     c34:	00200713          	li	a4,2
     c38:	00e7a023          	sw	a4,0(a5)
     c3c:	fec42783          	lw	a5,-20(s0)
     c40:	00200713          	li	a4,2
     c44:	00e7a223          	sw	a4,4(a5)
     c48:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     c4c:	01078713          	add	a4,a5,16
     c50:	fec42783          	lw	a5,-20(s0)
     c54:	00e7a423          	sw	a4,8(a5)
     c58:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     c5c:	fd878713          	add	a4,a5,-40
     c60:	fec42783          	lw	a5,-20(s0)
     c64:	00e7a623          	sw	a4,12(a5)
     c68:	1c80006f          	j	e30 <update_bullet+0x290>
     c6c:	fe842783          	lw	a5,-24(s0)
     c70:	00c7a703          	lw	a4,12(a5)
     c74:	02400793          	li	a5,36
     c78:	04f71063          	bne	a4,a5,cb8 <update_bullet+0x118>
     c7c:	fec42783          	lw	a5,-20(s0)
     c80:	00200713          	li	a4,2
     c84:	00e7a023          	sw	a4,0(a5)
     c88:	fec42783          	lw	a5,-20(s0)
     c8c:	00300713          	li	a4,3
     c90:	00e7a223          	sw	a4,4(a5)
     c94:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     c98:	04078713          	add	a4,a5,64
     c9c:	fec42783          	lw	a5,-20(s0)
     ca0:	00e7a423          	sw	a4,8(a5)
     ca4:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     ca8:	fe078713          	add	a4,a5,-32
     cac:	fec42783          	lw	a5,-20(s0)
     cb0:	00e7a623          	sw	a4,12(a5)
     cb4:	17c0006f          	j	e30 <update_bullet+0x290>
     cb8:	fe842783          	lw	a5,-24(s0)
     cbc:	00c7a703          	lw	a4,12(a5)
     cc0:	02500793          	li	a5,37
     cc4:	04f71063          	bne	a4,a5,d04 <update_bullet+0x164>
     cc8:	fec42783          	lw	a5,-20(s0)
     ccc:	00200713          	li	a4,2
     cd0:	00e7a023          	sw	a4,0(a5)
     cd4:	fec42783          	lw	a5,-20(s0)
     cd8:	00400713          	li	a4,4
     cdc:	00e7a223          	sw	a4,4(a5)
     ce0:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     ce4:	fe078713          	add	a4,a5,-32
     ce8:	fec42783          	lw	a5,-20(s0)
     cec:	00e7a423          	sw	a4,8(a5)
     cf0:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     cf4:	fe078713          	add	a4,a5,-32
     cf8:	fec42783          	lw	a5,-20(s0)
     cfc:	00e7a623          	sw	a4,12(a5)
     d00:	1300006f          	j	e30 <update_bullet+0x290>
     d04:	fe842783          	lw	a5,-24(s0)
     d08:	00c7a703          	lw	a4,12(a5)
     d0c:	02600793          	li	a5,38
     d10:	04f71063          	bne	a4,a5,d50 <update_bullet+0x1b0>
     d14:	fec42783          	lw	a5,-20(s0)
     d18:	00200713          	li	a4,2
     d1c:	00e7a023          	sw	a4,0(a5)
     d20:	fec42783          	lw	a5,-20(s0)
     d24:	00500713          	li	a4,5
     d28:	00e7a223          	sw	a4,4(a5)
     d2c:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     d30:	01078713          	add	a4,a5,16
     d34:	fec42783          	lw	a5,-20(s0)
     d38:	00e7a423          	sw	a4,8(a5)
     d3c:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     d40:	06a78713          	add	a4,a5,106
     d44:	fec42783          	lw	a5,-20(s0)
     d48:	00e7a623          	sw	a4,12(a5)
     d4c:	0e40006f          	j	e30 <update_bullet+0x290>
     d50:	fe842783          	lw	a5,-24(s0)
     d54:	00c7a703          	lw	a4,12(a5)
     d58:	02700793          	li	a5,39
     d5c:	04f71063          	bne	a4,a5,d9c <update_bullet+0x1fc>
     d60:	fec42783          	lw	a5,-20(s0)
     d64:	00200713          	li	a4,2
     d68:	00e7a023          	sw	a4,0(a5)
     d6c:	fec42783          	lw	a5,-20(s0)
     d70:	00600713          	li	a4,6
     d74:	00e7a223          	sw	a4,4(a5)
     d78:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     d7c:	04078713          	add	a4,a5,64
     d80:	fec42783          	lw	a5,-20(s0)
     d84:	00e7a423          	sw	a4,8(a5)
     d88:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     d8c:	04078713          	add	a4,a5,64
     d90:	fec42783          	lw	a5,-20(s0)
     d94:	00e7a623          	sw	a4,12(a5)
     d98:	0980006f          	j	e30 <update_bullet+0x290>
     d9c:	fe842783          	lw	a5,-24(s0)
     da0:	00c7a703          	lw	a4,12(a5)
     da4:	02800793          	li	a5,40
     da8:	04f71063          	bne	a4,a5,de8 <update_bullet+0x248>
     dac:	fec42783          	lw	a5,-20(s0)
     db0:	00200713          	li	a4,2
     db4:	00e7a023          	sw	a4,0(a5)
     db8:	fec42783          	lw	a5,-20(s0)
     dbc:	00700713          	li	a4,7
     dc0:	00e7a223          	sw	a4,4(a5)
     dc4:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     dc8:	fe078713          	add	a4,a5,-32
     dcc:	fec42783          	lw	a5,-20(s0)
     dd0:	00e7a423          	sw	a4,8(a5)
     dd4:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     dd8:	04078713          	add	a4,a5,64
     ddc:	fec42783          	lw	a5,-20(s0)
     de0:	00e7a623          	sw	a4,12(a5)
     de4:	04c0006f          	j	e30 <update_bullet+0x290>
     de8:	fe842783          	lw	a5,-24(s0)
     dec:	00c7a703          	lw	a4,12(a5)
     df0:	02900793          	li	a5,41
     df4:	02f71e63          	bne	a4,a5,e30 <update_bullet+0x290>
     df8:	fec42783          	lw	a5,-20(s0)
     dfc:	00200713          	li	a4,2
     e00:	00e7a023          	sw	a4,0(a5)
     e04:	fec42783          	lw	a5,-20(s0)
     e08:	00800713          	li	a4,8
     e0c:	00e7a223          	sw	a4,4(a5)
     e10:	88c1a783          	lw	a5,-1908(gp) # 12cc <tank_xloc>
     e14:	fe078713          	add	a4,a5,-32
     e18:	fec42783          	lw	a5,-20(s0)
     e1c:	00e7a423          	sw	a4,8(a5)
     e20:	8901a783          	lw	a5,-1904(gp) # 12d0 <tank_yloc>
     e24:	02078713          	add	a4,a5,32
     e28:	fec42783          	lw	a5,-20(s0)
     e2c:	00e7a623          	sw	a4,12(a5)
     e30:	a8cff0ef          	jal	bc <wait_for_vga>
     e34:	8681a783          	lw	a5,-1944(gp) # 12a8 <debug>
     e38:	03700713          	li	a4,55
     e3c:	00e7a023          	sw	a4,0(a5)
     e40:	fec42783          	lw	a5,-20(s0)
     e44:	0087a783          	lw	a5,8(a5)
     e48:	01679713          	sll	a4,a5,0x16
     e4c:	fec42783          	lw	a5,-20(s0)
     e50:	00c7a783          	lw	a5,12(a5)
     e54:	00c79793          	sll	a5,a5,0xc
     e58:	00f76733          	or	a4,a4,a5
     e5c:	fec42783          	lw	a5,-20(s0)
     e60:	0047a783          	lw	a5,4(a5)
     e64:	00279793          	sll	a5,a5,0x2
     e68:	00f767b3          	or	a5,a4,a5
     e6c:	0017e713          	or	a4,a5,1
     e70:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     e74:	00e7a023          	sw	a4,0(a5)
     e78:	3000006f          	j	1178 <update_bullet+0x5d8>
     e7c:	fec42783          	lw	a5,-20(s0)
     e80:	0007a703          	lw	a4,0(a5)
     e84:	00200793          	li	a5,2
     e88:	2ef71863          	bne	a4,a5,1178 <update_bullet+0x5d8>
     e8c:	fec42783          	lw	a5,-20(s0)
     e90:	0087a703          	lw	a4,8(a5)
     e94:	23f00793          	li	a5,575
     e98:	02e7ca63          	blt	a5,a4,ecc <update_bullet+0x32c>
     e9c:	fec42783          	lw	a5,-20(s0)
     ea0:	0087a703          	lw	a4,8(a5)
     ea4:	00100793          	li	a5,1
     ea8:	02e7d263          	bge	a5,a4,ecc <update_bullet+0x32c>
     eac:	fec42783          	lw	a5,-20(s0)
     eb0:	00c7a703          	lw	a4,12(a5)
     eb4:	34300793          	li	a5,835
     eb8:	00e7ca63          	blt	a5,a4,ecc <update_bullet+0x32c>
     ebc:	fec42783          	lw	a5,-20(s0)
     ec0:	00c7a703          	lw	a4,12(a5)
     ec4:	00100793          	li	a5,1
     ec8:	04e7ce63          	blt	a5,a4,f24 <update_bullet+0x384>
     ecc:	fec42783          	lw	a5,-20(s0)
     ed0:	00100713          	li	a4,1
     ed4:	00e7a023          	sw	a4,0(a5)
     ed8:	8681a783          	lw	a5,-1944(gp) # 12a8 <debug>
     edc:	04200713          	li	a4,66
     ee0:	00e7a023          	sw	a4,0(a5)
     ee4:	9d8ff0ef          	jal	bc <wait_for_vga>
     ee8:	fec42783          	lw	a5,-20(s0)
     eec:	0087a783          	lw	a5,8(a5)
     ef0:	01679713          	sll	a4,a5,0x16
     ef4:	fec42783          	lw	a5,-20(s0)
     ef8:	00c7a783          	lw	a5,12(a5)
     efc:	00c79793          	sll	a5,a5,0xc
     f00:	00f76733          	or	a4,a4,a5
     f04:	fec42783          	lw	a5,-20(s0)
     f08:	0047a783          	lw	a5,4(a5)
     f0c:	00279793          	sll	a5,a5,0x2
     f10:	00f767b3          	or	a5,a4,a5
     f14:	0027e713          	or	a4,a5,2
     f18:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     f1c:	00e7a023          	sw	a4,0(a5)
     f20:	2580006f          	j	1178 <update_bullet+0x5d8>
     f24:	fec42783          	lw	a5,-20(s0)
     f28:	0087a703          	lw	a4,8(a5)
     f2c:	fec42783          	lw	a5,-20(s0)
     f30:	00c7a783          	lw	a5,12(a5)
     f34:	00078593          	mv	a1,a5
     f38:	00070513          	mv	a0,a4
     f3c:	b98ff0ef          	jal	2d4 <wall_collision>
     f40:	00050713          	mv	a4,a0
     f44:	fff00793          	li	a5,-1
     f48:	04f71e63          	bne	a4,a5,fa4 <update_bullet+0x404>
     f4c:	8681a783          	lw	a5,-1944(gp) # 12a8 <debug>
     f50:	04100713          	li	a4,65
     f54:	00e7a023          	sw	a4,0(a5)
     f58:	fec42783          	lw	a5,-20(s0)
     f5c:	00100713          	li	a4,1
     f60:	00e7a023          	sw	a4,0(a5)
     f64:	958ff0ef          	jal	bc <wait_for_vga>
     f68:	fec42783          	lw	a5,-20(s0)
     f6c:	0087a783          	lw	a5,8(a5)
     f70:	01679713          	sll	a4,a5,0x16
     f74:	fec42783          	lw	a5,-20(s0)
     f78:	00c7a783          	lw	a5,12(a5)
     f7c:	00c79793          	sll	a5,a5,0xc
     f80:	00f76733          	or	a4,a4,a5
     f84:	fec42783          	lw	a5,-20(s0)
     f88:	0047a783          	lw	a5,4(a5)
     f8c:	00279793          	sll	a5,a5,0x2
     f90:	00f767b3          	or	a5,a4,a5
     f94:	0027e713          	or	a4,a5,2
     f98:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
     f9c:	00e7a023          	sw	a4,0(a5)
     fa0:	1d80006f          	j	1178 <update_bullet+0x5d8>
     fa4:	fec42783          	lw	a5,-20(s0)
     fa8:	0047a703          	lw	a4,4(a5)
     fac:	00100793          	li	a5,1
     fb0:	00f71e63          	bne	a4,a5,fcc <update_bullet+0x42c>
     fb4:	fec42783          	lw	a5,-20(s0)
     fb8:	0087a783          	lw	a5,8(a5)
     fbc:	00178713          	add	a4,a5,1
     fc0:	fec42783          	lw	a5,-20(s0)
     fc4:	00e7a423          	sw	a4,8(a5)
     fc8:	1680006f          	j	1130 <update_bullet+0x590>
     fcc:	fec42783          	lw	a5,-20(s0)
     fd0:	0047a703          	lw	a4,4(a5)
     fd4:	00200793          	li	a5,2
     fd8:	00f71e63          	bne	a4,a5,ff4 <update_bullet+0x454>
     fdc:	fec42783          	lw	a5,-20(s0)
     fe0:	00c7a783          	lw	a5,12(a5)
     fe4:	ffe78713          	add	a4,a5,-2
     fe8:	fec42783          	lw	a5,-20(s0)
     fec:	00e7a623          	sw	a4,12(a5)
     ff0:	1400006f          	j	1130 <update_bullet+0x590>
     ff4:	fec42783          	lw	a5,-20(s0)
     ff8:	0047a703          	lw	a4,4(a5)
     ffc:	00300793          	li	a5,3
    1000:	02f71863          	bne	a4,a5,1030 <update_bullet+0x490>
    1004:	fec42783          	lw	a5,-20(s0)
    1008:	00c7a783          	lw	a5,12(a5)
    100c:	fff78713          	add	a4,a5,-1
    1010:	fec42783          	lw	a5,-20(s0)
    1014:	00e7a623          	sw	a4,12(a5)
    1018:	fec42783          	lw	a5,-20(s0)
    101c:	0087a783          	lw	a5,8(a5)
    1020:	00178713          	add	a4,a5,1
    1024:	fec42783          	lw	a5,-20(s0)
    1028:	00e7a423          	sw	a4,8(a5)
    102c:	1040006f          	j	1130 <update_bullet+0x590>
    1030:	fec42783          	lw	a5,-20(s0)
    1034:	0047a703          	lw	a4,4(a5)
    1038:	00400793          	li	a5,4
    103c:	02f71863          	bne	a4,a5,106c <update_bullet+0x4cc>
    1040:	fec42783          	lw	a5,-20(s0)
    1044:	0087a783          	lw	a5,8(a5)
    1048:	fff78713          	add	a4,a5,-1
    104c:	fec42783          	lw	a5,-20(s0)
    1050:	00e7a423          	sw	a4,8(a5)
    1054:	fec42783          	lw	a5,-20(s0)
    1058:	00c7a783          	lw	a5,12(a5)
    105c:	fff78713          	add	a4,a5,-1
    1060:	fec42783          	lw	a5,-20(s0)
    1064:	00e7a623          	sw	a4,12(a5)
    1068:	0c80006f          	j	1130 <update_bullet+0x590>
    106c:	fec42783          	lw	a5,-20(s0)
    1070:	0047a703          	lw	a4,4(a5)
    1074:	00500793          	li	a5,5
    1078:	00f71e63          	bne	a4,a5,1094 <update_bullet+0x4f4>
    107c:	fec42783          	lw	a5,-20(s0)
    1080:	00c7a783          	lw	a5,12(a5)
    1084:	00278713          	add	a4,a5,2
    1088:	fec42783          	lw	a5,-20(s0)
    108c:	00e7a623          	sw	a4,12(a5)
    1090:	0a00006f          	j	1130 <update_bullet+0x590>
    1094:	fec42783          	lw	a5,-20(s0)
    1098:	0047a703          	lw	a4,4(a5)
    109c:	00600793          	li	a5,6
    10a0:	02f71863          	bne	a4,a5,10d0 <update_bullet+0x530>
    10a4:	fec42783          	lw	a5,-20(s0)
    10a8:	0087a783          	lw	a5,8(a5)
    10ac:	00178713          	add	a4,a5,1
    10b0:	fec42783          	lw	a5,-20(s0)
    10b4:	00e7a423          	sw	a4,8(a5)
    10b8:	fec42783          	lw	a5,-20(s0)
    10bc:	00c7a783          	lw	a5,12(a5)
    10c0:	00178713          	add	a4,a5,1
    10c4:	fec42783          	lw	a5,-20(s0)
    10c8:	00e7a623          	sw	a4,12(a5)
    10cc:	0640006f          	j	1130 <update_bullet+0x590>
    10d0:	fec42783          	lw	a5,-20(s0)
    10d4:	0047a703          	lw	a4,4(a5)
    10d8:	00700793          	li	a5,7
    10dc:	02f71863          	bne	a4,a5,110c <update_bullet+0x56c>
    10e0:	fec42783          	lw	a5,-20(s0)
    10e4:	0087a783          	lw	a5,8(a5)
    10e8:	fff78713          	add	a4,a5,-1
    10ec:	fec42783          	lw	a5,-20(s0)
    10f0:	00e7a423          	sw	a4,8(a5)
    10f4:	fec42783          	lw	a5,-20(s0)
    10f8:	00c7a783          	lw	a5,12(a5)
    10fc:	00178713          	add	a4,a5,1
    1100:	fec42783          	lw	a5,-20(s0)
    1104:	00e7a623          	sw	a4,12(a5)
    1108:	0280006f          	j	1130 <update_bullet+0x590>
    110c:	fec42783          	lw	a5,-20(s0)
    1110:	0047a703          	lw	a4,4(a5)
    1114:	00800793          	li	a5,8
    1118:	00f71c63          	bne	a4,a5,1130 <update_bullet+0x590>
    111c:	fec42783          	lw	a5,-20(s0)
    1120:	0087a783          	lw	a5,8(a5)
    1124:	fff78713          	add	a4,a5,-1
    1128:	fec42783          	lw	a5,-20(s0)
    112c:	00e7a423          	sw	a4,8(a5)
    1130:	f8dfe0ef          	jal	bc <wait_for_vga>
    1134:	8681a783          	lw	a5,-1944(gp) # 12a8 <debug>
    1138:	03800713          	li	a4,56
    113c:	00e7a023          	sw	a4,0(a5)
    1140:	fec42783          	lw	a5,-20(s0)
    1144:	0087a783          	lw	a5,8(a5)
    1148:	01679713          	sll	a4,a5,0x16
    114c:	fec42783          	lw	a5,-20(s0)
    1150:	00c7a783          	lw	a5,12(a5)
    1154:	00c79793          	sll	a5,a5,0xc
    1158:	00f76733          	or	a4,a4,a5
    115c:	fec42783          	lw	a5,-20(s0)
    1160:	0047a783          	lw	a5,4(a5)
    1164:	00279793          	sll	a5,a5,0x2
    1168:	00f767b3          	or	a5,a4,a5
    116c:	0017e713          	or	a4,a5,1
    1170:	8701a783          	lw	a5,-1936(gp) # 12b0 <VGA>
    1174:	00e7a023          	sw	a4,0(a5)
    1178:	00000013          	nop
    117c:	01c12083          	lw	ra,28(sp)
    1180:	01812403          	lw	s0,24(sp)
    1184:	02010113          	add	sp,sp,32
    1188:	00008067          	ret

0000118c <main>:
    118c:	fe010113          	add	sp,sp,-32
    1190:	00112e23          	sw	ra,28(sp)
    1194:	00812c23          	sw	s0,24(sp)
    1198:	02010413          	add	s0,sp,32
    119c:	f51fe0ef          	jal	ec <init>
    11a0:	e81fe0ef          	jal	20 <read_joystick>
    11a4:	89c18513          	add	a0,gp,-1892 # 12dc <player>
    11a8:	a0cff0ef          	jal	3b4 <update_player_tank>
    11ac:	89c18593          	add	a1,gp,-1892 # 12dc <player>
    11b0:	8bc18513          	add	a0,gp,-1860 # 12fc <player_bullet>
    11b4:	9edff0ef          	jal	ba0 <update_bullet>
    11b8:	8881a703          	lw	a4,-1912(gp) # 12c8 <ps2_val>
    11bc:	8681a783          	lw	a5,-1944(gp) # 12a8 <debug>
    11c0:	00e7a023          	sw	a4,0(a5)
    11c4:	fe042623          	sw	zero,-20(s0)
    11c8:	0100006f          	j	11d8 <main+0x4c>
    11cc:	fec42783          	lw	a5,-20(s0)
    11d0:	00178793          	add	a5,a5,1
    11d4:	fef42623          	sw	a5,-20(s0)
    11d8:	fec42703          	lw	a4,-20(s0)
    11dc:	000027b7          	lui	a5,0x2
    11e0:	70f78793          	add	a5,a5,1807 # 270f <__stack_top+0x70f>
    11e4:	fee7d4e3          	bge	a5,a4,11cc <main+0x40>
    11e8:	fb9ff06f          	j	11a0 <main+0x14>

Disassembly of section .eh_frame:

000011ec <.eh_frame>:
    11ec:	0014                	.insn	2, 0x0014
    11ee:	0000                	.insn	2, 0x
    11f0:	0000                	.insn	2, 0x
    11f2:	0000                	.insn	2, 0x
    11f4:	00527a03          	.insn	4, 0x00527a03
    11f8:	7c01                	.insn	2, 0x7c01
    11fa:	0101                	.insn	2, 0x0101
    11fc:	07020d1b          	.insn	4, 0x07020d1b
    1200:	0001                	.insn	2, 0x0001
    1202:	0000                	.insn	2, 0x
    1204:	0010                	.insn	2, 0x0010
    1206:	0000                	.insn	2, 0x
    1208:	001c                	.insn	2, 0x001c
    120a:	0000                	.insn	2, 0x
    120c:	edf4                	.insn	2, 0xedf4
    120e:	ffff                	.insn	2, 0xffff
    1210:	0018                	.insn	2, 0x0018
    1212:	0000                	.insn	2, 0x
    1214:	0000                	.insn	2, 0x
    1216:	0000                	.insn	2, 0x
    1218:	0010                	.insn	2, 0x0010
    121a:	0000                	.insn	2, 0x
    121c:	0000                	.insn	2, 0x
    121e:	0000                	.insn	2, 0x
    1220:	00527a03          	.insn	4, 0x00527a03
    1224:	7c01                	.insn	2, 0x7c01
    1226:	0101                	.insn	2, 0x0101
    1228:	00020d1b          	.insn	4, 0x00020d1b
    122c:	0010                	.insn	2, 0x0010
    122e:	0000                	.insn	2, 0x
    1230:	0018                	.insn	2, 0x0018
    1232:	0000                	.insn	2, 0x
    1234:	ede4                	.insn	2, 0xede4
    1236:	ffff                	.insn	2, 0xffff
    1238:	0008                	.insn	2, 0x0008
    123a:	0000                	.insn	2, 0x
    123c:	0000                	.insn	2, 0x
	...

Disassembly of section .data:

00001240 <blocks>:
    1240:	0046                	.insn	2, 0x0046
    1242:	0000                	.insn	2, 0x
    1244:	0344                	.insn	2, 0x0344
    1246:	0000                	.insn	2, 0x
    1248:	0046                	.insn	2, 0x0046
    124a:	0000                	.insn	2, 0x
    124c:	02c4                	.insn	2, 0x02c4
    124e:	0000                	.insn	2, 0x
    1250:	0046                	.insn	2, 0x0046
    1252:	0000                	.insn	2, 0x
    1254:	0244                	.insn	2, 0x0244
    1256:	0000                	.insn	2, 0x
    1258:	0005                	.insn	2, 0x0005
    125a:	0000                	.insn	2, 0x
    125c:	0005                	.insn	2, 0x0005
    125e:	0000                	.insn	2, 0x
    1260:	0000004b          	.insn	4, 0x004b
    1264:	0000004b          	.insn	4, 0x004b
    1268:	0091                	.insn	2, 0x0091
    126a:	0000                	.insn	2, 0x
    126c:	0091                	.insn	2, 0x0091
    126e:	0000                	.insn	2, 0x
    1270:	012c                	.insn	2, 0x012c
    1272:	0000                	.insn	2, 0x
    1274:	012c                	.insn	2, 0x012c
    1276:	0000                	.insn	2, 0x
    1278:	012c                	.insn	2, 0x012c
    127a:	0000                	.insn	2, 0x
    127c:	01ac                	.insn	2, 0x01ac
    127e:	0000                	.insn	2, 0x
    1280:	016c                	.insn	2, 0x016c
    1282:	0000                	.insn	2, 0x
    1284:	012c                	.insn	2, 0x012c
    1286:	0000                	.insn	2, 0x
    1288:	01f4                	.insn	2, 0x01f4
    128a:	0000                	.insn	2, 0x
    128c:	0344                	.insn	2, 0x0344
    128e:	0000                	.insn	2, 0x
    1290:	01f4                	.insn	2, 0x01f4
    1292:	0000                	.insn	2, 0x
    1294:	02c4                	.insn	2, 0x02c4
    1296:	0000                	.insn	2, 0x
    1298:	01b4                	.insn	2, 0x01b4
    129a:	0000                	.insn	2, 0x
    129c:	02c4                	.insn	2, 0x02c4
    129e:	0000                	.insn	2, 0x
    12a0:	01f4                	.insn	2, 0x01f4
    12a2:	0000                	.insn	2, 0x
    12a4:	0005                	.insn	2, 0x0005
	...

Disassembly of section .sdata:

000012a8 <debug>:
    12a8:	c001                	.insn	2, 0xc001
    12aa:	ffff                	.insn	2, 0xffff

000012ac <joystick>:
    12ac:	c002                	.insn	2, 0xc002
    12ae:	ffff                	.insn	2, 0xffff

000012b0 <VGA>:
    12b0:	ffffc003          	lbu	zero,-1(t6)

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
