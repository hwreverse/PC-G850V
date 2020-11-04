10 ORG 100H
20PUTSTR EQU 0BFF1H
30WAITK EQU 0BFCDH
40RPTCHR EQU 0BFEEH
50 CALL CLS
60 LD HL,GREET
70 CALL STRLN
80 LD DE,0000H
90 CALL PUTSTR
100 LD A,1
110 OUT (60H),A ; 8-BIT PIO
120 LD A,0
130 OUT (61H),A ; ALL OUTPUT
140 CALL WAIT
150ENCORE: LD HL,START
160 CALL STRLN
170 LD DE,0100H
180 CALL PUTSTR
190 CALL MYLOOP
200 LD HL,STOP
210 CALL STRLN
220 LD DE,0200H
230 CALL PUTSTR
250 LD HL,CNTN
260 CALL STRLN
270 LD DE,0300H
280 CALL PUTSTR
290 CALL WAIT
300 CALL MX2KEY
310 CP 'Q'
320 JP Z,THEEND
330 CALL CLS
340 JP ENCORE

1100WAIT: CALL WAITK
1110 CP 0
1120 JP Z,WAIT
1130 RET
1140THEEND: LD HL,BYE
1150 CALL STRLN
1160 LD DE,0500H
1170 CALL PUTSTR
1180 RET

2000CLS: LD A,144
2010 LD (CLSN),A
2020 LD DE,0
2030 LD (CLSX),DE
2040 LD A,32
2050 LD (CHAR),A
2060CLS0: LD A,(CLSN)
2070 LD B,A
2080 LD A,(CHAR)
2090 LD DE,(CLSY)
2100 CALL RPTCHR
2110 RET
2120CLSN: DB 144
2130CLSY: DB 0
2140CLSX: DB 0
2150CHAR: DB 32

3450STRLN: LD B,0
3460 PUSH HL
3470STRLN0: LD A,(HL)
3480 CP 0
3490 JP Z,STRLN1
3500 INC HL
3510 INC B
3520 JP STRLN0
3530STRLN1: POP HL
3540 RET

3540MX2KEY: LD B,0
3550 LD C,A ; A IS KEY INDEX
3560 LD HL,MATRIX
3570 ADD HL,BC
3580 LD A,(HL)
3590 RET

4000MYLOOP: LD A,1 ; 2 cycles
4010 OUT (62H),A ; HIGH ; 3 cycles
4020 LD A,0 ; (256 times) 2 cycles
4030MLP01: PUSH AF ; 3 cycles
4040 LD A,0 ; (256 times) 2 cycles
4050MLP00: PUSH AF ; 3 cycles
4060 LD HL,LOOP0 ; 2 cycles
4070 LD DE,LOOP1 ; 2 cycles
4080 LD BC,32 ; 2 cycles
4090 LDIR ; 4/5 cycles
4100 POP AF ; 3 cycles
4110 DEC A ; 1 cycle
4120 JP NZ,MLP00 ; 3 cycles
4130 POP AF ; 3 cycles
4140 DEC A ; 1 cycle
4150 JP NZ,MLP01 ; 3 cycles
4160 LD A,0 ; 2 cycles
4170 OUT (62H),A ; LOW ; 3 cycles
4180 RET ; 3 cycles

4200LOOP0: DB 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
4210 DB 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
4220LOOP1: DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
4230 DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

5000GREET: DB 'Hit key to start',0
5010START: DB 'Start...',0
5020STOP: DB 'Stop...',0
5030BYE: DB 'Good Bye...',0
5040CNTN: DB 'Q: end or other key',0
5050MATRIX: DB 0,0FFH
5060 DB 'QWERTYUASDFGHJKZXCVBNM,'
5070 DB 0FFH,0FFH,0FFH,0FFH,9,32,10,11,14,15 ; LEFT RIGHT UP DOWN
5080 DB 0FFH,'0.=+',13,'L;',0FFH,'123-'
5090 DB 0FFH,'IO',0FFH,'456*',0FFH,'P',8,0FFH,'789/)'
5100 DB 0FFH,0FFH,0FFH,0FFH,'(',0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH
5110 DB 0,12,0FFH

