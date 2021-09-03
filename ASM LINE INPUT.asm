10 ORG 400H
20 ; leaving space for RAMDISK.ASM
30 ; used as a debug tool
40 JP MAIN
50PUTSTR EQU 0BFF1H
60INKEY EQU 0BE53H
70PUTCHR EQU 0BE62H
80WAITK EQU 0BFCDH
90RPTCHR EQU 0BFEEH
100GPF EQU 0BFD0H
110LDPSTR EQU 0BD00H

120BUFFER: DEFS 24
130 DB 0

140MAIN: CALL CLS
150 LD HL,BANNER
160 LD D,0
170 CALL PUTBNR
180 LD HL,LINE01
190 LD DE, 0100H
200 CALL STRLN
210 CALL PUTSTR
220 LD HL,LINE02
230 LD DE, 0300H
240 CALL STRLN
250 CALL PUTSTR

260 LD DE,0300H
270 LD HL,BUFFER
280 CALL INPUT
290 LD HL,BUFFER
300 LD B,24
310 LD DE,0400H
320 CALL PUTSTR
330 CALL WAITK
340 RET

350CCOUNT: DB 0
360POSXY: DW 0
370INPUT: PUSH DE
380 PUSH HL
390 LD (POSXY),DE
400 LD HL,SBUF
410 LD B,144
420 CALL LDPSTR
430 LD A,' '
440 LD B,124
450 LD DE,(POSXY)
460 CALL RPTCHR
470 LD DE,(POSXY)
480INPUT0: PUSH HL
490 LD A,'_'
500 CALL PUTCHR
510 CALL VBWEHT
520 POP HL
530 CP 0
540 JP NZ,INPUT1
550 PUSH HL
560 LD A,' '
570 LD DE,(POSXY)
580 CALL PUTCHR
590 CALL VBWEHT
600 POP HL
610 CP 0
620 JP Z,INPUT0
630INPUT1: CP 28H ; RETURN
640 JP Z,INPUTX
650 CP 51H ; ON/BREAK
660 JP Z,INPUTY
670 CP 3AH ; BS
680 JP Z,BAKSPC
690 CP 21H ; BS
700 JP Z,BAKSPC
710 CALL MX2KEY
720 CP 0FFH
730 JP Z,INPUT0
740 LD (HL),A
750 INC HL
760 PUSH HL
770 LD DE,(POSXY)
780 CALL PUTCHR
790 POP HL
800 INC DE
810 LD (POSXY),DE
820 LD A,(CCOUNT)
830 INC A
840 LD (CCOUNT),A
850 CP 24
860 JP M,INPUT0
870 JP INPUTX

880INPUTY: POP HL ; CANCEL
890 PUSH HL
900INPUTX: XOR A
910 LD (HL),A
920 POP HL
930 POP DE ; ORIGINAL COORDS
940 PUSH HL
950 LD HL,SBUF
960 LD B,144
970 CALL GPF
980 POP HL ; RESTORE HL
990 RET

1000BAKSPC: LD A,(CCOUNT)
1010 CP 0
1020 JP Z,INPUT0
1030 DEC A
1040 LD (CCOUNT),A
1050 PUSH HL
1060 LD A,' '
1070 LD DE,(POSXY)
1080 DEC DE
1090 LD (POSXY),DE
1100 LD B,2
1110 CALL RPTCHR
1120 POP HL
1130 JP INPUT0

1140BANNER: DB '- Line Input -',0
1150LINE01: DB 'Input some text below:',0
1160LINE02: DB 'Just some stuff:',0
1170SBUF: DEFS 144

5000VBWEHT: LD B,125
5010BWEHT: PUSH BC
5020 CALL WEHT ; ~1 millisec
5030 CALL INKEY
5040 POP BC
5050 CP 0
5060 RET NZ
5070 DJNZ BWEHT
5080 RET

5090WEHT: LD B,241
5100WEHT0: NOP
5110 NOP
5120 NOP
5130 NOP
5140 NOP
5150 DJNZ WEHT0
5160 RET

5170PUTSR1: LD A,(HL)
5180 INC HL
5190 CP 0
5200 JP Z, PUTSR2
5210 OUT (72H),A
5220 CALL WEHT
5230 JP PUTSR1
5240PUTSR2: LD A,13
5250 OUT (72H),A
5260 LD A,10
5270 OUT (72H),A
5280 RET

5290PUTBNR: CALL STRLN
5300 LD A,24
5310 SUB B
5320 RRCA
5330 LD D,00H
5340 LD E,A
5350 CALL PUTSTR
5360 RET

5370NM2DEC: LD BC,-10000
5380 CALL NMDC1
5390 LD BC,-1000
5400 CALL NMDC1
5410 LD BC,-100
5420 CALL NMDC1
5430 LD C,-10
5440 CALL NMDC1
5450 LD C,B
5460NMDC1: LD A,-1
5470NMDC2: INC A
5480 ADD HL,BC
5490 JR C,NMDC2
5500 SBC HL,BC
5510 ADD A,48
5520 LD (DE),A
5530 INC DE
5540 RET

5550CLS: LD B,144
5560 LD DE,0
5570CLS0: LD A,32
5580 CALL RPTCHR
5590 RET
5600CLLN: LD B,24
5610 LD E,0
5620 JP CLS0

5630BYTE: PUSH AF
5640 AND 0F0H
5650 RRCA
5660 RRCA
5670 RRCA
5680 RRCA
5690 CALL NIBBLE
5700 INC HL
5710 POP AF
5720 AND 15
5730 CALL NIBBLE
5740 INC HL
5750 RET
5760NIBBLE: SUB 10
5770 JP M,ZERO9
5780 ADD A,7
5790ZERO9: ADD A,58
5800 LD (HL),A
5810 RET

5820STRLN: LD B,0
5830 PUSH HL ; preserve HL
5840STRLN0: LD A,(HL)
5850 CP 0
5860 JP Z,STRLN1
5870 INC HL
5880 INC B
5890 JP STRLN0
5900STRLN1: POP HL ; restore HL
5910 RET

5920MX2KEY: LD B,0
5930 LD C,A ; A IS KEY INDEX
5940 LD HL,MATRIX
5950 ADD HL,BC
5960 LD A,(HL)
5970 RET
5980MATRIX: DB 0,0FFH
5990 DB 'QWERTYUASDFGHJKZXCVBNM,'
6000 DB 0FFH,0FFH,0FFH,0FFH,9,32,10,11,14,15 ; LEFT RIGHT UP DOWN
6010 DB 0FFH,'0.=+',13,'L;',0FFH,'123-'
6020 DB 0FFH,'IO',0FFH,'456*',0FFH,'P',8,0FFH,'789/)'
6030 DB 0FFH,0FFH,0FFH,0FFH,'(',0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH
6040 DB 0,12,0FFH

6050PREPSR: LD A,2
6060 OUT (60H),A
6070 DEC A ; A=1
6080 OUT (74H),A
6090 XOR A ; A=0
6100 OUT (73H),A
6110 INC A ; A=1
6120 OUT (73H),A
6130 XOR A ; A=0
6140 OUT (73H),A
6150 LD A,0DH
6160 OUT (70H),A
6170 LD A,4EH
6180 OUT (71H),A
6190 LD A,10H
6200 OUT (71H),A
6210 XOR A ; A=0
6220 OUT (63H),A
6230 LD A,05H
6240 OUT (71H),A
6250 LD A,14H
6260 OUT (63H),A
6270 RET

6280GREET: DB '- LoRa Messenger -',0
6290MENUM0: DB '[p]ing [/]prefs [q]uit',0
6300MENUM1: DB '[m]box {'
6310MENUMB: DB 0,' msg}',0
6320MENUM2: DB 'SELECT MENU',0
6330ZOIGIN: DB 'Bye...',13,10,0

