; Disassembly of the file "D:\Documents\Z80\zout\140K27256.bin"
; PWB ASSY CONTROL 140K70720 TPB-S.V0 of RANK XEROX 8M6 module


; HISTORY:
; 12/03/25	started
; 14/03/25	Created messages in strings
; 15/03/25	Font table added


; CPU 1 Type: HD64180RP8 (Z180) (RP8 means 8MHz clock)
; Crystal: 15.000 MHz (X2), resulting in system clock of 7.500 MHz   
; Baud rate clock Crystal (X1): 4.9152 MHz using (U4 74HC393) as clock divider. Connected to CKA0 and CKA1.
; Addres space: 512K (A0-A18)
;################################################
.Z180	; Set assembler in Z180 mode for HD64180
;################################################
; CPU 2 Type: 68HC11
; Crystal: (X5)

; Memory Map:
; 0000 - 7FFF	U2	EPROM 	27C256-25
; 8000 - FFFF	U3	SRAM	HM62256LFP

; Display:
; Sanyo LCM-556-11E 256x128 pixels = 32.768 bit = 4096 bytes
; Graphics buffer at 99BDH (PIXELBUFFER)

;	8000	RAM START
;	99BD	PIXELBUFFER START
;	A9BC	PIXELBUFFER END
;   EFFF	END OF CLEAR RAM
;
;
;
;	FFFF	RAM END	
;  10000	BEGIN OF STACK (WORKING DOWN)


; Port Map:
; Internal Z180 ports used:
; $00 - $05
; $08 , $09
; $0E - $10
; $14 , $15
; $32 - $34
; $36 , $3F

;-----------------------
; ASCI Registers port 0 and 1 (Asynchronous Serial Communication Interface)
		CNTLA0	EQU	0000h	; ASCI Channel Control Register A 0
		CNTLA1	EQU	0001h	; ASCI Channel Control Register A 1
		CNTLB0	EQU	0002h	; ASCI Control Register B 0				MPST MP CTS*/PS PEO DR SS2 SS1 SS0
		CNTLB1	EQU	0003h	; ASCI Control Register B 1				MPST MP CTS*/PS PEO DR SS2 SS1 SS0
		STAT0	EQU	0004h	; ASCI Status Register 0
		STAT1	EQU	0005h	; ASCI Status Register 1
		TDR0	EQU	0006h	; ASCI Transmit Data Register 0			[NOT USED]
		TDR1	EQU	0007h	; ASCI Transmit Data Register 1
		RDR0	EQU	0008h	; ASCI Receive Data FIFO 0
		RDR1	EQU	0009h	; ASCI Receive Data FIFO 1
; CSI/O																[NOT USED]
		CNTR	EQU	000ah	; CSI/O Control Register				EF EE RE TE - SS2 SS1 SS0
		TRDR	EQU 000bh	; CSI/O Transmit/Receive Data Register
; Timer
		TMDR0L	EQU	000ch	; Timer Data Register Channel 0L		[NOT USED]
		TMDR0H	EQU	000dh	; Timer Data Register Channel 0H		[NOT USED]
		RLDR0L	EQU	000eh	; Timer Reload Register 0L
		RLDR0H	EQU	000fh	; Timer Reload Register 0H
		TCR		EQU	0010h	; Timer Control Register
;		reserved	0011h
;					0012h
;					0013h		
		TMDR1L	EQU	0014h	; Timer Data Register Channel 1L
		TMDR1H	EQU	0015h	; Timer Data Register Channel 1H
		RLDR1L	EQU	0016h	; Reload Register 1L					[NOT USED]
		RLDR1H	EQU	0017h	; Reload Register 1H					[NOT USED]
; Other
		FRC		EQU	0018h	; Free Running Counter					[NOT USED]
;		reserved	0019h
;					   |
;					001fh		
; DMA 
		SAROL	EQU	0020h	; DMA Source Address Register Ch OL 
		SAROH	EQU	0021h	; DMA Source Address Register Ch OH 
		SAROB	EQU	0022h	; DMA Source Address Register Ch OB 
		DAROL	EQU	0023h	; DMA Destination Address Register Ch OL 
		DAROH	EQU	0024h	; DMA Destination Address Register Ch OH 
		DAROB	EQU	0025h	; DMA Destination Address Register Ch OB 
		BCROL	EQU	0026h	; DMA Byte Count Register Ch OL 
		BCROH	EQU	0027h	; DMA Byte Count Register Ch OH 
		MAR1L	EQU	0028h	; DMA Memory Address Register Ch 1 L 
		MAR1H	EQU	0029h	; DMA DMA Memory Address Register Ch 1 H 
		MAR1B	EQU	002ah	; DMA Memory Address Register Ch 1 B  
		IAR1L	EQU	002bh	; DMA I/O Address Register Ch 1 L 
		IAR1H	EQU	002ch	; DMA I/O Address Register Ch 1 H 
;		reserved	002dh
		BCR1L	EQU	002eh	; DMA Byte Count Register Ch 1 L 
		BCR1H	EQU	002fh	; DMA Byte Count Register Ch 1 H 
		DSTAT	EQU	0030h	; DMA Status Register 
		DMODE	EQU	0031h	; DMA Mode Register  
		DCNTL	EQU	0032h	; DMA/WAIT Control Register
; Interrupt Control
		IL		EQU	0033h	; Interrupt Vector Low Register
		ITC		EQU	0034h	; Int/TRAP Control Register
;		reserved	0035h
; Refresh
		RCR		EQU	0036h	; Refresh Control Register
;		reserved	0037h
; MMU
		CBR		EQU	0038h	; MMU Common Base Register
		BBR		EQU	0039h	; MMU Bank Base Register
		CBAR	EQU	003ah	; MMU Common/Bank Area Register
; I/O
;		reserved	003bh
;					003ch
;					003dh
		OMCR	EQU	003eh	; Operation Mode Control Register
		ICR		EQU	003fh	; I/O Control Register

;-----------------------

; External onboard ports used:

; $80	register	HD61830B LCD controller
; $81	data		HD61830B LCD controller
;
; 8255 U10								Used for 13 LED array
; 0A0H			00	Port A		output
; 0A1H			00	Port B		output
; 0A2H			00	Port C		output   (not used?)
; 0A3H			80	Control word
;
; 8255 U14								Also used for card reader
; 0C0H			00	Port A		input
; 0C1H			04	Port B		output	
; 0C2H			00	Port C		input
; 0C3H			99	Control word
;
; Extra IO:
; U10 82C55AFP2	used for the LEDS (output)	Needs 13 output bit, so 8255 at 0A0H ~ 0A3H
; U14 82C55AFP2
; 
; Created with dZ80 2.0
; Monday, 10 of March 2025 at 11:06 PM
;
; Commented by Ruud Broers, March 2025
; 
; Declarations
;
		LF		EQU		0ah	; Line feed
		FALSE	EQU		00
		TRUE	EQU		01
		DEBUG	EQU		TRUE
		PIXELBUFFER	EQU	99BDH
		BUFFERSIZE	EQU	1000H	; 4096 bytes
		
; START of CODE
;		
		org		0000H
L0000:  DI
IF Debug = True      
        LD      A,81H		; Turn upper 32K RAM on on Model II for testing
        OUT     (0FFH),A	;
ENDIF		
        JP      INIT		; Continue with original code
		org		0008h
RST08:  JR      RST08
        org		0010h     
RST10:  JR      RST10
        org		0018h      
RST18:  JR      RST18
        org		0020h      
RST20:  JR      RST20
        org		0028h      
RST28:  JR      RST28
        org		0030h      
RST30:  JR      RST30
        org		0038h      
RST38:  JR      RST38
;							next memory filled with 00 until 0066H	
		org 	0066H
L0066:  JR      L0066	; NMI interrupt
;							next memory filled with 00 until 0084H
		org 	0084H
L0084:  DEC     SP
        INC     BC

		org		0090H
L0090:	DEFB	0DDH				; illegal Z180 opcode	WHAT IS THIS ??
		DEFB	01H     
INIT:
		LD      SP,$0000				; set stack pointer at end of RAM +1
        XOR     A			; init internal devices
        OUT0    (36H),A                 ; Refresh off
        OUT0    (34H),A                 ; Z180 instruction
        LD      A,10H
        OUT0    (32H),A                 ; Z180 instruction
        LD      A,80H
        OUT0    (33H),A                 ; Z180 instruction
        LD      A,00H
        LD      I,A
        LD      A,04H					;
        OUT0    (CNTLA0),A              ; 04H = Start+8 bit data+ 1 stop
        LD      A,07H
        OUT0    (CNTLB0),A              ; 07H = Baud rate channel 0: EXTERNAL clock connected to pin 47 (CKA0)
        LD      A,02H					;
        OUT0    (CNTLA1),A              ; 02H = Start+7 bit data+ parity + 1 stop
        LD      A,07H
        OUT0    (CNTLB1),A              ; 07H = Baud rate channel 1: EXTERNAL clock connected to pin 50 (CKA1)
        LD      A,00H
        OUT0    (04H),A                 ; Z180 instruction
        LD      A,0CH
        OUT0    (05H),A                 ; Z180 instruction
        LD      A,90H
        OUT0    (0EH),A                 ; Z180 instruction
        LD      A,01H
        OUT0    (0FH),A                 ; Z180 instruction
        LD      A,90H
        OUT0    (14H),A                 ; Z180 instruction
        LD      A,01H
        OUT0    (15H),A                 ; Z180 instruction
        LD      A,11H
        OUT0    (10H),A                 ; Z180 instruction
;---------------------------------------------------------------
;							init external devices 82C55 2x?
;---------------------------------------------------------------
        LD      A,80H		; Mode 0, Port A, B, C: output
        OUT     (0A3H),A
        LD      A,99H		; Mode 0, Port A, C: input, Port B: output (0C1H)
        OUT     (0C3H),A
        LD      A,00H
        OUT     (0C2H),A	; 00 to C	Clear all ports?
        OUT     (0A1H),A	; 00 to B	|
        OUT     (0A0H),A	; 00 to A	|
        OUT     (0A2H),A	; 00 to C	|
        OUT     (0C0H),A	; 00 to A	|
        LD      A,04H
        OUT     (0C1H),A	; 04 to B
        CALL    INITLCD					; init LCD Controller
        CALL    CLEARPIXELBUFFER		; at PIXELBUFFER
        CALL    PIXELS2LCD

ClearRAM8000:
        LD      HL,8000H	; Clear RAM from 8000 - 0EFFFH
        LD      BC,6FFFH	; Note: This also clears the pixel buffer again
ClRepeat:
		LD      (HL),00H
        INC     HL
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,ClRepeat

;Config serial ports

;		CNTLA0	EQU	0000h	; ASCI Channel Control Register A 0		C/PS = CTS*/PS
							; MPE  RE  TE  RTS* MPBR/EFR MOD2 MOD1 MOD0
							;					          ^-------------- 0 = 7 bit, 1 = 8 bit data
							;							       ^--------- 0 = No Parity, 1 = Parity Enabled
							;										^---- 0 = 1 stop bit, 1 = 2 stop bits
							;					    ^---------- Multi Processor Bit Receive/Error Flag Reset
							;               ^------------------ Request To Send
							;			^---------------------- Transmitter Enable
							;       ^-------------------------- Receiver Enable
							;   ^------------------------------ Multi Processor Bit Transmit

;		CNTLA1	EQU	0001h	; ASCI Channel Control Register A 1
							; MPE  RE  TE CKA1D MPBR/EFR MOD2 MOD1 MOD0
							;               ^------------------ CKA1 Clock Disable (0 = external clock for ch 1)

;		CNTLB0	EQU	0002h	; ASCI Control Register B 0
							; MPST MP C/PS PEO DR SS2 SS1 SS0	C/PS = CTS*/PS
							;					   ^---^---^--*	Baud Rate divider (1,1,1 = external clock)
							;					^-------------*	Sampling Rate
							;               ^------------------ Parity Even Odd (0=even)
							;			 ^--------------------*	Clear To Send / Pre Scaler
							;       ^-------------------------- Multi Processor Mode
							;   ^------------------------------ Multi Processor Bit Transmit

;		CNTLB1	EQU	0003h	; ASCI Control Register B 1			see above
;		STAT0	EQU	0004h	; ASCI Status Register 0
;		STAT1	EQU	0005h	; ASCI Status Register 1



        LD      A,64H					;      
        OUT0    (CNTLA0),A              ; 64H=  0   1   1   0   0   1   0   0
        LD      A,00H
        OUT0    (04H),A                 ; Z180 instruction
        LD      A,62H					;      
        OUT0    (CNTLA1),A              ; 62H=  0   1   1   0   0   0   1   0
        LD      A,0CH
        OUT0    (05H),A                 ; Z180 instruction
		
        LD      A,03H
        LD      (8000H),A
        CALL    L1876
L012c:  IN      A,(0C1H)
        OR      08H
        OUT     (0C1H),A
        CALL    L01CC
        IN      A,(0C1H)
        AND     0F7H
        OUT     (0C1H),A
        CALL    L01CC
        LD      A,74H					;      
        OUT0    (CNTLA0),A              ; 74H=  0   1   1   1   0   1   0   0
        LD      A,00H
        OUT0    (04H),A                 ; Z180 instruction
        LD      A,62H					;      
        OUT0    (CNTLA1),A              ; 62H=  0   1   1   0   0   0   1   0
        LD      A,0CH
        OUT0    (05H),A                 ; Z180 instruction
        IN0     A,(08H)                 ; CHECK ASCI Receive Data FIFO 0
        NOP     
        IN0     A,(08H)                 ; CHECK ASCI Receive Data FIFO 0
        IN0     A,(09H)                 ; CHECK ASCI Receive Data FIFO 1
        NOP     
        IN0     A,(09H)                 ; CHECK ASCI Receive Data FIFO 1
        LD      B,0FH
L0162:  CALL    DELAY3				; Delay 16x long
        DJNZ    L0162
        LD      A,51H
        CALL    L0FAF
        LD      BC,03E8H
L016f:  IN0     A,(05H)                 ; CHECK ASCI Status Register 1
        RLCA    
        JR      C,L018C
        CALL    DELAY
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,L016F
L017d:  LD      HL,MSG21				;0329CH	STORING
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        IN      A,(0C1H)
        AND     00H
L018a:  JR      L018A
L018c:  IN0     A,(09H)                 ; Z180 instruction
        CP      4BH
        JR      Z,L01A1
        LD      (8001H),A
        LD      A,(8000H)
        DEC     A
        LD      (8000H),A
        JR      NZ,L012C
        JR      L017D
L01a1:  XOR     A
        LD      (8000H),A
        LD      (8001H),A
        CALL    L01CA
        IM      2
        EI      
        CALL    L0FBC
        LD      A,00H
        LD      BC,01F4H
        LD      HL,0F82H
        CALL    L02ED
        LD      A,50H
        CALL    L0FAF
        CALL    L0FD5
        CALL    L057C
        JP      L1B5A
L01ca:  RETI    

L01cc:  LD      DE,0008
L01cf:  LD      BC,0000
L01d2:  DEC     BC
        LD      A,B
        OR      C
        JR      NZ,L01D2
        DEC     DE
        LD      A,D
        OR      E
        JR      NZ,L01CF
        RET     

        EX      AF,AF'
        EXX     
        IN0     A,(05H)                 ; CHECK ASCI Status Register 1
        LD      B,A
        AND     70H
        JR      Z,L01F9
        IN0     A,(09H)                 ; Z180 instruction
        IN0     A,(CNTLA1)                 ; Z180 instruction
        AND     0F7H
        OUT0    (CNTLA1),A                 ; Z180 instruction
        XOR     A
        LD      (8AF3H),A
        JP      L02E8
		
L01f9:  IN0     A,(09H)                 ; Z180 instruction
        LD      B,A
        CP      41H
        JP      NZ,L0212
        LD      A,01H
        LD      (8AF3H),A
        LD      HL,8042H
        LD      (8AF5H),HL
        LD      A,05H
        LD      (8AF4H),A
L0212:  LD      A,(8AF3H)
        AND     A
        JP      Z,L02E8
        LD      HL,(8AF5H)
        LD      (HL),B
        INC     HL
        LD      (8AF5H),HL
        LD      A,(8AF4H)
        DEC     A
        LD      (8AF4H),A
        JP      NZ,L02E8
        IN      A,(0C0H)
        AND     04H
        JP      Z,L02DD
        LD      C,00H
        LD      A,(8044H)
        SRL     A
        RR      C
        SRL     A
        RR      C
        LD      B,A
        LD      A,(8043H)
        OR      C
        LD      C,A
        LD      (8AF1H),BC
        LD      A,(8046H)
        LD      C,00H
        SRL     A
        RR      C
        SRL     A
        RR      C
        LD      B,A
        LD      A,(8045H)
        OR      C
        LD      C,A
        LD      (8AEFH),BC
        LD      BC,(8AEFH)
        LD      DE,(8AF1H)
        LD      D,B
        LD      B,C
        LD      C,D
        LD      D,00H
        CALL    L3A2E
        LD      HL,8B13H
        CALL    L3844
        LD      E,06H
        LD      D,01H
        LD      HL,8C84H
        CALL    L3B8A
        LD      BC,(8AF1H)
        LD      D,B
        LD      B,C
        LD      C,D
        LD      D,00H
        CALL    L3A2E
        LD      HL,8B17H
        CALL    L3844
        LD      E,06H
        LD      D,01H
        LD      HL,8C7AH
        CALL    L3B8A
        LD      HL,0D0AH
        LD      (8C80H),HL
        LD      (8C8AH),HL
        LD      HL,3D58H
        LD      (8C78H),HL
        LD      HL,3D59H
        LD      (8C82H),HL
        LD      HL,8C78H
        LD      B,14H
        IN      A,(0C1H)
        OR      10H
        OUT     (0C1H),A
L02bc:  IN0     A,(04H)                 ; Z180 instruction
        AND     02H
        JR      Z,L02BC
        LD      A,(HL)
        OUT0    (06H),A                 ; Z180 instruction
        INC     HL
        DJNZ    L02BC
        CALL    DELAY2
        IN      A,(0C1H)
        AND     0EFH
        OUT     (0C1H),A
        LD      A,50H
        CALL    L0FAF
        CALL    L0FBC
        JR      L02E8
L02dd:  LD      A,(8013H)
        AND     A
        JR      Z,L02E8
        LD      A,01H
        LD      (8AF7H),A
L02e8:  EXX     
        EX      AF,AF'
        EI      
        RETI    

L02ed:  LD      D,A
        LD      E,01H
L02f0:  AND     A
        JP      Z,L02F9
        DEC     A
        SLA     E
        JR      L02F0
L02f9:  LD      A,B
        OR      C
        JP      Z,L031F
        LD      A,(8001H)
        OR      E
        LD      (8001H),A
        LD      E,D
        SLA     E
        SLA     E
        LD      D,00H
        PUSH    HL
        LD      HL,8003H
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        LD      A,C
        LD      (DE),A
        INC     DE
        LD      A,B
        LD      (DE),A
        INC     DE
        LD      A,L
        LD      (DE),A
        INC     DE
        LD      A,H
        LD      (DE),A
        RET     

L031f:  INC     SP
        INC     SP
        JP      (HL)
        LD      D,A
        LD      E,01H
L0325:  AND     A
        JP      Z,L032E
        DEC     A
        SLA     E
        JR      L0325
L032e:  DI      
        LD      A,E
        CPL     
        LD      E,A
        LD      A,(8001H)
        AND     E
        LD      (8001H),A
        EI      
        RET     

        EX      AF,AF'
        EXX     
        LD      A,(8001H)
        AND     A
        JP      Z,L0364
        LD      E,01H
        LD      HL,8003H
        CALL    L03FB
        SLA     E
        LD      HL,8007H
        CALL    L03FB
        SLA     E
        LD      HL,800BH
        CALL    L03FB
        SLA     E
        LD      HL,800FH
        CALL    L03FB
L0364:  LD      A,(8C97H)
        AND     A
        JR      NZ,L037F
L036a:  LD      A,(8C98H)
        AND     A
        JR      Z,L03A9
        LD      A,01H
        LD      (8C97H),A
        LD      A,64H
        LD      (8C9AH),A
        CALL    L0E35
        JR      L03A9
L037f:  LD      A,(8C9AH)
        DEC     A
        LD      (8C9AH),A
        JR      NZ,L03A9
        LD      A,(8C99H)
        XOR     0FFH
        LD      (8C99H),A
        JR      Z,L039C
        LD      A,64H
        LD      (8C9AH),A
        CALL    L0E3E
        JR      L03A9
L039c:  XOR     A
        LD      (8C97H),A
        LD      A,(8C98H)
        DEC     A
        LD      (8C98H),A
        JR      NZ,L036A
L03a9:  IN      A,(0C0H)
        LD      B,A
        AND     01H
        JR      Z,L03BA
        LD      A,B
        AND     02H
        JR      Z,L03BA
        LD      A,01H
        LD      (8C9BH),A
L03ba:  IN0     A,(10H)                 ; Z180 instruction
        IN0     A,(0CH)                 ; Z180 instruction
        IN      A,(0C2H)
        XOR     01H
        OUT     (0C2H),A
        EXX     
        EX      AF,AF'
        EI      
        RETI    

L03cb:  LD      B,01H
        LD      HL,8005H
        RRCA    
        JR      C,L03EC
        LD      HL,8009H
        SLA     B
        RRCA    
        JR      C,L03EC
        LD      HL,800DH
        SLA     B
        RRCA    
        JR      C,L03EC
        LD      HL,8011H
        SLA     B
        RRCA    
        JP      NC,L1B06
L03ec:  LD      E,(HL)
        INC     HL
        LD      D,(HL)
        LD      A,B
        CPL     
        LD      B,A
        LD      A,(8002H)
        AND     B
        LD      (8002H),A
        EX      DE,HL
        JP      (HL)
L03fb:  LD      A,(8001H)
        AND     E
        RET     Z

        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        DEC     BC
        LD      (HL),B
        DEC     HL
        LD      (HL),C
        LD      A,B
        OR      C
        RET     NZ

        LD      A,(8002H)
        OR      E
        LD      (8002H),A
        LD      A,(8001H)
        XOR     E
        LD      (8001H),A
        RET     

SETLCDREG:
		PUSH    AF			; send data to LCD controller
L041A:  IN      A,(81H)
        RLCA    			; Wait for bit 7 of HD61830B to become low (non-busy)
        JR      C,L041A
        POP     AF
        OUT     (81H),A		; Send command to LCD controller
        RET     

BYTE2LCD:  PUSH    AF
L0424:  IN      A,(81H)
        RLCA    
        JR      C,L0424
        POP     AF
        OUT     (80H),A
        RET     

L042d:  PUSH    AF
        LD      A,51H
L0430:  DEC     A
        JR      NZ,L0430
        POP     AF
        RET     

INITLCD:
		LD      A,00H		; Program the LCD Controller
        CALL    SETLCDREG	; Load registers 00 01 02 03   08 09 0A 0B
        LD      A,32H		; With data      32 07 1F 3F   00 00 00 00
        OUT     (80H),A
		
        LD      A,01H
        CALL    SETLCDREG
        LD      A,07H
        OUT     (80H),A

        LD      A,02H
        CALL    SETLCDREG
        LD      A,1FH
        OUT     (80H),A

        LD      A,03H
        CALL    SETLCDREG
        LD      A,3FH
        OUT     (80H),A

        LD      A,08H
        CALL    SETLCDREG
        LD      A,00H
        OUT     (80H),A

        LD      A,09H
        CALL    SETLCDREG
        LD      A,00H
        OUT     (80H),A

        LD      A,0AH
        CALL    SETLCDREG
        LD      A,00H
        OUT     (80H),A

        LD      A,0BH
        CALL    SETLCDREG
        LD      A,00H
        OUT     (80H),A

        RET     

L047e:  PUSH    BC
        AND     A
        JR      Z,L048E
        CP      0FFH
        JR      Z,L048E
        LD      B,08H
L0488:  RLCA    
        RR      C
        DJNZ    L0488
        LD      A,C
L048e:  POP     BC
        RET     

        LD      A,01H
        LD      (8018H),A
        LD      (8019H),HL
        RET     

        XOR     A
        LD      (8018H),A
        RET     

L049e:  LD      A,50H
        CALL    L0FAF
        LD      A,01H
        LD      (8013H),A
        LD      (8014H),HL
        RET     

        XOR     A
        LD      (8013H),A
        RET     

L04b1:  LD      C,00H
        LD      A,(8044H)
        SRL     A
        RR      C
        SRL     A
        RR      C
        LD      B,A
        LD      A,(8043H)
        OR      C
        LD      C,A
        LD      (8AF1H),BC
        LD      A,(8046H)
        LD      C,00H
        SRL     A
        RR      C
        SRL     A
        RR      C
        LD      B,A
        LD      A,(8045H)
        OR      C
        LD      C,A
        LD      (8AEFH),BC
        LD      BC,(8AEFH)
        LD      DE,(8AF1H)
        XOR     A
        LD      (8013H),A
        LD      HL,(8014H)
        JP      (HL)
L04ef:  PUSH    DE
        LD      D,C
        LD      C,B
        LD      B,D
        LD      D,00H
        CALL    L3A2E
        LD      HL,8B13H
        CALL    L3844
        CALL    L09F3
        CALL    L39FD
        LD      D,C
        LD      C,B
        LD      B,D
        POP     DE
        PUSH    BC
        PUSH    DE
        POP     BC
        LD      D,C
        LD      C,B
        LD      B,D
        LD      D,00H
        CALL    L3A2E
        LD      HL,8B17H
        CALL    L3844
        CALL    L09F3
        CALL    L39FD
        LD      E,B
        LD      D,C
        POP     BC
        RET     

L0523:	defb	" 0.078808593 "
L0530:	defb	" 0.105664062 "
		
L053D:	push	DE
        LD      D,C
        LD      C,B
        LD      B,D
        LD      D,00H
        CALL    L3A2E
        LD      HL,1B56H
        CALL    L3892
        CALL    L09F3
        CALL    L39FD
        LD      A,4BH
        SUB     B
L0555:  ADD     A,02H
        LD      B,A
        LD      D,C
        LD      C,B
        LD      B,D
        POP     DE
        PUSH    BC
        PUSH    DE
        POP     BC
        LD      D,C
        LD      C,B
L0561:  LD      B,D
L0562:  LD      D,00H
L0564:  CALL    L3A2E
        LD      HL,1B56H
        CALL    L3892
        CALL    L09F3
        CALL    L39FD
        LD      A,B
        ADD     A,02H
        LD      E,B
        LD      D,C
        POP     BC
        LD      B,C
        LD      C,E
        RET     

L057c:  LD      HL,0523H			;point to " 0.078808593 "
        CALL    L3A92
        LD      HL,8B13H
        CALL    L393B
        LD      HL,0530H            ;point to " 0.105664062 "
        CALL    L3A92
        LD      HL,8B17H
        CALL    L393B
        RET     

L0595:  LD      HL,9BD3H
        LD      B,0AH
L059a:  LD      (HL),0FFH
        INC     HL
        DJNZ    L059A		; repeat 10x
        LD      HL,9BF3H
        LD      B,0AH
L05a4:  LD      (HL),0FFH
        INC     HL
        DJNZ    L05A4		; repeat 10x
        LD      HL,0A993H
        LD      B,0AH
L05ae:  LD      (HL),0FFH
        INC     HL
        DJNZ    L05AE		; repeat 10x
        LD      HL,0A9B3H
        LD      B,0AH
L05b8:  LD      (HL),0FFH
        INC     HL
        DJNZ    L05B8		; repeat 10x
        LD      HL,9BD3H
        LD      DE,00020H
        LD      B,6EH
L05c5:  LD      A,(HL)
        OR      03H
        LD      (HL),A
        ADD     HL,DE
        DJNZ    L05C5		; repeat 110x
        LD      HL,9BDCH
        LD      B,6EH
L05d1:  LD      A,(HL)
        OR      0C0H
        LD      (HL),A
        ADD     HL,DE
        DJNZ    L05D1		; repeat 110x
        RET     

CLEARPIXELBUFFER:
		LD      HL,PIXELBUFFER	; fill 4K with 00	LCD screen pixel buffer (99BDH)
        LD      DE,99BEH
        LD      BC,1000H	;4K
        LD      (HL),00H
        LDIR    
        RET     

CLEAR3K5:
		LD      HL,9BBDH	; fill 3583 bytes with 00
        LD      DE,9BBEH
        LD      BC,0DFFH
        LD      (HL),00H
        LDIR    
        RET     

MSG2BUFFER:
		LD      E,(HL)	;put length of message in DE
        INC     HL		;
        LD      D,(HL)	;
        INC     HL		;
        IN      A,(0C2H)	;8255 #2 Port C (input)	TOUCH PEN INPUT ??
        CP      0FFH
        JR      NZ,L0601
        LD      A,00H
L0601:  BIT     7,A
        JR      Z,L0615
        ADD     HL,DE
        BIT     6,A
        JR      Z,L0615
        ADD     HL,DE
        BIT     5,A
        JR      Z,L0615
        ADD     HL,DE
        BIT     4,A
        JR      Z,L0615
        ADD     HL,DE
L0615:  CALL    L0619
        RET     

L0619:  PUSH    HL
        POP     IX
        LD      L,(IX+00H)
        LD      H,00H
        LD      B,08H
L0623:  SLA     L
        RL      H
        DJNZ    L0623
        LD      E,(IX+01H)
        LD      D,00H
        ADD     HL,DE
        EX      DE,HL
        INC     IX
        INC     IX
        LD      HL,PIXELBUFFER
        ADD     HL,DE
        PUSH    HL
        POP     IY
L063b:  LD      A,(IX+00H)
        CP      0FFH			; 0FFH	End Of Message?
        JR      Z,L068C			; When yes, then done.
        CP      LF				; 0AH	Line feed in message?
        JR      Z,DoLF			; Do Line Feed at L0678
        SUB     20H				; First character is space
        LD      E,A				; Calculate offset into character bitmap font table
        LD      D,00H
        LD      B,03H
L064d:  SLA     E				; Multiply by 8 (2^3)
        RL      D
        DJNZ    L064D
		
        LD      HL,PXCHR20H		; 3D0DH	Start of ASCII table. First character is SPACE (20H)
        ADD     HL,DE			; Set HL to start of character bitmap using offset in DE
        EX      DE,HL
        PUSH    IY				; get pointer to the pixel buffer from IY into HL
        POP     HL
        LD      B,08H			; Get 8 bytes of pixel data for the character
L065d:  LD      A,(DE)
        LD      C,A
        LD      A,(8AECH)
        AND     A
        JR      Z,L0668			; skip next when all bits are OFF
        LD      A,C
        CPL     
        LD      C,A
L0668:  LD      (HL),C			; Place pixels in pixel buffer
        INC     DE
        PUSH    BC
        LD      BC,00020H
        ADD     HL,BC
        POP     BC
        DJNZ    L065D
        INC     IX
        INC     IY
        JR      L063B	; Continue with next character in the message
		
DoLF:					; process LF in the message		
		INC     IX		; point to next character in the message
        PUSH    IY		; IY is used as the pointer in the pixel buffer
        POP     HL		; Process using value of IY in HL
        AND     A
        LD      DE,PIXELBUFFER
        SBC     HL,DE
        INC     H
        LD      L,00H
        ADD     HL,DE
        PUSH    HL		; Put new value back in IY
        POP     IY
        JR      L063B		; continue with the next character in the message
		
L068c:  RET     		; Message processing completed. Retrun to the caller

L068d:  PUSH    HL
        LD      A,40H
        LD      HL,PIXELBUFFER
L0693:  LD      (HL),00H
        PUSH    HL
        POP     DE
        INC     DE
        LD      BC,0015H
        LDIR    
        LD      DE,000BH
        ADD     HL,DE
        DEC     A
        JR      NZ,L0693
        POP     HL
        RET     

L06a6:  LD      DE,0000H
        LD      BC,0460H
L06ac:  LD      HL,8C9DH
        ADD     HL,DE
        LD      A,(HL)
        LD      HL,90FDH
        ADD     HL,DE
        OR      (HL)
        LD      HL,955DH
        ADD     HL,DE
        OR      (HL)
        LD      (HL),A
        INC     DE
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,L06AC
        LD      DE,9BD3H
        LD      HL,955DH
        LD      A,6EH
L06ca:  LD      B,0AH
L06cc:  PUSH    AF
        LD      A,(HL)
        CALL    L047E
        LD      (DE),A
        POP     AF
        INC     HL
        INC     DE
        DJNZ    L06CC
        PUSH    HL
        LD      HL,0016H
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DEC     A
        JR      NZ,L06CA
        CALL    L0595
        RET     

L06e5:  PUSH    BC
        PUSH    DE
        AND     A
        JR      Z,L06F0
        LD      IX,0747H
        JR      L06F4
L06f0:  LD      IX,0873H
L06f4:  LD      L,(IX+00H)
        LD      H,(IX+01H)
        LD      A,H
        CP      0FFH
        JR      Z,L0735
        AND     A
        SBC     HL,BC
        JR      NC,L072C
        LD      L,(IX+02H)
        LD      H,(IX+03H)
        AND     A
        SBC     HL,BC
        JR      C,L072C
        LD      L,(IX+04H)
        LD      H,(IX+05H)
        AND     A
        SBC     HL,DE
        JR      NC,L072C
        LD      L,(IX+06H)
        LD      H,(IX+07H)
        AND     A
        SBC     HL,DE
        JR      C,L072C
        LD      A,(IX+08H)
        POP     DE
        POP     BC
        AND     A
        RET     

L072c:  PUSH    DE
        LD      DE,000AH
        ADD     IX,DE
        POP     DE
        JR      L06F4
L0735:  LD      HL,L0EEA
        AND     A
        SBC     HL,BC
        JR      C,L0741
        SCF     
        POP     DE
        POP     BC
        RET     

L0741:  LD      A,0FFH
        AND     A
        POP     DE
        POP     BC
        RET     

        XOR     A
        NOP     
        RRA     
        LD      (BC),A
        JP      Z,0320DH
        LD      C,30H
        NOP     
        XOR     A
        NOP     
        RRA     
        LD      (BC),A
        LD      (9A0EH),A
        LD      C,31H
        NOP     
        XOR     A
        NOP     
        RRA     
        LD      (BC),A
        SBC     A,D
        LD      C,02H
        RRCA    
        LD      (9E00H),A
        LD      (BC),A
        LD      A,(BC)
        INC     B
        LD      (9A0EH),A
        LD      C,23H
        NOP     
        SBC     A,(HL)
        LD      (BC),A
        LD      A,(BC)
        INC     B
        JP      Z,0320DH
        LD      C,24H
        NOP     
        SBC     A,(HL)
        LD      (BC),A
        LD      A,(BC)
        INC     B
        SBC     A,D
        LD      C,02H
        RRCA    
        DEC     H
        NOP     
        DEC     DE
        INC     B
        ADC     A,E
        DEC     B
        JP      Z,0320DH
        LD      C,20H
        NOP     
        DEC     DE
        INC     B
        ADC     A,E
        DEC     B
        LD      (9A0EH),A
        LD      C,21H
        NOP     
        DEC     DE
        INC     B
        ADC     A,E
        DEC     B
        SBC     A,D
        LD      C,02H
        RRCA    
        LD      (0A00H),HL
        LD      B,79H
        RLCA    
        JP      Z,0320DH
        LD      C,15H
        NOP     
        LD      A,(BC)
        LD      B,79H
        RLCA    
        LD      (9A0EH),A
        LD      C,16H
        NOP     
        LD      A,(BC)
        LD      B,79H
        RLCA    
        SBC     A,D
        LD      C,02H
        RRCA    
        RLA     
        NOP     
        LD      A,(BC)
        LD      B,79H
        RLCA    
        LD      (BC),A
        RRCA    
        LD      L,D
        RRCA    
        JR      L07C9
L07c9:  LD      A,(BC)
        LD      B,79H
        RLCA    
        LD      L,D
        RRCA    
        OUT     (0FH),A
        ADD     HL,DE
        NOP     
        ADD     A,(HL)
        RLCA    
        OR      08H
        JP      Z,0320DH
        LD      C,10H
        NOP     
        ADD     A,(HL)
        RLCA    
        OR      08H
        LD      (9A0EH),A
        LD      C,11H
        NOP     
        ADD     A,(HL)
        RLCA    
        OR      08H
        SBC     A,D
        LD      C,02H
        RRCA    
        LD      (DE),A
        NOP     
        ADD     A,(HL)
        RLCA    
        OR      08H
        LD      (BC),A
        RRCA    
        LD      L,D
        RRCA    
        INC     DE
        NOP     
        ADD     A,(HL)
        RLCA    
        OR      08H
        LD      L,D
        RRCA    
        OUT     (0FH),A
        INC     D
        NOP     
        LD      (HL),L
        ADD     HL,BC
        CP      A
        LD      A,(BC)
        JP      Z,0320DH
        LD      C,03H
        NOP     
        LD      (HL),L
        ADD     HL,BC
        CP      A
        LD      A,(BC)
        LD      (9A0EH),A
        LD      C,06H
        NOP     
        LD      (HL),L
        ADD     HL,BC
        CP      A
        LD      A,(BC)
        SBC     A,D
        LD      C,02H
        RRCA    
        ADD     HL,BC
        NOP     
        CALL    Z,L160A
        INC     C
        JP      Z,0320DH
        LD      C,02H
        NOP     
        CALL    Z,L160A
        INC     C
        LD      (9A0EH),A
        LD      C,05H
        NOP     
        CALL    Z,L160A
        INC     C
        SBC     A,D
        LD      C,02H
        RRCA    
        EX      AF,AF'
        NOP     
        CALL    Z,L160A
        INC     C
        LD      (BC),A
        RRCA    
        LD      L,D
        RRCA    
        NOP     
        NOP     
        LD      (6C0CH),HL
        DEC     C
        JP      Z,0320DH
        LD      C,01H
        NOP     
        LD      (6C0CH),HL
        DEC     C
        LD      (9A0EH),A
        LD      C,04H
        NOP     
        LD      (6C0CH),HL
        DEC     C
        SBC     A,D
        LD      C,02H
        RRCA    
        RLCA    
        NOP     
        LD      (HL),L
        ADD     HL,BC
        CP      A
        LD      A,(BC)
        LD      (BC),A
        RRCA    
        LD      L,D
        RRCA    
        LD      A,(BC)
        NOP     
        JP      NC,0FF0EH
        RRCA    
        RST     08H
        DEC     C
        SBC     A,A
        LD      C,80H
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        RLC     B
        ADC     A,B
        LD      BC,0081H
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        CP      B
        LD      BC,0275H
        ADD     A,D
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        LD      (HL),L
        LD      (BC),A
        LD      (8303H),A
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        LD      (0F003H),A
        INC     BC
        ADD     A,H
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        RET     P

        INC     BC
        XOR     L
        INC     B
        ADD     A,L
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        XOR     L
        INC     B
        LD      L,D
        DEC     B
        ADD     A,(HL)
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        LD      L,D
        DEC     B
        JR      Z,L08C7
        ADD     A,A
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
L08c7:  JR      Z,L08CF
        PUSH    HL
        LD      B,88H
        NOP     
        LD      (BC),A
        RRCA    
L08cf:  RST     38H
        RRCA    
        PUSH    HL
        LD      B,0A2H
        RLCA    
        ADC     A,C
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        JP      NC,08F07H
        EX      AF,AF'
        ADC     A,D
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        ADC     A,A
        EX      AF,AF'
        LD      C,H
        ADD     HL,BC
        ADC     A,E
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        LD      C,H
        ADD     HL,BC
        ADD     HL,BC
        LD      A,(BC)
        ADC     A,H
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        ADD     HL,BC
        LD      A,(BC)
        RST     00H
        LD      A,(BC)
        ADC     A,L
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        RST     00H
        LD      A,(BC)
        ADD     A,H
        DEC     BC
        ADC     A,(HL)
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        CALL    NC,0920BH
        INC     C
        ADC     A,A
        NOP     
        LD      (BC),A
        RRCA    
        RST     38H
        RRCA    
        AND     L
        INC     C
        LD      H,D
        DEC     C
        SUB     B
        NOP     
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
L0925:  CALL    L04EF
        PUSH    BC
        PUSH    DE
        SLA     C
        RL      B
        SRL     C
        SLA     E
        RL      D
        SRL     E
        LD      HL,(8B11H)
        LD      A,E
        AND     7FH
        LD      (HL),A
        INC     HL
        LD      A,D
        AND     7FH
        LD      (HL),A
        INC     HL
        LD      A,C
        AND     7FH
        LD      (HL),A
        INC     HL
        LD      A,B
        AND     7FH
        LD      (HL),A
        INC     HL
        LD      (8B11H),HL
        POP     DE
        POP     BC
        CALL    L053D
        RET     

L0956:  PUSH    BC
        POP     DE
        CALL    L0A2B
        RET     

L095c:  PUSH    BC
        LD      HL,(8B0AH)
        AND     A
        SBC     HL,BC
        JR      Z,L09A8
        LD      DE,(8B0AH)
        LD      A,D
        SUB     B
        JP      P,L0970
        LD      A,B
        SUB     D
L0970:  LD      (8B0CH),A
        LD      A,E
        SUB     C
        JP      P,L097A
        LD      A,C
        SUB     E
L097a:  LD      C,A
        LD      A,(8B0CH)
        CP      C
        JR      NC,L098B
        POP     BC
        LD      E,C
        LD      HL,(8C78H)
        LD      (8C7CH),HL
        JR      L0993
L098b:  POP     BC
        LD      D,B
        LD      HL,(8C7AH)
        LD      (8C7EH),HL
L0993:  CALL    L0FBC
        LD      BC,(8B0AH)
        CALL    L0A2B
        CALL    L06A6
        CALL    L0A0D
        CALL    L0A08
        AND     A
        RET     

L09a8:  POP     BC
        SCF     
        RET     

L09ab:  LD      DE,(8B0AH)
        LD      A,D
        CP      B
        JR      Z,L09F1
        LD      A,E
        CP      C
        JR      Z,L09F1
        CALL    L0FBC
        LD      (8B0CH),BC
L09be:  LD      D,B
        CALL    L0A2B
        LD      BC,(8B0CH)
        LD      DE,(8B0AH)
        LD      C,E
        CALL    L0A2B
        LD      BC,(8B0AH)
        LD      DE,(8B0CH)
        LD      D,B
        CALL    L0A2B
        LD      BC,(8B0AH)
        LD      DE,(8B0CH)
        LD      C,E
        CALL    L0A2B
        CALL    L0C58
        CALL    L06A6
        CALL    L0A08
        AND     A
        RET     

L09f1:  SCF     
        RET     

L09f3:  LD      HL,1B52H
        CALL    L37D8
        RET     

        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      B,C
        LD      C,E
        PUSH    BC
        POP     DE
        CALL    L0A2B
        POP     HL
        POP     DE
        POP     BC
        RET     

L0a08:  LD      HL,90FDH
        JR      L0A10
L0a0d:  LD      HL,8C9DH
L0a10:  PUSH    HL
        POP     DE
        INC     DE
        LD      BC,0460H
        LD      (HL),00H
        LDIR    
        RET     

L0a1b:  LD      HL,955DH
        JP      L0A10
L0a21:  CALL    L0A0D
        CALL    L0A08
        CALL    L0A1B
        RET     

L0a2b:  PUSH    IX
        PUSH    IY
        XOR     A
        LD      (8C95H),A
        LD      (8C94H),A
        LD      A,B
        LD      (8020H),A
        XOR     A
        LD      (8021H),A
        LD      A,C
        LD      (801EH),A
        XOR     A
        LD      (801FH),A
        LD      A,D
        LD      (8024H),A
        XOR     A
        LD      (8025H),A
        LD      A,E
        LD      (8022H),A
        XOR     A
        LD      (8023H),A
        XOR     A
        LD      (8028H),A
        LD      (8026H),A
        LD      B,A
        LD      C,A
        LD      HL,(8024H)
        LD      DE,(8020H)
        AND     A
        SBC     HL,DE
        JR      Z,L0A6D
        LD      B,0FFH
L0a6d:  JR      NC,L0A77
        LD      A,0FFH
        LD      (8028H),A
        CALL    L0B81
L0a77:  LD      (802CH),HL
        LD      HL,(8022H)
        LD      DE,(801EH)
        AND     A
        SBC     HL,DE
        JR      Z,L0A88
        LD      C,0FFH
L0a88:  JR      NC,L0A92
        LD      A,0FFH
        LD      (8026H),A
        CALL    L0B81
L0a92:  LD      (802AH),HL
        LD      A,B
        OR      C
        JR      Z,L0AB8
        LD      HL,L0000
        LD      (802EH),HL
        LD      HL,(802CH)
        LD      DE,(802AH)
        AND     A
        SBC     HL,DE
        JR      C,L0B00
L0aab:  LD      HL,(802EH)
        LD      DE,(802CH)
        AND     A
        SBC     HL,DE
        JP      P,L0AE8
L0ab8:  CALL    L0B89
        LD      HL,(8020H)
        LD      DE,(8024H)
        AND     A
        SBC     HL,DE
        JP      Z,L0B54
        LD      HL,(802EH)
        LD      DE,(802AH)
        ADD     HL,DE
        LD      (802EH),HL
        LD      HL,(8020H)
        LD      A,(8028H)
        AND     A
        JR      NZ,L0AE2
        INC     HL
        LD      (8020H),HL
        JR      L0AAB
L0ae2:  DEC     HL
        LD      (8020H),HL
        JR      L0AAB
L0ae8:  LD      (802EH),HL
        LD      HL,(801EH)
        LD      A,(8026H)
        AND     A
        JR      NZ,L0AFA
        INC     HL
        LD      (801EH),HL
        JR      L0AAB
L0afa:  DEC     HL
        LD      (801EH),HL
        JR      L0AAB
L0b00:  LD      HL,(802EH)
        LD      DE,(802AH)
        AND     A
        SBC     HL,DE
        JP      P,L0B3C
        CALL    L0B89
        LD      HL,(801EH)
        LD      DE,(8022H)
        AND     A
        SBC     HL,DE
        JR      Z,L0B54
        LD      HL,(802EH)
        LD      DE,(802CH)
        ADD     HL,DE
        LD      (802EH),HL
        LD      HL,(801EH)
        LD      A,(8026H)
        AND     A
        JR      NZ,L0B36
        INC     HL
        LD      (801EH),HL
        JR      L0B00
L0b36:  DEC     HL
        LD      (801EH),HL
        JR      L0B00
L0b3c:  LD      (802EH),HL
        LD      HL,(8020H)
        LD      A,(8028H)
        AND     A
        JR      NZ,L0B4E
        INC     HL
        LD      (8020H),HL
        JR      L0B00
L0b4e:  DEC     HL
        LD      (8020H),HL
        JR      L0B00
L0b54:  LD      HL,8C9DH
        LD      DE,90FDH
        LD      BC,0460H
L0b5d:  LD      A,(DE)
        OR      (HL)
        LD      (DE),A
        INC     HL
        INC     DE
        DEC     BC
        LD      A,B
        OR      C
        JR      NZ,L0B5D
        XOR     A
        LD      (8C9DH),A
        LD      HL,8C9DH
        LD      DE,8C9EH
        LD      BC,045FH
        LDIR    
        POP     IY
        POP     IX
        LD      A,(8C94H)
        AND     A
        RET     Z

        SCF     
        RET     

L0b81:  EX      DE,HL
        LD      HL,L0000
        AND     A
        SBC     HL,DE
        RET     

L0b89:  XOR     A
        LD      BC,L0000
        LD      HL,(8020H)
        SRL     H
        RR      L
        RR      B
        SRL     H
        RR      L
        RR      B
        SRL     H
        RR      L
        RR      B
        LD      A,B
        RLCA    
        RLCA    
        RLCA    
        LD      B,A
        LD      IX,0C3AH
        PUSH    DE
        LD      E,B
        LD      D,00H
        ADD     IX,DE
        POP     DE
        PUSH    HL
        LD      HL,L0000
        LD      DE,000AH
        LD      BC,(801EH)
L0bbd:  LD      A,B
        OR      C
        JR      Z,L0BC5
        ADD     HL,DE
        DEC     BC
        JR      L0BBD
L0bc5:  EX      DE,HL
        POP     HL
        ADD     HL,DE
        LD      B,(IX+00H)
        PUSH    HL
        LD      DE,8C9DH
        ADD     HL,DE
        LD      A,(HL)
        OR      B
        LD      (HL),A
        POP     DE
        LD      HL,90FDH
        ADD     HL,DE
        CALL    0C42H
        LD      A,B
        CP      80H
        JR      NZ,L0BF1
        LD      A,0C0H
        AND     (HL)
        JR      NZ,L0C14
        LD      A,E
        AND     A
        JR      Z,L0C34
        DEC     HL
        LD      A,01H
        AND     (HL)
        JR      NZ,L0C14
        JR      L0C34
L0bf1:  CP      01H
        JR      NZ,L0C07
        LD      A,03H
        AND     (HL)
        JR      NZ,L0C14
        LD      A,E
        CP      6FH
        JR      Z,L0C34
        INC     HL
        LD      A,80H
        AND     (HL)
        JR      NZ,L0C14
        JR      L0C34
L0c07:  LD      C,A
        SLA     C
        OR      C
        SRL     C
        SRL     C
        OR      C
        OR      B
        AND     (HL)
        JR      Z,L0C34
L0c14:  LD      HL,(8103H)
        LD      (HL),00H
        INC     HL
        LD      (HL),D
        INC     HL
        LD      (8103H),HL
        LD      A,(815AH)
        INC     A
        LD      (815AH),A
        LD      A,(8C95H)
        AND     A
        RET     Z

        LD      A,(8C94H)
        OR      01H
        LD      (8C94H),A
        RET     

L0c34:  LD      A,01H
        LD      (8C95H),A
        RET     

        ADD     A,B
        LD      B,B
        JR      NZ,L0C4E
        EX      AF,AF'
        INC     B
        LD      (BC),A
        LD      BC,0E5C5H
        EX      DE,HL
        LD      BC,000AH
        LD      DE,L0000
L0c4b:  AND     A
        SBC     HL,BC
L0c4e:  JR      C,L0C53
        INC     D
        JR      L0C4B
L0c53:  ADD     HL,BC
        LD      E,L
        POP     HL
        POP     BC
        RET     

L0c58:  PUSH    IX
        PUSH    IY
        LD      HL,815AH
        LD      (80ACH),HL
        LD      HL,8C9DH
        LD      (80AEH),HL
        LD      A,00H
        LD      (80B4H),A
        LD      (80B5H),A
        LD      HL,90FDH
        LD      (80B0H),HL
L0c76:  LD      DE,80B6H
        LD      BC,000AH
        LDIR    
        LD      HL,80B6H
        CALL    L0E13
        JR      NZ,L0C9D
L0c86:  LD      A,(80B5H)
        INC     A
        LD      (80B5H),A
        CP      70H
        JR      Z,L0CAC
        LD      HL,(80B0H)
        LD      BC,000AH
        ADD     HL,BC
        LD      (80B0H),HL
        JR      L0C76
L0c9d:  CALL    L0E1F
        JR      NZ,L0CA7
        CALL    L0D2C
        JR      L0C86
L0ca7:  CALL    L0CBA
        JR      L0C86
L0cac:  CALL    L0D44
        CALL    L0A0D
        CALL    L0FD5
        POP     IY
        POP     IX
        RET     

L0cba:  PUSH    HL
        LD      D,0AH
L0cbd:  LD      C,80H
        LD      B,08H
        LD      A,(HL)
L0cc2:  SRL     C
        SLA     A
        JR      C,L0CDB
        DJNZ    L0CC2
        INC     HL
        DEC     D
        JR      NZ,L0CBD
L0cce:  LD      DE,(80B0H)
        POP     HL
        PUSH    HL
        LD      BC,000AH
        LDIR    
        POP     HL
        RET     

L0cdb:  DJNZ    L0CE6
        INC     HL
        DEC     D
        JR      Z,L0CCE
        LD      C,80H
        LD      B,08H
        LD      A,(HL)
L0ce6:  SRL     C
        SLA     A
        JR      C,L0CDB
L0cec:  DJNZ    L0CFF
        PUSH    AF
        LD      A,(HL)
        OR      01H
        LD      (HL),A
        POP     AF
        INC     HL
        DEC     D
        JR      Z,L0CCE
        LD      B,08H
        LD      C,80H
        LD      A,(HL)
        JR      L0D08
L0cff:  PUSH    AF
        LD      A,(HL)
        SLA     C
        OR      C
        SRL     C
        LD      (HL),A
        POP     AF
L0d08:  SRL     C
        SLA     A
        JR      NC,L0CEC
L0d0e:  DJNZ    L0D19
        INC     HL
        DEC     D
        JR      Z,L0CCE
        LD      C,80H
        LD      B,08H
        LD      A,(HL)
L0d19:  SRL     C
        SLA     A
        JR      C,L0D0E
        DJNZ    L0CC2
        INC     HL
        DEC     D
        JR      Z,L0CCE
        LD      C,80H
        LD      B,08H
        LD      A,(HL)
        JR      L0CC2
L0d2c:  PUSH    HL
        LD      DE,(80B0H)
        LD      HL,(80AEH)
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        LD      (80AEH),HL
        LD      A,(80B4H)
        INC     A
        LD      (80B4H),A
        POP     HL
        RET     

L0d44:  LD      HL,80C8H
        LD      B,24H
L0d49:  LD      (HL),00H
        INC     HL
        DJNZ    L0D49
L0d4e:  LD      HL,(80AEH)
        DEC     HL
        DEC     HL
        LD      (80AEH),HL
        LD      A,(HL)
        LD      E,A
        INC     HL
        LD      A,(HL)
        LD      D,A
        LD      L,E
        LD      H,D
        LD      (80B2H),HL
        LD      DE,9553H
        SBC     HL,DE
        JP      Z,L0E08
        LD      HL,(80B2H)
        LD      DE,80C8H
        LD      BC,000AH
        LDIR    
        LD      HL,(80B2H)
        LD      DE,80DAH
        LD      BC,000AH
        LDIR    
        LD      HL,80C8H
        LD      B,0AH
L0d83:  LD      A,(HL)
        AND     A
        JR      NZ,L0D8C
        INC     HL
        DJNZ    L0D83
        JR      L0D9E
L0d8c:  LD      C,0FFH
L0d8e:  SLA     A
        JR      C,L0D96
        SRL     C
        JR      L0D8E
L0d96:  LD      A,(HL)
        OR      C
        LD      (HL),A
        LD      C,0FFH
        INC     HL
        DJNZ    L0D96
L0d9e:  LD      HL,80E3H
        LD      B,0AH
L0da3:  LD      A,(HL)
        AND     A
        JR      NZ,L0DAC
        DEC     HL
        DJNZ    L0DA3
        JR      L0DBE
L0dac:  LD      C,0FFH
L0dae:  SRL     A
        JR      C,L0DB6
        SLA     C
        JR      L0DAE
L0db6:  LD      A,(HL)
        OR      C
        LD      (HL),A
        LD      C,0FFH
        DEC     HL
        DJNZ    L0DB6
L0dbe:  LD      HL,80C8H
        LD      DE,80DAH
        LD      B,0AH
L0dc6:  LD      A,(DE)
        AND     (HL)
        LD      (HL),A
        INC     HL
        INC     DE
        DJNZ    L0DC6
        LD      HL,(80B2H)
        LD      DE,80DAH
        LD      BC,000AH
        LDIR    
        LD      DE,(80B2H)
        LD      HL,80C8H
        LD      BC,000AH
        LDIR    
        LD      HL,(80B2H)
        LD      BC,000AH
        ADD     HL,BC
        LD      E,L
        LD      D,H
        LD      HL,(80B2H)
        LD      B,0AH
L0df2:  LD      A,(DE)
        AND     (HL)
        LD      (HL),A
        INC     HL
        INC     DE
        DJNZ    L0DF2
        LD      DE,80DAH
        LD      HL,(80B2H)
        LD      B,0AH
L0e01:  LD      A,(DE)
        OR      (HL)
        LD      (HL),A
        INC     HL
        INC     DE
        DJNZ    L0E01
L0e08:  LD      A,(80B4H)
        DEC     A
        LD      (80B4H),A
        JP      NZ,L0D4E
        RET     

L0e13:  PUSH    HL
        LD      B,0AH
L0e16:  LD      A,(HL)
        AND     A
        JR      NZ,L0E1D
        INC     HL
        DJNZ    L0E16
L0e1d:  POP     HL
        RET     

L0e1f:  PUSH    HL
        LD      A,(80B5H)
        LD      C,A
        LD      HL,(80ACH)
        LD      B,(HL)
L0e28:  INC     HL
        INC     HL
        LD      A,(HL)
        CP      C
        JR      Z,L0E33
        DJNZ    L0E28
        LD      A,01H
        AND     A
L0e33:  POP     HL
        RET     

L0e35:  IN0     A,(0C1H)                ; Z180 instruction
        OR      01H
        OUT0    (0C1H),A                ; Z180 instruction
        RET     

L0e3e:  IN0     A,(0C1H)                ; Z180 instruction
        AND     0FEH
        OUT0    (0C1H),A                ; Z180 instruction
        RET     

PIXELS2LCD:
		LD      A,0AH					; send pixel buffer to LCD screen
        CALL    SETLCDREG				; stored in 99BDH (Pixel buffer) and on (4K)
        LD      A,00H	
        OUT     (80H),A

        LD      A,0BH
        CALL    SETLCDREG
        LD      A,00H
        OUT     (80H),A

        LD      BC,1000H			; 4K
        LD      A,0CH
        CALL    SETLCDREG
        LD      HL,PIXELBUFFER
L0e64:  LD      A,(HL)
        CALL    BYTE2LCD	; Send byte to LCD
        INC     HL			; Next byte in PixelBuffer
        DEC     BC			; repeat 4K, for each byte in PixelBuffer
        LD      A,B
        OR      C
        JR      NZ,L0E64
        RET     

L0e6f:  PUSH    HL
        LD      HL,0E7EH
        SLA     A
        LD      E,A
        LD      D,00H
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        POP     HL
        RET     

        LD      BC,0200H
        NOP     
        INC     B
        NOP     
        EX      AF,AF'
        NOP     
        DJNZ    L0E88
L0e88:  JR      NZ,L0E8A
L0e8a:  LD      B,B
        NOP     
        ADD     A,B
        NOP     
        NOP     
        LD      BC,0200H
        NOP     
        INC     B
        NOP     
        LD      B,B
        NOP     
        ADD     A,B
L0e98:  PUSH    HL
        LD      HL,8AFDH
        LD      A,(HL)
        OUT     (0A0H),A
        INC     HL
        LD      A,(HL)
        OUT     (0A1H),A
        POP     HL
        RET     

        PUSH    AF
        LD      HL,8AFDH
L0ea9:  CALL    L0ED0
        OR      (HL)
        LD      (HL),A
        CALL    L0E98
        POP     AF
        RET     

        PUSH    AF
        LD      HL,8AFDH
L0eb7:  CALL    L0ED0
        CPL     
        AND     (HL)
        LD      (HL),A
        CALL    L0E98
        POP     AF
        RET     

        PUSH    AF
        LD      HL,8B02H
        JP      L0EA9
        PUSH    AF
        LD      HL,8B02H
        JP      L0EB7
L0ed0:  PUSH    DE
        LD      DE,L0000
        SUB     08H
        JR      C,L0EEA
        INC     DE
        SUB     08H
        JR      C,L0EEA
        INC     DE
        SUB     08H
        JR      C,L0EEA
        INC     DE
        SUB     08H
        JR      C,L0EEA
        INC     DE
L0ee8:  SUB     08H
L0eea:  ADD     A,08H
        CALL    L0E6F
        ADD     HL,DE
        POP     DE
        RET     

        LD      HL,8B02H
        IN      A,(0A0H)
        LD      B,A
        LD      A,(HL)
        XOR     B
        OUT     (0A0H),A
        INC     HL
        IN      A,(0A1H)
        LD      B,A
        LD      A,(HL)
        XOR     B
        OUT     (0A1H),A
        RET     

L0f05:  LD      A,H
        AND     A
        JR      NZ,L0F0E
        LD      A,L
        AND     A
        JR      NZ,L0F0E
        RET     

L0f0e:  LD      IX,0F39H
        LD      B,0EH
        LD      DE,L0000
L0f17:  AND     A
        RR      H
        RR      L
        JR      NC,L0F2E
        LD      A,(IX+00H)
        ADD     A,E
        DAA     
        LD      E,A
        INC     IX
        LD      A,(IX+00H)
        ADC     A,D
        DAA     
        LD      D,A
        DEC     IX
L0f2e:  INC     IX
        INC     IX
        DJNZ    L0F17
        LD      A,E
        LD      E,D
        LD      D,A
        EX      DE,HL
        RET     

        LD      BC,0200H
        NOP     
        INC     B
        NOP     
        EX      AF,AF'
        NOP     
        LD      D,00H
        LD      (6400H),A
        NOP     
        JR      Z,L0F4A
        LD      D,(HL)
L0f4a:  LD      (BC),A
        LD      (DE),A
        DEC     B
        INC     H
        DJNZ    L0F98
        JR      NZ,L0EE8
        LD      B,B
        SUB     D
        ADD     A,C
        PUSH    BC
        PUSH    DE
        PUSH    HL
L0f58:  LD      A,(HL)
        LD      C,A
        AND     0F0H
        RRCA    
        RRCA    
        RRCA    
        RRCA    
        CP      0AH
        JR      C,L0F68
        ADD     A,37H
        JR      L0F6A
L0f68:  OR      30H
L0f6a:  LD      (DE),A
        INC     DE
        LD      A,C
        AND     0FH
        CP      0AH
        JR      C,L0F77
        ADD     A,37H
        JR      L0F79
L0f77:  OR      30H
L0f79:  LD      (DE),A
        INC     DE
        INC     HL
        DJNZ    L0F58
        POP     HL
        POP     DE
        POP     BC
        RET     

        LD      A,00H
        LD      BC,01F4H
        LD      HL,0F82H
        CALL    L02ED
        IN      A,(0A0H)
        CPL     
        LD      HL,8B02H
        XOR     (HL)
        CPL     
        OUT     (0A0H),A
        INC     HL
L0f98:  IN      A,(0A1H)
        CPL     
        XOR     (HL)
        CPL     
        OUT     (0A1H),A
        JP      L1AFF
		
        PUSH    AF
L0fa3:  IN0     A,(04H)                 ; Z180 instruction
        AND     02H
        JR      Z,L0FA3
        POP     AF
        OUT0    (06H),A                 ; Z180 instruction
        RET     

L0faf:  PUSH    AF
L0fb0:  IN0     A,(05H)                 ;CHECK ASCI Status Register 1
        AND     02H																	;////////////////////////////////////
        JR      Z,L0FB0		;<<<<<<<<<<<<<<<<< HANGS HERE "FOREVER" DURING EXECUTION  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
        POP     AF																	;////////////////////////////////////
		OUT0    (07H),A                 ; ASCI Transmit Data Register 1
        RET     

L0fbc:  PUSH    AF
        LD      A,01H
        LD      (8C98H),A
        POP     AF
        RET     

L0fc4:  XOR     A
        LD      (8AFDH),A
        LD      (8AFEH),A
        LD      (8B02H),A
        LD      (8B03H),A
        CALL    L0E98
        RET     

L0fd5:  XOR     A
        LD      (815AH),A
        LD      HL,815BH
        LD      (8103H),HL
        RET     

L0fe0:  LD      HL,37A5H
        CALL    L1036
        LD      DE,8A46H
        LD      BC,000DH
        LDIR    
        LD      A,(8C93H)
        LD      HL,3031H
        CP      0AH
        JR      Z,L0FFD
        ADD     A,30H
        LD      H,A
        LD      L,20H
L0ffd:  LD      (8A50H),HL
        LD      A,01H
        LD      (8AECH),A
        LD      HL,101CH
        CALL    L0619
        LD      HL,1029H
        CALL    L0619
        LD      HL,8A46H
        CALL    L0619
        XOR     A
        LD      (8AECH),A
        RET     

        NOP     
        LD      D,20H
        JR      NZ,1041H
        JR      NZ,1043H
        JR      NZ,1045H
        JR      NZ,1047H
        JR      NZ,1028H
        LD      BC,2016H
        JR      NZ,104EH
        JR      NZ,1050H
        JR      NZ,1052H
        JR      NZ,1054H
        JR      NZ,1035H
L1036:  PUSH    DE
        PUSH    BC
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        IN      A,(0C2H)
        CP      0FFH
        JR      NZ,L1044
        LD      A,00H
L1044:  BIT     7,A
        JR      Z,L1058
        ADD     HL,DE
        BIT     6,A
        JR      Z,L1058
        ADD     HL,DE
L104e:  BIT     5,A
L1050:  JR      Z,L1058
L1052:  ADD     HL,DE
        BIT     4,A
        JR      Z,L1058
        ADD     HL,DE
L1058:  POP     BC
        POP     DE
        RET     

L105b:  CALL    L068D
        LD      HL,MSG02		;29D7H Programmering bestaat reeds ....
        CALL    MSG2BUFFER
L1064:  LD      A,(0BFA4H)
        AND     0FH
        CP      0FH
        JR      Z,L10B1
        LD      C,A
        LD      HL,2543H
        AND     A
        JP      Z,L10FC
        LD      DE,25E1H
        CP      01H
        JR      Z,L1091
        LD      DE,25C9H
        LD      B,0AH
L1081:  LD      A,(HL)
        CP      C
        JR      Z,L1091
        INC     HL
        PUSH    HL
        LD      HL,0004H
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DJNZ    L1081
        JR      L10B1
L1091:  EX      DE,HL
        LD      DE,8A48H
        LD      BC,0004H
        LDIR    
        LD      A,0FFH
        LD      (DE),A
        LD      HL,120BH
        LD      (8A46H),HL
        LD      HL,8A48H
        CALL    L252F
        LD      HL,8A46H
        CALL    L0619
        JR      L1110
L10b1:  LD      HL,8A46H
        LD      DE,8A47H
        LD      BC,0006H
        LD      (HL),20H
        LDIR    
        LD      A,(0BF9FH)
        LD      L,A
        LD      A,(0BFA0H)
        LD      E,A
        LD      H,00H
        LD      D,00H
        ADD     HL,DE
        CALL    L0F05
        LD      A,L
        AND     0FH
        ADD     A,30H
        LD      (8A48H),A
        LD      A,H
        AND     0FH
        ADD     A,30H
        LD      (8A4AH),A
        LD      A,H
        RRCA    
        RRCA    
        RRCA    
        RRCA    
        AND     0FH
        ADD     A,30H
        LD      (8A49H),A
        LD      A,25H
        LD      (8A4BH),A
        LD      A,0FFH
        LD      (8A4CH),A
        LD      HL,8A48H
        CALL    L252F
        JR      L1104
		
L10fc:  LD      HL,MSG31		;3773H Verkleinen/vergroten
        CALL    MSG2BUFFER
        JR      L1110
		
L1104:  LD      HL,120BH
        LD      (8A46H),HL
        LD      HL,8A46H
        CALL    L0619
L1110:  LD      HL,0BF9DH
        LD      DE,8A48H
        LD      B,03H
L1118:  LD      A,(HL)
        AND     0FH
        ADD     A,30H
        LD      (DE),A
        DEC     HL
        INC     DE
        DJNZ    L1118
        LD      A,0FFH
        LD      (DE),A
        LD      HL,1309H
        LD      (8A46H),HL
        LD      HL,8A48H
        CALL    L252F
        LD      HL,8A46H
        CALL    L0619
        LD      A,(0BFEDH)
        AND     70H
        LD      HL,254DH
        LD      DE,MSG22			; 32F3H	Papier lade 1
        LD      B,06H
        LD      C,A
L1145:  LD      A,(HL)
        CP      C
        JR      Z,L1156
        INC     HL
        PUSH    HL
        EX      DE,HL
        LD      DE,0080H
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DJNZ    L1145
L1154:  JR      L1154			; WHY ??

L1156:  EX      DE,HL
        CALL    MSG2BUFFER
        LD      A,(0BF9DH)
        AND     30H
        LD      C,A
        LD      HL,2553H
        LD      DE,MSG28				;35F3H  Aflevering stapels
        LD      B,03H
L1168:  LD      A,(HL)
        CP      C
        JR      Z,L1179
        INC     HL
        PUSH    HL
        EX      DE,HL
        LD      DE,0080H
        ADD     HL,DE
        EX      DE,HL
        POP     HL
        DJNZ    L1168
L1177:  JR      L1177
L1179:  EX      DE,HL
        CALL    MSG2BUFFER
        LD      A,(8C93H)
        LD      (0BF9AH),A
        RET     

L1184:  CALL    L0A21
        LD      A,(0BFA6H)
        AND     A
        RET     Z

        LD      (8A9DH),A
        LD      IY,0BFA7H
L1193:  LD      A,(IY+00H)
        AND     60H
        CP      40H
        JP      Z,L11A8
        CP      20H
        JP      Z,L123A
        CP      60H
        JP      Z,L11FC
        RET     

L11a8:  LD      E,(IY+01H)
        LD      D,(IY+02H)
        LD      C,(IY+03H)
        LD      B,(IY+04H)
        CALL    L12C7
        CALL    L053D
        LD      (8B0AH),BC
        LD      E,(IY+05H)
        LD      D,(IY+06H)
        LD      C,(IY+07H)
        LD      B,(IY+08H)
        CALL    L12C7
        CALL    L053D
        LD      (8B0CH),BC
        LD      DE,(8B0AH)
        CALL    L09BE
        CALL    L0FD5
L11de:  LD      A,(IY+00H)
        AND     1FH
        LD      E,A
        LD      D,00H
        SLA     E
        RL      D
        SLA     E
        RL      D
        ADD     IY,DE
        INC     IY
        LD      A,(8A9DH)
        DEC     A
        LD      (8A9DH),A
        JR      NZ,L1193
        RET     

L11fc:  LD      E,(IY+01H)
        LD      D,(IY+02H)
        LD      C,(IY+03H)
        LD      B,(IY+04H)
        CALL    L12C7
        CALL    L053D
        LD      (8B0AH),BC
        LD      E,(IY+05H)
        LD      D,(IY+06H)
        LD      C,(IY+07H)
        LD      B,(IY+08H)
        CALL    L12C7
        CALL    L053D
        LD      (8B0CH),BC
        LD      DE,(8B0AH)
        CALL    L0A2B
        CALL    L06A6
        CALL    L0FD5
        CALL    L0A08
        JR      L11DE
L123a:  LD      A,(IY+00H)
        AND     1FH
        DEC     A
        LD      (8A9EH),A
        LD      E,(IY+01H)
        LD      D,(IY+02H)
        LD      C,(IY+03H)
        LD      B,(IY+04H)
        CALL    L12C7
        CALL    L053D
        LD      (8B0AH),BC
        LD      (8B0CH),BC
        PUSH    IY
        POP     IX
        INC     IX
        INC     IX
        INC     IX
        INC     IX
        INC     IX
L126b:  LD      E,(IX+00H)
        LD      D,(IX+01H)
        LD      C,(IX+02H)
        LD      B,(IX+03H)
        CALL    L12C7
        CALL    L053D
        PUSH    BC
        POP     DE
        LD      BC,(8B0CH)
        PUSH    DE
        CALL    L0A2B
        POP     DE
        LD      (8B0CH),DE
        INC     IX
        INC     IX
        INC     IX
        INC     IX
        LD      A,(8A9EH)
        DEC     A
        LD      (8A9EH),A
        JR      NZ,L126B
        LD      DE,(8B0AH)
        LD      BC,(8B0CH)
        CALL    L0A2B
        CALL    L0C58
        CALL    L06A6
        CALL    L0A08
        CALL    L0FD5
        JP      L11DE
L12b7:  LD      HL,955DH
        LD      BC,0460H
L12bd:  LD      A,(HL)
        CPL     
        LD      (HL),A
        DEC     BC
        INC     HL
        LD      A,B
        OR      C
        JR      NZ,L12BD
        RET     

L12c7:  XOR     A
        SRL     B
        RR      A
        OR      C
L12cd:  LD      C,A
        XOR     A
        SRL     D
        RR      A
        OR      E
        LD      E,A
        RET     

L12d6:  LD      HL,L12F5
        LD      DE,0BF99H
        LD      BC,000CH
        LDIR    
        LD      A,(8C93H)
        LD      (0BF9AH),A
        LD      HL,0BFA5H
        LD      DE,0BFA6H
        LD      BC,004DH
        LD      (HL),00H
        LDIR    
        RET     

L12F5:  LD      (BC),A
        NOP     
        LD      BC,00020H
        NOP     
        NOP     
        LD      H,H
        NOP     
        NOP     
        NOP     
        LD      B,C
L1301:  CALL    L1357
        LD      (8AE7H),HL
        LD      A,04H
        LD      (8AE9H),A
        CALL    L137F
        LD      (8AEAH),A
        LD      C,03H
L1314:  LD      HL,(8AE7H)
        LD      A,(8AEAH)
        LD      B,A
        CALL    0139AH
        JR      NC,L1322
        JR      L1355
		
L1322:  LD      HL,(8AE7H)
        LD      DE,00020H
        ADD     HL,DE
        LD      (8AE7H),HL
        LD      A,(8AEAH)
        INC     A
        LD      (8AEAH),A
        LD      A,(8AE9H)
        DEC     A
        LD      (8AE9H),A
        JR      NZ,L1314
        LD      A,(8C93H)
        LD      HL,0C059H
        LD      DE,00A0H
L1345:  DEC     A
        JR      Z,L134B
        ADD     HL,DE
        JR      L1345
		
L134b:  LD      DE,0BF99H
        LD      BC,005AH
        LDIR    
        AND     A
        RET     

L1355:  SCF     
        RET     

L1357:  PUSH    DE
        LD      A,(8C93H)
        DEC     A
        SLA     A
        LD      E,A
        LD      D,00H
        LD      HL,136BH
        ADD     HL,DE
        LD      E,(HL)
        INC     HL
        LD      D,(HL)
        EX      DE,HL
        POP     DE
        RET     

        LD      E,C
        RET     NZ

        LD      SP,HL
        RET     NZ

        SBC     A,C
        POP     BC
        ADD     HL,SP
        JP      NZ,0C2D9H
        LD      A,C
        JP      0C419h
        CP      C
        CALL    NZ,0C559H
        LD      SP,HL
        PUSH    BC
L137f:  PUSH    HL
        PUSH    DE
        LD      A,(8C93H)
        DEC     A
        LD      E,A
        LD      D,00H
        LD      HL,1390H
        ADD     HL,DE
        LD      A,(HL)
        POP     DE
        POP     HL
        RET     

        LD      (BC),A
        RLCA    
        INC     C
        LD      DE,1B16H
        JR      NZ,L13BD
        LD      HL,(0C52FH)
        PUSH    HL
        LD      A,0C2H
        CALL    L13B8
        JR      C,L13B4
        CALL    L140E
        JR      C,L13B4
        POP     DE
        LD      HL,8AAEH
        LD      BC,00020H
        LDIR    
        AND     A
        POP     BC
        RET     

L13b4:  POP     HL
        POP     BC
        SCF     
        RET     

L13b8:  LD      (8AA4H),A
        LD      A,0D2H
L13bd:  LD      (8AA3H),A
        LD      A,01H
        LD      (8AA5H),A
        LD      A,B
        LD      (8AA6H),A
        LD      B,03H
        LD      IX,8AA4H
        CALL    L18BD
        LD      (IX+00H),D
        LD      (IX+01H),E
        LD      HL,8AA3H
        LD      B,06H
L13dd:  LD      A,(HL)
        CALL    L164E
        RET     C

        INC     HL
        DJNZ    L13DD
        CALL    DELAY
        RET     

L13e9:  LD      HL,8ADDH
        LD      B,06H
L13ee:  CALL    L1696
        RET     C

        LD      (HL),A
        INC     HL
        DJNZ    L13EE
        CALL    DELAY
        LD      B,05H
        LD      IX,8ADEH
        CALL    L18BD
        LD      A,D
        OR      E
        JR      NZ,L140A
        LD      A,(8ADEH)
        RET     

L140a:  LD      A,(8ADEH)
        RET     

L140e:  LD      A,03H
        LD      (8AEBH),A
L1413:  CALL    L1696
        RET     C

        CP      0D2H
        JR      NZ,L1461
        LD      B,05H
        LD      HL,8ADDH
        LD      (HL),A
        INC     HL
L1422:  CALL    L1696
        RET     C

        LD      (HL),A
        INC     HL
        DJNZ    L1422
        CALL    DELAY
        LD      IX,8ADEH
        LD      B,05H
        CALL    L18BD
        LD      A,D
        OR      E
        JR      Z,L1454
        CALL    DELAY
        LD      A,(8AEBH)
        DEC     A
        LD      (8AEBH),A
        JR      Z,L144D
        LD      A,15H
        CALL    L164E
        JR      L1413
L144d:  LD      A,04H
        CALL    L164E
        SCF     
        RET     

L1454:  CALL    DELAY
        LD      A,04H
        CALL    L164E
        LD      A,(8ADEH)
        SCF     
        RET     

L1461:  LD      HL,8AADH
        LD      (HL),A
        INC     HL
        LD      B,22H
L1468:  CALL    L1696
        RET     C

        LD      (HL),A
        INC     HL
        DJNZ    L1468
        CALL    DELAY
        LD      B,22H
        LD      IX,8AAEH
        CALL    L18BD
        LD      A,D
        OR      E
        JR      Z,L14A2
        LD      A,(8AEBH)
        DEC     A
        LD      (8AEBH),A
        JR      Z,L1495
        CALL    DELAY
        LD      A,0FH
        CALL    L164E
        RET     C

        JP      L1413
L1495:  CALL    DELAY
        LD      A,04H
        CALL    L164E
        CALL    L13E9
L14a0:  SCF     
        RET     

L14a2:  CALL    DELAY
        LD      A,04H
        CALL    L164E
        CALL    L13E9
        JR      C,L14A0
        CP      55H
        JR      NZ,L14A0
        AND     A
        RET     

L14b5:  LD      C,03H
L14b7:  LD      A,(8AEAH)
        LD      B,A
        LD      A,0C3H
        CALL    L13B8
        RET     C

        CALL    L13E9
        JR      NC,L14D2
        CP      53H
        JR      Z,L14D2
        CALL    DELAY
        DEC     C
        JR      NZ,L14B7
        SCF     
        RET     

L14d2:  LD      HL,8AADH
        LD      B,23H
        CALL    DELAY
        CALL    DELAY
L14dd:  LD      A,(HL)
        CALL    L164E
        RET     C

        INC     HL
        DJNZ    L14DD
        CALL    DELAY
        CALL    L13E9
        JR      NC,L14F5
        CALL    DELAY
        DEC     C
        JR      NZ,L14B7
L14f3:  SCF     
        RET     

L14f5:  CP      55H
        JR      NZ,L14F3
        CALL    DELAY
        AND     A
        RET     

L14fe:  LD      HL,0C039H
        LD      B,01H
        CALL    0139AH
        RET     

L1507:  LD      C,03H
L1509:  LD      A,0C0H
        CALL    L13B8
        RET     C

        CALL    L13E9
        JR      NC,L151C
        CALL    DELAY
        DEC     C
        JR      NZ,L1509
        SCF     
        RET     

L151c:  CALL    DELAY
        CP      55H
        JR      Z,L1567
        CP      51H
        JR      Z,L153B
        CP      52H
        JR      Z,L1547
        CP      53H
        JR      Z,L154F
        CP      54H
        JR      Z,L155B
        CP      50H
        JR      Z,L1539
        SCF     
        RET     

L1539:  SCF     
        RET     

L153b:  CALL    L156B
        RET     C

        CALL    L1596
        RET     C

        CALL    L14FE
        RET     

L1547:  CALL    L1596
        RET     C

        CALL    L14FE
        RET     

L154f:  CALL    L15C1
        RET     C

        CALL    L156B
        RET     C

        CALL    L14FE
        RET     

L155b:  CALL    L162B
        RET     C

        CALL    L1596
        RET     C

        CALL    L14FE
        RET     

L1567:  CALL    L14FE
        RET     

L156b:  CALL    L160B
        LD      C,03H
L1570:  LD      A,0C6H
        CALL    L13B8
        RET     C

        CALL    L13E9
        CALL    DELAY
        JR      NC,L1586
L157e:  CALL    DELAY
        DEC     C
        JR      NZ,L1570
        SCF     
        RET     

L1586:  CP      60H
        JR      NC,L157E
        LD      HL,8AADH
        LD      B,23H
        LD      C,03H
        CALL    L14DD
        RET     C

        RET     

L1596:  CALL    L160B
        LD      C,03H
L159b:  LD      A,0C5H
        CALL    L13B8
        RET     C

        CALL    L13E9
        CALL    DELAY
        JR      NC,L15B1
L15a9:  CALL    DELAY
        DEC     C
        JR      NZ,L159B
        SCF     
        RET     

L15b1:  CP      55H
        JR      NZ,L15A9
        LD      HL,8AADH
        LD      B,23H
        LD      C,03H
        CALL    L14DD
        RET     C

        RET     

L15c1:  CALL    L15EB
        LD      C,03H
L15c6:  LD      A,0C1H
        CALL    L13B8
        RET     C

        CALL    L13E9
        CALL    DELAY
        JR      NC,L15DC
L15d4:  CALL    DELAY2
        DEC     C
        JR      NZ,L15C6
        SCF     
        RET     

L15dc:  CP      55H
        JR      NZ,L15D4
        LD      HL,8AADH
        LD      B,09H
        LD      C,03H
        CALL    L14DD
        RET     

L15eb:  LD      HL,17D9H
        LD      DE,8AAEH
        LD      BC,0006H
        LDIR    
        LD      A,02H
        LD      (8AADH),A
        LD      B,06H
        LD      IX,8AAEH
        CALL    L18BD
        LD      (IX+00H),D
        LD      (IX+01H),E
L160a:  RET     

L160b:  LD      HL,17B9H
        LD      DE,8AAEH
        LD      BC,00020H
        LDIR    
        LD      A,02H
        LD      (8AADH),A
        LD      B,20H
        LD      IX,8AAEH
        CALL    L18BD
        LD      (IX+00H),D
        LD      (IX+01H),E
        RET     

L162b:  CALL    L15EB
        LD      C,02H
L1630:  LD      B,09H
        LD      HL,8AADH
        LD      A,(HL)
        CALL    L164E
        INC     HL
        DJNZ    L162B
        CALL    DELAY
        CALL    L13E9
        JR      NC,L164C
        CALL    DELAY
        DEC     C
        JR      NZ,L1630
        SCF     
        RET     

L164c:  AND     A
        RET     

L164e:  PUSH    BC
        PUSH    HL
        LD      HL,0FFFFH
        PUSH    AF
        IN0     A,(CNTLA0)              ; Z180 instruction
        AND     0EFH
        OUT0    (CNTLA0),A              ; Z180 instruction
L165c:  IN0     A,(04H)                 ; Z180 instruction
        AND     02H
        JR      Z,L165C
        POP     AF
        OUT0    (06H),A                 ; Z180 instruction
L1667:  IN0     A,(04H)                 ; Z180 instruction
        LD      B,A
        AND     80H
        JR      NZ,L1676
        DEC     HL
        LD      A,H
        OR      L
        JR      NZ,L1667
        JR      L168A
L1676:  IN0     A,(08H)                 ; Z180 instruction
        LD      A,B
        AND     70H
        JR      NZ,L168A
        IN0     A,(CNTLA0)               ; Z180 instruction
        OR      10H
        OUT0    (CNTLA0),A              ; Z180 instruction
        POP     HL
        POP     BC
        AND     A
        RET     

L168a:  IN0     A,(CNTLA0)              ; Z180 instruction
        OR      10H
        OUT0    (CNTLA0),A              ; Z180 instruction
        POP     HL
        POP     BC
        SCF     
        RET     

L1696:  PUSH    BC
        PUSH    HL
        LD      HL,0FFFFH
L169b:  IN0     A,(04H)                 ; Z180 instruction
        LD      B,A
        AND     80H
        JR      NZ,L16AA
        DEC     HL
        LD      A,H
        OR      L
        JR      NZ,L169B
        JR      L16C7
L16aa:  LD      A,B
        AND     70H
        JR      NZ,L16B6
        IN0     A,(08H)                 ; Z180 instruction
        POP     HL
        POP     BC
        AND     A
        RET     

L16b6:  IN0     A,(08H)                 ; Z180 instruction
        IN0     A,(CNTLA0)                 ; Z180 instruction
        AND     0F7H
        OUT0    (CNTLA0),A                 ; Z180 instruction
        LD      A,0FFH
        POP     HL
        POP     BC
        SCF     
        RET     

L16c7:  SCF     
        POP     HL
        POP     BC
        RET     

L16cb:  LD      A,(8AA1H)
        AND     A
        JP      NZ,L16DD
        LD      A,(8C9CH)
        CP      0FFH
        JP      Z,L172F
        JP      L1732
L16dd:  SUB     82H
        SLA     A
        SLA     A
        SLA     A
        LD      E,A
        LD      D,00H
        LD      HL,1E10H
        ADD     HL,DE
        LD      A,(8017H)
        AND     A
        JR      Z,L16F6
        LD      DE,0004H
        ADD     HL,DE
L16f6:  LD      A,(HL)
        LD      (0BFA5H),A
        INC     HL
        LD      B,(HL)
        LD      A,(0BF9CH)
        AND     6FH
        OR      B
        LD      (0BF9CH),A
        INC     HL
        LD      B,(HL)
        LD      A,(0BF9EH)
        AND     6FH
        OR      B
        LD      (0BF9EH),A
        INC     HL
        LD      B,(HL)
        LD      A,(0BFF0H)
        AND     0FH
        OR      B
        LD      (0BFF0H),A
        LD      B,00H
        LD      A,(8AA1H)
        CP      82H
        JR      NZ,L1726
        LD      B,10H
L1726:  LD      A,(0BFEFH)
        AND     6FH
        OR      B
        LD      (0BFEFH),A
L172f:  CALL    L189D
L1732:  CALL    L0FC4
        LD      HL,0C059H
        LD      DE,00A0H
        LD      A,(8C93H)
L173e:  DEC     A
        JR      Z,L1744
        ADD     HL,DE
        JR      L173E
L1744:  EX      DE,HL
        LD      HL,0BF99H
        LD      BC,005AH
        LDIR    
        CALL    L1357
        LD      (8AE7H),HL
        LD      A,04H
        LD      (8AE9H),A
        CALL    L137F
        LD      (8AEAH),A
L175e:  LD      HL,(8AE7H)
        LD      A,(8AEAH)
        LD      B,A
        CALL    L1793
        JR      C,L1788
        LD      HL,(8AE7H)
        LD      DE,00020H
        ADD     HL,DE
        LD      (8AE7H),HL
        LD      A,(8AEAH)
        INC     A
        LD      (8AEAH),A
        LD      A,(8AE9H)
        DEC     A
        LD      (8AE9H),A
        JR      NZ,L175E
        CALL    L178A
        RET     

L1788:  SCF     
        RET     

L178a:  LD      HL,0C039H
        LD      B,01H
        CALL    L1793
        RET     

L1793:  PUSH    BC
        LD      DE,8AAEH
        LD      BC,00020H
        LDIR    
        LD      A,02H
        LD      (8AADH),A
        LD      IX,8AAEH
        LD      B,20H
        CALL    L18BD
        LD      (IX+00H),D
        LD      (IX+01H),E
        POP     BC
        LD      A,B
        LD      (8AEAH),A
        CALL    L14B5
        RET     

        LD      BC,L0000
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        NOP     
        JP      M,L12CD
		
L17df:  IN      A,(0C1H)
        RES     5,A
        OUT     (0C1H),A
        CALL    DELAY2
        IN      A,(0C1H)
        RES     6,A
        OUT     (0C1H),A
        CALL    DELAY2
        IN      A,(0C1H)
        RES     7,A
        OUT     (0C1H),A
        CALL    DELAY3
        RET     

L17fb:  IN0     A,(CNTLA0)                 ; Z180 instruction
        AND     0F7H
        OUT0    (CNTLA0),A                 ; Z180 instruction
        IN      A,(0C1H)
        AND     0C0H
        OR      04H
        OUT     (0C1H),A
        CALL    DELAY3
L180e:  IN      A,(0C0H)
        BIT     0,A
        JR      Z,L180E
        CALL    DELAY3
        IN      A,(0C1H)
        SET     7,A
        RES     5,A
        RES     6,A
        OUT     (0C1H),A
        CALL    DELAY3
        IN      A,(0C1H)
        SET     6,A
        OUT     (0C1H),A
        CALL    DELAY3
        IN      A,(0C1H)
        SET     5,A
        OUT     (0C1H),A
        LD      HL,0BB8H
L1836:  IN0     A,(04H)                 ; Z180 instruction
        LD      B,A
        AND     80H
        JR      NZ,L1866
        CALL    DELAY
        DEC     HL
        LD      A,H
        OR      L
        JR      NZ,L1836
        LD      A,02H
        SCF     
        RET     

L184a:  LD      HL,L0000
L184d:  IN0     A,(08H)                 ; Z180 instruction
        IN0     A,(CNTLA0)                 ; Z180 instruction
        AND     0F7H
        OUT0    (CNTLA0),A                 ; Z180 instruction
L1858:  IN0     A,(04H)                 ; Z180 instruction
        AND     80H
        JR      NZ,L184D
        DEC     HL
        LD      A,H
        OR      L
        JR      NZ,L1858
        SCF     
        RET     

L1866:  LD      A,B
        AND     70H
        JR      NZ,L184A
        IN0     A,(08H)                 ; Z180 instruction
        CP      0F4H
        JR      NZ,L17FB
        CALL    L1696
        RET     

L1876:  CALL    L17DF
L1879:  IN      A,(0C1H)
        AND     84H
        SET     1,A
        OUT     (0C1H),A
        CALL    DELAY3
        IN      A,(0C1H)
        RES     1,A
        OUT     (0C1H),A
        CALL    DELAY3
        CALL    DELAY3
        IN      A,(0C0H)
        BIT     0,A
        JR      NZ,L1879
        IN      A,(0C1H)
        AND     18H
        OUT     (0C1H),A
        RET     

L189d:  PUSH    AF
        PUSH    DE
        LD      A,(8C93H)
        DEC     A
        CALL    L0E6F
        SLA     E
        RL      D
        SRL     E
        LD      A,(0C052H)
        OR      E
        LD      (0C052H),A
        LD      A,(0C053H)
        OR      D
        LD      (0C053H),A
        POP     DE
        POP     AF
        RET     

L18bd:  PUSH    AF
        PUSH    BC
        PUSH    HL
        LD      DE,L0000
L18c3:  LD      C,08H
        LD      H,(IX+00H)
        CALL    L1900
        INC     IX
L18cd:  SLA     H
        RL      E
        RL      D
        JR      NC,L18DD
        LD      A,D
        XOR     10H
        LD      D,A
        LD      A,E
        XOR     21H
        LD      E,A
L18dd:  DEC     C
        JR      NZ,L18CD
        DEC     B
        JR      NZ,L18C3
        LD      C,10H
L18e5:  SLA     E
        RL      D
        JR      NC,L18F3
        LD      A,D
        XOR     10H
        LD      D,A
        LD      A,E
        XOR     21H
        LD      E,A
L18f3:  DEC     C
        JR      NZ,L18E5
        CALL    L190F
        CALL    L191E
        POP     HL
        POP     BC
        POP     AF
        RET     

L1900:  PUSH    AF
        PUSH    BC
        LD      B,08H
        XOR     A
L1905:  RL      H
        RR      A
        DJNZ    L1905
        LD      H,A
        POP     BC
        POP     AF
        RET     

L190f:  PUSH    AF
        PUSH    BC
        LD      B,08H
        XOR     A
L1914:  RL      D
        RR      A
        DJNZ    L1914
        LD      D,A
        POP     BC
        POP     AF
        RET     

L191e:  PUSH    AF
        PUSH    BC
        LD      B,08H
        XOR     A
L1923:  RL      E
        RR      A
        DJNZ    L1923
        LD      E,A
        POP     BC
        POP     AF
        RET     

L192d:  CALL    L105B
        CALL    L068D
        LD      A,(8000H)
        LD      HL,2C9EH
        CP      40H
        JR      Z,L1947
        LD      HL,2D78H
        CP      60H
        JR      Z,L1947
        LD      HL,MSG08					; 2D05H  Alle hoeken
L1947:  CALL    MSG2BUFFER
        RET     

L194b:  LD      A,(0BFA5H)
        CP      00H
        JP      Z,L1971
        CP      07H
        JP      Z,L1971
        CP      05H
        JP      Z,L1973
        CP      06H
        JP      Z,L19A8
        CP      04H
        JP      Z,L19DD
        CP      01H
        JP      Z,L1A12
        CP      20H
        JP      Z,L1A86
L1971:  SCF     
        RET     

L1973:  LD      A,(0BF9EH)
        AND     10H
        JR      NZ,L1991
        LD      A,01H
        LD      (8AFDH),A
        LD      A,00H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L1991:  LD      A,01H
        LD      (8AFDH),A
        LD      A,02H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L19a8:  LD      A,(0BF9EH)
        AND     10H
        JR      NZ,L19C6
        LD      A,08H
        LD      (8AFDH),A
        LD      A,00H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L19c6:  LD      A,08H
        LD      (8AFDH),A
        LD      A,02H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L19dd:  LD      A,(0BF9CH)
        AND     10H
        JR      Z,L19FB
        LD      A,04H
        LD      (8AFDH),A
        LD      A,02H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L19fb:  LD      A,04H
        LD      (8AFDH),A
        LD      A,00H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L1a12:  LD      A,(0BFF0H)
        AND     70H
        CP      30H
        JR      NZ,L1A32
        LD      A,20H
        LD      (8AFDH),A
        LD      A,00H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L1a32:  CP      20H
        JR      NZ,L1A4D
        LD      A,20H
        LD      (8AFDH),A
        LD      A,02H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L1a4d:  CP      40H
        JR      NZ,L1A7F
        LD      A,10H
        LD      (8AFDH),A
        LD      A,02H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L1a68:  LD      A,10H
        LD      (8AFDH),A
        LD      A,00H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L1a7f:  CP      50H
        JP      NZ,L1971
        JR      L1A68
L1a86:  LD      A,(0BFF0H)
        AND     70H
        CP      30H
        JR      NZ,L1AA6
        LD      A,80H
        LD      (8AFDH),A
        LD      A,00H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L1aa6:  CP      20H
        JR      NZ,L1AC1
        LD      A,80H
        LD      (8AFDH),A
        LD      A,02H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L1ac1:  CP      40H
        JR      NZ,L1AF3
        LD      A,40H
        LD      (8AFDH),A
        LD      A,00H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L1adc:  LD      A,40H
        LD      (8AFDH),A
        LD      A,02H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        JP      L1AFA
L1af3:  CP      50H
        JP      NZ,L1971
        JR      L1ADC
L1afa:  CALL    L0E98
        AND     A
        RET     

L1aff:  LD      A,(8002H)
        AND     A
        JP      NZ,L03CB
L1b06:  LD      A,(8AF7H)
        AND     A
        JR      Z,L1B1C
        LD      A,(8013H)
        AND     A
        JR      Z,L1B1C
        XOR     A
        LD      (8013H),A
        LD      (8AF7H),A
        JP      L04B1
L1b1c:  LD      A,(8C9BH)
        AND     A
        JP      NZ,L1B32
        LD      A,(8018H)
        AND     A
        JP      Z,L1AFF
        XOR     A
        LD      (8018H),A
        LD      HL,(8019H)
        JP      (HL)
L1b32:  CALL    L1876
        XOR     A
        LD      (8C9BH),A
        JP      L1B5A
L1b3c:  LD      H,28H
L1b3e:  CALL    DELAY3
        DEC     H
        JR      NZ,L1B3E
        RET     

L1b45:  LD      H,0FH
        CALL    DELAY3
        DEC     H
        JR      NZ,L1B45
        RET     

        RLCA    
        LD      H,H
        NOP     
        NOP     
        NOP     
        LD      B,B
        NOP     
        NOP     
        INC     BC
        LD      B,B
        NOP     
        NOP     
L1b5a:  XOR     A
        LD      (8BBBH),A
        XOR     A
        LD      (8B07H),A
        XOR     A
        LD      (8C9BH),A
        XOR     A
        LD      (8017H),A
        CALL    L0FC4
        LD      A,01H
        LD      (8C93H),A
        CALL    CLEARPIXELBUFFER
        CALL    PIXELS2LCD
        LD      HL,MSG01			; Point to first message	0297BH
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        CALL    L042D
        CALL    L17FB
        JR      NC,L1B9E
L1b89:  CALL    CLEARPIXELBUFFER
        LD      HL,MSG04					; 2B45H  Gheugenkaart ongeldig
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        CALL    L1876
        CALL    L1B3C
        JP      L1B5A
		
L1b9e:  CALL    DELAY3
        CALL    L1507
        JR      NC,L1BDE
        CP      53H
        JR      NZ,L1BC9
        XOR     A
        LD      (0C039H),A
        LD      HL,0C039H
        LD      DE,0C03AH
        LD      BC,001FH
        LDIR    
        CALL    L178A
L1bbc:  CALL    L12D6
        XOR     A
        LD      (8AA1H),A
        CALL    L16CB
        JP      NC,L1CCE
L1bc9:  CALL    CLEARPIXELBUFFER
        LD      HL,MSG03					;2AB9H  Geheugenkaart niet gereed
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        CALL    L1876
        CALL    L1B3C
        JP      L1B5A
L1bde:  LD      A,(8C93H)
        CP      0BH
        JR      Z,L1BF0
        CALL    L1301
        JR      NC,L1BFF
        CP      53H
        JR      Z,L1BBC
        JR      L1BC9
L1bf0:  CALL    CLEARPIXELBUFFER
        LD      HL,MSG05					;2B85H Geheugenkaart vol
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        JP      L1AFF
L1bff:  CALL    CLEARPIXELBUFFER
        CALL    L0A21
        CALL    L0FE0
        XOR     A
        LD      (8AA1H),A
        XOR     A
        LD      (8C9CH),A
        LD      A,(8C93H)
        DEC     A
        CALL    L0E6F
        LD      A,(0C052H)
        SLA     E
        RL      D
        SRL     E
        AND     E
        JR      NZ,L1C2A
        LD      A,(0C053H)
        AND     D
        JP      Z,L1CCE
L1c2a:  LD      A,(0BF99H)
        CP      02H
        JR      Z,L1C48
        CALL    CLEARPIXELBUFFER
        CALL    L0A21
        CALL    L0FE0
        LD      HL,MSG03 - 4					;2AB5H Geheugenkaart niet gereed  #### - 4 bytes #### WHY??
        CALL    MSG2BUFFER
        CALL    L06A6
        CALL    PIXELS2LCD
        JR      L1C72
L1c48:  CALL    L194B
        JR      C,L1C4D
L1c4d:  CALL    L105B
        CALL    L1184
        LD      A,(0BFA5H)
        CP      01H
        JR      Z,L1C62
        CP      04H
        JR      Z,L1C62
        CP      20H
        JR      NZ,L1C6C
L1c62:  LD      A,(0BFEFH)
        AND     10H
        JR      Z,L1C6C
        CALL    L12B7
L1c6c:  CALL    L06A6
        CALL    PIXELS2LCD
L1c72:  LD      HL,1C7BH
        CALL    L049E
        JP      L1AFF
        XOR     A
        CALL    L06E5
        JR      C,L1C72
        CP      8FH
        JR      NZ,L1CA3
L1c85:  LD      A,0FFH
        LD      (8C9CH),A
        CALL    L0FBC
        CALL    L16CB
        JP      C,L1B89
        LD      A,(8C93H)
        INC     A
        LD      (8C93H),A
        CALL    L0FC4
        CALL    L0A21
        JP      L1BDE
L1ca3:  CP      90H
        JR      NZ,L1C72
        CALL    L0FBC
        LD      A,(8C93H)
        DEC     A
        CALL    L0E6F
        SLA     E
        RL      D
        SRL     E
        LD      A,(0C052H)
        XOR     E
        LD      (0C052H),A
        LD      A,(0C053H)
        XOR     D
        LD      (0C053H),A
        CALL    L0A0D
        CALL    L0A08
        CALL    L0A1B
L1cce:  CALL    L12D6
        XOR     A
        LD      (8017H),A
        CALL    L0FE0
        CALL    L105B
        CALL    L0A21
        CALL    L06A6
        CALL    L068D
        LD      HL,MSG06				;2C2BH  Selecteer oplichtende toepassing
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        LD      A,0FDH
        LD      (8AFDH),A
        LD      A,00H
        LD      (8AFEH),A
        LD      A,00H
        LD      (8AFFH),A
        LD      A,00H
        LD      (8B00H),A
        LD      A,0FDH
        LD      (8B02H),A
        LD      A,00H
        LD      (8B03H),A
        LD      A,00H
        LD      (8B04H),A
        LD      A,00H
        LD      (8B05H),A
        CALL    L0E98
        XOR     A
        LD      (8AA1H),A
        LD      (8C9CH),A
        LD      (8AA2H),A
L1d22:  LD      HL,1D2BH
        CALL    L049E
        JP      L1AFF
        LD      A,01H
        CALL    L06E5
        JR      C,L1D22
        CP      80H
        JR      NZ,L1D3C
        LD      HL,L1D22
        JP      L23DD
L1d3c:  CP      81H
        JR      NZ,L1D46
        LD      HL,L1D22
        JP      L2673
L1d46:  CP      8FH
        JP      Z,L1C85
L1d4b:  LD      IX,1DF4H
        CP      82H
        JR      Z,L1DA0
        LD      IX,1DF8H
        CP      83H
        JR      Z,L1DA0
        LD      IX,1DFCH
        CP      84H
        JR      Z,L1DA0
        LD      IX,1E00H
        CP      85H
        JR      Z,L1DA0
        LD      IX,1E04H
        CP      86H
        JR      Z,L1DA0
        LD      IX,1E08H
        CP      87H
        JR      Z,L1DA0
        LD      IX,1E0CH
        CP      88H
        JR      Z,L1DA0
        CP      89H
        JR      NZ,L1D22
        CALL    L0FBC
        LD      A,(8AFEH)
        XOR     02H
        LD      (8AFEH),A
        LD      A,(8017H)
        XOR     0FFH
        LD      (8017H),A
        CALL    L0E98
        JP      L1D22
L1da0:  LD      IY,8AA1H
        CP      (IY+00H)
        JP      Z,L1CCE
        LD      B,A
        LD      A,(IY+00H)
        AND     A
        JP      Z,L1DC4
        CALL    L0FBC
        LD      (IY+00H),B
        LD      A,(IX+00H)
        LD      (8AFDH),A
        CALL    L0E98
        JP      L1E94
L1dc4:  LD      A,B
        LD      (IY+00H),A
        CALL    L0FBC
        LD      A,(IX+00H)
        LD      (8AFDH),A
        LD      A,(8AFEH)
        OR      (IX+01H)
        LD      (8AFEH),A
        LD      A,00H
        LD      (8B02H),A
        LD      A,00H
        LD      (8B03H),A
        LD      A,00H
        LD      (8B04H),A
        LD      A,00H
        LD      (8B05H),A
        CALL    L0E98
        JP      L1E48
        LD      BC,L0000
        NOP     
        EX      AF,AF'
        NOP     
        NOP     
        NOP     
        INC     B
        NOP     
        NOP     
        NOP     
        JR      NZ,L1E02
L1e02:  NOP     
        NOP     
        DJNZ    L1E06
L1e06:  NOP     
        NOP     
        ADD     A,B
        NOP     
        NOP     
        NOP     
        LD      B,B
        NOP     
        NOP     
        NOP     
        DEC     B
        NOP     
        NOP     
        NOP     
        DEC     B
        NOP     
        DJNZ    L1E28
        LD      B,00H
        NOP     
        NOP     
        LD      B,00H
        DJNZ    01e30H
        INC     B
        NOP     
        NOP     
        DJNZ    01E29H
        DJNZ    01E27H
L1e27:  NOP     
L1e28:  LD      BC,0000H
        JR      NC,01E2EH
        NOP     
L1e2e:  NOP     
        JR      NZ,01E32H
        NOP     
L1e32:  NOP     
        LD      D,B
        LD      BC,0010H
        LD      B,B
        JR      NZ,01E3AH
L1e3a:  NOP     
        JR      NC,01E5DH
        NOP     
        NOP     
        JR      NZ,01E61H
        NOP     
        NOP     
        LD      B,B
        JR      NZ,01E46H
L1e46:  NOP     
        LD      D,B
L1e48:  XOR     A
        LD      (8B10H),A
        XOR     A
        LD      (8B0EH),A
        XOR     A
        LD      (8C92H),A
        XOR     A
        LD      (8AA0H),A
        XOR     A
        LD      (8A9FH),A
        CALL    L0FD5
        CALL    L0A0D
        CALL    L0A08
        CALL    CLEAR3K5
        LD      HL,0BFA7H
        LD      (8C90H),HL
        LD      HL,0BFA8H
        LD      (8B11H),HL
L1e74:  LD      A,40H
        LD      (8000H),A
        LD      HL,8AFEH
        LD      A,(HL)
        AND     03H
        OR      01H
        LD      (HL),A
        CALL    L0E98
        CALL    CLEAR3K5
        CALL    L192D
        CALL    L06A6
        CALL    L0595
        CALL    PIXELS2LCD
L1e94:  LD      HL,L1EA2
        CALL    L049E
        JP      L1AFF
		
L1e9d:  CALL    L0FBC
        JR      L1E74
L1ea2:  XOR     A
        CALL    L06E5
        JP      C,L1F89
        LD      B,A
        CP      8AH
        JP      C,L1F20
        CP      8DH
        JP      NC,L1F20
        LD      A,(8B10H)
        AND     A
        JR      NZ,L1E94
        LD      A,(8AA0H)
        AND     A
        JP      NZ,L1E94
        LD      A,B
        CP      8AH
        JP      Z,L1E9D
        CP      8BH
        JP      Z,L1EF8
        CALL    L0FBC
        LD      A,60H
        LD      (8000H),A
        LD      HL,8AFEH
        LD      A,(HL)
        AND     02H
        OR      04H
        LD      (HL),A
        CALL    L0E98
        CALL    CLEAR3K5
        CALL    L192D
        CALL    L06A6
        CALL    L0595
        CALL    PIXELS2LCD
        JP      L1E94
        CALL    L0FBC
        JP      L1E74
L1ef8:  LD      A,20H
        LD      (8000H),A
        LD      HL,8AFEH
        LD      A,(HL)
        AND     02H
        OR      08H
        LD      (HL),A
        CALL    L0E98
        LD      A,(8C92H)
        CP      0EH
        JP      Z,L2233
        CALL    L0FBC
        CALL    L068D
        CALL    L192D
        CALL    PIXELS2LCD
        JP      L1E94
L1f20:  CP      81H
        JR      NZ,L1F2A
        LD      HL,L1E94
        JP      L2673
L1f2a:  CP      80H
        JR      NZ,L1F34
        LD      HL,L1E94
        JP      L23DD
L1f34:  CP      82H
        JP      C,L1E94
        CP      89H
        JR      NC,L1F53
        LD      B,A
        LD      A,(8B10H)
        AND     A
        JP      NZ,L1C72
        LD      A,(8AA1H)
        CP      B
        LD      A,B
        JP      NZ,L1D4B
        CALL    L0FBC
        JP      L1CCE
L1f53:  CP      8EH
        JP      Z,L232B
        CP      8FH
        JP      NZ,L1F81
        LD      A,(8B0EH)
        LD      (0BFA6H),A
        CALL    L0FBC
        LD      A,0FFH
        LD      (8C9CH),A
        CALL    L16CB
        JP      C,L1B89
        LD      A,(8C93H)
        INC     A
        LD      (8C93H),A
        CALL    L0FC4
        CALL    L0A21
        JP      L1BDE
L1f81:  CP      90H
        JP      NZ,L229F
        JP      L1CA3
L1f89:  LD      A,(8AA0H)
        AND     A
        JP      NZ,L228F
        LD      A,(8000H)
        CP      20H
        JP      Z,L2118
        CP      40H
        JP      Z,L2036
        CP      60H
        JP      NZ,L1E94
        LD      A,(8B10H)
        AND     A
        JP      NZ,L1FE1
        CALL    L0FBC
        LD      A,(8B10H)
        INC     A
        LD      (8B10H),A
        LD      A,(8C92H)
        INC     A
        LD      (8C92H),A
        LD      (8C78H),BC
        LD      (8C7AH),DE
        CALL    L04EF
        CALL    L053D
        LD      (8B0AH),BC
        CALL    L0956
        CALL    L06A6
        CALL    PIXELS2LCD
        CALL    L0FD5
L1fd8:  LD      HL,L1FE1
        CALL    L049E
        JP      L1AFF
L1fe1:  XOR     A
        CALL    L06E5
        JR      C,L1FF8
        CP      8EH
        JP      Z,L2330
        CP      8DH
        JP      Z,L20D4
        CP      90H
        JP      Z,L1CA3
        JR      L1FD8
L1ff8:  LD      A,(8B10H)
        INC     A
        LD      (8B10H),A
        LD      A,(8C92H)
        INC     A
        LD      (8C92H),A
        LD      (8C7CH),BC
        LD      (8C7EH),DE
        CALL    L04EF
        CALL    L053D
        CALL    L095C
        JP      C,L20D4
        LD      BC,(8C78H)
        LD      DE,(8C7AH)
        CALL    L0925
        LD      BC,(8C7CH)
        LD      DE,(8C7EH)
        CALL    L0925
        CALL    L0FD5
        JP      L2094
L2036:  LD      A,(8B10H)
        AND     A
        JR      NZ,L2066
        CALL    L0FBC
        LD      A,(8B10H)
        INC     A
        LD      (8B10H),A
        LD      A,(8C92H)
        INC     A
        LD      (8C92H),A
        CALL    L0925
        LD      (8B0AH),BC
        CALL    L0956
        CALL    L06A6
        CALL    PIXELS2LCD
L205d:  LD      HL,L2066
        CALL    L049E
        JP      L1AFF
L2066:  XOR     A
        CALL    L06E5
        JR      C,L207D
        CP      8EH
        JP      Z,L2330
        CP      8DH
        JP      Z,L20D4
        CP      90H
        JP      Z,L1CA3
        JR      L205D
L207d:  LD      A,(8B10H)
        INC     A
        LD      (8B10H),A
        LD      A,(8C92H)
        INC     A
        LD      (8C92H),A
        CALL    L0925
        CALL    L09AB
        JP      C,L20D4
L2094:  LD      A,01H
        LD      (8C96H),A
        LD      A,(8000H)
        LD      B,A
        LD      A,(8B10H)
        OR      B
        LD      HL,(8C90H)
        LD      (HL),A
        LD      HL,(8B11H)
        LD      (8C90H),HL
        INC     HL
        LD      (8B11H),HL
        XOR     A
        LD      (8B10H),A
        LD      A,(8B0EH)
        INC     A
        LD      (8B0EH),A
        CALL    L068D
        LD      HL,MSG10						;2DE7H Gebied is bepaald
        CALL    MSG2BUFFER
        CALL    L06A6
        CALL    L1064
        JP      L2233
        CP      8EH
        JP      NZ,L2094
        JP      L2330
L20d4:  LD      HL,PIXELBUFFER
        LD      DE,0A9BDH
        LD      BC,1000H
        LDIR    			; copy 4K bytes
        CALL    L068D
        LD      HL,MSG13							;2F65H Storing gebied wissen
        CALL    MSG2BUFFER
        CALL    L06A6
        CALL    L1064
        CALL    PIXELS2LCD
L20f1:  LD      HL,20FAH
        CALL    L049E
        JP      L1AFF
        XOR     A
        CALL    L06E5
        JR      C,L20F1
        CP      8EH
        JR      NZ,L20F1
        LD      HL,0A9BDH
        LD      DE,PIXELBUFFER
        LD      BC,1000H
        LDIR    
        CALL    L0A21
        CALL    L0FBC
        JP      L2330
L2118:  LD      A,(8A9FH)
        AND     A
        JP      NZ,L228F
        LD      A,(8B10H)
        AND     A
        JR      NZ,L214B
        CALL    L0FBC
        XOR     A
        LD      (8C96H),A
        LD      A,(8B10H)
        INC     A
        LD      (8B10H),A
        LD      A,(8C92H)
        INC     A
        LD      (8C92H),A
        CALL    L0925
        LD      (8B0AH),BC
        LD      (8B0CH),BC
        CALL    L0956
        JP      L228F
L214b:  LD      A,(8B10H)
        INC     A
        LD      (8B10H),A
        LD      A,(8C92H)
        INC     A
        LD      (8C92H),A
        CALL    L0925
        PUSH    BC
        POP     DE
        LD      HL,(8B0CH)
        AND     A
        SBC     HL,BC
        JP      Z,L2188
        CALL    L0FBC
        LD      BC,(8B0CH)
        PUSH    DE
        CALL    L0A2B
        POP     DE
        LD      (8B0CH),DE
        CALL    L06A6
        CALL    PIXELS2LCD
        LD      A,(8C92H)
        CP      10H
        JP      Z,L226C
        JP      L228F
L2188:  LD      HL,PIXELBUFFER
        LD      DE,0A9BDH
        LD      BC,1000H
        LDIR    
        CALL    L068D
        LD      HL,MSG13					;2F65H Storing gebied wissen
        CALL    MSG2BUFFER
        CALL    L06A6
        CALL    L1064
        CALL    PIXELS2LCD
L21a5:  LD      HL,21AEH
        CALL    L049E
        JP      L1AFF
        XOR     A
        CALL    L06E5
        JR      C,L21A5
        CP      8EH
        JR      NZ,L21A5
        LD      HL,0A9BDH
        LD      DE,PIXELBUFFER
        LD      BC,1000H
        LDIR    
        CALL    L0FBC
        CALL    L0A21
        JP      L2330
L21cc:  LD      A,(8C96H)
        AND     A
        JR      Z,L21DC
        XOR     A
        LD      (8C96H),A
        CALL    L0FBC
        JP      L228F
L21dc:  LD      A,(8000H)
        CP      20H
        JP      NZ,L228F
        LD      A,(8B10H)
        CP      03H
        JP      C,L20D4
        CALL    L0FBC
        LD      BC,(8B0CH)
        LD      DE,(8B0AH)
        CALL    L0A2B
        LD      A,(8B10H)
        LD      B,A
        LD      A,(8000H)
        OR      B
        LD      HL,(8C90H)
        LD      (HL),A
        LD      HL,(8B11H)
        LD      (8C90H),HL
        INC     HL
        LD      (8B11H),HL
        LD      A,(8B0EH)
        INC     A
        LD      (8B0EH),A
        LD      (0BFA6H),A
        XOR     A
        LD      (8B10H),A
        CALL    L068D
        LD      HL,MSG10					;2DE7H  Gebied is bepaald
        CALL    MSG2BUFFER
        CALL    L0C58
        CALL    L06A6
        CALL    L0A0D
        CALL    L0A08
L2233:  LD      A,(8B0EH)
        CP      04H
        JP      Z,L226C
        LD      A,(8C92H)
        CP      0EH
        JR      NZ,L225D
        LD      A,(8000H)
        CP      20H
        JR      NZ,L225D
        CALL    L068D
        LD      HL,MSG11					;2E63H Max aantal gebieden bijna
        CALL    MSG2BUFFER
        XOR     A
        LD      (8AA0H),A
        LD      A,01H
        LD      (8A9FH),A
        JR      L228C
L225d:  CP      0FH
        JR      Z,L226C
        CP      10H
        JR      Z,L226C
        LD      A,(8B0EH)
        CP      04H
        JR      NZ,L228C
L226c:  CALL    L068D
        LD      HL,MSG12					;2EF0H Max aantal gebieden bereikt
        CALL    MSG2BUFFER
        CALL    L06A6
        XOR     A
        LD      (8A9FH),A
        LD      A,01H
        LD      (8AA0H),A
        JR      L228C
        CALL    L192D
        CALL    L06A6
        CALL    L0595
L228c:  CALL    PIXELS2LCD
L228f:  LD      HL,2298H
        CALL    L049E
        JP      L1AFF
        XOR     A
        CALL    L06E5
        JP      C,L1F89
L229f:  CP      81H
        JR      NZ,L22A9
        LD      HL,L228F
        JP      L2673
L22a9:  CP      8FH
        JR      NZ,L22DD
        LD      A,(8B0EH)
        LD      (0BFA6H),A
        CALL    L0FBC
        LD      A,0FFH
        LD      (8C9CH),A
        CALL    L16CB
        JP      C,L1B89
        LD      A,(8C93H)
        INC     A
        LD      (8C93H),A
        XOR     A
        LD      (8B10H),A
        XOR     A
        LD      (8B0EH),A
        XOR     A
        LD      (8C92H),A
        CALL    L0FC4
        CALL    L0A21
        JP      L1BDE
L22dd:  CP      82H
        JR      C,L22FD
        CP      89H
        JR      NC,L22FD
        LD      B,A
        LD      A,(8B10H)
        AND     A
        JR      NZ,L228F
        LD      A,(8AA1H)
        CP      B
        LD      A,B
        JP      NZ,L1D4B
        CALL    L0FBC
        CALL    L0FC4
        JP      L1CCE
L22fd:  CP      89H
        JP      NZ,L231B
        CALL    L0FBC
        LD      A,(8AFEH)
        XOR     02H
        LD      (8AFEH),A
        LD      A,(8017H)
        XOR     0FFH
        LD      (8017H),A
        CALL    L0E98
        JP      L228F
L231b:  CP      80H
        JR      NZ,L232B
        LD      A,(8B10H)
        AND     A
        JR      NZ,L232B
        LD      HL,L228F
        JP      L23DD
L232b:  CP      8EH
        JP      NZ,L23AD
L2330:  LD      A,(8B10H)
        AND     A
        JR      Z,L2357
        CALL    L0FBC
        LD      A,(8B10H)
        LD      B,A
        LD      A,(8C92H)
        SUB     B
        LD      (8C92H),A
        XOR     A
        LD      (8B10H),A
        LD      HL,(8C90H)
        INC     HL
        LD      (8B11H),HL
        LD      A,(8B0EH)
        LD      (0BFA6H),A
        JR      L238F
L2357:  LD      A,(8B0EH)
        AND     A
        JP      Z,L2233
        DEC     A
        LD      (8B0EH),A
        LD      (0BFA6H),A
        LD      B,A
        LD      C,00H
        LD      HL,0BFA7H
        AND     A
        JR      Z,L2381
L236e:  LD      A,(HL)
        AND     1FH
        ADD     A,C
        LD      C,A
        LD      A,(HL)
        AND     1FH
        SLA     A
        SLA     A
        LD      E,A
        LD      D,00H
        ADD     HL,DE
        INC     HL
        DJNZ    L236E
L2381:  LD      (8C90H),HL
        INC     HL
        LD      (8B11H),HL
        LD      A,C
        LD      (8C92H),A
        CALL    L0FBC
L238f:  CALL    L1184
        CALL    L06A6
        CALL    L1064
        CALL    L192D
        CALL    PIXELS2LCD
        XOR     A
        LD      (8B10H),A
        XOR     A
        LD      (8AA0H),A
        XOR     A
        LD      (8A9FH),A
        JP      L2233
L23ad:  CP      8DH
        JP      NZ,L23CC
        LD      A,(8C96H)
        AND     A
        JR      Z,L23C2
        XOR     A
        LD      (8C96H),A
        CALL    L0FBC
        JP      L228F
L23c2:  LD      A,(8B10H)
        AND     A
        JP      Z,L228F
        JP      L21CC
L23cc:  CP      8AH
        JR      C,L23D5
        CP      8DH
        JP      C,L1EA2
L23d5:  CP      90H
        JP      NZ,L228F
        JP      L1CA3
L23dd:  CALL    L0FBC
        LD      (89BAH),HL
        LD      HL,PIXELBUFFER
        LD      DE,0A9BDH
        LD      BC,0800H
        LDIR    
        LD      A,(8AFEH)
        OR      20H
        LD      (8AFEH),A
        CALL    L0E98
        CALL    L068D
        LD      HL,MSG19					;03160H Basis toepassingen instellen
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        LD      HL,2556H
        LD      DE,89C6H
        LD      BC,0006H
        LDIR    
L2410:  LD      HL,2419H
        CALL    L049E
        JP      L1AFF
        LD      A,01H
        CALL    L06E5
        JR      C,L2410
        CP      0AH
        JR      C,L247F
        CP      0AH
        JP      Z,L24E9
        CP      20H
        JP      C,L255C
        CP      26H
        JP      C,L24F6
        CP      10H
        JR      C,L243C
        CP      1AH
        JP      C,L255C
L243c:  CP      33H
        JP      C,L2605
        CP      80H
        JP      Z,L263B
        CP      8FH
        JR      Z,L2451
        CP      90H
        JR      NZ,L2410
        JP      L1CA3
L2451:  LD      HL,0BF9BH
        LD      A,(HL)
        INC     HL
        OR      (HL)
        INC     HL
        OR      (HL)
        AND     0FH
        JP      Z,L263B
        LD      A,(8B0EH)
        LD      (0BFA6H),A
        CALL    L0FBC
        LD      A,0FFH
        LD      (8C9CH),A
        CALL    L16CB
        JP      C,L1B89
        LD      A,(8C93H)
        INC     A
        LD      (8C93H),A
        CALL    L0FC4
        JP      L1BDE
L247f:  PUSH    AF
        CALL    L068D
        LD      HL,MSG19				;03160H  Basis toepassingen instellen
        CALL    MSG2BUFFER
        CALL    L1064
        CALL    PIXELS2LCD
        LD      HL,89C9H
        LD      DE,89C8H
        LD      A,(HL)
        LD      (DE),A
        INC     HL
        INC     DE
        LD      A,(HL)
        LD      (DE),A
        POP     AF
        ADD     A,30H
        LD      (HL),A
        INC     HL
        LD      (HL),0FFH
L24a2:  LD      HL,0BF9BH
        LD      A,(89CAH)
        AND     0FH
        CP      0BH
        JR      NZ,L24AF
        XOR     A
L24af:  LD      (HL),A
        INC     HL
        LD      A,(HL)
        AND     70H
        LD      B,A
        LD      A,(89C9H)
        AND     0FH
        CP      0BH
        JR      NZ,L24BF
        XOR     A
L24bf:  OR      B
        LD      (HL),A
        INC     HL
        LD      A,(HL)
        AND     70H
        LD      B,A
        LD      A,(89C8H)
        AND     0FH
        CP      0BH
        JR      NZ,L24D0
        XOR     A
L24d0:  OR      B
        LD      (HL),A
        CALL    L0FBC
        CALL    L252C
        LD      HL,89C6H
        CALL    L0619
        CALL    PIXELS2LCD
        LD      A,0FFH
        LD      (8C9CH),A
        JP      L2410
L24e9:  LD      HL,2556H
        LD      DE,89C6H
        LD      BC,0005H
        LDIR    
        JR      L24A2
L24f6:  CALL    L0FBC
        SUB     20H
        PUSH    AF
        LD      E,A
        LD      D,00H
        LD      B,07H
L2501:  SLA     E
        RL      D
        DJNZ    L2501
        LD      HL,MSG22					;32F3H  Papier lade 1 ## + CALCULATION ##
        ADD     HL,DE
        CALL    MSG2BUFFER
        POP     AF
        LD      E,A
        LD      D,00H
        LD      HL,254DH
        ADD     HL,DE
        LD      A,(HL)
        LD      B,A
        LD      A,(0BFEDH)
        AND     0FH
        OR      B
        LD      (0BFEDH),A
        CALL    PIXELS2LCD
        LD      A,0FFH
        LD      (8C9CH),A
        JP      L2410
L252c:  LD      HL,89C8H
L252f:  LD      A,(HL)
        CP      20H
        JR      Z,L253A
        CP      30H
        JR      NZ,L2542
        LD      (HL),20H
L253a:  INC     HL
        LD      A,(HL)
        CP      30H
        JR      NZ,L2542
        LD      (HL),20H
L2542:  RET     

        LD      B,0FH
        RLCA    
        RRCA    
        EX      AF,AF'
        ADD     HL,BC
        LD      A,(BC)
        RRCA    
        DEC     C
        LD      C,10H
        JR      NZ,02580H
        LD      D,B
        LD      B,B
        NOP     
        JR      NZ,02565H
        NOP     
        ADD     HL,BC
        INC     DE
        JR      NC,0258AH
        JR      NC,0255BH
L255c:  CALL    L0FBC
        SUB     10H
        PUSH    AF
        LD      B,A
        LD      DE,0004H
        LD      HL,L0000
        AND     A
        JR      Z,0256FH
L256c:  ADD     HL,DE
        DJNZ    L256C
L256f:  EX      DE,HL
        LD      HL,25C9H
        ADD     HL,DE
        LD      DE,8A08H
        LD      BC,0004H
        LDIR    
        LD      A,0FFH
        LD      (DE),A
        LD      HL,120BH
        LD      (8A06H),HL
        LD      HL,8A06H
        CALL    L0619
        POP     AF
        PUSH    AF
        SLA     A
        LD      E,A
        LD      D,00H
        LD      HL,25F1H
        ADD     HL,DE
        LD      A,(HL)
        LD      (0BF9FH),A
        INC     HL
        LD      A,(HL)
        LD      (0BFA0H),A
        POP     AF
        LD      E,A
        LD      D,00H
        LD      HL,2543H
        ADD     HL,DE
        LD      A,(HL)
        LD      B,A
        LD      A,(0BFA4H)
        AND     70H
        OR      B
        LD      (0BFA4H),A
        LD      HL,8A08H
        CALL    L252F			;real call
        LD      HL,8A06H
        CALL    L0619
        CALL    PIXELS2LCD
        LD      A,0FFH
        LD      (8C9CH),A
        JP      L2410
        JR      NZ,L2600
        JR      NC,L25F2
        JR      NZ,L2605
        INC     (HL)
        DEC     H
        JR      NZ,0260AH
        JR      NC,025FAH
        JR      NZ,0260EH
        JR      C,025FEH
        JR      NZ,02613H
        LD      SP,2025H
        JR      C,02616H
        DEC     H
        LD      SP,3030H
        DEC     H
        LD      SP,3932H
        DEC     H
        LD      SP,3134H
        DEC     H
        LD      (3030H),A
        DEC     H
        NOP     
L25f2:  LD      (4000H),A
        NOP     
        LD      B,(HL)
        NOP     
        LD      C,(HL)
        NOP     
L25fa:  LD      D,C
        NOP     
        LD      D,(HL)
        NOP     
L25fe:  LD      H,H
        DEC     E
L2600:  LD      H,H
        ADD     HL,HL
        LD      H,H
        LD      H,H
        LD      H,H
L2605:  CALL    L0FBC
        SUB     30H
L260a:  PUSH    AF
        LD      E,A
        LD      D,00H
L260e:  LD      B,07H
L2610:  SLA     E
        RL      D
        DJNZ    L2610
L2616:  LD      HL,MSG28					;35F3H  Aflevering stapels ## + CALCULATION ##
        ADD     HL,DE
        CALL    MSG2BUFFER
        POP     AF
        LD      E,A
        LD      D,00H
        LD      HL,2553H
        ADD     HL,DE
        LD      A,(HL)
        LD      B,A
        LD      A,(0BF9DH)
        AND     4FH
        OR      B
        LD      (0BF9DH),A
        CALL    PIXELS2LCD
        LD      A,0FFH
        LD      (8C9CH),A
        JP      L2410
L263b:  LD      HL,0BF9BH
        LD      A,(HL)
        INC     HL
        OR      (HL)
        INC     HL
        OR      (HL)
        AND     0FH
        JR      NZ,L2653
        LD      HL,MSG20						;31E0H getal tussen 1 en 999 selecteren
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        JP      L2410
L2653:  CALL    L0FBC
        LD      HL,0A9BDH
        LD      DE,PIXELBUFFER
        LD      BC,0800H
        LDIR    
        CALL    PIXELS2LCD
        LD      A,(8AFEH)
        AND     0DFH
        LD      (8AFEH),A
        CALL    L0E98
        LD      HL,(89BAH)
        JP      (HL)
L2673:  CALL    L0FBC
        LD      (89BAH),HL
        LD      HL,PIXELBUFFER
        LD      DE,0A9BDH
        LD      BC,0800H
        LDIR    
        LD      A,(8AFDH)
        OR      02H
        LD      (8AFDH),A
        CALL    L0E98
L268f:  CALL    L068D
        LD      HL,MSG14						;2FC4H   Hoeken aangeven met selecteerpen
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        XOR     A
        LD      (8A88H),A
        LD      HL,8A46H
        LD      (8A86H),HL
        LD      HL,L0000
        LD      (8A89H),HL
        LD      (8A8BH),HL
        LD      A,(0BFA4H)
        AND     70H
        OR      01H
        LD      (0BFA4H),A
        LD      A,64H
        LD      (0BFA0H),A
        XOR     A
        LD      (0BF9FH),A
L26c1:  LD      HL,26CAH
        CALL    L049E
        JP      L1AFF
        LD      A,00H
        CALL    L06E5
        JR      C,L270C
        CP      81H
        JR      NZ,L26DB
        CALL    L0FBC
        JP      L2934
L26db:  CP      8EH
        JR      Z,L26EB
        CP      8FH
        JP      Z,L2451
        CP      90H
        JR      NZ,L26C1
        JP      L1CA3
L26eb:  LD      A,(8A88H)
        CP      03H
        JR      C,L2702
        LD      A,02H
        LD      (8A88H),A
        LD      HL,(8A86H)
        DEC     HL
        DEC     HL
        LD      (8A86H),HL
        JP      L27CD
L2702:  AND     A
        JP      Z,L268F
        CALL    L0FBC
        JP      L268F
L270c:  CALL    L04EF
        LD      A,(8A88H)
        AND     A
        JR      NZ,L271F
L2715:  LD      (8A89H),BC
        LD      (8A8BH),DE
        JR      L2793
L271f:  CP      02H
        JR      Z,L2715
        LD      A,(8A89H)
        XOR     C
        JR      NZ,L2793
        LD      A,(8A8AH)
        XOR     B
        JR      NZ,L2793
        LD      A,(8A8BH)
        XOR     E
        JR      NZ,L2793
        LD      A,(8A8CH)
        XOR     D
        JR      NZ,L2793
        CALL    L068D
        LD      HL,MSG13					;2F65H Storing gebied wissen
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
L2747:  LD      HL,2750H
        CALL    L049E
        JP      L1AFF
        LD      A,00H
        CALL    L06E5
        JR      C,L2747
        CP      8EH
        JP      Z,L2763
        CP      90H
        JR      NZ,L278C
        JP      L1CA3
L2763:  CALL    L0FBC
        LD      A,(8A88H)
        CP      01H
        JP      Z,L268F
        CALL    L068D
        LD      HL,MSG14					;2FC4H    Hoeken aangeven met selecteerpen
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        LD      A,02H
        LD      (8A88H),A
        LD      HL,(8A86H)
        LD      DE,0FFFCH
        ADD     HL,DE
        LD      (8A86H),HL
        JP      L26C1
L278c:  CP      8FH
        JR      NZ,L2747
        JP      L2451
L2793:  LD      A,(8A88H)
        INC     A
        LD      (8A88H),A
        LD      HL,(8A86H)
        LD      (HL),C
        INC     HL
        LD      (HL),B
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),D
        INC     HL
        LD      (8A86H),HL
        LD      A,(8A88H)
        CP      02H
        JR      NZ,L27D3
        CALL    L068D
        LD      HL,MSG15					;3030H Met selekteerpen hoeken op afdruk aangeven
        CALL    MSG2BUFFER
        CALL    PIXELS2LCD
        XOR     A
        LD      (8A89H),A
        XOR     A
        LD      (8A8AH),A
        XOR     A
        LD      (8A8BH),A
        XOR     A
        LD      (8A8CH),A
        JR      L27D3
L27cd:  CALL    L0FBC
        JP      L26C1
L27d3:  CP      04H
        JP      NZ,L27CD
        LD      HL,(8A46H)
        LD      DE,(8A4AH)
        CALL    L2951
        LD      (8A56H),HL
        LD      HL,(8A4EH)
        LD      DE,(8A52H)
        CALL    L2951
        LD      (8A58H),HL
        LD      HL,(8A48H)
        LD      DE,(8A4CH)
        CALL    L2951
        LD      (8A5AH),HL
        LD      HL,(8A50H)
        LD      DE,(8A54H)
        CALL    L2951
        LD      (8A5CH),HL
        LD      BC,(8A56H)
        LD      A,B
        LD      B,C
        LD      C,A
        LD      D,00H
        CALL    L3A2E
        LD      HL,8A8DH
        CALL    L393B
        LD      BC,(8A58H)
        LD      A,B
        LD      B,C
        LD      C,A
        LD      D,00H
        CALL    L3A2E
        LD      HL,8A8DH
        CALL    L3892
        LD      HL,8A8DH
        CALL    L393B
        LD      BC,(8A5AH)
        LD      A,B
        LD      B,C
        LD      C,A
        LD      D,00H
        CALL    L3A2E
        LD      HL,8A91H
        CALL    L393B
        LD      BC,(8A5CH)
        LD      A,B
        LD      B,C
        LD      C,A
        LD      D,00H
        CALL    L3A2E
        LD      HL,8A91H
        CALL    L3892
        LD      HL,8A8DH
        CALL    L39DD
        JP      M,L2869
        LD      HL,8A8DH
        CALL    L3931
L2869:  LD      HL,1B4EH
        CALL    L3844
        CALL    L09F3
        LD      HL,8C78H
        CALL    L393B
        CALL    L39FD
        CALL    L3A2E
        LD      E,08H
        LD      D,02H
        LD      HL,8A8DH
        CALL    L3B8A
        LD      A,(8A8FH)
        CP      32H
        JP      NC,L28E6
        AND     0FH
        JR      NZ,L289C
        LD      A,(8A90H)
        CP      35H
        JP      C,L28F7
L289c:  LD      HL,8A93H
        LD      (HL),0FFH
        LD      HL,L0000
        LD      A,25H
        LD      (8A92H),A
        LD      (8A8DH),HL
        LD      HL,8A8FH
        CALL    L252F
        CALL    L068D
        LD      HL,MSG18						;3146H  ***% is geselekteerd
        CALL    MSG2BUFFER
        LD      HL,8A8DH
        CALL    L0619
        LD      HL,120BH
        LD      (8A8DH),HL
        LD      HL,8A8DH
        CALL    L0619
        CALL    L06A6
        LD      HL,8C78H
        CALL    L3931
        CALL    L39FD
        LD      A,B
        LD      B,C
        LD      C,A
        LD      A,C
        SUB     64H
        JR      C,L2906
        LD      B,A
        LD      C,64H
        JR      L2906
L28e6:  CALL    L068D
        LD      HL,MSG16								;3096H Groter dan maximum 200%
        CALL    MSG2BUFFER
        CALL    L06A6
        LD      BC,6464H
        JR      L2906
L28f7:  CALL    L068D
        LD      HL,MSG17								;30EFH Percentage op minimum gezet
        CALL    MSG2BUFFER
        CALL    L06A6
        LD      BC,0032H
L2906:  LD      A,B
        LD      (0BF9FH),A
        LD      A,C
        LD      (0BFA0H),A
        LD      A,(0BFA4H)
        AND     70H
        OR      0FH
        LD      (0BFA4H),A
        CALL    L1064
        CALL    PIXELS2LCD
        CALL    L0FBC
        LD      A,0FFH
        LD      (8C9CH),A
        LD      A,01H
        LD      BC,0FA0H
        LD      HL,L2934
        CALL    L02ED
        JP      L1AFF
L2934:  LD      HL,0A9BDH
        LD      DE,PIXELBUFFER
        LD      BC,0800H
        LDIR    
        CALL    PIXELS2LCD
        LD      A,(8AFDH)
        AND     0FDH
        LD      (8AFDH),A
        CALL    L0E98
        LD      HL,(89BAH)
        JP      (HL)
L2951:  PUSH    HL
        AND     A
        SBC     HL,DE
        JR      NC,L295D
        POP     HL
        EX      DE,HL
        AND     A
        SBC     HL,DE
        RET     

L295d:  INC     SP
        INC     SP
        RET     

; 3 DELAY routines. Accumulator & HL saved.
DELAY:  PUSH    AF
        PUSH    HL
        LD      HL,010BH			; short
        JR      DELAY4
DELAY2:  PUSH    AF
        PUSH    HL
        LD      HL,0B80H			; middle
        JR      DELAY4
DELAY3:  PUSH    AF
        PUSH    HL
        LD      HL,7930H			; long
DELAY4:  DEC     HL
        LD      A,L
        OR      H
        JR      NZ,DELAY4
        POP     HL
        POP     AF
        RET     
;=======================  Start of text =======================
;##############################################################;
;#                                                            #;
;#   #   #  #####   ###    ###    ###    ###   #####   ###    #;
;#   ## ##  #      #      #      #   #  #   #  #      #       #;
;#   # # #  #      #      #      #   #  #      #      #       #;
;#   # # #  ####    ###    ###   #####  #      ####    ###    #;
;#   #   #  #          #      #  #   #  #  ##  #          #   #;
;#   #   #  #          #      #  #   #  #   #  #          #   #;
;#   #   #  #####   ###    ###   #   #   ####  #####   ###    #;
;#                                                            #;
;##############################################################;

MSG01	EQU		$
		DEFB	MSG01E-$-1	; length of text as 1 byte			at 02979H
		DEFB	00,00,00	;this assumed part of the text
		DEFB	LF,LF,LF
		DEFM	"   GEHEUGENKAART INSTEKEN --",LF,LF,"   DAARNA MET SELECTIEPEN",LF,LF,"   TOEPASSINGEN SELECTEREN."
MSG01E	DEFB	0FFH;				END OF MESSAGE

MSG02	equ	$		
		DEFB	MSG02E-$-1
		DEFB	00,00,00
		DEFB	"PROGRAMMERING BESTAAT",LF,"REEDS.",LF,"ALLES WISSEN SEL. OM",LF,"PROGRAMMERING TE WIJ-",LF
		DEFB	"ZIGEN, OF PROGRAMM.",LF,"OPSLAAN OM NAAR VOL-",LF,"GENDE PROGRAMMERING",LF,"TE GAAN.",LF
		DEFB	"AANTAL:",LF
		DEFM	"                   999",LF,"VERKLEINEN/VERGROTEN:",LF,"                  100%"
MSG02E	DEFB	0FFH;				END OF MESSAGE 2
		DEFS	04		; skipping 4 bytes 00
		
MSG03	EQU	$
		DEFB	MSG03E-$-1
		DEFB	00,00,00
		DEFB	LF,LF,LF,"   GEHEUGENKAART IS NIET",LF,"   GEREED VOOR GEBRUIK.",LF,LF,"   KAART M.B.V. SPECIALE",LF
		DEFB	"   TOEPASSINGEN FORMATTEREN",LF,"   OF ANDERE KAART GEBRUIKEN."
MSG03E	DEFB	0FFH;				END OF MESSAGE
MSG04	EQU	$
		DEFB	MSG04E-$-1
		DEFB	00,00,00
		DEFB	LF,LF,LF,"    GEHEUGENKAART ONGELDIG.",LF,LF,"    ANDERE KAART GEBRUIKEN."
MSG04E	DEFB	0FFH;				END OF MESSAGE
MSG05	EQU	$
		DEFB	MSG05E-$-1
		DEFB	00,00,00
		DEFB	LF,LF,LF,LF,"  GEHEUGENKAART KAN TOT",LF,"  TIEN PROGRAMMERINGEN BEVATTEN.",LF,LF
		DEFB	"  KAART BEVAT REEDS TIEN",LF,"  PROGRAMMERINGEN.",LF,LF,"  DEZE GEHEUGENKAART M.B.V.",LF
		DEFB	"  EJECT-TOETS VERWIJDEREN."
MSG05E	DEFB	0FFH;				END OF MESSAGE
MSG06	EQU	$
		DEFB	MSG06E-$-1
		DEFB	00,00,00
		DEFB	"E",9AH,"N VAN DE OPLICHTENDE",LF,"TOEPASSINGEN OF",LF,"BASISTOEPASSINGEN",LF,"SELECTEREN."
		DEFB	LF,LF,"DAARNA PROGRAMMERING",LF,"OPSLAAN SELECTEREN."
MSG06E	DEFB	0FFH;				END OF MESSAGE
MSG07	EQU	$
		DEFB	MSG07E-$-1
		DEFB	00,00,00
		DEFB	"BEWERKINGSGEBIED",LF,"AANGEVEN DOOR MET",LF,"SELECTIEPEN LINKER",LF,"BOVEN- EN RECHTER",LF
		DEFB	"BENEDENHOEK TE",LF,"SELECTEREN."
MSG07E	DEFB	0FFH;				END OF MESSAGE
MSG08	EQU	$
		DEFB	MSG08E-$-1
		DEFB	00,00,00
		DEFB	"MET DE SELECTIEPEN",LF,"ALLE HOEKEN VAN DE",LF,"TE BEWERKEN VEELHOEK",LF,"AANGEVEN.",LF,LF
		DEFB	"DAARNA PROGRAMMERING",LF,"OPSLAAN SELECTEREN."
MSG08E	DEFB	0FFH;				END OF MESSAGE
MSG09	EQU	$
		DEFB	MSG09E-$-1
		DEFB	00,00,00
		DEFB	"OM EEN TE BEWERKEN",LF,"LIJN OP HET ORIGINEEL",LF,"AAN TE GEVEN, M.B.V DE",LF
		DEFB	"SELECTIEPEN DE BEIDE",LF,"UITEINDEN AANSTIPPEN."
MSG09E	DEFB	0FFH;				END OF MESSAGE
MSG10	EQU	$
		DEFB	MSG10E-$-1
		DEFB	00,00,00
		DEFB	"GEBIED IS BEPAALD.",LF,"DESGEWENST EEN VOLGEND",LF,"GEBIED AANGEVEN.",LF,LF
		DEFB	"DAARNA BASISTOE-",LF,"PASSINGEN OF PROGRAMM.",LF,"OPSLAAN SELECTEREN."
MSG10E	DEFB	0FFH;				END OF MESSAGE
MSG11	EQU	$
		DEFB	MSG11E-$-1
		DEFB	00,00,00
		DEFB	"MAX. AANTAL GEBIEDEN",LF,"IS BIJNA BEREIKT.",LF,"ALLEEN VIERKANT EN",LF
		DEFB	"LIJN ZIJN BESCHIKBAAR.",LF,LF,"BASISTOEPASSINGEN OF",LF,"PROGRAMMERING OPSLAAN",LF
		DEFB	"SELECTEREN."
MSG11E	DEFB	0FFH;				END OF MESSAGE
MSG12	EQU	$
		DEFB	MSG12E-$-1
		DEFB	00,00,00
		DEFB	"MAX. AANTAL GEBIEDEN",LF,"IS BEREIKT VOOR DEZE",LF,"PROGRAMMERING.",LF,LF
		DEFB	"BASISTOEPASSINGEN OF",LF,"PROGRAMMERING OPSLAAN",LF,"SELECTEREN."
MSG12E	DEFB	0FFH;				END OF MESSAGE
MSG13	EQU	$
		DEFB	MSG13E-$-1
		DEFB	00,00,00
		DEFB	"STORING",LF,LF,"GEBIED WISSEN SELECT.",LF,LF,"GEMAAKTE SELECTIES",LF
		DEFB	"CONTROLEREN EN GEBIED",LF,"OPNIEUW AANGEVEN."
MSG13E	DEFB	0FFH;				END OF MESSAGE
MSG14	EQU	$
		DEFB	MSG14E-$-1
		DEFB	00,00,00
		DEFB	"MET SELECTIEPEN",LF,"LINKER BOVEN- EN",LF,"RECHTER BENEDENHOEK",LF
		DEFB	"VAN TE VERKLEINEN OF",LF,"TE VERGROTEN GEBIED",LF,"AANGEVEN."
MSG14E	DEFB	0FFH;				END OF MESSAGE
MSG15	EQU	$
		DEFB	MSG15E-$-1
		DEFB	00,00,00
		DEFB	"MET SELECTIEPEN",LF,"LINKER BOVEN- EN",LF,"RECHTER BENEDENHOEK",LF
		DEFB	"VAN OP AFDRUK GEWENST",LF,"BEELDFORMAAT AANGEVEN."
MSG15E	DEFB	0FFH;				END OF MESSAGE
MSG16	EQU	$
		DEFB	MSG16E-$-1
		DEFB	00,00,00
		DEFB	"HET GEWENSTE PERCEN-",LF,"TAGE OVERSCHRIJDT HET",LF,"MAXIMUM VAN 200%.",LF,LF
		DEFB	"INSTELLING IS NU 200%."
MSG16E	DEFB	0FFH;				END OF MESSAGE
MSG17	EQU	$
		DEFB	MSG17E-$-1
		DEFB	00,00,00
		DEFB	"HET GEWENSTE PERCEN-",LF,"TAGE LIGT BENEDEN HET",LF,"MINIMUM VAN 50%.",LF,LF
		DEFB	"INSTELLING IS NU 50%."
MSG17E	DEFB	0FFH;				END OF MESSAGE
MSG18	EQU	$
		DEFB	MSG18E-$-1
		DEFB	00,00,00
		DEFB	"***% IS GESELECTEERD."
MSG18E	DEFB	0FFH;				END OF MESSAGE
MSG19	EQU	$
		DEFB	MSG19E-$-1
		DEFB	00,00,00
		DEFB	"DE BASISTOEPASSINGEN",LF,"INSTELLEN.",LF,LF,"DAARNA PROGRAMMERING",LF
		DEFB	"OPSLAAN SELECTEREN,",LF,"OF BASISTOEPASSINGEN",LF,"OM INSTELLINGEN TE",LF,"WIJZIGEN."
MSG19E	DEFB	0FFH;				END OF MESSAGE
MSG20	EQU	$
		DEFB	MSG20E-$-1
		DEFB	00,00,00
		DEFB	"                      ",LF,"NUL IS  ONGELDIG.     ",LF,"                      ",LF
		DEFB	"AANTAL TUSSEN         ",LF,"1-999 SELECTEREN.     ",LF,"                      ",LF
		DEFB	"                      ",LF,"                      "
MSG20E	DEFB	0FFH;				END OF MESSAGE
MSG21	EQU	$
		DEFB	MSG21E-$-1
		DEFB	00,00,00
		DEFB	LF,"STORING BEWERKINGSBLAD",LF,LF,LF,"GETRAINDE OPERATEUR OF",LF,"RX TECHNISCHE DIENST",LF
		DEFB	"WAARSCHUWEN."
MSG21E	DEFB	0FFH;				END OF MESSAGE

MSG22	EQU	$
		DEFB	MSG22E-$-1
		DEFB	00,0CH,00
		DEFB	"PAPIER:         LADE 1",LF,"                      "
MSG22E	DEFB	0FFH		;END OF MESSAGE
		DEFS	4EH			; Skip 50H bytes

MSG23	EQU	$
		DEFB	MSG23E-$-1
		DEFB	00,0CH,00
		DEFB	"PAPIER:         LADE 2",LF,"                      "
MSG23E	DEFB	0FFH		;END OF MESSAGE
		DEFS	4EH			; Skip 50H bytes
MSG24	EQU	$
		DEFB	MSG24E-$-1
		DEFB	00,0CH,00
		DEFB	"PAPIER:         LADE 3",LF,"                      "
MSG24E	DEFB	0FFH		;END OF MESSAGE
		DEFS	4EH			; Skip 50H bytes

MSG25	EQU	$
		DEFB	MSG25E-$-1
		DEFB	00,0CH,00
		DEFB	"PAPIER:         LADE 5",LF,"                      "
MSG25E	DEFB	0FFH		;END OF MESSAGE
		DEFS	4EH			; Skip 50H bytes

MSG26	EQU	$
		DEFB	MSG26E-$-1
		DEFB	00,0CH,00
		DEFB	"PAPIER:         LADE 4",LF,"                      "
MSG26E	DEFB	0FFH		;END OF MESSAGE
		DEFS	4EH			; Skip 50H bytes
MSG27	EQU	$
		DEFB	MSG27E-$-1
		DEFB	00,0CH,00
		DEFB	"PAPIER:           AUTO",LF,"                      "
MSG27E	DEFB	0FFH		;END OF MESSAGE
		DEFS	4EH			; Skip 50H bytes
MSG28	EQU	$
		DEFB	MSG28E-$-1
		DEFB	00,0EH,00
		DEFB	"AFLEVERING:    STAPELS",LF,"                      "
MSG28E	DEFB	0FFH		;END OF MESSAGE
		DEFS	4EH			; Skip 50H bytes
MSG29	EQU	$
		DEFB	MSG29E-$-1
		DEFB	00,0EH,00
		DEFB	"AFLEVERING:       SETS",LF,"                      "
MSG29E	DEFB	0FFH		;END OF MESSAGE
		DEFS	4EH			; Skip 50H bytes
MSG30	EQU	$
		DEFB	MSG30E-$-1
		DEFB	00,0EH,00
		DEFB	"AFLEV.:  BOV.OPVANGBAK",LF,"                      "
MSG30E	DEFB	0FFH		;END OF MESSAGE
		DEFS	4EH			; Skip 50H bytes
MSG31	EQU	$
		DEFB	MSG31E-$-1
		DEFB	00,0AH,00
		DEFB	"VERKL./VERGR.:    AUTO",LF,"                      "
MSG31E	DEFB	0FFH		;END OF MESSAGE

MSG32	EQU	$
		DEFB	MSG32E-$-1
		DEFB	00,00,16H
		DEFB	"  OPDR.   "
MSG32E	DEFB	0FFH		;END OF MESSAGE

;========================== end of text ======================		
		
L37b4:  JP      L37D8
        JP      L3838
L37ba:  JP      L3844
        JP      L3892
L37c0:  JP      L3931
        JP      L393B
        JP      L3972
        JP      L39DD
        JP      L39F6
        JP      L39FD
        JP      L3A2A
        JP      L3A2E
L37d8:  CALL    L395B
        EX      DE,HL
        JP      Z,L382B
        INC     HL
        LD      A,(HL)
        DEC     HL
        AND     A
        JP      Z,L3834
        EX      DE,HL
        LD      A,(DE)
        SUB     (HL)
        JP      Z,L380A
        PUSH    AF
        JP      P,L37F2
        CPL     
        INC     A
L37f2:  LD      C,A
        CP      18H
        JP      P,L3826
        POP     AF
        PUSH    AF
        JP      P,L37FE
        EX      DE,HL
L37fe:  CALL    L399D
        DEC     C
        JP      NZ,L37FE
        POP     AF
        JP      P,L380A
        EX      DE,HL
L380a:  CALL    L399D
        EX      DE,HL
        CALL    L399D
        ADD     A,40H
        INC     HL
        INC     HL
        INC     HL
        POP     DE
        POP     BC
        LD      A,B
        ADC     A,(HL)
        LD      (HL),A
        DEC     HL
        LD      A,C
        ADC     A,(HL)
        LD      (HL),A
        DEC     HL
        LD      A,D
        ADC     A,(HL)
        LD      (HL),A
        JP      L38FB
L3826:  POP     AF
        EX      DE,HL
        JP      M,L3834
L382b:  POP     DE
        POP     BC
        LD      HL,803FH
        LD      A,(HL)
        DEC     HL
        AND     A
        RET     

L3834:  CALL    L394D
        RET     

L3838:  CALL    L395B
        CALL    L3975
        CALL    L37D8
        POP     DE
        POP     BC
        RET     

L3844:  CALL    L395B
        LD      A,(DE)
        ADD     A,C
        INC     A
        LD      (DE),A
        CALL    L3986
        POP     HL
        POP     DE
        LD      A,L
        LD      L,E
        LD      BC,L0000
        LD      E,C
        PUSH    HL
        PUSH    DE
        PUSH    BC
        LD      B,A
        LD      C,18H
L385c:  CALL    L39C8
        CALL    L39B3
        JP      NC,L387A
        CALL    L39C8
        AND     A
        CALL    L39D1
        CALL    L39D1
        CALL    L39D1
        JP      NC,L387A
L3875:  INC     (HL)
        INC     HL
        JP      Z,L3875
L387a:  DEC     C
        JP      NZ,L385C
        LD      HL,803FH
        POP     DE
        POP     DE
        LD      C,D
        POP     DE
        LD      (HL),D
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),C
        LD      A,B
        AND     A
        CALL    NZ,L3972
        JP      L38FB
L3892:  LD      DE,803FH
        INC     HL
        LD      A,(DE)
        AND     A
        RET     Z

        LD      A,(HL)
        AND     A
        SCF     
        DEC     HL
        RET     Z

        CALL    L395B
        LD      A,(DE)
        SUB     C
        INC     A
        LD      (DE),A
        CALL    L3986
        CALL    L3975
        POP     DE
        POP     BC
        LD      A,E
        LD      E,D
        LD      H,C
        LD      L,B
        LD      BC,L0000
        LD      D,C
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      B,A
        LD      C,17H
L38bb:  CALL    L39C8
        LD      A,(DE)
        ADD     A,(HL)
        DEC     DE
        INC     HL
        LD      A,(DE)
        ADC     A,(HL)
        DEC     DE
        INC     HL
        LD      A,(DE)
        ADC     A,(HL)
        INC     HL
        JP      NC,L38D8
        CALL    L39C8
        CALL    L39D7
        CALL    L39D7
        CALL    L39D7
L38d8:  CALL    L39BD
        LD      HL,8041H
        LD      A,(HL)
        RLA     
        LD      (HL),A
        DEC     HL
        LD      A,(HL)
        RLA     
        LD      (HL),A
        DEC     HL
        LD      A,(HL)
        RLA     
        LD      (HL),A
        DEC     C
        JP      NZ,L38BB
        POP     DE
        POP     DE
        LD      C,D
        POP     DE
        LD      (HL),D
        INC     HL
        LD      (HL),E
        INC     HL
        LD      (HL),C
        LD      A,B
        AND     A
        CALL    NZ,L3972
L38fb:  LD      HL,803EH
L38fe:  PUSH    HL
        CALL    L395B
        PUSH    AF
        CALL    M,L3975
        POP     AF
        POP     DE
        POP     BC
        PUSH    AF
        LD      A,B
        OR      C
        OR      D
        JP      Z,L391D
L3910:  LD      A,D
        RLA     
        AND     A
        JP      M,L391E
        CALL    L3A87
        DEC     E
        JP      L3910
L391d:  LD      E,A
L391e:  POP     AF
        POP     HL
        PUSH    HL
        PUSH    AF
        PUSH    BC
        PUSH    DE
        CALL    L394D
        POP     AF
        POP     HL
        CALL    M,L3975
        INC     HL
        LD      A,(HL)
        DEC     HL
        AND     A
        RET     

L3931:  NOP     
        CALL    L395B
        EX      DE,HL
        CALL    L394D
        NOP     
        RET     

L393b:  NOP     
        PUSH    HL
        LD      HL,803EH
        CALL    L395B
        POP     DE
        POP     BC
        POP     HL
        PUSH    BC
        PUSH    DE
        CALL    L394D
        NOP     
        RET     

L394d:  POP     DE
        POP     BC
        LD      (HL),C
        INC     HL
        LD      (HL),B
        INC     HL
        LD      A,B
        AND     A
        POP     BC
        LD      (HL),C
        INC     HL
        LD      (HL),B
        EX      DE,HL
        JP      (HL)
L395b:  LD      E,(HL)
        INC     HL
        LD      D,(HL)
        INC     HL
        LD      C,(HL)
        INC     HL
        LD      B,(HL)
        LD      A,D
        AND     A
        POP     HL
        PUSH    BC
        PUSH    DE
        POP     BC
        PUSH    BC
        PUSH    HL
        LD      HL,0002H
        ADD     HL,SP
        LD      DE,803EH
        RET     

L3972:  LD      HL,803EH
L3975:  INC     HL
        INC     HL
        INC     HL
        SCF     
        CALL    L397F
        CALL    L397F
L397f:  LD      A,(HL)
        CPL     
        ADC     A,00H
        LD      (HL),A
        DEC     HL
        RET     

L3986:  LD      (HL),00H
        LD      A,B
        AND     A
        JP      P,L3991
        CALL    L3975
        INC     (HL)
L3991:  INC     DE
        LD      A,(DE)
        DEC     DE
        AND     A
        RET     P

        EX      DE,HL
        CALL    L3975
        EX      DE,HL
        DEC     (HL)
        RET     

L399d:  INC     (HL)
        INC     HL
        LD      A,(HL)
        RLA     
        LD      A,(HL)
        RRA     
        LD      (HL),A
        INC     HL
        LD      A,(HL)
        RRA     
        LD      (HL),A
        INC     HL
        LD      A,(HL)
        RRA     
        LD      (HL),A
        LD      A,B
        RRA     
        LD      B,A
        DEC     HL
        DEC     HL
        DEC     HL
        RET     

L39b3:  AND     A
        CALL    L39C3
        CALL    L39C3
        CALL    L39C3
L39bd:  CALL    L39C3
        CALL    L39C3
L39c3:  LD      A,(HL)
        RLA     
        LD      (HL),A
        INC     HL
        RET     

L39c8:  LD      HL,0002H
        ADD     HL,SP
        LD      DE,8041H
        AND     A
        RET     

L39d1:  LD      A,(DE)
        DEC     DE
        ADC     A,(HL)
        LD      (HL),A
        INC     HL
        RET     

L39d7:  LD      A,(DE)
        ADC     A,(HL)
        LD      (DE),A
        DEC     DE
        INC     HL
        RET     

L39dd:  PUSH    HL
        PUSH    HL
        PUSH    HL
        LD      HL,0002H
        ADD     HL,SP
        PUSH    HL
        CALL    L393B
        POP     HL
        EX      (SP),HL
        CALL    L3838
        POP     HL
        PUSH    AF
        CALL    L3931
        POP     AF
        POP     DE
        POP     DE
        RET     

L39f6:  CALL    L39FD
        RET     C

        JP      L3A2E
L39fd:  LD      HL,803EH
        LD      BC,L0000
        PUSH    BC
        POP     DE
        LD      A,(HL)
        AND     A
        RET     M

        RET     Z

        SUB     18H
        SCF     
        RET     P

        PUSH    AF
        CALL    L395B
        POP     DE
        POP     BC
        POP     AF
        LD      E,A
L3a15:  AND     A
        INC     E
        RET     Z

        LD      A,D
        RLA     
        CALL    L3A20
        JP      L3A15
L3a20:  LD      A,D
        RRA     
        LD      D,A
        LD      A,C
        RRA     
        LD      C,A
        LD      A,B
        RRA     
        LD      B,A
        RET     

L3a2a:  CALL    L3A3B
        RET     C

L3a2e:  LD      E,17H
        PUSH    BC
        PUSH    DE
        LD      HL,803EH
        CALL    L394D
        JP      L38FB
L3a3b:  PUSH    BC
        PUSH    DE
        LD      BC,L0000
        LD      D,B
        POP     HL
        LD      A,H
        AND     A
        CALL    L3A4F
        POP     HL
        PUSH    HL
        LD      A,L
        CALL    NC,L3A4F
        POP     HL
        LD      A,H
L3a4f:  CALL    L3A52
L3a52:  RET     C

        RLCA    
        RLCA    
        RLCA    
        RLCA    
        AND     A
        PUSH    AF
        AND     0FH
        CP      0AH
        JP      P,L3A84
        LD      E,A
        PUSH    DE
        PUSH    BC
        CALL    L3A87
        CALL    L3A87
        POP     HL
        LD      A,H
        ADD     A,B
        LD      B,A
        LD      A,L
        ADC     A,C
        LD      C,A
        POP     HL
        LD      A,H
        ADC     A,D
        LD      D,A
        CALL    L3A87
        LD      L,00H
        LD      A,B
        ADD     A,E
        LD      B,A
        LD      A,C
        ADC     A,L
        LD      C,A
        LD      A,D
        ADC     A,L
        LD      D,A
        POP     AF
        RET     

L3a84:  POP     AF
        SCF     
        RET     

L3a87:  AND     A
        LD      A,B
        RLA     
        LD      B,A
        LD      A,C
        RLA     
        LD      C,A
        LD      A,D
        RLA     
        LD      D,A
        RET     

L3a92:  PUSH    HL
        LD      HL,3B7CH
        CALL    L3931
        POP     HL
        LD      BC,L0000
        PUSH    BC
L3a9e:  PUSH    HL
L3a9f:  POP     HL
        LD      A,(HL)
        INC     HL
        PUSH    HL
        LD      DE,4004H
        CP      20H
        JP      Z,L3B3B
        CP      2BH
        JP      Z,L3AFD
        LD      D,0C0H
        CP      2DH
        JP      Z,L3B09
        LD      D,10H
        CP      2EH
        JP      Z,L3B13
        LD      D,E
        CP      45H
        JP      Z,L3B1C
        SUB     30H
        JP      M,L3B41
        CP      0AH
        JP      P,L3B41
        LD      D,A
        LD      A,B
        OR      20H
        LD      B,A
        AND     E
        JP      NZ,L3B28
        PUSH    BC
        PUSH    DE
        LD      HL,3B80H
        CALL    L3844
        POP     BC
        LD      DE,0017H
        LD      C,D
        PUSH    BC
        PUSH    DE
        LD      HL,L0000
        ADD     HL,SP
        CALL    L38FE
        CALL    L37D8
        POP     BC
        POP     BC
        POP     BC
        LD      A,B
        AND     10H
        JP      Z,L3A9F
        INC     C
        JP      L3A9F
L3afd:  LD      A,B
        AND     70H
        JP      NZ,L3B37
L3b03:  LD      A,B
        OR      D
L3b05:  LD      B,A
        JP      L3A9F
L3b09:  LD      A,B
        AND     E
        JP      Z,L3AFD
        LD      D,48H
        JP      L3AFD
L3b13:  LD      A,B
        AND     14H
        JP      NZ,L3B37
        JP      L3B03
L3b1c:  LD      A,B
        AND     E
        JP      NZ,L3B37
        LD      A,B
        OR      E
        AND     84H
        JP      L3B05
L3b28:  POP     HL
        LD      A,D
        POP     DE
        LD      D,A
        LD      A,E
        RLA     
        RLA     
        ADD     A,E
        RLA     
        ADD     A,D
        LD      E,A
        PUSH    DE
        JP      L3A9E
L3b37:  INC     B
        JP      L3B41
L3b3b:  LD      A,B
        AND     30H
        JP      Z,L3A9F
L3b41:  POP     HL
        POP     DE
        PUSH    HL
        LD      A,B
        AND     08H
        JP      Z,L3B4D
        XOR     A
        SUB     E
        LD      E,A
L3b4d:  LD      A,E
        SUB     C
        LD      C,A
        JP      P,L3B6D
L3b53:  PUSH    BC
        LD      HL,3B80H
        CALL    L3892
        POP     BC
        INC     C
        JP      NZ,L3B53
L3b5f:  LD      A,B
        AND     A
        CALL    M,L3972
        LD      HL,803FH
        LD      A,(HL)
        AND     A
        LD      A,B
        RRA     
        POP     HL
        RET     

L3b6d:  JP      Z,L3B5F
        PUSH    BC
        LD      HL,3B80H
        CALL    L3844
        POP     BC
        DEC     C
        JP      L3B6D
        NOP     
        NOP     
        NOP     
        NOP     
        INC     B
        LD      D,B
        NOP     
        NOP     
        LD      BC,0100H
        JP      L3B8D
L3b8a:  LD      BC,L0000
L3b8d:  PUSH    HL
        PUSH    DE
        PUSH    BC
L3b90:  DEC     E
        JP      M,L3B9A
        LD      (HL),2AH
        INC     HL
        JP      L3B90
L3b9a:  LD      A,(803FH)
        AND     A
        JP      Z,L3BF1
        JP      P,L3BAD
        CALL    L3972
        POP     BC
        LD      A,B
        OR      80H
        LD      B,A
        PUSH    BC
L3bad:  POP     BC
        POP     DE
        PUSH    BC
        LD      A,B
        RRA     
        CALL    NC,L3C86
        POP     BC
        PUSH    DE
        PUSH    BC
L3bb8:  LD      HL,3B80H
        CALL    L39DD
        JP      P,L3BD6
L3bc1:  LD      HL,3D09H
        CALL    L39DD
        JP      P,L3BDC
        LD      HL,3B80H
        CALL    L3844
        POP     BC
        DEC     C
        PUSH    BC
        JP      L3BC1
L3bd6:  CALL    L3CB1
        JP      L3BB8
L3bdc:  POP     BC
        INC     C
        POP     DE
        PUSH    BC
        LD      A,B
        RRA     
        CALL    C,L3C86
        POP     BC
        PUSH    DE
        PUSH    BC
        LD      HL,3B80H
        CALL    L39DD
        CALL    P,L3CB1
L3bf1:  POP     BC
        POP     DE
        POP     HL
        LD      A,B
        RRA     
        LD      A,E
        JP      C,L3C4A
        SUB     D
        SUB     02H
        PUSH    AF
        LD      A,D
        AND     A
        JP      NZ,L3C06
        POP     AF
        INC     A
        PUSH    AF
L3c06:  XOR     A
        SUB     C
        JP      P,L3C22
        POP     AF
        SUB     C
        JP      M,L3C45
        LD      E,A
        CALL    L3CBC
        LD      E,C
        CALL    L3CCB
L3c18:  LD      A,D
        AND     A
        RET     Z

        LD      (HL),2EH
        INC     HL
L3c1e:  LD      E,D
        JP      L3CCB
L3c22:  POP     AF
        DEC     A
        JP      M,L3C45
        LD      E,A
        CALL    L3CBC
        LD      (HL),30H
        INC     HL
        LD      A,C
        AND     A
        JP      Z,L3C18
        LD      A,D
        AND     A
        RET     Z

        LD      (HL),2EH
        INC     HL
L3c39:  DEC     D
        RET     M

        LD      (HL),30H
        INC     HL
        INC     C
        JP      P,L3C1E
        JP      L3C39
L3c45:  LD      D,00H
        ADD     HL,DE
        SCF     
        RET     

L3c4a:  SUB     D
        SUB     07H
        JP      M,L3C45
        LD      E,A
        CALL    L3CBC
        LD      (HL),30H
        INC     HL
        LD      (HL),2EH
        INC     HL
        LD      E,D
        CALL    L3CCB
        LD      (HL),45H
        INC     HL
        LD      (HL),2BH
        LD      A,C
        AND     A
        JP      P,L3C6D
        LD      (HL),2DH
        XOR     A
        SUB     C
        LD      C,A
L3c6d:  INC     HL
        LD      DE,000AH
L3c71:  LD      A,C
        SUB     E
        JP      M,L3C7B
        LD      C,A
        INC     D
        JP      L3C71
L3c7b:  LD      E,30H
        LD      A,D
        ADD     A,E
        LD      (HL),A
        INC     HL
        LD      A,C
        ADD     A,E
        LD      (HL),A
        INC     HL
        RET     

L3c86:  PUSH    HL
        PUSH    HL
        LD      HL,0000H
        ADD     HL,SP
        PUSH    HL
        PUSH    DE
        CALL    L393B
        LD      HL,3D05H	;point to FONT table?
        CALL    L3931
        POP     DE
        PUSH    DE
L3c99:  DEC     D
        JP      M,L3CA8
        PUSH    DE
        LD      HL,3B80H
        CALL    L3892
        POP     DE
        JP      L3C99
L3ca8:  POP     HL
        EX      (SP),HL
        CALL    L37D8
        POP     DE
        POP     HL
        POP     HL
        RET     

L3cb1:  LD      HL,3B80H
        CALL    L3892
        POP     HL
        POP     BC
        INC     C
        PUSH    BC
        JP      (HL)
L3cbc:  LD      (HL),20H
        INC     HL
        DEC     E
        JP      P,L3CBC
        LD      A,B
        AND     A
        RET     P

        DEC     HL
        LD      (HL),2DH
        INC     HL
        RET     

L3ccb:  DEC     E
        RET     M

        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      B,00H
        LD      HL,803EH
        LD      A,(HL)
        CPL     
        LD      D,A
        PUSH    DE
        INC     HL
        LD      A,(HL)
L3cdb:  RLA     
        PUSH    AF
        LD      A,B
        RLA     
        LD      B,A
        POP     AF
        INC     D
        JP      M,L3CDB
        POP     DE
L3ce6:  AND     A
        RRA     
        INC     D
        JP      M,L3CE6
        LD      (HL),A
        LD      A,B
        ADD     A,30H
        PUSH    AF
        CALL    L38FB
        POP     AF
        POP     HL
        LD      (HL),A
        INC     HL
        PUSH    HL
        LD      HL,3B80H
        CALL    L3844
        POP     HL
        POP     DE
        POP     BC
        JP      L3CCB

;################################################################
;#	 															#
;#				 	#####  ###	#	# #####						#
;#				 	#	  #   #	#	#	#						#
;#				 	#	  #   #	##	#	#						#
;#				 	####  #   #	# #	#	#						#
;#				 	#	  #   #	#  ##	#						#
;#				 	#	  #   #	#	#	#						#
;#				 	#	   ###	#	#	#						#
;#	 															# 
;################################################################
;#	 															#
;#   Bitmap for ascii characters 32 ~ 161	(20H ~ A1H)			#
;#																#
;#   8 pixels heigh (top line is empty							#
;#   5 pixels wide (with 1 pixel extra for character spacing)	#
;#																#
;################################################################
  		
L3D05:			; Used for ???
			DEFB	00,40H,00H,00H,01H,40H,00H,00H
		
; at 3D0DH
PxChr20H	DEFB	00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H		;SPACE
PxChr21H	DEFB	00H, 04H, 04H, 04H, 04H, 04H, 00H, 04H
PxChr22H	DEFB	00H, 0AH, 0AH, 0AH, 00H, 00H, 00H, 00H
PxChr23H	DEFB	00H, 0AH, 0AH, 1FH, 0AH, 1FH, 0AH, 0AH
PxChr24H	DEFB	00H, 04H, 1FH, 05H, 0EH, 14H, 0FH, 04H
PxChr25H	DEFB	00H, 03H, 13H, 08H, 04H, 02H, 19H, 18H
PxChr26H	DEFB	00H, 06H, 09H, 05H, 02H, 15H, 09H, 16H
PxChr27H	DEFB	00H, 06H, 04H, 03H, 00H, 00H, 00H, 00H
PxChr28H	DEFB	00H, 08H, 04H, 02H, 02H, 02H, 04H, 08H
PxChr29H	DEFB	00H, 02H, 04H, 08H, 08H, 08H, 04H, 02H
PxChr2AH	DEFB	00H, 00H, 00H, 0EH, 0EH, 0EH, 00H, 00H
PxChr2BH	DEFB	00H, 00H, 04H, 04H, 1FH, 04H, 04H, 00H
PxChr2CH	DEFB	00H, 00H, 00H, 00H, 00H, 06H, 04H, 03H
PxChr2DH	DEFB	00H, 00H, 00H, 00H, 1FH, 00H, 00H, 00H
PxChr2EH	DEFB	00H, 00H, 00H, 00H, 00H, 00H, 06H, 06H
PxChr2FH	DEFB	00H, 00H, 10H, 08H, 04H, 02H, 01H, 00H
PxChr30H	DEFB	00H, 0EH, 11H, 19H, 15H, 13H, 11H, 0EH
PxChr31H	DEFB	00H, 04H, 06H, 04H, 04H, 04H, 04H, 0EH
PxChr32H	DEFB	00H, 0EH, 11H, 10H, 08H, 04H, 02H, 1FH
PxChr33H	DEFB	00H, 1FH, 08H, 04H, 08H, 10H, 11H, 0EH
PxChr34H	DEFB	00H, 08H, 0CH, 0AH, 09H, 1FH, 08H, 08H
PxChr35H	DEFB	00H, 1FH, 01H, 0FH, 10H, 10H, 11H, 0EH
PxChr36H	DEFB	00H, 0CH, 02H, 01H, 0FH, 11H, 11H, 0EH
PxChr37H	DEFB	00H, 1FH, 10H, 08H, 04H, 02H, 02H, 02H
PxChr38H	DEFB	00H, 0EH, 11H, 11H, 0EH, 11H, 11H, 0EH
PxChr39H	DEFB	00H, 0EH, 11H, 11H, 1EH, 10H, 08H, 06H
PxChr3AH	DEFB	00H, 00H, 06H, 06H, 00H, 06H, 06H, 00H
PxChr3BH	DEFB	00H, 00H, 06H, 06H, 00H, 06H, 06H, 04H
PxChr3CH	DEFB	00H, 08H, 04H, 02H, 01H, 02H, 04H, 08H
PxChr3DH	DEFB	00H, 00H, 00H, 1FH, 00H, 1FH, 00H, 00H
PxChr3EH	DEFB	00H, 01H, 02H, 04H, 08H, 04H, 02H, 01H
PxChr3FH	DEFB	00H, 0EH, 11H, 10H, 08H, 04H, 00H, 04H
PxChr40H	DEFB	00H, 00H, 00H, 00H, 00H, 00H, 00H, 00H
PxChr41H	DEFB	00H, 0EH, 11H, 11H, 11H, 1FH, 11H, 11H
PxChr42H	DEFB	00H, 0FH, 11H, 11H, 0FH, 11H, 11H, 0FH
PxChr43H	DEFB	00H, 0EH, 11H, 01H, 01H, 01H, 11H, 0EH
PxChr44H	DEFB	00H, 07H, 09H, 11H, 11H, 11H, 09H, 07H
PxChr45H	DEFB	00H, 1FH, 01H, 01H, 0FH, 01H, 01H, 1FH
PxChr46H	DEFB	00H, 1FH, 01H, 01H, 0FH, 01H, 01H, 01H
PxChr47H	DEFB	00H, 0EH, 11H, 01H, 1DH, 11H, 11H, 1EH
PxChr48H	DEFB	00H, 11H, 11H, 11H, 1FH, 11H, 11H, 11H
PxChr49H	DEFB	00H, 0EH, 04H, 04H, 04H, 04H, 04H, 0EH
PxChr4AH	DEFB	00H, 1CH, 08H, 08H, 08H, 08H, 09H, 06H
PxChr4BH	DEFB	00H, 11H, 09H, 05H, 03H, 05H, 09H, 11H
PxChr4CH	DEFB	00H, 01H, 01H, 01H, 01H, 01H, 01H, 1FH
PxChr4DH	DEFB	00H, 11H, 1BH, 15H, 15H, 11H, 11H, 11H
PxChr4EH	DEFB	00H, 11H, 11H, 13H, 15H, 19H, 11H, 11H
PxChr4FH	DEFB	00H, 0EH, 11H, 11H, 11H, 11H, 11H, 0EH
PxChr50H	DEFB	00H, 0FH, 11H, 11H, 0FH, 01H, 01H, 01H
PxChr51H	DEFB	00H, 0EH, 11H, 11H, 11H, 15H, 09H, 16H
PxChr52H	DEFB	00H, 0FH, 11H, 11H, 0FH, 05H, 09H, 11H
PxChr53H	DEFB	00H, 1EH, 01H, 01H, 0EH, 10H, 10H, 0FH
PxChr54H	DEFB	00H, 1FH, 04H, 04H, 04H, 04H, 04H, 04H
PxChr55H	DEFB	00H, 11H, 11H, 11H, 11H, 11H, 11H, 0EH
PxChr56H	DEFB	00H, 11H, 11H, 11H, 11H, 11H, 0AH, 04H
PxChr57H	DEFB	00H, 11H, 11H, 11H, 15H, 15H, 15H, 0AH
PxChr58H	DEFB	00H, 11H, 11H, 0AH, 04H, 0AH, 11H, 11H
PxChr59H	DEFB	00H, 11H, 11H, 11H, 0AH, 04H, 04H, 04H
PxChr5AH	DEFB	00H, 1FH, 10H, 08H, 04H, 02H, 01H, 1FH
PxChr5BH	DEFB	00H, 0EH, 02H, 02H, 02H, 02H, 02H, 0EH
PxChr5CH	DEFB	00H, 11H, 0AH, 1FH, 04H, 1FH, 04H, 04H
PxChr5DH	DEFB	00H, 0EH, 08H, 08H, 08H, 08H, 08H, 0EH
PxChr5EH	DEFB	00H, 06H, 04H, 03H, 00H, 00H, 00H, 00H
PxChr5FH	DEFB	00H, 00H, 00H, 00H, 00H, 00H, 00H, 1FH
PxChr60H	DEFB	00H, 02H, 04H, 00H, 00H, 00H, 00H, 00H
PxChr61H	DEFB	00H, 00H, 00H, 0EH, 10H, 1EH, 11H, 1EH
PxChr62H	DEFB	00H, 01H, 01H, 0DH, 13H, 11H, 11H, 0FH
PxChr63H	DEFB	00H, 00H, 00H, 0EH, 01H, 01H, 11H, 0EH
PxChr64H	DEFB	00H, 10H, 10H, 16H, 19H, 11H, 11H, 1EH
PxChr65H	DEFB	00H, 00H, 00H, 0EH, 11H, 1FH, 01H, 0EH
PxChr66H	DEFB	00H, 0CH, 12H, 02H, 07H, 02H, 02H, 02H
PxChr67H	DEFB	00H, 00H, 1EH, 11H, 11H, 1EH, 10H, 0EH
PxChr68H	DEFB	00H, 01H, 01H, 0DH, 13H, 11H, 11H, 11H
PxChr69H	DEFB	00H, 04H, 00H, 06H, 04H, 04H, 04H, 0EH
PxChr6AH	DEFB	00H, 08H, 00H, 0AH, 08H, 08H, 09H, 06H
PxChr6BH	DEFB	00H, 01H, 01H, 09H, 05H, 03H, 05H, 09H
PxChr6CH	DEFB	00H, 06H, 04H, 04H, 04H, 04H, 04H, 0EH
PxChr6DH	DEFB	00H, 00H, 00H, 0BH, 15H, 15H, 11H, 11H
PxChr6EH	DEFB	00H, 00H, 00H, 0DH, 13H, 11H, 11H, 11H
PxChr6FH	DEFB	00H, 00H, 00H, 0EH, 11H, 11H, 11H, 0EH
PxChr70H	DEFB	00H, 00H, 00H, 0FH, 11H, 0FH, 01H, 01H
PxChr71H	DEFB	00H, 00H, 00H, 16H, 19H, 1EH, 10H, 10H
PxChr72H	DEFB	00H, 00H, 00H, 0DH, 13H, 01H, 01H, 01H
PxChr73H	DEFB	00H, 00H, 00H, 0EH, 01H, 0EH, 10H, 0FH
PxChr74H	DEFB	00H, 02H, 02H, 07H, 02H, 02H, 02H, 0CH
PxChr75H	DEFB	00H, 00H, 00H, 11H, 11H, 11H, 19H, 16H
PxChr76H	DEFB	00H, 00H, 00H, 11H, 11H, 11H, 0AH, 04H
PxChr77H	DEFB	00H, 00H, 00H, 11H, 11H, 15H, 15H, 0AH
PxChr78H	DEFB	00H, 00H, 00H, 11H, 0AH, 04H, 0AH, 11H
PxChr79H	DEFB	00H, 00H, 00H, 11H, 11H, 1EH, 10H, 0EH
PxChr7AH	DEFB	00H, 00H, 00H, 1FH, 08H, 04H, 02H, 1FH
PxChr7BH	DEFB	00H, 0CH, 02H, 02H, 01H, 02H, 02H, 0CH
PxChr7CH	DEFB	00H, 00H, 00H, 00H, 1BH, 00H, 00H, 00H
PxChr7DH	DEFB	00H, 06H, 08H, 08H, 10H, 08H, 08H, 06H
PxChr7EH	DEFB	00H, 02H, 15H, 08H, 00H, 00H, 00H, 00H
PxChr7FH	DEFB	00H, 1FH, 1FH, 1FH, 1FH, 1FH, 1FH, 1FH
PxChr80H	DEFB	00H, 02H, 04H, 0EH, 10H, 1EH, 11H, 1EH
PxChr81H	DEFB	00H, 08H, 04H, 0EH, 10H, 1EH, 11H, 1EH
PxChr82H	DEFB	00H, 02H, 04H, 0EH, 11H, 1FH, 01H, 0EH
PxChr83H	DEFB	00H, 08H, 04H, 0EH, 11H, 1FH, 01H, 0EH
PxChr84H	DEFB	08H, 04H, 00H, 06H, 04H, 04H, 04H, 0EH
PxChr85H	DEFB	00H, 08H, 04H, 0EH, 11H, 11H, 11H, 0EH
PxChr86H	DEFB	00H, 08H, 04H, 11H, 11H, 11H, 19H, 16H
PxChr87H	DEFB	00H, 00H, 14H, 0AH, 05H, 0AH, 14H, 00H
PxChr88H	DEFB	00H, 00H, 05H, 0AH, 14H, 0AH, 05H, 00H
PxChr89H	DEFB	00H, 14H, 0AH, 0DH, 13H, 11H, 11H, 11H
PxChr8AH	DEFB	00H, 08H, 04H, 0EH, 10H, 1EH, 11H, 1EH
PxChr8BH	DEFB	00H, 02H, 04H, 0EH, 11H, 1FH, 01H, 0EH
PxChr8CH	DEFB	00H, 08H, 04H, 0EH, 11H, 1FH, 01H, 0EH
PxChr8DH	DEFB	08H, 04H, 00H, 06H, 04H, 04H, 04H, 0EH
PxChr8EH	DEFB	00H, 08H, 04H, 0EH, 11H, 11H, 11H, 0EH
PxChr8FH	DEFB	00H, 08H, 04H, 11H, 11H, 11H, 19H, 16H
PxChr90H	DEFB	00H, 11H, 00H, 0EH, 10H, 1EH, 11H, 1EH
PxChr91H	DEFB	00H, 11H, 00H, 0EH, 11H, 11H, 11H, 0EH
PxChr92H	DEFB	00H, 11H, 00H, 11H, 11H, 11H, 19H, 16H
PxChr93H	DEFB	00H, 04H, 00H, 0EH, 10H, 1EH, 11H, 1EH
PxChr94H	DEFB	00H, 10H, 0EH, 19H, 15H, 13H, 0EH, 01H
PxChr95H	DEFB	00H, 76H, 09H, 09H, 7FH, 09H, 09H, 79H
PxChr96H	DEFB	00H, 00H, 10H, 0EH, 15H, 15H, 0EH, 01H
PxChr97H	DEFB	04H, 0AH, 04H, 0AH, 11H, 1FH, 11H, 11H
PxChr98H	DEFB	11H, 0EH, 11H, 11H, 11H, 11H, 11H, 0EH
PxChr99H	DEFB	10H, 08H, 04H, 0AH, 11H, 1FH, 11H, 11H
PxChr9AH	DEFB	10H, 08H, 1FH, 01H, 0FH, 01H, 01H, 1FH
PxChr9BH	DEFB	10H, 08H, 0EH, 04H, 04H, 04H, 04H, 0EH
PxChr9CH	DEFB	10H, 08H, 0EH, 11H, 11H, 11H, 11H, 0EH
PxChr9DH	DEFB	04H, 0AH, 1FH, 01H, 0FH, 01H, 01H, 1FH
PxChr9EH	DEFB	16H, 09H, 04H, 0AH, 11H, 1FH, 11H, 11H
PxChr9FH	DEFB	16H, 09H, 0EH, 11H, 11H, 11H, 11H, 0EH
PxChrA0H	DEFB	11H, 0EH, 11H, 11H, 11H, 1FH, 11H, 11H
PxChrA1H	DEFB	00H, 0EH, 11H, 01H, 11H, 0EH, 08H, 06H



		
;=========================== END OF EPROM CODE =====		
		
		
		rst		38H
		
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
        RST     38H
		DEFB	"FF until end 32K"
		;######################## END of CODE #########################

