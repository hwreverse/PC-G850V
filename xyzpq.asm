10 ORG 0100H
20PUTCHR EQU 0BE62H
30DSPHEX EQU 0F9BDH
40AOUT EQU 0BD09H
50 JP MAIN
60MAIN: LD HL,(L0)
70 LD A,(HL)
80 CALL AOUT
90 LD HL,DSPLYV
100 CALL DSPHEX
110 LD B,A
120 AND 7
130 LD HL,STOREZ
140 LD (HL),A
150 CALL AOUT
160 LD HL,DSPLYZ
170 CALL DSPHEX
180 LD A,B
190 RRCA
200 RRCA
210 RRCA
220 AND 7
230 LD C,A
240 CALL AOUT
250 LD HL,DSPLYY
260 CALL DSPHEX
270 LD HL,STOREY
280 LD (HL),A
290 AND 1
300 LD HL,STOREQ
310 LD (HL),A
320 LD HL,DSPLYQ
330 CALL DSPHEX
340 LD A,C
350 RRCA
360 LD HL,STOREP
370 LD (HL),A
380 LD HL,DSPLYP
390 CALL DSPHEX
400 LD A,B
410 RRCA
420 RRCA
430 RRCA
440 RRCA
450 RRCA
460 RRCA
470 AND 3
480 LD HL,STOREX
490 LD (HL),A
500 CALL AOUT
510 LD HL,DSPLYX
520 CALL DSPHEX
530 LD HL,DSPLAY
540 CALL STRLN
550 LD HL,DSPLYL
560 LD A,B
570 CALL DSPHEX
580 LD HL,DSPLAY
590 LD DE,00100H
600 CALL DSPSTR
610 RET
620STRLN: LD B,0
630STRLN0: LD A,(HL)
640 CP 0
650 JP Z,STRLN1
660 INC HL
670 INC B
680 JP STRLN0
690STRLN1: RET
700DSPSTR: LD A,(HL)
710 INC HL
720 PUSH BC
730 PUSH DE
740 PUSH HL
750 CALL PUTCHR
760 POP HL
770 POP DE
780 POP BC
790 INC E
800 LD A,E
810 SUB 24
820 JP M,SKIP0
830 INC D
840 LD E,0
850SKIP0: DJNZ DSPSTR
860 RET
870L0: DB 0,1
880STOREX: DB 0
890STOREY: DB 0
900STOREZ: DB 0
910STOREP: DB 0
920STOREQ: DB 0
930DSPLAY: DB 'A:'
940DSPLYV: DB ' ,LN:'
950DSPLYL: DB ' ,X:'
960DSPLYX: DB ' ,Y:'
970DSPLYY: DB ' ,Z:'
980DSPLYZ: DB ' ,P:'
990DSPLYP: DB ' ,Q:'
1000DSPLYQ: DB ' ',0,0,0


