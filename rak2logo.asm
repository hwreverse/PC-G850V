5000RAK:
5001 XOR A
5002 LD B,144
5003 LD D,0
5004 LD E,0
5005 CALL 0BFEEH
5006 JP MAIN
5007GPF EQU 0BFD0H
5008MAIN: LD HL,L0
5009 LD B,144
5010 LD DE,0
5011 CALL GPF
5012 LD HL,L1
5013 LD B,144
5014 LD DE,0100H
5015 CALL GPF
5016 LD HL,L2
5017 LD B,144
5018 LD DE,0200H
5019 CALL GPF
5020 LD HL,L3
5021 LD B,144
5022 LD DE,0300H
5023 CALL GPF
5024 LD HL,L4
5025 LD B,144
5026 LD DE,0400H
5027 CALL GPF
5028 LD HL,L5
5029 LD B,144
5030 LD DE,0500H
5031 CALL GPF
5032 IN A,(1FH)
5033 RLCA
5034 RET C
5035 JP MAIN
5036 RET
5037L0: DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5038 DB 00H,00H,80H,0C0H,0E0H,0F0H,0F8H,0F8H,0FCH,0FCH,0FEH,0FEH
5039 DB 7EH,7EH,7FH,3FH,3FH,3EH,3EH,3EH,3EH,0CH,00H,00H
5040 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5041 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5042 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5043 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5044 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5045 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5046 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5047 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5048 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5049L1: DB 00H,00H,80H,80H,80H,80H,00H,00H,80H,0C0H,0C0H,0D8H
5050 DB 0DEH,0BFH,3FH,9FH,0DFH,0CFH,0D7H,9BH,39H,3CH,0BEH,0BEH
5051 DB 9FH,0DFH,0DFH,0DFH,0DFH,0DFH,0DFH,9FH,9FH,1FH,60H,0F8H
5052 DB 0F8H,0F8H,0F0H,0E0H,0E0H,0C0H,80H,00H,00H,00H,00H,00H
5053 DB 00H,00H,00H,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,1FH
5054 DB 1FH,1FH,1FH,1FH,1FH,1FH,1FH,1FH,3FH,3FH,7FH,0FFH
5055 DB 0FFH,0FFH,0FEH,0FCH,0F8H,0F0H,80H,00H,00H,00H,00H,00H
5056 DB 00H,00H,00H,00H,00H,80H,0F0H,0FEH,0FFH,0FFH,0FFH,0FFH
5057 DB 0FFH,0FFH,0FFH,0FFH,0FCH,0F0H,80H,00H,00H,00H,00H,00H
5058 DB 00H,00H,00H,00H,00H,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH
5059 DB 0FFH,00H,00H,00H,00H,80H,0C0H,0E0H,0F0H,0F8H,0FCH,0FEH
5060 DB 0FFH,0FFH,7FH,3FH,1FH,0FH,07H,03H,01H,00H,00H,00H
5061L2: DB 3CH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,00H,7FH,0FFH,0FFH,0FFH
5062 DB 0FFH,0C1H,1CH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,00H,1FH,1FH
5063 DB 1FH,1FH,1FH,0DFH,0DFH,0DFH,0DFH,0CFH,0EFH,07H,70H,0FCH
5064 DB 0F9H,0F3H,0CFH,1FH,7FH,0FFH,0FFH,0FFH,0FCH,0F8H,0C0H,00H
5065 DB 00H,00H,00H,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0C0H
5066 DB 0C0H,0C0H,0C0H,0C0H,0C0H,0C0H,0C0H,0C0H,0C0H,0E0H,0F0H,0FFH
5067 DB 0FFH,0FFH,0FFH,0FFH,7FH,1FH,03H,00H,00H,00H,00H,00H
5068 DB 00H,00H,80H,0F0H,0FEH,0FFH,0FFH,0FFH,0FFH,7FH,0FH,01H
5069 DB 03H,1FH,0FFH,0FFH,0FFH,0FFH,0FFH,0FCH,0F0H,80H,00H,00H
5070 DB 00H,00H,00H,00H,00H,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH
5071 DB 0F7H,0F0H,0F8H,0FCH,0FEH,0FFH,0FFH,0FFH,0FFH,0FFH,0C7H,83H
5072 DB 01H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5073L3: DB 00H,01H,0FH,3FH,7FH,0FFH,0FFH,0FFH,0FCH,0F3H,0E7H,0CFH
5074 DB 0BFH,1FH,40H,0F3H,0FBH,0FBH,0FBH,0FBH,0FBH,0F8H,0F8H,0F8H
5075 DB 0F8H,0F8H,0C0H,0FH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,00H,0FFH
5076 DB 0FFH,0FFH,0FFH,0FFH,00H,03H,0FFH,0FFH,0FFH,0FFH,0FFH,7EH
5077 DB 00H,00H,00H,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,07H
5078 DB 07H,07H,07H,07H,07H,07H,0FH,0FH,0FH,1FH,3FH,0FFH
5079 DB 0FFH,0FFH,0FEH,0FCH,0F8H,0E0H,00H,00H,00H,00H,00H,80H
5080 DB 0F0H,0FEH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0F9H,0F8H,0F8H,0F8H
5081 DB 0F8H,0F8H,0F8H,0FBH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FCH,0F0H
5082 DB 80H,00H,00H,00H,00H,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH
5083 DB 0FFH,1FH,0FH,07H,03H,07H,1FH,3FH,0FFH,0FFH,0FFH,0FFH
5084 DB 0FEH,0FCH,0F0H,0E0H,0C0H,00H,00H,00H,00H,00H,00H,00H
5085L4: DB 00H,00H,00H,00H,00H,00H,01H,03H,07H,0FH,0FH,1FH
5086 DB 1FH,07H,70H,0F9H,0FDH,0F9H,0FBH,0FBH,0FBH,0FBH,0FBH,0F9H
5087 DB 7DH,7DH,3DH,0BCH,0DDH,0E9H,0E3H,0F3H,0F9H,0FCH,0FCH,79H
5088 DB 3BH,03H,03H,01H,00H,00H,01H,01H,01H,01H,01H,00H
5089 DB 00H,00H,00H,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,00H
5090 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,1FH
5091 DB 0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0F0H,00H,80H,0F0H,0FEH,0FFH
5092 DB 0FFH,0FFH,0FFH,0FFH,1FH,03H,01H,01H,01H,01H,01H,01H
5093 DB 01H,01H,01H,01H,01H,01H,07H,3FH,0FFH,0FFH,0FFH,0FFH
5094 DB 0FFH,0FCH,0F0H,80H,00H,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH
5095 DB 0FFH,00H,00H,00H,00H,00H,00H,00H,00H,01H,07H,0FH
5096 DB 3FH,7FH,0FFH,0FFH,0FFH,0FFH,0FEH,0F8H,0F0H,0E0H,80H,00H
5097L5: DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5098 DB 00H,00H,00H,3CH,7EH,0FEH,0FEH,0FEH,0FEH,0FEH,0FEH,7EH
5099 DB 7FH,7FH,3FH,3FH,1FH,1FH,0FH,07H,07H,03H,01H,00H
5100 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5101 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5102 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5103 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5104 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5105 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5106 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5107 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H
5108 DB 00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H,00H

