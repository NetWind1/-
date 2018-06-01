opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F690
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 18 "F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
	psect config,class=CONFIG,delta=2 ;#
# 18 "F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
	dw 0x03c1 ;#
	FNCALL	_main,_IO_init
	FNCALL	_main,_Timer_init
	FNCALL	_main,_EEPROM_INIT
	FNCALL	_main,_AD_INIT
	FNCALL	_main,_Output
	FNCALL	_main,_get_adc
	FNCALL	_main,_KEY_SET
	FNROOT	_main
	FNCALL	_com1,_DIS_SCAN
	FNCALL	_com1,_KEY_SCAN
	FNCALL	_DIS_SCAN,i1_Output
	FNCALL	intlevel1,_com1
	global	intlevel1
	FNROOT	intlevel1
	global	_dight
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\System.h"
	line	27

;initializer for _dight
	retlw	0C0h
	retlw	0F9h
	retlw	0A4h
	retlw	0B0h
	retlw	099h
	retlw	092h
	retlw	082h
	retlw	0F8h
	retlw	080h
	retlw	090h
	global	_Buff
	global	_key_num2
	global	_FLAG_ON
	global	_KEY_Long
	global	_KEY_Short
	global	_SCAN_NUM
	global	_key_time
	global	_old_key
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_ADIF
_ADIF	set	102
	global	_GIE
_GIE	set	95
	global	_GO
_GO	set	249
	global	_PEIE
_PEIE	set	94
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_TMR1IF
_TMR1IF	set	96
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_PIE1
_PIE1	set	140
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	global	_ANSEL
_ANSEL	set	286
	global	_ANSELH
_ANSELH	set	287
	file	"690.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_FLAG_ON:
       ds      1

_KEY_Long:
       ds      1

_KEY_Short:
       ds      1

_SCAN_NUM:
       ds      1

_key_time:
       ds      1

_old_key:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_Buff:
       ds      5

_key_num2:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\System.h"
_dight:
       ds      10

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
	clrf	((__pbssCOMMON)+5)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
	fcall	__pidataBANK0+2		;fetch initializer
	movwf	__pdataBANK0+2&07fh		
	fcall	__pidataBANK0+3		;fetch initializer
	movwf	__pdataBANK0+3&07fh		
	fcall	__pidataBANK0+4		;fetch initializer
	movwf	__pdataBANK0+4&07fh		
	fcall	__pidataBANK0+5		;fetch initializer
	movwf	__pdataBANK0+5&07fh		
	fcall	__pidataBANK0+6		;fetch initializer
	movwf	__pdataBANK0+6&07fh		
	fcall	__pidataBANK0+7		;fetch initializer
	movwf	__pdataBANK0+7&07fh		
	fcall	__pidataBANK0+8		;fetch initializer
	movwf	__pdataBANK0+8&07fh		
	fcall	__pidataBANK0+9		;fetch initializer
	movwf	__pdataBANK0+9&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_Output
?_Output:	; 0 bytes @ 0x0
	global	?_Timer_init
?_Timer_init:	; 0 bytes @ 0x0
	global	?_EEPROM_INIT
?_EEPROM_INIT:	; 0 bytes @ 0x0
	global	?_AD_INIT
?_AD_INIT:	; 0 bytes @ 0x0
	global	?_IO_init
?_IO_init:	; 0 bytes @ 0x0
	global	?_DIS_SCAN
?_DIS_SCAN:	; 0 bytes @ 0x0
	global	?_KEY_SCAN
?_KEY_SCAN:	; 0 bytes @ 0x0
	global	??_KEY_SCAN
??_KEY_SCAN:	; 0 bytes @ 0x0
	global	?_KEY_SET
?_KEY_SET:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_com1
?_com1:	; 0 bytes @ 0x0
	global	?i1_Output
?i1_Output:	; 0 bytes @ 0x0
	global	??i1_Output
??i1_Output:	; 0 bytes @ 0x0
	global	KEY_SCAN@KEY_DATA
KEY_SCAN@KEY_DATA:	; 1 bytes @ 0x0
	global	i1Output@i_data
i1Output@i_data:	; 1 bytes @ 0x0
	ds	1
	global	i1Output@i
i1Output@i:	; 1 bytes @ 0x1
	ds	1
	global	??_DIS_SCAN
??_DIS_SCAN:	; 0 bytes @ 0x2
	global	??_com1
??_com1:	; 0 bytes @ 0x2
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_Output
??_Output:	; 0 bytes @ 0x0
	global	??_Timer_init
??_Timer_init:	; 0 bytes @ 0x0
	global	??_EEPROM_INIT
??_EEPROM_INIT:	; 0 bytes @ 0x0
	global	??_AD_INIT
??_AD_INIT:	; 0 bytes @ 0x0
	global	??_IO_init
??_IO_init:	; 0 bytes @ 0x0
	global	??_KEY_SET
??_KEY_SET:	; 0 bytes @ 0x0
	global	?_get_adc
?_get_adc:	; 2 bytes @ 0x0
	global	Output@i_data
Output@i_data:	; 1 bytes @ 0x0
	ds	1
	global	Output@i
Output@i:	; 1 bytes @ 0x1
	ds	1
	global	??_get_adc
??_get_adc:	; 0 bytes @ 0x2
	ds	1
	global	get_adc@CH
get_adc@CH:	; 1 bytes @ 0x3
	ds	1
	global	get_adc@adc_val
get_adc@adc_val:	; 2 bytes @ 0x4
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x6
;;Data sizes: Strings 0, constant 0, data 10, bss 12, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      5      11
;; BANK0           80      6      22
;; BANK1           80      0       0
;; BANK2           80      0       0

;;
;; Pointer list with targets:

;; ?_get_adc	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _com1 in COMMON
;;
;;   _DIS_SCAN->i1_Output
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_get_adc
;;
;; Critical Paths under _com1 in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _com1 in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _com1 in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0     204
;;                            _IO_init
;;                         _Timer_init
;;                        _EEPROM_INIT
;;                            _AD_INIT
;;                             _Output
;;                            _get_adc
;;                            _KEY_SET
;; ---------------------------------------------------------------------------------
;; (1) _Output                                               2     2      0     102
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _get_adc                                              6     4      2     102
;;                                              0 BANK0      6     4      2
;; ---------------------------------------------------------------------------------
;; (1) _AD_INIT                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _EEPROM_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Timer_init                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _KEY_SET                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _IO_init                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (2) _com1                                                 3     3      0     315
;;                                              2 COMMON     3     3      0
;;                           _DIS_SCAN
;;                           _KEY_SCAN
;; ---------------------------------------------------------------------------------
;; (3) _DIS_SCAN                                             0     0      0     225
;;                           i1_Output
;; ---------------------------------------------------------------------------------
;; (4) i1_Output                                             2     2      0     225
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _KEY_SCAN                                             1     1      0      90
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _IO_init
;;   _Timer_init
;;   _EEPROM_INIT
;;   _AD_INIT
;;   _Output
;;   _get_adc
;;   _KEY_SET
;;
;; _com1 (ROOT)
;;   _DIS_SCAN
;;     i1_Output
;;   _KEY_SCAN
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               50      0       0       7        0.0%
;;BITBANK2            50      0       0       6        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       5        0.0%
;;BITBANK1            50      0       0       4        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      28      10        0.0%
;;ABS                  0      0      21       8        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50      6      16       3       27.5%
;;BITBANK0            50      0       0       9        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      5       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 211 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_IO_init
;;		_Timer_init
;;		_EEPROM_INIT
;;		_AD_INIT
;;		_Output
;;		_get_adc
;;		_KEY_SET
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
	line	211
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	212
	
l6290:	
;MAIN.c: 212: IO_init();
	fcall	_IO_init
	line	213
;MAIN.c: 213: Timer_init();
	fcall	_Timer_init
	line	214
	
l6292:	
;MAIN.c: 214: EEPROM_INIT();
	fcall	_EEPROM_INIT
	line	215
	
l6294:	
;MAIN.c: 215: AD_INIT();
	fcall	_AD_INIT
	line	216
	
l6296:	
;MAIN.c: 216: Output(0xff);
	movlw	(0FFh)
	fcall	_Output
	line	221
	
l6298:	
;MAIN.c: 219: {
;MAIN.c: 221: AD_data=get_adc(0);
	movlw	(0)
	fcall	_get_adc
	line	222
	
l6300:	
;MAIN.c: 222: KEY_SET();
	fcall	_KEY_SET
	line	229
	
l6302:	
;MAIN.c: 229: if(FLAG_ON.oneBit.T0)
	btfss	(_FLAG_ON),0	;volatile
	goto	u511
	goto	u510
u511:
	goto	l6308
u510:
	line	231
	
l6304:	
;MAIN.c: 230: {
;MAIN.c: 231: Buff[1]=Buff[1]+1;
	incf	0+(_Buff)+01h,w	;volatile
	movwf	0+(_Buff)+01h	;volatile
	line	232
	
l6306:	
;MAIN.c: 232: FLAG_ON.oneBit.T0=0;
	bcf	(_FLAG_ON),0	;volatile
	line	234
	
l6308:	
;MAIN.c: 233: }
;MAIN.c: 234: if(FLAG_ON.oneBit.T1)
	btfss	(_FLAG_ON),1	;volatile
	goto	u521
	goto	u520
u521:
	goto	l6314
u520:
	line	236
	
l6310:	
;MAIN.c: 235: {
;MAIN.c: 236: Buff[1]=0;
	clrf	0+(_Buff)+01h	;volatile
	line	237
	
l6312:	
;MAIN.c: 237: FLAG_ON.oneBit.T1=0;
	bcf	(_FLAG_ON),1	;volatile
	line	239
	
l6314:	
;MAIN.c: 238: }
;MAIN.c: 239: if(KEY_Long)
	movf	(_KEY_Long),w
	skipz
	goto	u530
	goto	l6298
u530:
	line	241
	
l6316:	
;MAIN.c: 240: {
;MAIN.c: 241: Buff[4]=5;
	movlw	(05h)
	movwf	0+(_Buff)+04h	;volatile
	line	242
	
l6318:	
;MAIN.c: 242: KEY_Long=0;
	clrf	(_KEY_Long)
	goto	l6298
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	247
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_Output
psect	text388,local,class=CODE,delta=2
global __ptext388
__ptext388:

;; *************** function _Output *****************
;; Defined at:
;;		line 28 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\74HC164.c"
;; Parameters:    Size  Location     Type
;;  i_data          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  i_data          1    0[BANK0 ] unsigned char 
;;  i               1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text388
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\74HC164.c"
	line	28
	global	__size_of_Output
	__size_of_Output	equ	__end_of_Output-_Output
	
_Output:	
	opt	stack 4
; Regs used in _Output: [wreg+status,2+status,0]
;Output@i_data stored from wreg
	line	30
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Output@i_data)
	
l6278:	
;74HC164.c: 29: unsigned char i;
;74HC164.c: 30: for(i=0;i<8;i++)
	clrf	(Output@i)
	line	31
	
l4543:	
	line	32
;74HC164.c: 31: {
;74HC164.c: 32: if((i_data&0x80)==0x80)
	btfss	(Output@i_data),(7)&7
	goto	u491
	goto	u490
u491:
	goto	l4545
u490:
	line	33
	
l6284:	
;74HC164.c: 33: {RB5=1;}
	bsf	(53/8),(53)&7
	goto	l4546
	line	34
	
l4545:	
	line	35
;74HC164.c: 34: else
;74HC164.c: 35: {RB5=0;}
	bcf	(53/8),(53)&7
	
l4546:	
	line	36
;74HC164.c: 36: _nop();
	nop
	line	37
;74HC164.c: 37: RB6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(54/8),(54)&7
	line	38
;74HC164.c: 38: _nop();
	nop
	line	39
;74HC164.c: 39: RB6=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	40
;74HC164.c: 40: _nop();
	nop
	line	41
;74HC164.c: 41: i_data<<=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(Output@i_data),f
	line	30
	
l6286:	
	incf	(Output@i),f
	
l6288:	
	movlw	(08h)
	subwf	(Output@i),w
	skipc
	goto	u501
	goto	u500
u501:
	goto	l4543
u500:
	line	43
	
l4547:	
	return
	opt stack 0
GLOBAL	__end_of_Output
	__end_of_Output:
;; =============== function _Output ends ============

	signat	_Output,4216
	global	_get_adc
psect	text389,local,class=CODE,delta=2
global __ptext389
__ptext389:

;; *************** function _get_adc *****************
;; Defined at:
;;		line 35 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\ADC.c"
;; Parameters:    Size  Location     Type
;;  CH              1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  CH              1    3[BANK0 ] unsigned char 
;;  adc_val         2    4[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text389
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\ADC.c"
	line	35
	global	__size_of_get_adc
	__size_of_get_adc	equ	__end_of_get_adc-_get_adc
	
_get_adc:	
	opt	stack 4
; Regs used in _get_adc: [wreg+status,2]
;get_adc@CH stored from wreg
	line	37
	movwf	(get_adc@CH)
	
l6268:	
;ADC.c: 36: unsigned int adc_val;
;ADC.c: 37: CH=CH<<2;
	clrc
	rlf	(get_adc@CH),f
	clrc
	rlf	(get_adc@CH),f
	line	38
	
l6270:	
;ADC.c: 38: ADCON0=0xc1|CH;
	movf	(get_adc@CH),w
	iorlw	0C1h
	movwf	(31)	;volatile
	line	39
	
l6272:	
;ADC.c: 39: GO = 1;
	bsf	(249/8),(249)&7
	line	40
;ADC.c: 40: while(GO);
	
l1868:	
	btfsc	(249/8),(249)&7
	goto	u481
	goto	u480
u481:
	goto	l1868
u480:
	
l1870:	
	line	41
;ADC.c: 41: ADIF = 0;
	bcf	(102/8),(102)&7
	line	43
	
l6274:	
;ADC.c: 43: adc_val=ADRESH;
	movf	(30),w	;volatile
	movwf	(get_adc@adc_val)
	clrf	(get_adc@adc_val+1)
	line	44
;ADC.c: 44: adc_val = adc_val<<8|ADRESL;
	movf	(get_adc@adc_val),w
	movwf	(??_get_adc+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	movwf	(get_adc@adc_val)
	movf	(??_get_adc+0)+0,w
	movwf	(get_adc@adc_val+1)
	line	45
;ADC.c: 45: return adc_val;
	movf	(get_adc@adc_val+1),w
	movwf	(?_get_adc+1)
	movf	(get_adc@adc_val),w
	movwf	(?_get_adc)
	line	46
	
l1871:	
	return
	opt stack 0
GLOBAL	__end_of_get_adc
	__end_of_get_adc:
;; =============== function _get_adc ends ============

	signat	_get_adc,4218
	global	_AD_INIT
psect	text390,local,class=CODE,delta=2
global __ptext390
__ptext390:

;; *************** function _AD_INIT *****************
;; Defined at:
;;		line 24 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\ADC.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text390
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\ADC.c"
	line	24
	global	__size_of_AD_INIT
	__size_of_AD_INIT	equ	__end_of_AD_INIT-_AD_INIT
	
_AD_INIT:	
	opt	stack 4
; Regs used in _AD_INIT: [wreg]
	line	25
	
l6266:	
;ADC.c: 25: ADCON0=0xc1;
	movlw	(0C1h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	26
;ADC.c: 26: ADCON1=0x10;
	movlw	(010h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	27
	
l1865:	
	return
	opt stack 0
GLOBAL	__end_of_AD_INIT
	__end_of_AD_INIT:
;; =============== function _AD_INIT ends ============

	signat	_AD_INIT,88
	global	_EEPROM_INIT
psect	text391,local,class=CODE,delta=2
global __ptext391
__ptext391:

;; *************** function _EEPROM_INIT *****************
;; Defined at:
;;		line 60 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\EEPROM.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/20
;;		Unchanged: FFFFFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text391
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\EEPROM.c"
	line	60
	global	__size_of_EEPROM_INIT
	__size_of_EEPROM_INIT	equ	__end_of_EEPROM_INIT-_EEPROM_INIT
	
_EEPROM_INIT:	
	opt	stack 4
; Regs used in _EEPROM_INIT: []
	line	62
	
l3654:	
	return
	opt stack 0
GLOBAL	__end_of_EEPROM_INIT
	__end_of_EEPROM_INIT:
;; =============== function _EEPROM_INIT ends ============

	signat	_EEPROM_INIT,88
	global	_Timer_init
psect	text392,local,class=CODE,delta=2
global __ptext392
__ptext392:

;; *************** function _Timer_init *****************
;; Defined at:
;;		line 11 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\TIME.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text392
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\TIME.c"
	line	11
	global	__size_of_Timer_init
	__size_of_Timer_init	equ	__end_of_Timer_init-_Timer_init
	
_Timer_init:	
	opt	stack 4
; Regs used in _Timer_init: [wreg+status,2]
	line	12
	
l6256:	
;TIME.c: 12: T1CON=0x21;
	movlw	(021h)
	movwf	(16)	;volatile
	line	13
;TIME.c: 13: TMR1L=(65536-65000)%256;
	movlw	(018h)
	movwf	(14)	;volatile
	line	14
	
l6258:	
;TIME.c: 14: TMR1H=(65536-65534)/256;
	clrf	(15)	;volatile
	line	15
	
l6260:	
;TIME.c: 15: PIE1=0x01;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(140)^080h	;volatile
	line	16
	
l6262:	
;TIME.c: 16: GIE=1;
	bsf	(95/8),(95)&7
	line	17
	
l6264:	
;TIME.c: 17: PEIE=1;
	bsf	(94/8),(94)&7
	line	18
	
l2758:	
	return
	opt stack 0
GLOBAL	__end_of_Timer_init
	__end_of_Timer_init:
;; =============== function _Timer_init ends ============

	signat	_Timer_init,88
	global	_KEY_SET
psect	text393,local,class=CODE,delta=2
global __ptext393
__ptext393:

;; *************** function _KEY_SET *****************
;; Defined at:
;;		line 180 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text393
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
	line	180
	global	__size_of_KEY_SET
	__size_of_KEY_SET	equ	__end_of_KEY_SET-_KEY_SET
	
_KEY_SET:	
	opt	stack 4
; Regs used in _KEY_SET: [wreg-fsr0h+status,2+status,0]
	line	181
	
l6238:	
;MAIN.c: 181: if(KEY_Short!=0x00)
	movf	(_KEY_Short),w
	skipz
	goto	u450
	goto	l6250
u450:
	goto	l6246
	line	185
;MAIN.c: 184: {
;MAIN.c: 185: case 0xd0: FLAG_ON.oneBit.T0=1; break;
	
l958:	
	bsf	(_FLAG_ON),0	;volatile
	goto	l6248
	line	186
;MAIN.c: 186: case 0xc8: FLAG_ON.oneBit.T1=1; break;
	
l960:	
	bsf	(_FLAG_ON),1	;volatile
	goto	l6248
	line	187
;MAIN.c: 187: case 0x98: FLAG_ON.oneBit.T2=1; break;
	
l961:	
	bsf	(_FLAG_ON),2	;volatile
	goto	l6248
	line	188
;MAIN.c: 188: case 0x58: FLAG_ON.oneBit.T3=1; break;
	
l962:	
	bsf	(_FLAG_ON),3	;volatile
	goto	l6248
	line	183
	
l6246:	
	movf	(_KEY_Short),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 88 to 208
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte          252    10 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	88^0	; case 88
	skipnz
	goto	l962
	xorlw	152^88	; case 152
	skipnz
	goto	l961
	xorlw	200^152	; case 200
	skipnz
	goto	l960
	xorlw	208^200	; case 208
	skipnz
	goto	l958
	goto	l6248
	opt asmopt_on

	line	192
	
l6248:	
;MAIN.c: 192: KEY_Short=0x00;
	clrf	(_KEY_Short)
	line	195
	
l6250:	
;MAIN.c: 193: }
;MAIN.c: 195: if(KEY_Long!=0x00)
	movf	(_KEY_Long),w
	skipz
	goto	u460
	goto	l965
u460:
	line	197
	
l6252:	
;MAIN.c: 196: {
;MAIN.c: 197: if(KEY_Long==0xc0)
	movf	(_KEY_Long),w
	xorlw	0C0h
	skipz
	goto	u471
	goto	u470
u471:
	goto	l965
u470:
	line	199
	
l6254:	
;MAIN.c: 198: {
;MAIN.c: 199: FLAG_ON.oneBit.T4=1;
	bsf	(_FLAG_ON),4	;volatile
	line	204
	
l965:	
	return
	opt stack 0
GLOBAL	__end_of_KEY_SET
	__end_of_KEY_SET:
;; =============== function _KEY_SET ends ============

	signat	_KEY_SET,88
	global	_IO_init
psect	text394,local,class=CODE,delta=2
global __ptext394
__ptext394:

;; *************** function _IO_init *****************
;; Defined at:
;;		line 26 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text394
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
	line	26
	global	__size_of_IO_init
	__size_of_IO_init	equ	__end_of_IO_init-_IO_init
	
_IO_init:	
	opt	stack 4
; Regs used in _IO_init: [wreg+status,2]
	line	27
	
l6226:	
;MAIN.c: 27: TRISA=0x03;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	28
;MAIN.c: 28: ANSEL=0x03;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(286)^0100h	;volatile
	line	29
	
l6228:	
;MAIN.c: 29: ANSELH=0;
	clrf	(287)^0100h	;volatile
	line	30
	
l6230:	
;MAIN.c: 30: PORTA=0;
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	32
	
l6232:	
;MAIN.c: 32: TRISB=0x00;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(134)^080h	;volatile
	line	33
	
l6234:	
;MAIN.c: 33: PORTB=0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(6)	;volatile
	line	35
;MAIN.c: 35: TRISC=0xd8;
	movlw	(0D8h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	36
	
l6236:	
;MAIN.c: 36: PORTC=0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	37
	
l930:	
	return
	opt stack 0
GLOBAL	__end_of_IO_init
	__end_of_IO_init:
;; =============== function _IO_init ends ============

	signat	_IO_init,88
	global	_com1
psect	text395,local,class=CODE,delta=2
global __ptext395
__ptext395:

;; *************** function _com1 *****************
;; Defined at:
;;		line 254 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          3       0       0       0
;;      Totals:         3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DIS_SCAN
;;		_KEY_SCAN
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text395
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
	line	254
	global	__size_of_com1
	__size_of_com1	equ	__end_of_com1-_com1
	
_com1:	
	opt	stack 4
; Regs used in _com1: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_com1+0)
	movf	fsr0,w
	movwf	(??_com1+1)
	movf	pclath,w
	movwf	(??_com1+2)
	ljmp	_com1
psect	text395
	line	255
	
i1l6158:	
;MAIN.c: 255: if(TMR1IF==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l978
u37_20:
	line	257
	
i1l6160:	
;MAIN.c: 256: {
;MAIN.c: 257: TMR1IF=0;
	bcf	(96/8),(96)&7
	line	258
	
i1l6162:	
;MAIN.c: 258: SCAN_NUM++;
	incf	(_SCAN_NUM),f
	line	259
	
i1l6164:	
;MAIN.c: 259: DIS_SCAN();
	fcall	_DIS_SCAN
	line	260
	
i1l6166:	
;MAIN.c: 260: KEY_SCAN();
	fcall	_KEY_SCAN
	line	261
	
i1l6168:	
;MAIN.c: 261: TMR1L=(65536-100)%256;
	movlw	(09Ch)
	movwf	(14)	;volatile
	line	262
	
i1l6170:	
;MAIN.c: 262: TMR1H=(65536-100)/256;
	movlw	(0FFh)
	movwf	(15)	;volatile
	line	264
	
i1l978:	
	movf	(??_com1+2),w
	movwf	pclath
	movf	(??_com1+1),w
	movwf	fsr0
	swapf	(??_com1+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_com1
	__end_of_com1:
;; =============== function _com1 ends ============

	signat	_com1,88
	global	_DIS_SCAN
psect	text396,local,class=CODE,delta=2
global __ptext396
__ptext396:

;; *************** function _DIS_SCAN *****************
;; Defined at:
;;		line 44 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_Output
;; This function is called by:
;;		_com1
;; This function uses a non-reentrant model
;;
psect	text396
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
	line	44
	global	__size_of_DIS_SCAN
	__size_of_DIS_SCAN	equ	__end_of_DIS_SCAN-_DIS_SCAN
	
_DIS_SCAN:	
	opt	stack 4
; Regs used in _DIS_SCAN: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	46
	
i1l6016:	
;MAIN.c: 46: if(SCAN_NUM==10)
	movf	(_SCAN_NUM),w
	xorlw	0Ah
	skipz
	goto	u24_21
	goto	u24_20
u24_21:
	goto	i1l6030
u24_20:
	line	48
	
i1l6018:	
;MAIN.c: 47: {
;MAIN.c: 48: RB4=1;
	bsf	(52/8),(52)&7
	line	49
;MAIN.c: 49: RC2=1;
	bsf	(58/8),(58)&7
	line	50
;MAIN.c: 50: RC1=1;
	bsf	(57/8),(57)&7
	line	51
;MAIN.c: 51: RC0=1;
	bsf	(56/8),(56)&7
	line	52
	
i1l6020:	
;MAIN.c: 52: Output(dight[Buff[1]]);
	movf	0+(_Buff)+01h,w	;volatile
	addlw	_dight&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	i1_Output
	line	53
	
i1l6022:	
;MAIN.c: 53: RB4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	54
	
i1l6024:	
;MAIN.c: 54: RC2=1;
	bsf	(58/8),(58)&7
	line	55
	
i1l6026:	
;MAIN.c: 55: RC1=1;
	bsf	(57/8),(57)&7
	line	56
	
i1l6028:	
;MAIN.c: 56: RC0=1;
	bsf	(56/8),(56)&7
	line	60
	
i1l6030:	
;MAIN.c: 58: }
;MAIN.c: 60: if(SCAN_NUM==20)
	movf	(_SCAN_NUM),w
	xorlw	014h
	skipz
	goto	u25_21
	goto	u25_20
u25_21:
	goto	i1l6044
u25_20:
	line	62
	
i1l6032:	
;MAIN.c: 61: {
;MAIN.c: 62: RB4=1;
	bsf	(52/8),(52)&7
	line	63
;MAIN.c: 63: RC2=1;
	bsf	(58/8),(58)&7
	line	64
;MAIN.c: 64: RC1=1;
	bsf	(57/8),(57)&7
	line	65
;MAIN.c: 65: RC0=1;
	bsf	(56/8),(56)&7
	line	66
	
i1l6034:	
;MAIN.c: 66: Output(dight[Buff[2]]);
	movf	0+(_Buff)+02h,w	;volatile
	addlw	_dight&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	i1_Output
	line	67
	
i1l6036:	
;MAIN.c: 67: RB4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	68
	
i1l6038:	
;MAIN.c: 68: RC2=0;
	bcf	(58/8),(58)&7
	line	69
	
i1l6040:	
;MAIN.c: 69: RC1=1;
	bsf	(57/8),(57)&7
	line	70
	
i1l6042:	
;MAIN.c: 70: RC0=1;
	bsf	(56/8),(56)&7
	line	74
	
i1l6044:	
;MAIN.c: 72: }
;MAIN.c: 74: if(SCAN_NUM==30)
	movf	(_SCAN_NUM),w
	xorlw	01Eh
	skipz
	goto	u26_21
	goto	u26_20
u26_21:
	goto	i1l6058
u26_20:
	line	76
	
i1l6046:	
;MAIN.c: 75: {
;MAIN.c: 76: RB4=1;
	bsf	(52/8),(52)&7
	line	77
;MAIN.c: 77: RC2=1;
	bsf	(58/8),(58)&7
	line	78
;MAIN.c: 78: RC1=1;
	bsf	(57/8),(57)&7
	line	79
;MAIN.c: 79: RC0=1;
	bsf	(56/8),(56)&7
	line	80
	
i1l6048:	
;MAIN.c: 80: Output(dight[Buff[3]]);
	movf	0+(_Buff)+03h,w	;volatile
	addlw	_dight&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	i1_Output
	line	81
	
i1l6050:	
;MAIN.c: 81: RB4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	82
	
i1l6052:	
;MAIN.c: 82: RC2=1;
	bsf	(58/8),(58)&7
	line	83
	
i1l6054:	
;MAIN.c: 83: RC1=0;
	bcf	(57/8),(57)&7
	line	84
	
i1l6056:	
;MAIN.c: 84: RC0=1;
	bsf	(56/8),(56)&7
	line	88
	
i1l6058:	
;MAIN.c: 86: }
;MAIN.c: 88: if(SCAN_NUM==40)
	movf	(_SCAN_NUM),w
	xorlw	028h
	skipz
	goto	u27_21
	goto	u27_20
u27_21:
	goto	i1l937
u27_20:
	line	90
	
i1l6060:	
;MAIN.c: 89: {
;MAIN.c: 90: RB4=1;
	bsf	(52/8),(52)&7
	line	91
;MAIN.c: 91: RC2=1;
	bsf	(58/8),(58)&7
	line	92
;MAIN.c: 92: RC1=1;
	bsf	(57/8),(57)&7
	line	93
;MAIN.c: 93: RC0=1;
	bsf	(56/8),(56)&7
	line	94
	
i1l6062:	
;MAIN.c: 94: Output(dight[Buff[4]]);
	movf	0+(_Buff)+04h,w	;volatile
	addlw	_dight&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	i1_Output
	line	95
	
i1l6064:	
;MAIN.c: 95: RB4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	96
	
i1l6066:	
;MAIN.c: 96: RC2=1;
	bsf	(58/8),(58)&7
	line	97
	
i1l6068:	
;MAIN.c: 97: RC1=1;
	bsf	(57/8),(57)&7
	line	98
	
i1l6070:	
;MAIN.c: 98: RC0=0;
	bcf	(56/8),(56)&7
	line	99
	
i1l6072:	
;MAIN.c: 99: SCAN_NUM=0;
	clrf	(_SCAN_NUM)
	line	101
	
i1l937:	
	return
	opt stack 0
GLOBAL	__end_of_DIS_SCAN
	__end_of_DIS_SCAN:
;; =============== function _DIS_SCAN ends ============

	signat	_DIS_SCAN,88
	global	i1_Output
psect	text397,local,class=CODE,delta=2
global __ptext397
__ptext397:

;; *************** function i1_Output *****************
;; Defined at:
;;		line 28 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\74HC164.c"
;; Parameters:    Size  Location     Type
;;  Output          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Output          1    0[COMMON] unsigned char 
;;  Output          1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         2       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DIS_SCAN
;; This function uses a non-reentrant model
;;
psect	text397
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\74HC164.c"
	line	28
	global	__size_ofi1_Output
	__size_ofi1_Output	equ	__end_ofi1_Output-i1_Output
	
i1_Output:	
	opt	stack 4
; Regs used in i1_Output: [wreg+status,2+status,0]
;i1Output@i_data stored from wreg
	line	30
	movwf	(i1Output@i_data)
	
i1l6172:	
;74HC164.c: 29: unsigned char i;
;74HC164.c: 30: for(i=0;i<8;i++)
	clrf	(i1Output@i)
	line	31
	
i1l4543:	
	line	32
;74HC164.c: 31: {
;74HC164.c: 32: if((i_data&0x80)==0x80)
	btfss	(i1Output@i_data),(7)&7
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l4545
u38_20:
	line	33
	
i1l6178:	
;74HC164.c: 33: {RB5=1;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(53/8),(53)&7
	goto	i1l4546
	line	34
	
i1l4545:	
	line	35
;74HC164.c: 34: else
;74HC164.c: 35: {RB5=0;}
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(53/8),(53)&7
	
i1l4546:	
	line	36
;74HC164.c: 36: _nop();
	nop
	line	37
;74HC164.c: 37: RB6=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(54/8),(54)&7
	line	38
;74HC164.c: 38: _nop();
	nop
	line	39
;74HC164.c: 39: RB6=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	40
;74HC164.c: 40: _nop();
	nop
	line	41
;74HC164.c: 41: i_data<<=1;
	clrc
	rlf	(i1Output@i_data),f
	line	30
	
i1l6180:	
	incf	(i1Output@i),f
	
i1l6182:	
	movlw	(08h)
	subwf	(i1Output@i),w
	skipc
	goto	u39_21
	goto	u39_20
u39_21:
	goto	i1l4543
u39_20:
	line	43
	
i1l4547:	
	return
	opt stack 0
GLOBAL	__end_ofi1_Output
	__end_ofi1_Output:
;; =============== function i1_Output ends ============

	signat	i1_Output,88
	global	_KEY_SCAN
psect	text398,local,class=CODE,delta=2
global __ptext398
__ptext398:

;; *************** function _KEY_SCAN *****************
;; Defined at:
;;		line 108 in file "F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  KEY_DATA        1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_com1
;; This function uses a non-reentrant model
;;
psect	text398
	file	"F:\PIC project\nantong\690+AD+74HC164   11.10\MAIN.c"
	line	108
	global	__size_of_KEY_SCAN
	__size_of_KEY_SCAN	equ	__end_of_KEY_SCAN-_KEY_SCAN
	
_KEY_SCAN:	
	opt	stack 5
; Regs used in _KEY_SCAN: [wreg-fsr0h+status,2+status,0]
	line	110
	
i1l6074:	
;MAIN.c: 109: unsigned char KEY_DATA;
;MAIN.c: 110: KEY_DATA=PORTC&0XD8;
	movf	(7),w
	movwf	(KEY_SCAN@KEY_DATA)
	
i1l6076:	
	movlw	(0D8h)
	andwf	(KEY_SCAN@KEY_DATA),f
	line	112
;MAIN.c: 112: switch(key_num2)
	goto	i1l6116
	line	115
	
i1l6078:	
;MAIN.c: 115: if(KEY_DATA!=0XD8)
	movf	(KEY_SCAN@KEY_DATA),w
	xorlw	0D8h
	skipnz
	goto	u28_21
	goto	u28_20
u28_21:
	goto	i1l6084
u28_20:
	line	117
	
i1l6080:	
;MAIN.c: 116: {
;MAIN.c: 117: old_key=KEY_DATA;
	movf	(KEY_SCAN@KEY_DATA),w
	movwf	(_old_key)
	line	118
	
i1l6082:	
;MAIN.c: 118: key_num2=1;
	clrf	(_key_num2)
	incf	(_key_num2),f
	line	120
;MAIN.c: 120: }
	goto	i1l953
	line	123
	
i1l6084:	
;MAIN.c: 121: else
;MAIN.c: 122: {
;MAIN.c: 123: key_num2=0;
	clrf	(_key_num2)
	goto	i1l953
	line	128
	
i1l6086:	
;MAIN.c: 128: if(KEY_DATA==old_key)
	movf	(KEY_SCAN@KEY_DATA),w
	xorwf	(_old_key),w
	skipz
	goto	u29_21
	goto	u29_20
u29_21:
	goto	i1l6096
u29_20:
	line	130
	
i1l6088:	
;MAIN.c: 129: {
;MAIN.c: 130: key_time++;
	incf	(_key_time),f
	line	131
	
i1l6090:	
;MAIN.c: 131: if(key_time>50)
	movlw	(033h)
	subwf	(_key_time),w
	skipc
	goto	u30_21
	goto	u30_20
u30_21:
	goto	i1l953
u30_20:
	line	134
	
i1l6092:	
;MAIN.c: 132: {
;MAIN.c: 134: key_num2=2;
	movlw	(02h)
	movwf	(_key_num2)
	line	135
	
i1l6094:	
;MAIN.c: 135: key_time=0;
	clrf	(_key_time)
	goto	i1l953
	line	142
	
i1l6096:	
;MAIN.c: 140: else
;MAIN.c: 141: {
;MAIN.c: 142: key_time=0;
	clrf	(_key_time)
	line	143
;MAIN.c: 143: key_num2=0;
	clrf	(_key_num2)
	line	144
;MAIN.c: 144: KEY_Long=0x00;
	clrf	(_KEY_Long)
	line	145
;MAIN.c: 145: KEY_Short=0x00;
	clrf	(_KEY_Short)
	goto	i1l953
	line	151
	
i1l6098:	
;MAIN.c: 151: if(KEY_DATA==old_key)
	movf	(KEY_SCAN@KEY_DATA),w
	xorwf	(_old_key),w
	skipz
	goto	u31_21
	goto	u31_20
u31_21:
	goto	i1l6110
u31_20:
	line	153
	
i1l6100:	
;MAIN.c: 152: {
;MAIN.c: 153: key_time++;
	incf	(_key_time),f
	line	154
	
i1l6102:	
;MAIN.c: 154: if(key_time>100)
	movlw	(065h)
	subwf	(_key_time),w
	skipc
	goto	u32_21
	goto	u32_20
u32_21:
	goto	i1l953
u32_20:
	line	156
	
i1l6104:	
;MAIN.c: 155: {
;MAIN.c: 156: KEY_Long=old_key;
	movf	(_old_key),w
	movwf	(_KEY_Long)
	line	157
	
i1l6106:	
;MAIN.c: 157: key_time=0;
	clrf	(_key_time)
	goto	i1l6084
	line	164
	
i1l6110:	
;MAIN.c: 162: else
;MAIN.c: 163: {
;MAIN.c: 164: key_time=0;
	clrf	(_key_time)
	line	165
;MAIN.c: 165: key_num2=0;
	clrf	(_key_num2)
	line	166
	
i1l6112:	
;MAIN.c: 166: KEY_Short=old_key;
	movf	(_old_key),w
	movwf	(_KEY_Short)
	goto	i1l953
	line	112
	
i1l6116:	
	movf	(_key_num2),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           13     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	i1l6078
	xorlw	1^0	; case 1
	skipnz
	goto	i1l6086
	xorlw	2^1	; case 2
	skipnz
	goto	i1l6098
	goto	i1l953
	opt asmopt_on

	line	173
	
i1l953:	
	return
	opt stack 0
GLOBAL	__end_of_KEY_SCAN
	__end_of_KEY_SCAN:
;; =============== function _KEY_SCAN ends ============

	signat	_KEY_SCAN,88
psect	text399,local,class=CODE,delta=2
global __ptext399
__ptext399:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
