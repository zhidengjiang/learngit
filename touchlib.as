opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F1938
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
indf1	equ	1
pc	equ	2
pcl	equ	2
status	equ	3
fsr0l	equ	4
fsr0h	equ	5
fsr1l	equ	6
fsr1h	equ	7
bsr	equ	8
wreg	equ	9
intcon	equ	11
c	equ	1
z	equ	0
pclath	equ	10
# 88 "TOUCH.C"
  M00 EQU 50H ;#
# 89 "TOUCH.C"
  M01 EQU 51H ;#
# 90 "TOUCH.C"
  M02 EQU 52H ;#
# 92 "TOUCH.C"
     M10 EQU 54H ;#
# 93 "TOUCH.C"
  M11 EQU 55H ;#
# 94 "TOUCH.C"
  M12 EQU 56H ;#
# 96 "TOUCH.C"
    SUML EQU 57H ;#
# 97 "TOUCH.C"
  SUMM EQU 58H ;#
# 98 "TOUCH.C"
  SUMH EQU 59H ;#
# 100 "TOUCH.C"
    COUNT EQU 5AH ;#
DABS 1,1568,48	;_fmd_nodownsum_Key
DABS 1,1448,72	;_fmd_nodownsum_Key
DABS 1,1440,8	;_fmd_nodownavrdata_Key
DABS 1,1312,80	;_fmd_nodownavrdata_Key
DABS 1,1232,32	;_fmd_nodownavrdata_Key
	FNCALL	_main,_SysInit
	FNCALL	_main,_UART_INITIAL
	FNCALL	_main,_DelayMs
	FNCALL	_main,_Time4Initial
	FNCALL	_main,_TouchInital
	FNCALL	_main,_TouchKeyScan
	FNCALL	_main,_uart_data_send
	FNCALL	_TouchKeyScan,_ReadTouchData
	FNCALL	_ReadTouchData,_TouchInit
	FNCALL	_ReadTouchData,_MxSet013
	FNCALL	_ReadTouchData,_DIV
	FNCALL	_ReadTouchData,_StartHigeFreq
	FNCALL	_ReadTouchData,_DataProcessing
	FNCALL	_DataProcessing,___bmul
	FNCALL	_DataProcessing,_StartHigeFreq
	FNCALL	_DataProcessing,_HighFreqCo
	FNCALL	_DataProcessing,_DIV
	FNCALL	_DelayMs,_DelayUs
	FNCALL	_StartHigeFreq,_TouchInit
	FNCALL	_StartHigeFreq,_DIV
	FNCALL	_TouchInital,___awdiv
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_fmd_DownDataTime
	global	_fmd_DownTouchCount
	global	_toSend
	global	_fmd_UpDataTime
	global	_fmd_UpTouchCount
psect	idataBANK0l,class=CODE,space=0,delta=2
global __pidataBANK0l
__pidataBANK0l:
	file	"TOUCH.C"
	line	81

;initializer for _fmd_DownDataTime
	retlw	0B0h
	retlw	04h

	line	75

;initializer for _fmd_DownTouchCount
	retlw	0B0h
	retlw	04h

psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	file	"main.c"
	line	79

;initializer for _toSend
	retlw	011h
	retlw	022h
	retlw	033h
	retlw	044h
	retlw	055h
	retlw	066h
	retlw	077h
	retlw	088h
	retlw	099h
	retlw	0AAh
	retlw	0
	file	"TOUCH.C"
	line	80

;initializer for _fmd_UpDataTime
	retlw	058h
	retlw	02h

	line	74

;initializer for _fmd_UpTouchCount
	retlw	0E8h
	retlw	03h

	global	_ACTIVE_SENSOR_DELTA
psect	stringtext,class=STRCODE,delta=2,reloc=256
global __pstringtext
__pstringtext:
	global    __stringtab
__stringtab:
	retlw	0
psect	stringtext
	file	"touch.h"
	line	261
_ACTIVE_SENSOR_DELTA:
	retlw	01Bh
	retlw	01Bh
	retlw	014h
	retlw	010h
	retlw	0
	retlw	0
	retlw	023h
	retlw	025h
	retlw	01Ah
	retlw	017h
	retlw	0
	retlw	0
	retlw	01Ch
	retlw	01Eh
	retlw	015h
	retlw	014h
	retlw	0
	retlw	0
	retlw	022h
	retlw	023h
	retlw	015h
	retlw	015h
	retlw	0
	retlw	0
	retlw	025h
	retlw	028h
	retlw	018h
	retlw	016h
	retlw	0
	retlw	0
	retlw	022h
	retlw	022h
	retlw	018h
	retlw	015h
	retlw	0
	retlw	0
	retlw	01Fh
	retlw	022h
	retlw	018h
	retlw	014h
	retlw	0
	retlw	0
	retlw	01Ah
	retlw	01Ch
	retlw	015h
	retlw	012h
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_INACTIVE_SENSOR_DELTA
psect	stringtext
	file	"touch.h"
	line	281
_INACTIVE_SENSOR_DELTA:
	retlw	010h
	retlw	011h
	retlw	0Ch
	retlw	0Ah
	retlw	0
	retlw	0
	retlw	015h
	retlw	016h
	retlw	010h
	retlw	0Eh
	retlw	0
	retlw	0
	retlw	011h
	retlw	012h
	retlw	0Dh
	retlw	0Ch
	retlw	0
	retlw	0
	retlw	015h
	retlw	016h
	retlw	0Dh
	retlw	0Dh
	retlw	0
	retlw	0
	retlw	016h
	retlw	018h
	retlw	0Fh
	retlw	0Dh
	retlw	0
	retlw	0
	retlw	015h
	retlw	015h
	retlw	0Fh
	retlw	0Dh
	retlw	0
	retlw	0
	retlw	013h
	retlw	015h
	retlw	0Eh
	retlw	0Ch
	retlw	0
	retlw	0
	retlw	010h
	retlw	011h
	retlw	0Dh
	retlw	0Bh
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	retlw	0
	global	_ad3nop
	global	_ad3nop_absaddr
_ad3nop_absaddr	set	0x3
	global	_IO_TOUCH_ATTR1
psect	stringtext
	file	"touch.h"
	line	301
_IO_TOUCH_ATTR1:
	retlw	0FFh
	retlw	0

	global	_LONGKEYPROTECT1
psect	stringtext
	file	"touch.h"
	line	302
_LONGKEYPROTECT1:
	retlw	01Eh
	global	_PRIMARYKEY11
psect	stringtext
	file	"touch.h"
	line	308
_PRIMARYKEY11:
	retlw	0
	global	_SCANNINGTIME1
psect	stringtext
	file	"touch.h"
	line	310
_SCANNINGTIME1:
	retlw	0Fh
	global	_ACTIVE_SENSOR_DELTA
	global	_INACTIVE_SENSOR_DELTA
	global	_ad3nop
	global	_ad3nop_absaddr
_ad3nop_absaddr	set	0x3
psect	_ad3nop_text,class=CODE,delta=2
global __p_ad3nop_text
__p_ad3nop_text:
_ad3nop:
	retlw	0
	global	_IO_TOUCH_ATTR1
	global	_LONGKEYPROTECT1
	global	_PRIMARYKEY11
	global	_SCANNINGTIME1
	global	_fmd_TouchDataBuff_Key
	global	_fmd_KeyDValue_Key
	global	_fmd_Keystatus
	global	_fmd_Keystatus1
	global	_fmd_Keystatus2
	global	_varKeyPushCnt
	global	_flag
	global	_fmd_HfreqOn
	global	_fmd_KeyBuffPress
	global	_fmd_KeyBuffUnPress
	global	_fmd_PressOff
	global	_fmd_PressOffCount
	global	_fmd_Startgx
	global	_fmd_TestCount
	global	_fmd_a1
	global	_fmd_a2
	global	_fmd_a3
	global	_fmd_antishaketimecount
	global	_fmd_antishaketimecount1
	global	_fmd_currentCount
	global	_fmd_u
	global	_fmd_updataFlag
	global	_fmd_x
	global	_k
	global	_senddata
	global	_unionAllKeyFlag
	global	_unionAllTimeFlag
	global	_fmd_nodownavrdata_Key
	global	_fmd_nodownsum_Key
	global	_fmd_f_firstdown
	global	_fmd_f_firstloop
	global	_fmd_f_forbidden
	global	_fmd_f_main_key
	global	_fmd_theUsedChannel
	global	_receivedata
	global	_fmd_KeyDValue_Key_base
	global	_fmd_KeyDValue_Key_baseBuff
	global	_fmd_thedeathcount
	global	_fmd_thedeathcount1
	global	_fmd_thedeathcount2
	global	_key_status
	global	_readKeyNum
	global	_fmd_f_keydown_flag
	global	_fmd_AntiWaterBit
	global	_fmd_a
	global	_fmd_channels
	global	_fmd_OriginalData
_fmd_OriginalData	set	81
	DABS	1,81,2	;_fmd_OriginalData

	global	_fmd_Null0
_fmd_Null0	set	80
	DABS	1,80,1	;_fmd_Null0

	global	_INTCON
_INTCON	set	11
	global	_PORTA
_PORTA	set	12
	global	_PORTB
_PORTB	set	13
	global	_PORTC
_PORTC	set	14
	global	_PORTD
_PORTD	set	15
	global	_STATUS
_STATUS	set	3
	global	_RA0
_RA0	set	96
	global	_RA3
_RA3	set	99
	global	_RB0
_RB0	set	104
	global	_RB1
_RB1	set	105
	global	_RB4
_RB4	set	108
	global	_RC6
_RC6	set	118
	global	_RD0
_RD0	set	120
	global	_RD1
_RD1	set	121
	global	_RD3
_RD3	set	123
	global	_OSCCON
_OSCCON	set	153
	global	_PCKEN
_PCKEN	set	154
	global	_TRISA
_TRISA	set	140
	global	_TRISB
_TRISB	set	141
	global	_TRISC
_TRISC	set	142
	global	_TRISD
_TRISD	set	143
	global	_TRISA4
_TRISA4	set	1124
	global	_TRISA5
_TRISA5	set	1125
	global	_TRISA6
_TRISA6	set	1126
	global	_TRISA7
_TRISA7	set	1127
	global	_TRISB2
_TRISB2	set	1130
	global	_TRISB3
_TRISB3	set	1131
	global	_TRISB4
_TRISB4	set	1132
	global	_TRISB7
_TRISB7	set	1135
	global	_TRISC0
_TRISC0	set	1136
	global	_TRISC1
_TRISC1	set	1137
	global	_TRISC3
_TRISC3	set	1139
	global	_TRISC4
_TRISC4	set	1140
	global	_TRISC5
_TRISC5	set	1141
	global	_TRISC6
_TRISC6	set	1142
	global	_TRISC7
_TRISC7	set	1143
	global	_TRISD5
_TRISD5	set	1149
	global	_AFP2
_AFP2	set	285
	global	_PSRC0
_PSRC0	set	282
	global	_PSRC1
_PSRC1	set	283
	global	_TIM4ARR
_TIM4ARR	set	279
	global	_TIM4CNTR
_TIM4CNTR	set	277
	global	_TIM4CR1
_TIM4CR1	set	273
	global	_TIM4EGR
_TIM4EGR	set	276
	global	_TIM4IER
_TIM4IER	set	274
	global	_TIM4PSCR
_TIM4PSCR	set	278
	global	_TIM4SR
_TIM4SR	set	275
	global	_T4UIE
_T4UIE	set	2192
	global	_T4UIF
_T4UIF	set	2200
	global	_ANSELA
_ANSELA	set	407
	global	_PSINK0
_PSINK0	set	410
	global	_PSINK1
_PSINK1	set	411
	global	_PSINK2
_PSINK2	set	412
	global	_PSINK3
_PSINK3	set	413
	global	_WPUA
_WPUA	set	396
	global	_WPUB
_WPUB	set	397
	global	_WPUC
_WPUC	set	398
	global	_WPUD
_WPUD	set	399
	global	_WPDA
_WPDA	set	524
	global	_WPDB
_WPDB	set	525
	global	_WPDC
_WPDC	set	526
	global	_WPDD
_WPDD	set	527
	global	_UROD
_UROD	set	4344
	global	_M0ANALOG
_M0ANALOG	set	914
	global	_M1ANALOG
_M1ANALOG	set	915
	global	_M2ANALOG
_M2ANALOG	set	916
	global	_M3ANALOG
_M3ANALOG	set	917
	global	_TKC0
_TKC0	set	909
	global	_TKC1
_TKC1	set	910
	global	_TKM0C0
_TKM0C0	set	918
	global	_TKM0C1
_TKM0C1	set	919
	global	_TKM1C0
_TKM1C0	set	920
	global	_TKM1C1
_TKM1C1	set	921
	global	_TKM2C0
_TKM2C0	set	922
	global	_TKM2C1
_TKM2C1	set	923
	global	_TKM3C0
_TKM3C0	set	924
	global	_TKM3C1
_TKM3C1	set	925
	global	_TKTMR
_TKTMR	set	908
	global	_WPROOF1
_WPROOF1	set	911
	global	_WPROOF2
_WPROOF2	set	912
	global	_WPROOF3
_WPROOF3	set	913
	global	_TKRCOV
_TKRCOV	set	7278
	global	_TKST
_TKST	set	7277
	global	_URDATAL
_URDATAL	set	1164
	global	_URDLH
_URDLH	set	1173
	global	_URDLL
_URDLL	set	1172
	global	_URIER
_URIER	set	1166
	global	_URLCR
_URLCR	set	1167
	global	_URMCR
_URMCR	set	1169
	global	_TCF
_TCF	set	9440
	global	_TKM016DH
_TKM016DH	set	3989
	global	_TKM016DL
_TKM016DL	set	3988
	global	_TKM116DH
_TKM116DH	set	3997
	global	_TKM116DL
_TKM116DL	set	3996
	global	_TKM216DH
_TKM216DH	set	4005
	global	_TKM216DL
_TKM216DL	set	4004
	global	_TKM316DH
_TKM316DH	set	4013
	global	_TKM316DL
_TKM316DL	set	4012
	global	_fmd_ReferenceData
_fmd_ReferenceData	set	85
	DABS	1,85,2	;_fmd_ReferenceData

	global	_fmd_Null1
_fmd_Null1	set	83
	DABS	1,83,1	;_fmd_Null1

	global	_fmd_Null2
_fmd_Null2	set	84
	DABS	1,84,1	;_fmd_Null2

	global	_fmd_ResultData
_fmd_ResultData	set	87
	DABS	1,87,2	;_fmd_ResultData

	global	_fmd_Null3
_fmd_Null3	set	90
	DABS	1,90,1	;_fmd_Null3

	global	_fmd_ResultDataH
_fmd_ResultDataH	set	89
	DABS	1,89,1	;_fmd_ResultDataH

	file	"touchlib.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

_fmd_nodownavrdata_Key  equ     8960	;BIGRAM
_fmd_nodownsum_Key  equ     9080	;BIGRAM
psect	bitbssCOMMON,class=COMMON,bit,space=1
global __pbitbssCOMMON
__pbitbssCOMMON:
_fmd_f_firstdown:
       ds      1

_fmd_f_firstloop:
       ds      1

_fmd_f_forbidden:
       ds      1

_fmd_f_main_key:
       ds      1

psect	bitbssBANK0hh,class=BANK0,bit,space=1
global __pbitbssBANK0hh
__pbitbssBANK0hh:
_fmd_f_keydown_flag:
       ds      1

psect	bssBANK0l,class=BANK0,space=1
global __pbssBANK0l
__pbssBANK0l:
_fmd_TouchDataBuff_Key:
       ds      8

_fmd_KeyDValue_Key:
       ds      4

_fmd_Keystatus:
       ds      2

_fmd_Keystatus1:
       ds      2

_fmd_Keystatus2:
       ds      2

_varKeyPushCnt:
       ds      2

_flag:
       ds      1

_fmd_HfreqOn:
       ds      1

_fmd_KeyBuffPress:
       ds      1

_fmd_KeyBuffUnPress:
       ds      1

_fmd_PressOff:
       ds      1

_fmd_PressOffCount:
       ds      1

_fmd_Startgx:
       ds      1

_fmd_TestCount:
       ds      1

_fmd_a1:
       ds      1

_fmd_a2:
       ds      1

_fmd_a3:
       ds      1

_fmd_antishaketimecount:
       ds      1

_fmd_antishaketimecount1:
       ds      1

_fmd_currentCount:
       ds      1

_fmd_u:
       ds      1

_fmd_updataFlag:
       ds      1

_fmd_x:
       ds      1

_k:
       ds      1

_senddata:
       ds      1

_unionAllKeyFlag:
       ds      1

_unionAllTimeFlag:
       ds      1

_fmd_AntiWaterBit:
       ds      1

_fmd_a:
       ds      1

_fmd_channels:
       ds      1

psect	dataBANK0l,class=BANK0,space=1
global __pdataBANK0l
__pdataBANK0l:
	file	"TOUCH.C"
	line	81
_fmd_DownDataTime:
       ds      2

psect	dataBANK0l
	file	"TOUCH.C"
	line	75
_fmd_DownTouchCount:
       ds      2

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_fmd_theUsedChannel:
       ds      15

_receivedata:
       ds      10

_fmd_KeyDValue_Key_base:
       ds      4

_fmd_KeyDValue_Key_baseBuff:
       ds      4

_fmd_thedeathcount:
       ds      2

_fmd_thedeathcount1:
       ds      2

_fmd_thedeathcount2:
       ds      2

_key_status:
       ds      2

_readKeyNum:
       ds      2

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"main.c"
	line	79
_toSend:
       ds      11

psect	dataBANK1
	file	"TOUCH.C"
	line	80
_fmd_UpDataTime:
       ds      2

psect	dataBANK1
	file	"TOUCH.C"
	line	74
_fmd_UpTouchCount:
       ds      2

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR0 containing the base address, and
;	btemp/btemp+1 has the size to clear
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf0		;clear RAM location pointed to by FSR
	addfsr	0,1
	movlw	1
	subwf	btemp,f
	movlw	0
	subwfb btemp+1,f
	movf btemp+1,w
	iorwf btemp,w
	skipz
	goto clrloop	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
; Clear objects allocated to BIGRAM
psect cinit,class=CODE,delta=2
	global __pbssBIGRAM
	movlw	low(__pbssBIGRAM)
	movwf	fsr0l
	movlw	high(__pbssBIGRAM)
	movwf	fsr0h
	movlw	low(0F0h)
	movwf	btemp
	movlw	high(0F0h)
	movwf	btemp+1
	fcall	clear_ram
; Clear objects allocated to BITCOMMON
psect cinit,class=CODE,delta=2
	global __pbitbssCOMMON
	clrf	((__pbitbssCOMMON/8)+0)&07Fh
; Clear objects allocated to BITBANK0hh
psect cinit,class=CODE,delta=2
	global __pbitbssBANK0hh
	clrf	((__pbitbssBANK0hh/8)+0)&07Fh
; Clear objects allocated to BANK0l
psect cinit,class=CODE,delta=2
	global __pbssBANK0l
	movlw	low(__pbssBANK0l)
	movwf	fsr0l
	movlw	high(__pbssBANK0l)
	movwf	fsr0h
	movlw	low(02Ch)
	movwf	btemp
	movlw	high(02Ch)
	movwf	btemp+1
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	global __pbssBANK1
	movlw	low(__pbssBANK1)
	movwf	fsr0l
	movlw	high(__pbssBANK1)
	movwf	fsr0h
	movlw	low(02Bh)
	movwf	btemp
	movlw	high(02Bh)
	movwf	btemp+1
	fcall	clear_ram
; Initialize objects allocated to BANK0l
	global __pidataBANK0l,__pdataBANK0l
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0l+0		;fetch initializer
	movwf	__pdataBANK0l+0&07fh		
	fcall	__pidataBANK0l+1		;fetch initializer
	movwf	__pdataBANK0l+1&07fh		
	fcall	__pidataBANK0l+2		;fetch initializer
	movwf	__pdataBANK0l+2&07fh		
	fcall	__pidataBANK0l+3		;fetch initializer
	movwf	__pdataBANK0l+3&07fh		
; Initialize objects allocated to BANK1
	global __pidataBANK1,__pdataBANK1
psect cinit,class=CODE,delta=2
	movlb 1	; select bank1
	fcall	__pidataBANK1+0		;fetch initializer
	movwf	__pdataBANK1+0&07fh		
	fcall	__pidataBANK1+1		;fetch initializer
	movwf	__pdataBANK1+1&07fh		
	fcall	__pidataBANK1+2		;fetch initializer
	movwf	__pdataBANK1+2&07fh		
	fcall	__pidataBANK1+3		;fetch initializer
	movwf	__pdataBANK1+3&07fh		
	fcall	__pidataBANK1+4		;fetch initializer
	movwf	__pdataBANK1+4&07fh		
	fcall	__pidataBANK1+5		;fetch initializer
	movwf	__pdataBANK1+5&07fh		
	fcall	__pidataBANK1+6		;fetch initializer
	movwf	__pdataBANK1+6&07fh		
	fcall	__pidataBANK1+7		;fetch initializer
	movwf	__pdataBANK1+7&07fh		
	fcall	__pidataBANK1+8		;fetch initializer
	movwf	__pdataBANK1+8&07fh		
	fcall	__pidataBANK1+9		;fetch initializer
	movwf	__pdataBANK1+9&07fh		
	fcall	__pidataBANK1+10		;fetch initializer
	movwf	__pdataBANK1+10&07fh		
	fcall	__pidataBANK1+11		;fetch initializer
	movwf	__pdataBANK1+11&07fh		
	fcall	__pidataBANK1+12		;fetch initializer
	movwf	__pdataBANK1+12&07fh		
	fcall	__pidataBANK1+13		;fetch initializer
	movwf	__pdataBANK1+13&07fh		
	fcall	__pidataBANK1+14		;fetch initializer
	movwf	__pdataBANK1+14&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
movlb 0
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_UART_INITIAL
?_UART_INITIAL:	; 0 bytes @ 0x0
	global	??_UART_INITIAL
??_UART_INITIAL:	; 0 bytes @ 0x0
	global	?_DelayMs
?_DelayMs:	; 0 bytes @ 0x0
	global	?_TouchInital
?_TouchInital:	; 0 bytes @ 0x0
	global	?_uart_data_send
?_uart_data_send:	; 0 bytes @ 0x0
	global	??_uart_data_send
??_uart_data_send:	; 0 bytes @ 0x0
	global	?_DataProcessing
?_DataProcessing:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_SysInit
?_SysInit:	; 0 bytes @ 0x0
	global	??_SysInit
??_SysInit:	; 0 bytes @ 0x0
	global	?_Time4Initial
?_Time4Initial:	; 0 bytes @ 0x0
	global	??_Time4Initial
??_Time4Initial:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_DelayUs
?_DelayUs:	; 0 bytes @ 0x0
	global	??_DelayUs
??_DelayUs:	; 0 bytes @ 0x0
	global	?_DIV
?_DIV:	; 0 bytes @ 0x0
	global	??_DIV
??_DIV:	; 0 bytes @ 0x0
	global	?_TouchInit
?_TouchInit:	; 0 bytes @ 0x0
	global	??_TouchInit
??_TouchInit:	; 0 bytes @ 0x0
	global	?_MxSet013
?_MxSet013:	; 0 bytes @ 0x0
	global	??_MxSet013
??_MxSet013:	; 0 bytes @ 0x0
	global	?_StartHigeFreq
?_StartHigeFreq:	; 0 bytes @ 0x0
	global	?_ReadTouchData
?_ReadTouchData:	; 0 bytes @ 0x0
	global	?_HighFreqCo
?_HighFreqCo:	; 0 bytes @ 0x0
	global	??_HighFreqCo
??_HighFreqCo:	; 0 bytes @ 0x0
	global	?___bmul
?___bmul:	; 1 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	DelayUs@Time
DelayUs@Time:	; 1 bytes @ 0x0
	global	TouchInit@Time
TouchInit@Time:	; 1 bytes @ 0x0
	global	MxSet013@a
MxSet013@a:	; 1 bytes @ 0x0
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_StartHigeFreq
??_StartHigeFreq:	; 0 bytes @ 0x1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x1
	global	DelayUs@a
DelayUs@a:	; 1 bytes @ 0x1
	global	uart_data_send@buff
uart_data_send@buff:	; 1 bytes @ 0x1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x1
	ds	1
	global	??_DelayMs
??_DelayMs:	; 0 bytes @ 0x2
	global	DelayMs@Time
DelayMs@Time:	; 1 bytes @ 0x2
	global	uart_data_send@i
uart_data_send@i:	; 1 bytes @ 0x2
	global	StartHigeFreq@a
StartHigeFreq@a:	; 1 bytes @ 0x2
	global	HighFreqCo@a
HighFreqCo@a:	; 1 bytes @ 0x2
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_DataProcessing
??_DataProcessing:	; 0 bytes @ 0x3
	global	DelayMs@a
DelayMs@a:	; 1 bytes @ 0x3
	ds	1
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	DelayMs@b
DelayMs@b:	; 1 bytes @ 0x4
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x4
	ds	1
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x5
	ds	1
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x6
	ds	2
	global	??_TouchInital
??_TouchInital:	; 0 bytes @ 0x8
	ds	3
	global	??_ReadTouchData
??_ReadTouchData:	; 0 bytes @ 0xB
	ds	2
	global	??_TouchKeyScan
??_TouchKeyScan:	; 0 bytes @ 0xD
	global	??_main
??_main:	; 0 bytes @ 0xD
psect	cstackBANK0hh,class=BANK0,space=1
global __pcstackBANK0hh
__pcstackBANK0hh:
	global	?_TouchKeyScan
?_TouchKeyScan:	; 2 bytes @ 0x0
	ds	2
	global	main@data
main@data:	; 6 bytes @ 0x2
	ds	6
;;Data sizes: Strings 0, constant 185, data 19, bss 87, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0hh         21      8       9
;; BANK0l          48      0      48
;; BANK1           80      0      58
;; BANK2           80      0       0
;; BANK3           80      0       0
;; BANK4           80      0       0
;; BANK5           80      0       0
;; BANK6           80      0       0
;; BANK7           80      0       0
;; BANK8           80      0       0
;; BANK9           48      0       0
;; BANK10           0      0       0
;; BANK11           0      0       0
;; BANK12           0      0       0

;;
;; Pointer list with targets:

;; ?_TouchKeyScan	unsigned int  size(1) Largest target is 1
;;		 -> fmd_a(BANK0l[1]), 
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; uart_data_send@buff	PTR unsigned char  size(1) Largest target is 6
;;		 -> main@data(BANK0hh[6]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _TouchKeyScan->_ReadTouchData
;;   _ReadTouchData->_DataProcessing
;;   _DataProcessing->___bmul
;;   _DataProcessing->_StartHigeFreq
;;   _DataProcessing->_HighFreqCo
;;   _DelayMs->_DelayUs
;;   _StartHigeFreq->_TouchInit
;;   _TouchInital->___awdiv
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0hh
;;
;;   _main->_TouchKeyScan
;;
;; Critical Paths under _ISR in BANK0hh
;;
;;   None.
;;
;; Critical Paths under _main in BANK0l
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK0l
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK2
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK4
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK4
;;
;;   None.
;;
;; Critical Paths under _main in BANK5
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK5
;;
;;   None.
;;
;; Critical Paths under _main in BANK6
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK6
;;
;;   None.
;;
;; Critical Paths under _main in BANK7
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK7
;;
;;   None.
;;
;; Critical Paths under _main in BANK8
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK8
;;
;;   None.
;;
;; Critical Paths under _main in BANK9
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK9
;;
;;   None.
;;
;; Critical Paths under _main in BANK10
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK10
;;
;;   None.
;;
;; Critical Paths under _main in BANK11
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK11
;;
;;   None.
;;
;; Critical Paths under _main in BANK12
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK12
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
;; (0) _main                                                 6     6      0    2477
;;                                              2 BANK0hh    6     6      0
;;                            _SysInit
;;                       _UART_INITIAL
;;                            _DelayMs
;;                       _Time4Initial
;;                        _TouchInital
;;                       _TouchKeyScan
;;                     _uart_data_send
;; ---------------------------------------------------------------------------------
;; (1) _TouchKeyScan                                         2     0      2    1658
;;                                              0 BANK0hh    2     0      2
;;                      _ReadTouchData
;; ---------------------------------------------------------------------------------
;; (2) _ReadTouchData                                        3     3      0    1658
;;                                             11 COMMON     2     2      0
;;                          _TouchInit
;;                           _MxSet013
;;                                _DIV
;;                      _StartHigeFreq
;;                     _DataProcessing
;; ---------------------------------------------------------------------------------
;; (3) _DataProcessing                                       8     8      0     914
;;                                              3 COMMON     8     8      0
;;                             ___bmul
;;                      _StartHigeFreq
;;                         _HighFreqCo
;;                                _DIV
;; ---------------------------------------------------------------------------------
;; (1) _DelayMs                                              3     3      0     204
;;                                              2 COMMON     3     3      0
;;                            _DelayUs
;; ---------------------------------------------------------------------------------
;; (4) _StartHigeFreq                                        2     2      0     620
;;                                              1 COMMON     2     2      0
;;                          _TouchInit
;;                                _DIV
;; ---------------------------------------------------------------------------------
;; (2) _DelayUs                                              2     2      0      68
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _TouchInital                                          2     2      0     445
;;                                              8 COMMON     2     2      0
;;                            ___awdiv
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              8     4      4     445
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (4) ___bmul                                               3     2      1     108
;;                                              0 COMMON     3     2      1
;; ---------------------------------------------------------------------------------
;; (4) _HighFreqCo                                           3     3      0     186
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (3) _MxSet013                                             1     1      0      93
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (5) _TouchInit                                            1     1      0      31
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (4) _DIV                                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _uart_data_send                                       3     3      0     133
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _UART_INITIAL                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _Time4Initial                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _SysInit                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (6) _ISR                                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _SysInit
;;   _UART_INITIAL
;;   _DelayMs
;;     _DelayUs
;;   _Time4Initial
;;   _TouchInital
;;     ___awdiv
;;   _TouchKeyScan
;;     _ReadTouchData
;;       _TouchInit
;;       _MxSet013
;;       _DIV
;;       _StartHigeFreq
;;         _TouchInit
;;         _DIV
;;       _DataProcessing
;;         ___bmul
;;         _StartHigeFreq
;;           _TouchInit
;;           _DIV
;;         _HighFreqCo
;;         _DIV
;;   _uart_data_send
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BIGRAM             3F0      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;BITCOMMON            E      0       1       1        7.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;COMMON               E      D       E       2      100.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR2              0      0       0       3        0.0%
;;SFR2                 0      0       0       3        0.0%
;;STACK                0      0       5       3        0.0%
;;BITBANK0hh          15      0       1       4        4.8%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITBANK0l           30      0       0       5        0.0%
;;BITSFR4              0      0       0       5        0.0%
;;SFR4                 0      0       0       5        0.0%
;;BANK0hh             15      8       9       6       42.9%
;;BITSFR5              0      0       0       6        0.0%
;;SFR5                 0      0       0       6        0.0%
;;BANK0l              30      0      30       7      100.0%
;;BITSFR6              0      0       0       7        0.0%
;;SFR6                 0      0       0       7        0.0%
;;BITBANK1            50      0       0       8        0.0%
;;BITSFR7              0      0       0       8        0.0%
;;SFR7                 0      0       0       8        0.0%
;;BANK1               50      0      3A       9       72.5%
;;BITSFR8              0      0       0       9        0.0%
;;SFR8                 0      0       0       9        0.0%
;;BITBANK2            50      0       0      10        0.0%
;;BITSFR9              0      0       0      10        0.0%
;;SFR9                 0      0       0      10        0.0%
;;BANK2               50      0       0      11        0.0%
;;BITSFR10             0      0       0      11        0.0%
;;SFR10                0      0       0      11        0.0%
;;BITBANK3            50      0       0      12        0.0%
;;BITSFR11             0      0       0      12        0.0%
;;SFR11                0      0       0      12        0.0%
;;BANK3               50      0       0      13        0.0%
;;BITSFR12             0      0       0      13        0.0%
;;SFR12                0      0       0      13        0.0%
;;BITBANK4            50      0       0      14        0.0%
;;BITSFR13             0      0       0      14        0.0%
;;SFR13                0      0       0      14        0.0%
;;BANK4               50      0       0      15        0.0%
;;BITSFR14             0      0       0      15        0.0%
;;SFR14                0      0       0      15        0.0%
;;BITBANK5            50      0       0      16        0.0%
;;BITSFR15             0      0       0      16        0.0%
;;SFR15                0      0       0      16        0.0%
;;BANK5               50      0       0      17        0.0%
;;BITSFR16             0      0       0      17        0.0%
;;SFR16                0      0       0      17        0.0%
;;BITBANK6            50      0       0      18        0.0%
;;BITSFR17             0      0       0      18        0.0%
;;SFR17                0      0       0      18        0.0%
;;BANK6               50      0       0      19        0.0%
;;BITSFR18             0      0       0      19        0.0%
;;SFR18                0      0       0      19        0.0%
;;BITBANK7            50      0       0      20        0.0%
;;BITSFR19             0      0       0      20        0.0%
;;SFR19                0      0       0      20        0.0%
;;BANK7               50      0       0      21        0.0%
;;BITSFR20             0      0       0      21        0.0%
;;SFR20                0      0       0      21        0.0%
;;BITSFR21             0      0       0      22        0.0%
;;SFR21                0      0       0      22        0.0%
;;ABS                  0      0      81      22        0.0%
;;BITBANK8            50      0       0      23        0.0%
;;BITSFR22             0      0       0      23        0.0%
;;SFR22                0      0       0      23        0.0%
;;BANK8               50      0       0      24        0.0%
;;BITSFR23             0      0       0      24        0.0%
;;SFR23                0      0       0      24        0.0%
;;BITBANK9            50      0       0      25        0.0%
;;BITSFR24             0      0       0      25        0.0%
;;SFR24                0      0       0      25        0.0%
;;BANK9               30      0       0      26        0.0%
;;BITSFR25             0      0       0      26        0.0%
;;SFR25                0      0       0      26        0.0%
;;BITBANK10           50      0       0      27        0.0%
;;BITSFR26             0      0       0      27        0.0%
;;SFR26                0      0       0      27        0.0%
;;BITSFR27             0      0       0      28        0.0%
;;SFR27                0      0       0      28        0.0%
;;BANK10               0      0       0      28        0.0%
;;BITBANK11           50      0       0      29        0.0%
;;BITSFR28             0      0       0      29        0.0%
;;SFR28                0      0       0      29        0.0%
;;BITSFR29             0      0       0      30        0.0%
;;SFR29                0      0       0      30        0.0%
;;BANK11               0      0       0      30        0.0%
;;BITBANK12           30      0       0      31        0.0%
;;BITSFR30             0      0       0      31        0.0%
;;SFR30                0      0       0      31        0.0%
;;BITSFR31             0      0       0      32        0.0%
;;SFR31                0      0       0      32        0.0%
;;BANK12               0      0       0      32        0.0%
;;DATA                 0      0      86      33        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 272 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  data            6    2[BANK0h] unsigned int [3]
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 1F/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       6       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       6       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called:    6
;; This function calls:
;;		_SysInit
;;		_UART_INITIAL
;;		_DelayMs
;;		_Time4Initial
;;		_TouchInital
;;		_TouchKeyScan
;;		_uart_data_send
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"main.c"
	line	272
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 10
; Regs used in _main: [wreg-status,0+pclath+cstack]
	line	273
	
l13951:	
;main.c: 273: SysInit();
	fcall	_SysInit
	line	275
;main.c: 274: unsigned int data[3];
;main.c: 275: UART_INITIAL();
	fcall	_UART_INITIAL
	line	276
;main.c: 276: DelayMs(100);
	movlw	(064h)
	fcall	_DelayMs
	line	284
;main.c: 284: Time4Initial();
	fcall	_Time4Initial
	line	285
	
l13953:	
;main.c: 285: TouchInital();
	fcall	_TouchInital
	line	288
	
l13955:	
;main.c: 288: varKeyPushCnt = 0;
	clrf	(_varKeyPushCnt)
	clrf	(_varKeyPushCnt+1)
	line	289
	
l13957:	
;main.c: 289: RB0=1;RD3=1;RA0=1;RB1=1;
	bsf	(104/8),(104)&7
	
l13959:	
	bsf	(123/8),(123)&7
	
l13961:	
	bsf	(96/8),(96)&7
	
l13963:	
	bsf	(105/8),(105)&7
	line	301
	
l13965:	
;main.c: 293: {
;main.c: 301: if(unionAllTimeFlag.bitData.B1)
	btfss	(_unionAllTimeFlag),1
	goto	u4561
	goto	u4560
u4561:
	goto	l13965
u4560:
	line	303
	
l13967:	
;main.c: 305: TouchTimeCount = 0;
	bcf	(_unionAllTimeFlag),1
	line	306
	
l13969:	
;main.c: 306: readKeyNum = 0;
	movlb 1	; select bank1
	clrf	(_readKeyNum)^080h	;volatile
	clrf	(_readKeyNum+1)^080h	;volatile
	line	307
	
l13971:	
;main.c: 307: readKeyNum = TouchKeyScan();
	fcall	_TouchKeyScan
	movf	(1+(?_TouchKeyScan)),w
	movlb 1	; select bank1
	movwf	(_readKeyNum+1)^080h	;volatile
	movlb 0	; select bank0
	movf	(0+(?_TouchKeyScan)),w
	movlb 1	; select bank1
	movwf	(_readKeyNum)^080h	;volatile
	line	309
	
l13973:	
;main.c: 309: unionAllKeyFlag.varCharData = (unsigned char)readKeyNum;
	movf	(_readKeyNum)^080h,w	;volatile
	movlb 0	; select bank0
	movwf	(_unionAllKeyFlag)
	line	310
	
l13975:	
;main.c: 310: RB4=0;
	bcf	(108/8),(108)&7
	line	311
	
l13977:	
;main.c: 311: if(unionAllKeyFlag.bitData.B5)
	btfss	(_unionAllKeyFlag),5
	goto	u4571
	goto	u4570
u4571:
	goto	l14005
u4570:
	line	313
	
l13979:	
;main.c: 312: {
;main.c: 313: RD1=1;
	bsf	(121/8),(121)&7
	line	314
	
l13981:	
;main.c: 314: ++varKeyPushCnt;
	incf	(_varKeyPushCnt),f
	skipnz
	incf	(_varKeyPushCnt+1),f
	line	315
	
l13983:	
;main.c: 315: if(varKeyPushCnt >= 625)
	movlw	high(0271h)
	subwf	(_varKeyPushCnt+1),w
	movlw	low(0271h)
	skipnz
	subwf	(_varKeyPushCnt),w
	skipc
	goto	u4581
	goto	u4580
u4581:
	goto	l13991
u4580:
	line	317
	
l13985:	
;main.c: 316: {
;main.c: 317: RC6=1;
	bsf	(118/8),(118)&7
	line	318
	
l13987:	
;main.c: 318: varKeyPushCnt = 625;
	movlw	low(0271h)
	movwf	(_varKeyPushCnt)
	movlw	high(0271h)
	movwf	((_varKeyPushCnt))+1
	line	319
	
l13989:	
;main.c: 319: key_status=1;
	movlb 1	; select bank1
	clrf	(_key_status)^080h
	incf	(_key_status)^080h,f
	clrf	(_key_status+1)^080h
	line	322
;main.c: 322: }
	goto	l13997
	line	323
	
l13991:	
;main.c: 323: else if(varKeyPushCnt >= 15)
	movlw	high(0Fh)
	subwf	(_varKeyPushCnt+1),w
	movlw	low(0Fh)
	skipnz
	subwf	(_varKeyPushCnt),w
	skipc
	goto	u4591
	goto	u4590
u4591:
	goto	l2416
u4590:
	line	325
	
l13993:	
;main.c: 324: {
;main.c: 325: RD0=1;
	bsf	(120/8),(120)&7
	line	326
;main.c: 326: RC6=0;
	bcf	(118/8),(118)&7
	line	327
	
l13995:	
;main.c: 327: key_status=0;
	movlb 1	; select bank1
	clrf	(_key_status)^080h
	clrf	(_key_status+1)^080h
	line	330
;main.c: 330: }
	goto	l13997
	line	331
	
l2416:	
	line	333
;main.c: 331: else
;main.c: 332: {
;main.c: 333: RD0=0;
	bcf	(120/8),(120)&7
	line	334
;main.c: 334: RC6=0;
	bcf	(118/8),(118)&7
	line	336
	
l13997:	
;main.c: 335: }
;main.c: 336: data[0]=key_status;
	movlb 1	; select bank1
	movf	(_key_status+1)^080h,w
	movlb 0	; select bank0
	movwf	(main@data+1)
	movlb 1	; select bank1
	movf	(_key_status)^080h,w
	movlb 0	; select bank0
	movwf	(main@data)
	line	337
	
l13999:	
;main.c: 337: flag=1;
	clrf	(_flag)
	incf	(_flag),f
	line	338
	
l14001:	
;main.c: 338: uart_data_send(data);
	movlw	(main@data)&0ffh
	fcall	_uart_data_send
	line	339
	
l14003:	
;main.c: 339: unionAllKeyFlag.bitData.B5 = 0;
	bcf	(_unionAllKeyFlag),5
	line	340
;main.c: 340: }
	goto	l13965
	line	346
	
l14005:	
;main.c: 341: else
;main.c: 342: {
;main.c: 346: key_status=0;
	movlb 1	; select bank1
	clrf	(_key_status)^080h
	clrf	(_key_status+1)^080h
	line	347
	
l14007:	
;main.c: 347: RD1=0;RC6=0;RB4=0;RD0=0;
	movlb 0	; select bank0
	bcf	(121/8),(121)&7
	
l14009:	
	bcf	(118/8),(118)&7
	
l14011:	
	bcf	(108/8),(108)&7
	
l14013:	
	bcf	(120/8),(120)&7
	line	348
;main.c: 348: varKeyPushCnt = 0;
	clrf	(_varKeyPushCnt)
	clrf	(_varKeyPushCnt+1)
	goto	l13965
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	353
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_TouchKeyScan
psect	text623,local,class=CODE,delta=2
global __ptext623
__ptext623:

;; *************** function _TouchKeyScan *****************
;; Defined at:
;;		line 1321 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[BANK0h] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/1
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       2       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       2       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_ReadTouchData
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text623
	file	"TOUCH.C"
	line	1321
	global	__size_of_TouchKeyScan
	__size_of_TouchKeyScan	equ	__end_of_TouchKeyScan-_TouchKeyScan
	
_TouchKeyScan:	
	opt	stack 10
; Regs used in _TouchKeyScan: [wreg-status,0+pclath+cstack]
	line	1323
	
l13915:	
;TOUCH.C: 1323: ReadTouchData();
	fcall	_ReadTouchData
	line	1325
	
l13917:	
;TOUCH.C: 1325: if((fmd_updataFlag != 2) && (fmd_a2==0))
	movf	(_fmd_updataFlag),w
	xorlw	02h&0ffh
	skipnz
	goto	u4511
	goto	u4510
u4511:
	goto	l13947
u4510:
	
l13919:	
	movf	(_fmd_a2),f
	skipz	;volatile
	goto	u4521
	goto	u4520
u4521:
	goto	l13947
u4520:
	line	1327
	
l13921:	
;TOUCH.C: 1326: {
;TOUCH.C: 1327: if(fmd_Keystatus1 != 0)
	movf	(_fmd_Keystatus1+1),w	;volatile
	iorwf	(_fmd_Keystatus1),w	;volatile
	skipnz
	goto	u4531
	goto	u4530
u4531:
	goto	l13939
u4530:
	line	1329
	
l13923:	
;TOUCH.C: 1328: {
;TOUCH.C: 1329: fmd_updataFlag = 0;
	clrf	(_fmd_updataFlag)
	line	1331
	
l13925:	
	movlb 1	; select bank1
	incf	(_fmd_thedeathcount)^080h,f
	skipnz
	incf	(_fmd_thedeathcount+1)^080h,f
	movlw	high(0Fh)
	subwf	((_fmd_thedeathcount+1)^080h),w
	movlw	low(0Fh)
	skipnz
	subwf	((_fmd_thedeathcount)^080h),w
	skipc
	goto	u4541
	goto	u4540
u4541:
	goto	l13935
u4540:
	line	1333
	
l13927:	
;TOUCH.C: 1332: {
;TOUCH.C: 1333: fmd_thedeathcount=0;
	clrf	(_fmd_thedeathcount)^080h
	clrf	(_fmd_thedeathcount+1)^080h
	line	1335
	
l13929:	
;TOUCH.C: 1335: if(++fmd_thedeathcount1>=fmd_thedeathcount2)
	incf	(_fmd_thedeathcount1)^080h,f
	skipnz
	incf	(_fmd_thedeathcount1+1)^080h,f
	movf	(_fmd_thedeathcount2+1)^080h,w
	subwf	((_fmd_thedeathcount1+1)^080h),w
	skipz
	goto	u4555
	movf	(_fmd_thedeathcount2)^080h,w
	subwf	((_fmd_thedeathcount1)^080h),w
u4555:
	skipc
	goto	u4551
	goto	u4550
u4551:
	goto	l13935
u4550:
	line	1337
	
l13931:	
;TOUCH.C: 1336: {
;TOUCH.C: 1337: fmd_thedeathcount1=0;
	clrf	(_fmd_thedeathcount1)^080h
	clrf	(_fmd_thedeathcount1+1)^080h
	line	1341
	
l13933:	
;TOUCH.C: 1340: {
;TOUCH.C: 1341: fmd_updataFlag = 2;
	movlw	(02h)
	movlb 0	; select bank0
	movwf	(_fmd_updataFlag)
	line	1346
	
l13935:	
;TOUCH.C: 1342: }
;TOUCH.C: 1343: }
;TOUCH.C: 1344: }
;TOUCH.C: 1346: fmd_UpTouchCount = 0;
	movlb 1	; select bank1
	clrf	(_fmd_UpTouchCount)^080h
	clrf	(_fmd_UpTouchCount+1)^080h
	line	1347
	
l13937:	
;TOUCH.C: 1347: fmd_DownTouchCount = 0;
	movlb 0	; select bank0
	clrf	(_fmd_DownTouchCount)
	clrf	(_fmd_DownTouchCount+1)
	line	1348
;TOUCH.C: 1348: }
	goto	l13947
	line	1351
	
l13939:	
;TOUCH.C: 1349: else
;TOUCH.C: 1350: {
;TOUCH.C: 1351: fmd_UpTouchCount++;
	movlb 1	; select bank1
	incf	(_fmd_UpTouchCount)^080h,f
	skipnz
	incf	(_fmd_UpTouchCount+1)^080h,f
	line	1352
;TOUCH.C: 1352: fmd_DownTouchCount++;
	movlb 0	; select bank0
	incf	(_fmd_DownTouchCount),f
	skipnz
	incf	(_fmd_DownTouchCount+1),f
	line	1353
	
l13941:	
;TOUCH.C: 1353: fmd_updataFlag = 1;
	clrf	(_fmd_updataFlag)
	incf	(_fmd_updataFlag),f
	line	1355
	
l13943:	
;TOUCH.C: 1355: fmd_thedeathcount = 0;
	movlb 1	; select bank1
	clrf	(_fmd_thedeathcount)^080h
	clrf	(_fmd_thedeathcount+1)^080h
	line	1356
	
l13945:	
;TOUCH.C: 1356: fmd_thedeathcount1 = 0;
	clrf	(_fmd_thedeathcount1)^080h
	clrf	(_fmd_thedeathcount1+1)^080h
	line	1360
	
l13947:	
;TOUCH.C: 1357: }
;TOUCH.C: 1358: }
;TOUCH.C: 1360: return fmd_Keystatus1;
	movlb 0	; select bank0
	movf	(_fmd_Keystatus1+1),w	;volatile
	movwf	(?_TouchKeyScan+1)
	movf	(_fmd_Keystatus1),w	;volatile
	movwf	(?_TouchKeyScan)
	line	1361
	
l7528:	
	return
	opt stack 0
GLOBAL	__end_of_TouchKeyScan
	__end_of_TouchKeyScan:
;; =============== function _TouchKeyScan ends ============

	signat	_TouchKeyScan,90
	global	_ReadTouchData
psect	text624,local,class=CODE,delta=2
global __ptext624
__ptext624:

;; *************** function _ReadTouchData *****************
;; Defined at:
;;		line 490 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  x               1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/1
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_TouchInit
;;		_MxSet013
;;		_DIV
;;		_StartHigeFreq
;;		_DataProcessing
;; This function is called by:
;;		_TouchKeyScan
;; This function uses a non-reentrant model
;;
psect	text624
	file	"TOUCH.C"
	line	490
	global	__size_of_ReadTouchData
	__size_of_ReadTouchData	equ	__end_of_ReadTouchData-_ReadTouchData
	
_ReadTouchData:	
	opt	stack 10
; Regs used in _ReadTouchData: [wreg-status,0+pclath+cstack]
	line	492
	
l13423:	
;TOUCH.C: 491: unsigned char x;
;TOUCH.C: 492: if(fmd_a<4)
	movlw	(04h)
	movlb 0	; select bank0
	subwf	(_fmd_a),w	;volatile
	skipnc
	goto	u4111
	goto	u4110
u4111:
	goto	l13525
u4110:
	line	497
	
l13425:	
;TOUCH.C: 496: {
;TOUCH.C: 497: fmd_AntiWaterBit = 0;
	clrf	(_fmd_AntiWaterBit)
	line	498
	
l13427:	
;TOUCH.C: 498: for(fmd_x=4;fmd_x<8;fmd_x++)
	movlw	(04h)
	movwf	(_fmd_x)
	line	500
	
l13433:	
	movlw	low(0FFh)
	movwf	(??_ReadTouchData+0)+0
	movlw	high(0FFh)
	movwf	(??_ReadTouchData+0)+0+1
	incf	(_fmd_x),w
	goto	u4124
u4125:
	lsrf	(??_ReadTouchData+0)+1,f
	rrf	(??_ReadTouchData+0)+0,f
u4124:
	decfsz	wreg,f
	goto	u4125
	btfss	0+(??_ReadTouchData+0)+0,(0)&7
	goto	u4131
	goto	u4130
u4131:
	goto	l13437
u4130:
	line	502
	
l13435:	
;TOUCH.C: 501: {
;TOUCH.C: 502: fmd_AntiWaterBit = fmd_x-4;
	movf	(_fmd_x),w
	addlw	0FCh
	movwf	(_fmd_AntiWaterBit)
	line	498
	
l13437:	
	incf	(_fmd_x),f
	movlw	(08h)
	subwf	(_fmd_x),w
	skipc
	goto	u4141
	goto	u4140
u4141:
	goto	l13433
u4140:
	line	505
	
l13439:	
	movlw	(01h)
	movwf	(??_ReadTouchData+0)+0
	incf	(_fmd_a),w	;volatile
	goto	u4154
u4155:
	lslf	(??_ReadTouchData+0)+0,f
u4154:
	decfsz	wreg,f
	goto	u4155
	movf	0+(??_ReadTouchData+0)+0,w
	xorlw	0ffh
	movlb 7	; select bank7
	movwf	(911)^0380h	;volatile
	line	506
	
l13441:	
;TOUCH.C: 506: WPROOF2 = 0;
	clrf	(912)^0380h	;volatile
	line	507
	
l13443:	
;TOUCH.C: 507: WPROOF3 = fmd_a|0x80;
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	iorlw	080h
	movlb 7	; select bank7
	movwf	(913)^0380h	;volatile
	line	519
;TOUCH.C: 508: }
	
l13447:	
;TOUCH.C: 518: {
;TOUCH.C: 519: TouchInit(62);
	movlw	(03Eh)
	fcall	_TouchInit
	line	520
	
l13449:	
;TOUCH.C: 520: TKM0C0 = 0x00 | (fmd_a << 6);
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(918)^0380h	;volatile
	line	521
	
l13451:	
;TOUCH.C: 521: TKM1C0 = 0x00 | (fmd_AntiWaterBit << 6);
	movlb 0	; select bank0
	movf	(_fmd_AntiWaterBit),w
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(920)^0380h	;volatile
	line	522
	
l13453:	
;TOUCH.C: 522: TKM3C0 = 0xC0;
	movlw	(0C0h)
	movwf	(924)^0380h	;volatile
	line	523
	
l13455:	
;TOUCH.C: 523: MxSet013(0B00111111);
	movlw	(03Fh)
	fcall	_MxSet013
	line	535
;TOUCH.C: 524: }
	
l13471:	
;TOUCH.C: 534: }
;TOUCH.C: 535: TKST = 1;
	bsf	(7277/8)^0380h,(7277)&7
	line	536
;TOUCH.C: 536: while(TKRCOV==0);
	
l7343:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u4161
	goto	u4160
u4161:
	goto	l7343
u4160:
	line	538
	
l13473:	
;TOUCH.C: 538: fmd_OriginalData = (TKM016DH << 8) +TKM016DL;
	movlb 31	; select bank31
	movf	(3989)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(3988)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	539
;TOUCH.C: 539: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	540
	
l13475:	
;TOUCH.C: 540: DIV();
	fcall	_DIV
	line	541
	
l13477:	
;TOUCH.C: 541: fmd_TouchDataBuff_Key[0] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	(_fmd_TouchDataBuff_Key+1)
	movf	(87),w
	movwf	(_fmd_TouchDataBuff_Key)
	line	543
	
l13479:	
;TOUCH.C: 543: fmd_nodownsum_Key[fmd_a][0] = fmd_TouchDataBuff_Key[0];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	(_fmd_TouchDataBuff_Key),w
	movwi	[0]fsr1
	movf	(_fmd_TouchDataBuff_Key+1),w
	movwi	[1]fsr1
	line	549
	
l13481:	
;TOUCH.C: 548: {
;TOUCH.C: 549: TouchInit(31);
	movlw	(01Fh)
	fcall	_TouchInit
	line	550
	
l13483:	
;TOUCH.C: 550: TKM0C0 = 0x00 | (fmd_a<<6);
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(918)^0380h	;volatile
	line	551
	
l13485:	
;TOUCH.C: 551: TKM1C0 = 0x00 | (fmd_AntiWaterBit << 6);
	movlb 0	; select bank0
	movf	(_fmd_AntiWaterBit),w
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(920)^0380h	;volatile
	line	552
	
l13487:	
;TOUCH.C: 552: TKM3C0 = 0xC0;
	movlw	(0C0h)
	movwf	(924)^0380h	;volatile
	line	553
	
l13489:	
;TOUCH.C: 553: MxSet013(0B01010010);
	movlw	(052h)
	fcall	_MxSet013
	line	565
;TOUCH.C: 554: }
	
l13505:	
;TOUCH.C: 564: }
;TOUCH.C: 565: TKST = 1;
	bsf	(7277/8)^0380h,(7277)&7
	line	566
;TOUCH.C: 566: while(TKRCOV==0);
	
l7348:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u4171
	goto	u4170
u4171:
	goto	l7348
u4170:
	line	568
	
l13507:	
;TOUCH.C: 568: fmd_OriginalData = (TKM016DH << 8) +TKM016DL;
	movlb 31	; select bank31
	movf	(3989)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(3988)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	569
;TOUCH.C: 569: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	571
	
l13509:	
;TOUCH.C: 571: DIV();
	fcall	_DIV
	line	572
	
l13511:	
;TOUCH.C: 572: fmd_TouchDataBuff_Key[1] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	1+(_fmd_TouchDataBuff_Key)+02h
	movf	(87),w
	movwf	0+(_fmd_TouchDataBuff_Key)+02h
	line	574
	
l13513:	
;TOUCH.C: 574: fmd_nodownsum_Key[fmd_a][1] = fmd_TouchDataBuff_Key[1];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	02h
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+02h,w
	movwi	[0]fsr1
	movf	1+(_fmd_TouchDataBuff_Key)+02h,w
	movwi	[1]fsr1
	line	576
	
l13515:	
;TOUCH.C: 576: if((fmd_DownTouchCount == fmd_DownDataTime) || fmd_updataFlag == 2)
	movf	(_fmd_DownDataTime+1),w
	xorwf	(_fmd_DownTouchCount+1),w
	skipz
	goto	u4185
	movf	(_fmd_DownDataTime),w
	xorwf	(_fmd_DownTouchCount),w
u4185:

	skipnz
	goto	u4181
	goto	u4180
u4181:
	goto	l7353
u4180:
	
l13517:	
	movf	(_fmd_updataFlag),w
	xorlw	02h&0ffh
	skipz
	goto	u4191
	goto	u4190
u4191:
	goto	l7351
u4190:
	
l7353:	
	line	578
;TOUCH.C: 577: {
;TOUCH.C: 578: fmd_HfreqOn = 1;
	clrf	(_fmd_HfreqOn)
	incf	(_fmd_HfreqOn),f
	line	579
	
l7351:	
	line	580
;TOUCH.C: 579: }
;TOUCH.C: 580: fmd_HfreqOn = 1;
	clrf	(_fmd_HfreqOn)
	incf	(_fmd_HfreqOn),f
	line	581
	
l13519:	
;TOUCH.C: 581: StartHigeFreq(fmd_a);
	movf	(_fmd_a),w	;volatile
	fcall	_StartHigeFreq
	line	582
	
l13521:	
;TOUCH.C: 582: fmd_HfreqOn = 0;
	movlb 0	; select bank0
	clrf	(_fmd_HfreqOn)
	line	585
	
l13523:	
;TOUCH.C: 585: DataProcessing();
	fcall	_DataProcessing
	line	586
;TOUCH.C: 586: }
	goto	l13813
	line	587
	
l13525:	
;TOUCH.C: 587: else if(fmd_a<8)
	movlw	(08h)
	subwf	(_fmd_a),w	;volatile
	skipnc
	goto	u4201
	goto	u4200
u4201:
	goto	l13627
u4200:
	line	592
	
l13527:	
;TOUCH.C: 591: {
;TOUCH.C: 592: fmd_AntiWaterBit = 0;
	clrf	(_fmd_AntiWaterBit)
	line	593
;TOUCH.C: 593: for(fmd_x=0;fmd_x<3;fmd_x++)
	clrf	(_fmd_x)
	line	595
	
l13533:	
	movlw	low(0FFh)
	movwf	(??_ReadTouchData+0)+0
	movlw	high(0FFh)
	movwf	(??_ReadTouchData+0)+0+1
	incf	(_fmd_x),w
	goto	u4214
u4215:
	lsrf	(??_ReadTouchData+0)+1,f
	rrf	(??_ReadTouchData+0)+0,f
u4214:
	decfsz	wreg,f
	goto	u4215
	btfss	0+(??_ReadTouchData+0)+0,(0)&7
	goto	u4221
	goto	u4220
u4221:
	goto	l13537
u4220:
	line	597
	
l13535:	
;TOUCH.C: 596: {
;TOUCH.C: 597: fmd_AntiWaterBit = fmd_x;
	movf	(_fmd_x),w
	movwf	(_fmd_AntiWaterBit)
	line	593
	
l13537:	
	incf	(_fmd_x),f
	
l13539:	
	movlw	(03h)
	subwf	(_fmd_x),w
	skipc
	goto	u4231
	goto	u4230
u4231:
	goto	l13533
u4230:
	line	600
	
l13541:	
	movlw	(01h)
	movwf	(??_ReadTouchData+0)+0
	incf	(_fmd_a),w	;volatile
	goto	u4244
u4245:
	lslf	(??_ReadTouchData+0)+0,f
u4244:
	decfsz	wreg,f
	goto	u4245
	movf	0+(??_ReadTouchData+0)+0,w
	xorlw	0ffh
	movlb 7	; select bank7
	movwf	(911)^0380h	;volatile
	line	601
	
l13543:	
;TOUCH.C: 601: WPROOF2 = 0;
	clrf	(912)^0380h	;volatile
	line	602
	
l13545:	
;TOUCH.C: 602: WPROOF3 = fmd_a|0x80;
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	iorlw	080h
	movlb 7	; select bank7
	movwf	(913)^0380h	;volatile
	line	614
;TOUCH.C: 603: }
	
l13549:	
;TOUCH.C: 613: {
;TOUCH.C: 614: TouchInit(62);
	movlw	(03Eh)
	fcall	_TouchInit
	line	615
	
l13551:	
;TOUCH.C: 615: TKM1C0 = 0x00 | ((fmd_a-4)<<6);
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(920)^0380h	;volatile
	line	616
	
l13553:	
;TOUCH.C: 616: TKM0C0 = 0x00 | (fmd_AntiWaterBit << 6);
	movlb 0	; select bank0
	movf	(_fmd_AntiWaterBit),w
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(918)^0380h	;volatile
	line	617
	
l13555:	
;TOUCH.C: 617: TKM3C0 = 0xC0;
	movlw	(0C0h)
	movwf	(924)^0380h	;volatile
	line	618
	
l13557:	
;TOUCH.C: 618: MxSet013(0B00111111);
	movlw	(03Fh)
	fcall	_MxSet013
	line	630
;TOUCH.C: 619: }
	
l13573:	
;TOUCH.C: 629: }
;TOUCH.C: 630: TKST = 1;
	bsf	(7277/8)^0380h,(7277)&7
	line	631
;TOUCH.C: 631: while(TKRCOV==0);
	
l7363:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u4251
	goto	u4250
u4251:
	goto	l7363
u4250:
	line	633
	
l13575:	
;TOUCH.C: 633: fmd_OriginalData = (TKM116DH << 8) +TKM116DL;
	movlb 31	; select bank31
	movf	(3997)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(3996)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	634
;TOUCH.C: 634: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	635
	
l13577:	
;TOUCH.C: 635: DIV();
	fcall	_DIV
	line	636
	
l13579:	
;TOUCH.C: 636: fmd_TouchDataBuff_Key[0] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	(_fmd_TouchDataBuff_Key+1)
	movf	(87),w
	movwf	(_fmd_TouchDataBuff_Key)
	line	637
	
l13581:	
;TOUCH.C: 637: fmd_nodownsum_Key[fmd_a][0] = fmd_TouchDataBuff_Key[0];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	(_fmd_TouchDataBuff_Key),w
	movwi	[0]fsr1
	movf	(_fmd_TouchDataBuff_Key+1),w
	movwi	[1]fsr1
	line	642
	
l13583:	
;TOUCH.C: 641: {
;TOUCH.C: 642: TouchInit(31);
	movlw	(01Fh)
	fcall	_TouchInit
	line	643
	
l13585:	
;TOUCH.C: 643: TKM1C0 = 0x00 | ((fmd_a-4)<<6);
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(920)^0380h	;volatile
	line	644
	
l13587:	
;TOUCH.C: 644: TKM0C0 = 0x00 | (fmd_AntiWaterBit << 6);
	movlb 0	; select bank0
	movf	(_fmd_AntiWaterBit),w
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(918)^0380h	;volatile
	line	645
	
l13589:	
;TOUCH.C: 645: TKM3C0 = 0xC0;
	movlw	(0C0h)
	movwf	(924)^0380h	;volatile
	line	646
	
l13591:	
;TOUCH.C: 646: MxSet013(0B01010010);
	movlw	(052h)
	fcall	_MxSet013
	line	658
;TOUCH.C: 647: }
	
l13607:	
;TOUCH.C: 657: }
;TOUCH.C: 658: TKST = 1;
	bsf	(7277/8)^0380h,(7277)&7
	line	659
;TOUCH.C: 659: while(TKRCOV==0);
	
l7368:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u4261
	goto	u4260
u4261:
	goto	l7368
u4260:
	line	661
	
l13609:	
;TOUCH.C: 661: fmd_OriginalData = (TKM116DH << 8) +TKM116DL;
	movlb 31	; select bank31
	movf	(3997)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(3996)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	662
;TOUCH.C: 662: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	663
	
l13611:	
;TOUCH.C: 663: DIV();
	fcall	_DIV
	line	664
	
l13613:	
;TOUCH.C: 664: fmd_TouchDataBuff_Key[1] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	1+(_fmd_TouchDataBuff_Key)+02h
	movf	(87),w
	movwf	0+(_fmd_TouchDataBuff_Key)+02h
	line	665
	
l13615:	
;TOUCH.C: 665: fmd_nodownsum_Key[fmd_a][1] = fmd_TouchDataBuff_Key[1];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	02h
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+02h,w
	movwi	[0]fsr1
	movf	1+(_fmd_TouchDataBuff_Key)+02h,w
	movwi	[1]fsr1
	line	668
	
l13617:	
;TOUCH.C: 668: if((fmd_DownTouchCount == fmd_DownDataTime) || fmd_updataFlag == 2)
	movf	(_fmd_DownDataTime+1),w
	xorwf	(_fmd_DownTouchCount+1),w
	skipz
	goto	u4275
	movf	(_fmd_DownDataTime),w
	xorwf	(_fmd_DownTouchCount),w
u4275:

	skipnz
	goto	u4271
	goto	u4270
u4271:
	goto	l7373
u4270:
	
l13619:	
	movf	(_fmd_updataFlag),w
	xorlw	02h&0ffh
	skipz
	goto	u4281
	goto	u4280
u4281:
	goto	l13621
u4280:
	
l7373:	
	line	670
;TOUCH.C: 669: {
;TOUCH.C: 670: fmd_HfreqOn = 1;
	clrf	(_fmd_HfreqOn)
	incf	(_fmd_HfreqOn),f
	line	672
	
l13621:	
;TOUCH.C: 671: }
;TOUCH.C: 672: StartHigeFreq(fmd_a);
	movf	(_fmd_a),w	;volatile
	fcall	_StartHigeFreq
	goto	l13521
	line	677
	
l13627:	
;TOUCH.C: 677: else if(fmd_a<12)
	movlw	(0Ch)
	subwf	(_fmd_a),w	;volatile
	skipnc
	goto	u4291
	goto	u4290
u4291:
	goto	l13721
u4290:
	line	682
	
l13629:	
;TOUCH.C: 681: {
;TOUCH.C: 682: WPROOF1 = 0;
	movlb 7	; select bank7
	clrf	(911)^0380h	;volatile
	line	683
	clrf	(912)^0380h	;volatile
	line	684
	
l13631:	
;TOUCH.C: 684: WPROOF3 = (fmd_a-8)<<3;
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	0C0h
	movlb 7	; select bank7
	movwf	(913)^0380h	;volatile
	line	696
;TOUCH.C: 685: }
	
l13635:	
;TOUCH.C: 695: {
;TOUCH.C: 696: TouchInit(62);
	movlw	(03Eh)
	fcall	_TouchInit
	line	697
	
l13637:	
;TOUCH.C: 697: M2ANALOG = 0B00111111;
	movlw	(03Fh)
	movlb 7	; select bank7
	movwf	(916)^0380h	;volatile
	line	698
	
l13639:	
;TOUCH.C: 698: M3ANALOG = 0B00111111;
	movlw	(03Fh)
	movwf	(917)^0380h	;volatile
	line	699
	
l13641:	
;TOUCH.C: 699: TKM2C0 = 0x00 | ((fmd_a-8)<<6);
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(922)^0380h	;volatile
	line	700
	
l13643:	
	movlw	(010h)
	movwf	(923)^0380h	;volatile
	line	701
	
l13645:	
	movlw	(018h)
	movwf	(925)^0380h	;volatile
	line	702
	
l13647:	
;TOUCH.C: 702: TKM3C0 = 0xC0;
	movlw	(0C0h)
	movwf	(924)^0380h	;volatile
	line	714
;TOUCH.C: 703: }
	
l13663:	
;TOUCH.C: 713: }
;TOUCH.C: 714: TKST = 1;
	bsf	(7277/8)^0380h,(7277)&7
	line	715
;TOUCH.C: 715: while(TKRCOV==0);
	
l7380:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u4301
	goto	u4300
u4301:
	goto	l7380
u4300:
	line	717
	
l13665:	
;TOUCH.C: 717: fmd_OriginalData = (TKM216DH << 8) +TKM216DL;
	movlb 31	; select bank31
	movf	(4005)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(4004)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	718
;TOUCH.C: 718: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	719
	
l13667:	
;TOUCH.C: 719: DIV();
	fcall	_DIV
	line	720
	
l13669:	
;TOUCH.C: 720: fmd_TouchDataBuff_Key[0] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	(_fmd_TouchDataBuff_Key+1)
	movf	(87),w
	movwf	(_fmd_TouchDataBuff_Key)
	line	721
	
l13671:	
;TOUCH.C: 721: fmd_nodownsum_Key[fmd_a][0] = fmd_TouchDataBuff_Key[0];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	(_fmd_TouchDataBuff_Key),w
	movwi	[0]fsr1
	movf	(_fmd_TouchDataBuff_Key+1),w
	movwi	[1]fsr1
	line	736
	
l13687:	
;TOUCH.C: 734: else
;TOUCH.C: 735: {
;TOUCH.C: 736: TouchInit(31);
	movlw	(01Fh)
	fcall	_TouchInit
	line	737
	
l13689:	
;TOUCH.C: 737: M2ANALOG = 0B01010010;
	movlw	(052h)
	movlb 7	; select bank7
	movwf	(916)^0380h	;volatile
	line	738
	
l13691:	
;TOUCH.C: 738: TKM2C0 = 0x00 | (fmd_a-8<<6);
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(922)^0380h	;volatile
	line	739
	
l13693:	
;TOUCH.C: 739: TKM2C1 = 0x10 | (0x01 << fmd_a-8);
	movlw	(01h)
	movwf	(??_ReadTouchData+0)+0
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	addlw	-8
	incf	wreg,f
	goto	u4314
u4315:
	lslf	(??_ReadTouchData+0)+0,f
u4314:
	decfsz	wreg,f
	goto	u4315
	movf	0+(??_ReadTouchData+0)+0,w
	iorlw	010h
	movlb 7	; select bank7
	movwf	(923)^0380h	;volatile
	line	740
	
l13695:	
;TOUCH.C: 740: M3ANALOG = 0B01010010;
	movlw	(052h)
	movwf	(917)^0380h	;volatile
	line	741
	
l13697:	
;TOUCH.C: 741: TKM3C0 = 0xC0;
	movlw	(0C0h)
	movwf	(924)^0380h	;volatile
	line	742
	
l13699:	
;TOUCH.C: 742: TKM3C1 = 0x18;
	movlw	(018h)
	movwf	(925)^0380h	;volatile
	line	744
	
l13701:	
;TOUCH.C: 743: }
;TOUCH.C: 744: TKST = 1;
	bsf	(7277/8)^0380h,(7277)&7
	line	745
;TOUCH.C: 745: while(TKRCOV==0);
	
l7385:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u4321
	goto	u4320
u4321:
	goto	l7385
u4320:
	line	747
	
l13703:	
;TOUCH.C: 747: fmd_OriginalData = (TKM216DH << 8) +TKM216DL;
	movlb 31	; select bank31
	movf	(4005)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(4004)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	748
;TOUCH.C: 748: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	749
	
l13705:	
;TOUCH.C: 749: DIV();
	fcall	_DIV
	line	750
	
l13707:	
;TOUCH.C: 750: fmd_TouchDataBuff_Key[1] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	1+(_fmd_TouchDataBuff_Key)+02h
	movf	(87),w
	movwf	0+(_fmd_TouchDataBuff_Key)+02h
	line	751
	
l13709:	
;TOUCH.C: 751: fmd_nodownsum_Key[fmd_a][1] = fmd_TouchDataBuff_Key[1];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	02h
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+02h,w
	movwi	[0]fsr1
	movf	1+(_fmd_TouchDataBuff_Key)+02h,w
	movwi	[1]fsr1
	line	754
	
l13711:	
;TOUCH.C: 754: if((fmd_DownTouchCount == fmd_DownDataTime) || fmd_updataFlag == 2)
	movf	(_fmd_DownDataTime+1),w
	xorwf	(_fmd_DownTouchCount+1),w
	skipz
	goto	u4335
	movf	(_fmd_DownDataTime),w
	xorwf	(_fmd_DownTouchCount),w
u4335:

	skipnz
	goto	u4331
	goto	u4330
u4331:
	goto	l7390
u4330:
	
l13713:	
	movf	(_fmd_updataFlag),w
	xorlw	02h&0ffh
	skipz
	goto	u4341
	goto	u4340
u4341:
	goto	l13715
u4340:
	
l7390:	
	line	756
;TOUCH.C: 755: {
;TOUCH.C: 756: fmd_HfreqOn = 1;
	clrf	(_fmd_HfreqOn)
	incf	(_fmd_HfreqOn),f
	line	758
	
l13715:	
;TOUCH.C: 757: }
;TOUCH.C: 758: StartHigeFreq(fmd_a);
	movf	(_fmd_a),w	;volatile
	fcall	_StartHigeFreq
	goto	l13521
	line	768
	
l13721:	
;TOUCH.C: 767: {
;TOUCH.C: 768: WPROOF1 = 0;
	movlb 7	; select bank7
	clrf	(911)^0380h	;volatile
	line	769
	clrf	(912)^0380h	;volatile
	line	770
	
l13723:	
;TOUCH.C: 770: WPROOF3 = (fmd_a-8)<<3;
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	0C0h
	movlb 7	; select bank7
	movwf	(913)^0380h	;volatile
	line	782
;TOUCH.C: 771: }
	
l13727:	
;TOUCH.C: 781: {
;TOUCH.C: 782: TouchInit(62);
	movlw	(03Eh)
	fcall	_TouchInit
	line	783
	
l13729:	
;TOUCH.C: 783: M2ANALOG = 0B00111111;
	movlw	(03Fh)
	movlb 7	; select bank7
	movwf	(916)^0380h	;volatile
	line	784
	
l13731:	
;TOUCH.C: 784: M3ANALOG = 0B00111111;
	movlw	(03Fh)
	movwf	(917)^0380h	;volatile
	line	785
	
l13733:	
;TOUCH.C: 785: TKM2C0 = 0x00;
	clrf	(922)^0380h	;volatile
	line	786
	
l13735:	
	movlw	(090h)
	movwf	(923)^0380h	;volatile
	line	787
	
l13737:	
	movlw	(098h)
	movwf	(925)^0380h	;volatile
	line	788
	
l13739:	
;TOUCH.C: 788: TKM3C0 = 0x00 | ((fmd_a-12)<<6);
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(924)^0380h	;volatile
	line	801
;TOUCH.C: 789: }
	
l13755:	
;TOUCH.C: 799: }
;TOUCH.C: 801: TKST = 1;
	bsf	(7277/8)^0380h,(7277)&7
	line	802
;TOUCH.C: 802: while(TKRCOV==0);
	
l7396:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u4351
	goto	u4350
u4351:
	goto	l7396
u4350:
	line	804
	
l13757:	
;TOUCH.C: 804: fmd_OriginalData = (TKM216DH << 8) +TKM216DL;
	movlb 31	; select bank31
	movf	(4005)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(4004)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	805
;TOUCH.C: 805: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	806
	
l13759:	
;TOUCH.C: 806: DIV();
	fcall	_DIV
	line	807
	
l13761:	
;TOUCH.C: 807: fmd_TouchDataBuff_Key[0] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	(_fmd_TouchDataBuff_Key+1)
	movf	(87),w
	movwf	(_fmd_TouchDataBuff_Key)
	line	808
	
l13763:	
;TOUCH.C: 808: fmd_nodownsum_Key[fmd_a][0] = fmd_TouchDataBuff_Key[0];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	(_fmd_TouchDataBuff_Key),w
	movwi	[0]fsr1
	movf	(_fmd_TouchDataBuff_Key+1),w
	movwi	[1]fsr1
	line	813
	
l13765:	
;TOUCH.C: 812: {
;TOUCH.C: 813: TouchInit(31);
	movlw	(01Fh)
	fcall	_TouchInit
	line	814
	
l13767:	
;TOUCH.C: 814: M2ANALOG = 0B01010010;
	movlw	(052h)
	movlb 7	; select bank7
	movwf	(916)^0380h	;volatile
	line	815
	
l13769:	
;TOUCH.C: 815: M3ANALOG = 0B01010010;
	movlw	(052h)
	movwf	(917)^0380h	;volatile
	line	816
	
l13771:	
;TOUCH.C: 816: TKM2C0 = 0x00;
	clrf	(922)^0380h	;volatile
	line	817
	
l13773:	
	movlw	(090h)
	movwf	(923)^0380h	;volatile
	line	818
	
l13775:	
	movlw	(098h)
	movwf	(925)^0380h	;volatile
	line	819
	
l13777:	
;TOUCH.C: 819: TKM3C0 = 0x00 | ((fmd_a-12)<<6);
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	movwf	(??_ReadTouchData+0)+0
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,f
	rrf	(??_ReadTouchData+0)+0,w
	andlw	0c0h
	movlb 7	; select bank7
	movwf	(924)^0380h	;volatile
	line	831
;TOUCH.C: 820: }
	
l13793:	
;TOUCH.C: 830: }
;TOUCH.C: 831: TKST = 1;
	bsf	(7277/8)^0380h,(7277)&7
	line	832
;TOUCH.C: 832: while(TKRCOV==0);
	
l7401:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u4361
	goto	u4360
u4361:
	goto	l7401
u4360:
	line	834
	
l13795:	
;TOUCH.C: 834: fmd_OriginalData = (TKM216DH << 8) +TKM216DL;
	movlb 31	; select bank31
	movf	(4005)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(4004)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	835
;TOUCH.C: 835: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	836
	
l13797:	
;TOUCH.C: 836: DIV();
	fcall	_DIV
	line	838
	
l13799:	
;TOUCH.C: 838: fmd_TouchDataBuff_Key[1] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	1+(_fmd_TouchDataBuff_Key)+02h
	movf	(87),w
	movwf	0+(_fmd_TouchDataBuff_Key)+02h
	line	839
	
l13801:	
;TOUCH.C: 839: fmd_nodownsum_Key[fmd_a][1] = fmd_TouchDataBuff_Key[1];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	02h
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+02h,w
	movwi	[0]fsr1
	movf	1+(_fmd_TouchDataBuff_Key)+02h,w
	movwi	[1]fsr1
	line	842
	
l13803:	
;TOUCH.C: 842: if((fmd_DownTouchCount == fmd_DownDataTime) || fmd_updataFlag == 2)
	movf	(_fmd_DownDataTime+1),w
	xorwf	(_fmd_DownTouchCount+1),w
	skipz
	goto	u4375
	movf	(_fmd_DownDataTime),w
	xorwf	(_fmd_DownTouchCount),w
u4375:

	skipnz
	goto	u4371
	goto	u4370
u4371:
	goto	l7406
u4370:
	
l13805:	
	movf	(_fmd_updataFlag),w
	xorlw	02h&0ffh
	skipz
	goto	u4381
	goto	u4380
u4381:
	goto	l13807
u4380:
	
l7406:	
	line	844
;TOUCH.C: 843: {
;TOUCH.C: 844: fmd_HfreqOn = 1;
	clrf	(_fmd_HfreqOn)
	incf	(_fmd_HfreqOn),f
	line	846
	
l13807:	
;TOUCH.C: 845: }
;TOUCH.C: 846: StartHigeFreq(fmd_a);
	movf	(_fmd_a),w	;volatile
	fcall	_StartHigeFreq
	goto	l13521
	line	853
	
l13813:	
;TOUCH.C: 849: }
;TOUCH.C: 853: if(fmd_a3==fmd_a)
	movf	(_fmd_a3),w	;volatile
	xorwf	(_fmd_a),w	;volatile
	skipz
	goto	u4391
	goto	u4390
u4391:
	goto	l7407
u4390:
	line	855
	
l13815:	
;TOUCH.C: 854: {
;TOUCH.C: 855: if(fmd_f_firstloop == 1)
	btfss	(_fmd_f_firstloop/8),(_fmd_f_firstloop)&7
	goto	u4401
	goto	u4400
u4401:
	goto	l13819
u4400:
	line	857
	
l13817:	
;TOUCH.C: 856: {
;TOUCH.C: 857: fmd_f_firstloop = 0;
	bcf	(_fmd_f_firstloop/8),(_fmd_f_firstloop)&7
	line	858
;TOUCH.C: 858: }
	goto	l7407
	line	861
	
l13819:	
;TOUCH.C: 859: else
;TOUCH.C: 860: {
;TOUCH.C: 861: fmd_a1=0;
	clrf	(_fmd_a1)	;volatile
	line	862
;TOUCH.C: 862: for(fmd_u=0;fmd_u<15;fmd_u++)
	clrf	(_fmd_u)	;volatile
	
l13821:	
	movlw	(0Fh)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u4411
	goto	u4410
u4411:
	goto	l13825
u4410:
	goto	l7411
	line	864
	
l13825:	
;TOUCH.C: 863: {
;TOUCH.C: 864: if((fmd_Keystatus2 >> fmd_u) & 0x01)
	movf	(_fmd_Keystatus2+1),w	;volatile
	movwf	(??_ReadTouchData+0)+0+1
	movf	(_fmd_Keystatus2),w	;volatile
	movwf	(??_ReadTouchData+0)+0
	incf	(_fmd_u),w	;volatile
	goto	u4424
u4425:
	lsrf	(??_ReadTouchData+0)+1,f
	rrf	(??_ReadTouchData+0)+0,f
u4424:
	decfsz	wreg,f
	goto	u4425
	btfss	0+(??_ReadTouchData+0)+0,(0)&7
	goto	u4431
	goto	u4430
u4431:
	goto	l7412
u4430:
	line	866
	
l13827:	
;TOUCH.C: 865: {
;TOUCH.C: 866: fmd_a1++;
	incf	(_fmd_a1),f	;volatile
	line	867
	
l7412:	
	line	862
	incf	(_fmd_u),f	;volatile
	goto	l13821
	
l7411:	
	line	870
;TOUCH.C: 867: }
;TOUCH.C: 868: }
;TOUCH.C: 870: fmd_f_forbidden=0;
	bcf	(_fmd_f_forbidden/8),(_fmd_f_forbidden)&7
	line	874
;TOUCH.C: 871: if(FORBIDDENKEY11&fmd_Keystatus2)
	
l7413:	
	line	876
;TOUCH.C: 874: }
;TOUCH.C: 876: fmd_f_main_key=0;
	bcf	(_fmd_f_main_key/8),(_fmd_f_main_key)&7
	file	"touch.h"
	line	308
	
l13833:	
	movlw	(0FFh)
	movwf	(_fmd_u)	;volatile
	file	"TOUCH.C"
	line	880
	
l13835:	
;TOUCH.C: 880: if((fmd_Keystatus2 >> fmd_u)&0x01)
	movf	(_fmd_Keystatus2+1),w	;volatile
	movwf	(??_ReadTouchData+0)+0+1
	movf	(_fmd_Keystatus2),w	;volatile
	movwf	(??_ReadTouchData+0)+0
	incf	(_fmd_u),w	;volatile
	goto	u4444
u4445:
	lsrf	(??_ReadTouchData+0)+1,f
	rrf	(??_ReadTouchData+0)+0,f
u4444:
	decfsz	wreg,f
	goto	u4445
	btfss	0+(??_ReadTouchData+0)+0,(0)&7
	goto	u4451
	goto	u4450
u4451:
	goto	l13839
u4450:
	line	882
	
l13837:	
;TOUCH.C: 881: {
;TOUCH.C: 882: fmd_f_main_key=1;
	bsf	(_fmd_f_main_key/8),(_fmd_f_main_key)&7
	line	887
	
l13839:	
;TOUCH.C: 886: {
;TOUCH.C: 887: if(fmd_PressOff == 1 && (fmd_PressOffCount != 1) && (fmd_TestCount<5))
	decf	(_fmd_PressOff),w
	skipz
	goto	u4461
	goto	u4460
u4461:
	goto	l13903
u4460:
	
l13841:	
	decf	(_fmd_PressOffCount),w
	skipnz
	goto	u4471
	goto	u4470
u4471:
	goto	l13903
u4470:
	
l13843:	
	movlw	(05h)
	subwf	(_fmd_TestCount),w
	skipnc
	goto	u4481
	goto	u4480
u4481:
	goto	l13903
u4480:
	line	889
	
l13845:	
;TOUCH.C: 888: {
;TOUCH.C: 889: if(fmd_Keystatus !=0)
	movf	(_fmd_Keystatus+1),w	;volatile
	iorwf	(_fmd_Keystatus),w	;volatile
	skipnz
	goto	u4491
	goto	u4490
u4491:
	goto	l13851
u4490:
	line	891
	
l13847:	
;TOUCH.C: 890: {
;TOUCH.C: 891: fmd_antishaketimecount1=0;
	clrf	(_fmd_antishaketimecount1)
	line	895
;TOUCH.C: 894: {
;TOUCH.C: 895: fmd_antishaketimecount=0;
	clrf	(_fmd_antishaketimecount)
	line	897
	
l13849:	
;TOUCH.C: 897: fmd_Keystatus1=fmd_Keystatus;
	movf	(_fmd_Keystatus+1),w	;volatile
	movwf	(_fmd_Keystatus1+1)	;volatile
	movf	(_fmd_Keystatus),w	;volatile
	movwf	(_fmd_Keystatus1)	;volatile
	line	899
;TOUCH.C: 898: }
;TOUCH.C: 899: }
	goto	l13903
	line	902
	
l13851:	
;TOUCH.C: 900: else
;TOUCH.C: 901: {
;TOUCH.C: 902: fmd_antishaketimecount=0;
	clrf	(_fmd_antishaketimecount)
	line	906
;TOUCH.C: 905: {
;TOUCH.C: 906: fmd_antishaketimecount1=0;
	clrf	(_fmd_antishaketimecount1)
	goto	l13849
	line	982
	
l13903:	
;TOUCH.C: 977: }
;TOUCH.C: 978: }
;TOUCH.C: 979: }
;TOUCH.C: 980: }
;TOUCH.C: 982: fmd_PressOffCount = 2;
	movlw	(02h)
	movwf	(_fmd_PressOffCount)
	line	983
	
l13905:	
;TOUCH.C: 983: fmd_f_firstdown = 0;
	bcf	(_fmd_f_firstdown/8),(_fmd_f_firstdown)&7
	line	984
	
l13907:	
;TOUCH.C: 984: fmd_TestCount = 0;
	clrf	(_fmd_TestCount)
	line	993
	
l7407:	
	line	996
;TOUCH.C: 991: }
;TOUCH.C: 993: }
;TOUCH.C: 996: if(fmd_a2<fmd_channels)
	movf	(_fmd_channels),w
	subwf	(_fmd_a2),w	;volatile
	skipnc
	goto	u4501
	goto	u4500
u4501:
	goto	l13911
u4500:
	line	998
	
l13909:	
;TOUCH.C: 997: {
;TOUCH.C: 998: fmd_a2++;
	incf	(_fmd_a2),f	;volatile
	line	999
;TOUCH.C: 999: }
	goto	l13913
	line	1009
	
l13911:	
;TOUCH.C: 1000: else
;TOUCH.C: 1001: {
;TOUCH.C: 1009: fmd_a2=0;
	clrf	(_fmd_a2)	;volatile
	line	1012
	
l13913:	
;TOUCH.C: 1010: }
;TOUCH.C: 1012: fmd_a=fmd_theUsedChannel[fmd_a2];
	movf	(_fmd_a2),w
	addlw	_fmd_theUsedChannel&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(_fmd_a)	;volatile
	line	1013
	
l7438:	
	return
	opt stack 0
GLOBAL	__end_of_ReadTouchData
	__end_of_ReadTouchData:
;; =============== function _ReadTouchData ends ============

	signat	_ReadTouchData,88
	global	_DataProcessing
psect	text625,local,class=CODE,delta=2
global __ptext625
__ptext625:

;; *************** function _DataProcessing *****************
;; Defined at:
;;		line 1052 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          8       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___bmul
;;		_StartHigeFreq
;;		_HighFreqCo
;;		_DIV
;; This function is called by:
;;		_ReadTouchData
;; This function uses a non-reentrant model
;;
psect	text625
	file	"TOUCH.C"
	line	1052
	global	__size_of_DataProcessing
	__size_of_DataProcessing	equ	__end_of_DataProcessing-_DataProcessing
	
_DataProcessing:	
	opt	stack 10
; Regs used in _DataProcessing: [wreg-status,0+pclath+cstack]
	line	1053
	
l13145:	
;TOUCH.C: 1053: if(fmd_updataFlag == 0)
	movf	(_fmd_updataFlag),f
	skipz
	goto	u3581
	goto	u3580
u3581:
	goto	l13149
u3580:
	goto	l13235
	line	1058
	
l13149:	
;TOUCH.C: 1056: else
;TOUCH.C: 1057: {
;TOUCH.C: 1058: if(fmd_a==fmd_theUsedChannel[fmd_channels])
	movf	(_fmd_channels),w
	addlw	_fmd_theUsedChannel&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	xorwf	(_fmd_a),w	;volatile
	skipz
	goto	u3591
	goto	u3590
u3591:
	goto	l13235
u3590:
	line	1060
	
l13151:	
;TOUCH.C: 1059: {
;TOUCH.C: 1060: if(fmd_UpTouchCount >=fmd_UpDataTime)
	movlb 1	; select bank1
	movf	(_fmd_UpDataTime+1)^080h,w
	subwf	(_fmd_UpTouchCount+1)^080h,w
	skipz
	goto	u3605
	movf	(_fmd_UpDataTime)^080h,w
	subwf	(_fmd_UpTouchCount)^080h,w
u3605:
	skipc
	goto	u3601
	goto	u3600
u3601:
	goto	l13177
u3600:
	line	1062
	
l13153:	
;TOUCH.C: 1061: {
;TOUCH.C: 1062: fmd_UpTouchCount = 0;
	clrf	(_fmd_UpTouchCount)^080h
	clrf	(_fmd_UpTouchCount+1)^080h
	line	1064
;TOUCH.C: 1064: for(fmd_a1=0; fmd_a1<15; fmd_a1++)
	movlb 0	; select bank0
	clrf	(_fmd_a1)	;volatile
	
l13155:	
	movlw	(0Fh)
	subwf	(_fmd_a1),w	;volatile
	skipc
	goto	u3611
	goto	u3610
u3611:
	goto	l13159
u3610:
	goto	l13177
	line	1066
	
l13159:	
;TOUCH.C: 1065: {
;TOUCH.C: 1066: for(fmd_u=0; fmd_u<2; fmd_u++)
	clrf	(_fmd_u)	;volatile
	
l13161:	
	movlw	(02h)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u3621
	goto	u3620
u3621:
	goto	l13165
u3620:
	goto	l13173
	line	1068
	
l13165:	
;TOUCH.C: 1067: {
;TOUCH.C: 1068: if(fmd_nodownavrdata_Key[fmd_a1][fmd_u] < fmd_nodownsum_Key[fmd_a1][fmd_u])
	movf	(_fmd_a1),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 9080
	movwf	(??_DataProcessing+0)+0
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	((??_DataProcessing+0)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+0)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+0)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	moviw	[0]fsr1
	movwf	(??_DataProcessing+2)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+2)+0+1
	movf	(_fmd_a1),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 8960
	movwf	(??_DataProcessing+4)+0
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	((??_DataProcessing+4)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+4)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+4)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	moviw	[0]fsr1
	movwf	(??_DataProcessing+6)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+6)+0+1
	movf	1+(??_DataProcessing+2)+0,w
	subwf	1+(??_DataProcessing+6)+0,w
	skipz
	goto	u3635
	movf	0+(??_DataProcessing+2)+0,w
	subwf	0+(??_DataProcessing+6)+0,w
u3635:
	skipnc
	goto	u3631
	goto	u3630
u3631:
	goto	l13169
u3630:
	line	1070
	
l13167:	
;TOUCH.C: 1069: {
;TOUCH.C: 1070: fmd_nodownavrdata_Key[fmd_a1][fmd_u] = fmd_nodownsum_Key[fmd_a1][fmd_u];
	movf	(_fmd_a1),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 9080
	movwf	(??_DataProcessing+0)+0
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	((??_DataProcessing+0)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+0)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+0)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	moviw	[0]fsr1
	movwf	(??_DataProcessing+2)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+2)+0+1
	movf	(_fmd_a1),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 8960
	movwf	(??_DataProcessing+4)+0
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	((??_DataProcessing+4)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+4)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+4)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	movf	0+(??_DataProcessing+2)+0,w
	movwi	[0]fsr1
	movf	1+(??_DataProcessing+2)+0,w
	movwi	[1]fsr1
	line	1066
	
l13169:	
	incf	(_fmd_u),f	;volatile
	goto	l13161
	line	1064
	
l13173:	
	incf	(_fmd_a1),f	;volatile
	goto	l13155
	line	1075
	
l13177:	
;TOUCH.C: 1071: }
;TOUCH.C: 1072: }
;TOUCH.C: 1073: }
;TOUCH.C: 1074: }
;TOUCH.C: 1075: if(fmd_DownTouchCount >= fmd_DownDataTime)
	movlb 0	; select bank0
	movf	(_fmd_DownDataTime+1),w
	subwf	(_fmd_DownTouchCount+1),w
	skipz
	goto	u3645
	movf	(_fmd_DownDataTime),w
	subwf	(_fmd_DownTouchCount),w
u3645:
	skipc
	goto	u3641
	goto	u3640
u3641:
	goto	l13207
u3640:
	line	1077
	
l13179:	
;TOUCH.C: 1076: {
;TOUCH.C: 1077: fmd_DownTouchCount = 0;
	clrf	(_fmd_DownTouchCount)
	clrf	(_fmd_DownTouchCount+1)
	line	1079
;TOUCH.C: 1079: for(fmd_a1=0; fmd_a1<15; fmd_a1++)
	clrf	(_fmd_a1)	;volatile
	
l13181:	
	movlw	(0Fh)
	subwf	(_fmd_a1),w	;volatile
	skipc
	goto	u3651
	goto	u3650
u3651:
	goto	l13185
u3650:
	goto	l13207
	line	1081
	
l13185:	
;TOUCH.C: 1080: {
;TOUCH.C: 1081: for(fmd_u=0; fmd_u<4; fmd_u++)
	clrf	(_fmd_u)	;volatile
	
l13187:	
	movlw	(04h)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u3661
	goto	u3660
u3661:
	goto	l13191
u3660:
	goto	l13203
	line	1083
	
l13191:	
;TOUCH.C: 1082: {
;TOUCH.C: 1083: if(fmd_u<2)
	movlw	(02h)
	subwf	(_fmd_u),w	;volatile
	skipnc
	goto	u3671
	goto	u3670
u3671:
	goto	l13195
u3670:
	line	1085
	
l13193:	
;TOUCH.C: 1084: {
;TOUCH.C: 1085: if(fmd_nodownavrdata_Key[fmd_a1][fmd_u] > fmd_nodownsum_Key[fmd_a1][fmd_u])
	movf	(_fmd_a1),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 8960
	movwf	(??_DataProcessing+0)+0
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	((??_DataProcessing+0)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+0)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+0)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	moviw	[0]fsr1
	movwf	(??_DataProcessing+2)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+2)+0+1
	movf	(_fmd_a1),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 9080
	movwf	(??_DataProcessing+4)+0
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	((??_DataProcessing+4)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+4)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+4)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	moviw	[0]fsr1
	movwf	(??_DataProcessing+6)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+6)+0+1
	movf	1+(??_DataProcessing+2)+0,w
	subwf	1+(??_DataProcessing+6)+0,w
	skipz
	goto	u3685
	movf	0+(??_DataProcessing+2)+0,w
	subwf	0+(??_DataProcessing+6)+0,w
u3685:
	skipnc
	goto	u3681
	goto	u3680
u3681:
	goto	l13199
u3680:
	line	1087
	
l13195:	
;TOUCH.C: 1086: {
;TOUCH.C: 1087: fmd_nodownavrdata_Key[fmd_a1][fmd_u] = fmd_nodownsum_Key[fmd_a1][fmd_u];
	movf	(_fmd_a1),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 9080
	movwf	(??_DataProcessing+0)+0
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	((??_DataProcessing+0)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+0)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+0)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	moviw	[0]fsr1
	movwf	(??_DataProcessing+2)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+2)+0+1
	movf	(_fmd_a1),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 8960
	movwf	(??_DataProcessing+4)+0
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	((??_DataProcessing+4)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+4)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+4)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	movf	0+(??_DataProcessing+2)+0,w
	movwi	[0]fsr1
	movf	1+(??_DataProcessing+2)+0,w
	movwi	[1]fsr1
	line	1081
	
l13199:	
	incf	(_fmd_u),f	;volatile
	goto	l13187
	line	1079
	
l13203:	
	incf	(_fmd_a1),f	;volatile
	goto	l13181
	line	1097
	
l13207:	
;TOUCH.C: 1093: }
;TOUCH.C: 1094: }
;TOUCH.C: 1095: }
;TOUCH.C: 1096: }
;TOUCH.C: 1097: if(fmd_updataFlag == 2)
	movf	(_fmd_updataFlag),w
	xorlw	02h&0ffh
	skipz
	goto	u3691
	goto	u3690
u3691:
	goto	l13235
u3690:
	line	1099
	
l13209:	
;TOUCH.C: 1098: {
;TOUCH.C: 1099: if(fmd_Startgx == 0)
	movf	(_fmd_Startgx),f
	skipz
	goto	u3701
	goto	u3700
u3701:
	goto	l7470
u3700:
	line	1101
	
l13211:	
;TOUCH.C: 1100: {
;TOUCH.C: 1101: fmd_Startgx = 1;
	clrf	(_fmd_Startgx)
	incf	(_fmd_Startgx),f
	line	1102
;TOUCH.C: 1102: }
	goto	l13235
	line	1103
	
l7470:	
	line	1105
;TOUCH.C: 1103: else
;TOUCH.C: 1104: {
;TOUCH.C: 1105: fmd_updataFlag = 1;
	clrf	(_fmd_updataFlag)
	incf	(_fmd_updataFlag),f
	line	1106
	
l13213:	
;TOUCH.C: 1106: for(fmd_a1=0; fmd_a1<15; fmd_a1++)
	clrf	(_fmd_a1)	;volatile
	
l13215:	
	movlw	(0Fh)
	subwf	(_fmd_a1),w	;volatile
	skipc
	goto	u3711
	goto	u3710
u3711:
	goto	l13219
u3710:
	goto	l13235
	line	1108
	
l13219:	
;TOUCH.C: 1107: {
;TOUCH.C: 1108: for(fmd_u=0; fmd_u<4; fmd_u++)
	clrf	(_fmd_u)	;volatile
	
l13221:	
	movlw	(04h)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u3721
	goto	u3720
u3721:
	goto	l13225
u3720:
	goto	l13231
	line	1110
	
l13225:	
;TOUCH.C: 1109: {
;TOUCH.C: 1110: fmd_nodownavrdata_Key[fmd_a1][fmd_u] = fmd_nodownsum_Key[fmd_a1][fmd_u];
	movf	(_fmd_a1),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 9080
	movwf	(??_DataProcessing+0)+0
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	((??_DataProcessing+0)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+0)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+0)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	moviw	[0]fsr1
	movwf	(??_DataProcessing+2)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+2)+0+1
	movf	(_fmd_a1),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 8960
	movwf	(??_DataProcessing+4)+0
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	((??_DataProcessing+4)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+4)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+4)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	movf	0+(??_DataProcessing+2)+0,w
	movwi	[0]fsr1
	movf	1+(??_DataProcessing+2)+0,w
	movwi	[1]fsr1
	line	1108
	
l13227:	
	incf	(_fmd_u),f	;volatile
	goto	l13221
	line	1106
	
l13231:	
	incf	(_fmd_a1),f	;volatile
	goto	l13215
	line	1118
	
l13235:	
;TOUCH.C: 1111: }
;TOUCH.C: 1112: }
;TOUCH.C: 1113: }
;TOUCH.C: 1114: }
;TOUCH.C: 1115: }
;TOUCH.C: 1116: }
;TOUCH.C: 1118: fmd_KeyBuffPress = 0;
	clrf	(_fmd_KeyBuffPress)
	line	1119
;TOUCH.C: 1119: fmd_KeyBuffUnPress = 0;
	clrf	(_fmd_KeyBuffUnPress)
	line	1120
;TOUCH.C: 1120: for(fmd_u=0; fmd_u<2; fmd_u++)
	clrf	(_fmd_u)	;volatile
	
l13237:	
	movlw	(02h)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u3731
	goto	u3730
u3731:
	goto	l13241
u3730:
	goto	l13261
	line	1122
	
l13241:	
;TOUCH.C: 1121: {
;TOUCH.C: 1122: if((fmd_nodownavrdata_Key[fmd_a][fmd_u]>=fmd_TouchDataBuff_Key[fmd_u]))
	lslf	(_fmd_u),w	;volatile
	addlw	_fmd_TouchDataBuff_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	moviw	[0]fsr1
	movwf	(??_DataProcessing+0)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+0)+0+1
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 8960
	movwf	(??_DataProcessing+2)+0
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	((??_DataProcessing+2)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+2)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+2)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	moviw	[0]fsr1
	movwf	(??_DataProcessing+4)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+4)+0+1
	movf	1+(??_DataProcessing+0)+0,w
	subwf	1+(??_DataProcessing+4)+0,w
	skipz
	goto	u3745
	movf	0+(??_DataProcessing+0)+0,w
	subwf	0+(??_DataProcessing+4)+0,w
u3745:
	skipc
	goto	u3741
	goto	u3740
u3741:
	goto	l13249
u3740:
	line	1124
	
l13243:	
;TOUCH.C: 1123: {
;TOUCH.C: 1124: if((fmd_nodownavrdata_Key[fmd_a][fmd_u] - fmd_TouchDataBuff_Key[fmd_u])<255)
	lslf	(_fmd_u),w	;volatile
	addlw	_fmd_TouchDataBuff_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 8960
	movwf	(??_DataProcessing+0)+0
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	((??_DataProcessing+0)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+0)+0,w
	movwf	fsr0l
	movf	1+(??_DataProcessing+0)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr0l
	moviw	[0]fsr1
	subwf	indf0,w
	movwf	(??_DataProcessing+2)+0
	addfsr	fsr0,1
	moviw	[1]fsr1
	subwfb	indf0,w
	movwf	(??_DataProcessing+2)+0+1
	movlw	high(0FFh)
	subwf	1+(??_DataProcessing+2)+0,w
	movlw	low(0FFh)
	skipnz
	subwf	0+(??_DataProcessing+2)+0,w
	skipnc
	goto	u3751
	goto	u3750
u3751:
	goto	l13247
u3750:
	line	1126
	
l13245:	
;TOUCH.C: 1125: {
;TOUCH.C: 1126: fmd_KeyDValue_Key[fmd_u]= fmd_nodownavrdata_Key[fmd_a][fmd_u] - fmd_TouchDataBuff_Key[fmd_u];
	movf	(_fmd_u),w
	addlw	_fmd_KeyDValue_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	lslf	(_fmd_u),w	;volatile
	addlw	_fmd_TouchDataBuff_Key&0ffh
	movwf	fsr0l
	clrf fsr0h	
	
	movf	indf0,w
	movwf	(??_DataProcessing+0)+0
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 8960
	movwf	(??_DataProcessing+1)+0
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	((??_DataProcessing+1)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+1)+0,w
	movwf	fsr0l
	movf	1+(??_DataProcessing+1)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr0l
	movf	indf0,w
	movwf	(??_DataProcessing+3)+0
	movf	(??_DataProcessing+0)+0,w
	subwf	(??_DataProcessing+3)+0,w
	movwf	indf1
	line	1127
;TOUCH.C: 1127: }
	goto	l13251
	line	1130
	
l13247:	
;TOUCH.C: 1128: else
;TOUCH.C: 1129: {
;TOUCH.C: 1130: fmd_KeyDValue_Key[fmd_u]=255;
	movf	(_fmd_u),w
	addlw	_fmd_KeyDValue_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(0FFh)
	movwf	indf1
	goto	l13251
	line	1135
	
l13249:	
;TOUCH.C: 1133: else
;TOUCH.C: 1134: {
;TOUCH.C: 1135: fmd_KeyDValue_Key[fmd_u]=0;
	movf	(_fmd_u),w
	addlw	_fmd_KeyDValue_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	line	1138
	
l13251:	
;TOUCH.C: 1136: }
;TOUCH.C: 1138: if(fmd_KeyDValue_Key[fmd_u]<=INACTIVE_SENSOR_DELTA[fmd_a][fmd_u])
	movf	(_fmd_u),w
	addlw	_fmd_KeyDValue_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(_fmd_a),w
	fcall	___bmul
	addlw	low(_INACTIVE_SENSOR_DELTA|8000h)
	movwf	(??_DataProcessing+0)+0
	movlw	high(_INACTIVE_SENSOR_DELTA|8000h)
	skipnc
	incf	wreg,f
	movwf	1+(??_DataProcessing+0)+0
	movf	(_fmd_u),w
	addwf	(??_DataProcessing+0)+0,w
	movwf	fsr0l
	movf	(??_DataProcessing+0)+1,w
	skipnc
	incf	(??_DataProcessing+0)+1,w
	movwf	fsr0h

	movf	indf0,w ;code access
	movwf	(??_DataProcessing+2)+0
	movf	indf1,w
	subwf	(??_DataProcessing+2)+0,w
	skipc
	goto	u3761
	goto	u3760
u3761:
	goto	l13255
u3760:
	line	1140
	
l13253:	
;TOUCH.C: 1139: {
;TOUCH.C: 1140: fmd_KeyBuffUnPress |= (1 << fmd_u);
	movlw	(01h)
	movwf	(??_DataProcessing+0)+0
	incf	(_fmd_u),w	;volatile
	goto	u3774
u3775:
	lslf	(??_DataProcessing+0)+0,f
u3774:
	decfsz	wreg,f
	goto	u3775
	movf	0+(??_DataProcessing+0)+0,w
	iorwf	(_fmd_KeyBuffUnPress),f
	line	1142
	
l13255:	
;TOUCH.C: 1141: }
;TOUCH.C: 1142: if(fmd_KeyDValue_Key[fmd_u]>=ACTIVE_SENSOR_DELTA[fmd_a][fmd_u])
	movf	(_fmd_u),w
	addlw	_fmd_KeyDValue_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(_fmd_a),w
	fcall	___bmul
	addlw	low(_ACTIVE_SENSOR_DELTA|8000h)
	movwf	(??_DataProcessing+0)+0
	movlw	high(_ACTIVE_SENSOR_DELTA|8000h)
	skipnc
	incf	wreg,f
	movwf	1+(??_DataProcessing+0)+0
	movf	(_fmd_u),w
	addwf	(??_DataProcessing+0)+0,w
	movwf	fsr0l
	movf	(??_DataProcessing+0)+1,w
	skipnc
	incf	(??_DataProcessing+0)+1,w
	movwf	fsr0h

	movf	indf0,w ;code access
	subwf	indf1,w
	skipc
	goto	u3781
	goto	u3780
u3781:
	goto	l13259
u3780:
	line	1144
	
l13257:	
;TOUCH.C: 1143: {
;TOUCH.C: 1144: fmd_KeyBuffPress |= (1 << fmd_u);
	movlw	(01h)
	movwf	(??_DataProcessing+0)+0
	incf	(_fmd_u),w	;volatile
	goto	u3794
u3795:
	lslf	(??_DataProcessing+0)+0,f
u3794:
	decfsz	wreg,f
	goto	u3795
	movf	0+(??_DataProcessing+0)+0,w
	iorwf	(_fmd_KeyBuffPress),f
	line	1120
	
l13259:	
	incf	(_fmd_u),f	;volatile
	movlw	(02h)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u3801
	goto	u3800
u3801:
	goto	l13241
u3800:
	line	1148
	
l13261:	
;TOUCH.C: 1145: }
;TOUCH.C: 1146: }
;TOUCH.C: 1148: if((fmd_Keystatus >> fmd_a) & 0x01)
	movf	(_fmd_Keystatus+1),w	;volatile
	movwf	(??_DataProcessing+0)+0+1
	movf	(_fmd_Keystatus),w	;volatile
	movwf	(??_DataProcessing+0)+0
	incf	(_fmd_a),w	;volatile
	goto	u3814
u3815:
	lsrf	(??_DataProcessing+0)+1,f
	rrf	(??_DataProcessing+0)+0,f
u3814:
	decfsz	wreg,f
	goto	u3815
	btfss	0+(??_DataProcessing+0)+0,(0)&7
	goto	u3821
	goto	u3820
u3821:
	goto	l13307
u3820:
	line	1150
	
l13263:	
;TOUCH.C: 1149: {
;TOUCH.C: 1150: fmd_TestCount++;
	incf	(_fmd_TestCount),f
	line	1151
	
l13265:	
;TOUCH.C: 1151: if((fmd_KeyBuffUnPress & 0x03) == 0x03)
	movlw	(03h)
	andwf	(_fmd_KeyBuffUnPress),w
	movwf	(??_DataProcessing+0)+0
	movf	0+(??_DataProcessing+0)+0,w
	xorlw	03h&0ffh
	skipz
	goto	u3831
	goto	u3830
u3831:
	goto	l13271
u3830:
	line	1153
	
l13267:	
;TOUCH.C: 1152: {
;TOUCH.C: 1153: fmd_Keystatus &= ~(1 << fmd_a);
	movlw	low(01h)
	movwf	(??_DataProcessing+0)+0
	movlw	high(01h)
	movwf	(??_DataProcessing+0)+0+1
	incf	(_fmd_a),w	;volatile
	goto	u3844
u3845:
	lslf	(??_DataProcessing+0)+0,f
	rlf	(??_DataProcessing+0)+1,f
u3844:
	decfsz	wreg,f
	goto	u3845
	comf	(??_DataProcessing+0)+0,f
	comf	(??_DataProcessing+0)+1,f
	movf	0+(??_DataProcessing+0)+0,w
	andwf	(_fmd_Keystatus),f	;volatile
	movf	1+(??_DataProcessing+0)+0,w
	andwf	(_fmd_Keystatus+1),f	;volatile
	line	1154
	
l13269:	
;TOUCH.C: 1154: fmd_Keystatus2=fmd_Keystatus;
	movf	(_fmd_Keystatus+1),w	;volatile
	movwf	(_fmd_Keystatus2+1)	;volatile
	movf	(_fmd_Keystatus),w	;volatile
	movwf	(_fmd_Keystatus2)	;volatile
	line	1155
;TOUCH.C: 1155: fmd_TestCount--;
	decf	(_fmd_TestCount),f
	line	1156
;TOUCH.C: 1156: }
	goto	l13289
	line	1157
	
l13271:	
;TOUCH.C: 1157: else if((fmd_KeyBuffUnPress & 0x03) == 0x00)
	movf	(_fmd_KeyBuffUnPress),w
	andlw	03h
	btfss	status,2
	goto	u3851
	goto	u3850
u3851:
	goto	l7487
u3850:
	goto	l13289
	line	1160
	
l7487:	
	line	1164
;TOUCH.C: 1160: else
;TOUCH.C: 1161: {
;TOUCH.C: 1164: fmd_HfreqOn = 1;
	clrf	(_fmd_HfreqOn)
	incf	(_fmd_HfreqOn),f
	line	1165
	
l13275:	
;TOUCH.C: 1165: StartHigeFreq(fmd_a);
	movf	(_fmd_a),w	;volatile
	fcall	_StartHigeFreq
	line	1166
	
l13277:	
;TOUCH.C: 1166: HighFreqCo(fmd_a);
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	fcall	_HighFreqCo
	line	1167
	
l13279:	
;TOUCH.C: 1167: fmd_HfreqOn = 0;
	clrf	(_fmd_HfreqOn)
	line	1168
	
l13281:	
;TOUCH.C: 1168: if((fmd_KeyDValue_Key[3]<=INACTIVE_SENSOR_DELTA[fmd_a][3]) && (fmd_KeyDValue_Key[2]<=INACTIVE_SENSOR_DELTA[fmd_a][2]))
	movlw	(06h)
	movwf	(?___bmul)
	movf	(_fmd_a),w
	fcall	___bmul
	addlw	03h
	addlw	low(_INACTIVE_SENSOR_DELTA|8000h)
	movwf	fsr0l
	movlw	high(_INACTIVE_SENSOR_DELTA|8000h)
	skipnc
	addlw	1
	movwf	fsr0h
	movf	indf0,w ;code access
	movwf	(??_DataProcessing+0)+0
	movf	0+(_fmd_KeyDValue_Key)+03h,w
	subwf	(??_DataProcessing+0)+0,w
	skipc
	goto	u3861
	goto	u3860
u3861:
	goto	l13289
u3860:
	
l13283:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(_fmd_a),w
	fcall	___bmul
	addlw	02h
	addlw	low(_INACTIVE_SENSOR_DELTA|8000h)
	movwf	fsr0l
	movlw	high(_INACTIVE_SENSOR_DELTA|8000h)
	skipnc
	addlw	1
	movwf	fsr0h
	movf	indf0,w ;code access
	movwf	(??_DataProcessing+0)+0
	movf	0+(_fmd_KeyDValue_Key)+02h,w
	subwf	(??_DataProcessing+0)+0,w
	skipc
	goto	u3871
	goto	u3870
u3871:
	goto	l13289
u3870:
	goto	l13267
	line	1176
	
l13289:	
;TOUCH.C: 1173: }
;TOUCH.C: 1175: }
;TOUCH.C: 1176: if((fmd_Keystatus1 >> fmd_a) & 0x01)
	movf	(_fmd_Keystatus1+1),w	;volatile
	movwf	(??_DataProcessing+0)+0+1
	movf	(_fmd_Keystatus1),w	;volatile
	movwf	(??_DataProcessing+0)+0
	incf	(_fmd_a),w	;volatile
	goto	u3884
u3885:
	lsrf	(??_DataProcessing+0)+1,f
	rrf	(??_DataProcessing+0)+0,f
u3884:
	decfsz	wreg,f
	goto	u3885
	btfss	0+(??_DataProcessing+0)+0,(0)&7
	goto	u3891
	goto	u3890
u3891:
	goto	l13345
u3890:
	line	1178
	
l13291:	
;TOUCH.C: 1177: {
;TOUCH.C: 1178: if((fmd_Keystatus >> fmd_a) & 0x01)
	movf	(_fmd_Keystatus+1),w	;volatile
	movwf	(??_DataProcessing+0)+0+1
	movf	(_fmd_Keystatus),w	;volatile
	movwf	(??_DataProcessing+0)+0
	incf	(_fmd_a),w	;volatile
	goto	u3904
u3905:
	lsrf	(??_DataProcessing+0)+1,f
	rrf	(??_DataProcessing+0)+0,f
u3904:
	decfsz	wreg,f
	goto	u3905
	btfss	0+(??_DataProcessing+0)+0,(0)&7
	goto	u3911
	goto	u3910
u3911:
	goto	l13295
u3910:
	line	1180
	
l13293:	
;TOUCH.C: 1179: {
;TOUCH.C: 1180: fmd_PressOff = 0;
	clrf	(_fmd_PressOff)
	line	1181
;TOUCH.C: 1181: }
	goto	l13345
	line	1184
	
l13295:	
;TOUCH.C: 1182: else
;TOUCH.C: 1183: {
;TOUCH.C: 1184: if(fmd_PressOff == 0)
	movf	(_fmd_PressOff),f
	skipz
	goto	u3921
	goto	u3920
u3921:
	goto	l13299
u3920:
	line	1186
	
l13297:	
;TOUCH.C: 1185: {
;TOUCH.C: 1186: fmd_PressOffCount = 1;
	clrf	(_fmd_PressOffCount)
	incf	(_fmd_PressOffCount),f
	line	1187
;TOUCH.C: 1187: }
	goto	l13301
	line	1190
	
l13299:	
;TOUCH.C: 1188: else
;TOUCH.C: 1189: {
;TOUCH.C: 1190: fmd_PressOffCount = 2;
	movlw	(02h)
	movwf	(_fmd_PressOffCount)
	line	1193
	
l13301:	
;TOUCH.C: 1191: }
;TOUCH.C: 1193: fmd_PressOff = 1;
	clrf	(_fmd_PressOff)
	incf	(_fmd_PressOff),f
	line	1194
	
l13303:	
;TOUCH.C: 1194: fmd_thedeathcount = 0;
	movlb 1	; select bank1
	clrf	(_fmd_thedeathcount)^080h
	clrf	(_fmd_thedeathcount+1)^080h
	line	1197
	
l13305:	
;TOUCH.C: 1197: fmd_f_firstdown = 0;
	bcf	(_fmd_f_firstdown/8),(_fmd_f_firstdown)&7
	goto	l13345
	line	1203
	
l13307:	
;TOUCH.C: 1201: else
;TOUCH.C: 1202: {
;TOUCH.C: 1203: if((fmd_KeyBuffPress & 0x03) == 0x03)
	movlw	(03h)
	andwf	(_fmd_KeyBuffPress),w
	movwf	(??_DataProcessing+0)+0
	movf	0+(??_DataProcessing+0)+0,w
	xorlw	03h&0ffh
	skipz
	goto	u3931
	goto	u3930
u3931:
	goto	l13315
u3930:
	line	1206
	
l13309:	
;TOUCH.C: 1204: {
;TOUCH.C: 1206: fmd_Keystatus |= (1 << fmd_a);
	movlw	low(01h)
	movwf	(??_DataProcessing+0)+0
	movlw	high(01h)
	movwf	(??_DataProcessing+0)+0+1
	movlb 0	; select bank0
	incf	(_fmd_a),w	;volatile
	goto	u3944
u3945:
	lslf	(??_DataProcessing+0)+0,f
	rlf	(??_DataProcessing+0)+1,f
u3944:
	decfsz	wreg,f
	goto	u3945
	movf	0+(??_DataProcessing+0)+0,w
	iorwf	(_fmd_Keystatus),f	;volatile
	movf	1+(??_DataProcessing+0)+0,w
	iorwf	(_fmd_Keystatus+1),f	;volatile
	line	1207
	
l13311:	
;TOUCH.C: 1207: fmd_Keystatus2=fmd_Keystatus;
	movf	(_fmd_Keystatus+1),w	;volatile
	movwf	(_fmd_Keystatus2+1)	;volatile
	movf	(_fmd_Keystatus),w	;volatile
	movwf	(_fmd_Keystatus2)	;volatile
	line	1208
;TOUCH.C: 1208: fmd_TestCount++;
	incf	(_fmd_TestCount),f
	line	1209
	
l13313:	
;TOUCH.C: 1209: fmd_f_keydown_flag=1;
	bsf	(_fmd_f_keydown_flag/8),(_fmd_f_keydown_flag)&7
	line	1210
;TOUCH.C: 1210: }
	goto	l13345
	line	1211
	
l13315:	
;TOUCH.C: 1211: else if((fmd_KeyBuffPress & 0x03) == 0x00)
	movf	(_fmd_KeyBuffPress),w
	andlw	03h
	btfss	status,2
	goto	u3951
	goto	u3950
u3951:
	goto	l7498
u3950:
	goto	l13345
	line	1214
	
l7498:	
	line	1217
;TOUCH.C: 1214: else
;TOUCH.C: 1215: {
;TOUCH.C: 1217: fmd_HfreqOn = 1;
	clrf	(_fmd_HfreqOn)
	incf	(_fmd_HfreqOn),f
	line	1218
	
l13319:	
;TOUCH.C: 1218: StartHigeFreq(fmd_a);
	movf	(_fmd_a),w	;volatile
	fcall	_StartHigeFreq
	line	1219
	
l13321:	
;TOUCH.C: 1219: HighFreqCo(fmd_a);
	movlb 0	; select bank0
	movf	(_fmd_a),w	;volatile
	fcall	_HighFreqCo
	line	1220
	
l13323:	
;TOUCH.C: 1220: fmd_HfreqOn = 0;
	clrf	(_fmd_HfreqOn)
	line	1221
	
l13325:	
;TOUCH.C: 1221: if((fmd_KeyDValue_Key[3]>=ACTIVE_SENSOR_DELTA[fmd_a][3]) && (fmd_KeyDValue_Key[2]>=ACTIVE_SENSOR_DELTA[fmd_a][2]))
	movlw	(06h)
	movwf	(?___bmul)
	movf	(_fmd_a),w
	fcall	___bmul
	addlw	03h
	addlw	low(_ACTIVE_SENSOR_DELTA|8000h)
	movwf	fsr0l
	movlw	high(_ACTIVE_SENSOR_DELTA|8000h)
	skipnc
	addlw	1
	movwf	fsr0h
	movf	indf0,w ;code access
	subwf	0+(_fmd_KeyDValue_Key)+03h,w
	skipc
	goto	u3961
	goto	u3960
u3961:
	goto	l13345
u3960:
	
l13327:	
	movlw	(06h)
	movwf	(?___bmul)
	movf	(_fmd_a),w
	fcall	___bmul
	addlw	02h
	addlw	low(_ACTIVE_SENSOR_DELTA|8000h)
	movwf	fsr0l
	movlw	high(_ACTIVE_SENSOR_DELTA|8000h)
	skipnc
	addlw	1
	movwf	fsr0h
	movf	indf0,w ;code access
	subwf	0+(_fmd_KeyDValue_Key)+02h,w
	skipc
	goto	u3971
	goto	u3970
u3971:
	goto	l13345
u3970:
	line	1223
	
l13329:	
;TOUCH.C: 1222: {
;TOUCH.C: 1223: if(fmd_KeyDValue_Key[0]>=ACTIVE_SENSOR_DELTA[fmd_a][0]+(ACTIVE_SENSOR_DELTA[fmd_a][0]))
	movlw	(06h)
	movwf	(?___bmul)
	movf	(_fmd_a),w
	fcall	___bmul
	addlw	low(_ACTIVE_SENSOR_DELTA|8000h)
	movwf	fsr0l
	movlw	high(_ACTIVE_SENSOR_DELTA|8000h)
	skipnc
	addlw	1
	movwf	fsr0h
	movf	indf0,w ;code access
	movwf	(??_DataProcessing+0)+0
	movlw	(0x0/2)
	movwf	(??_DataProcessing+0)+0+1
	lslf	(??_DataProcessing+0)+0,f
	rlf	(??_DataProcessing+0)+1,f
	movf	1+(??_DataProcessing+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u3985
	movf	0+(??_DataProcessing+0)+0,w
	subwf	(_fmd_KeyDValue_Key),w
u3985:

	skipc
	goto	u3981
	goto	u3980
u3981:
	goto	l13337
u3980:
	goto	l13309
	line	1232
	
l13337:	
;TOUCH.C: 1230: else
;TOUCH.C: 1231: {
;TOUCH.C: 1232: if(fmd_KeyDValue_Key[1]>=ACTIVE_SENSOR_DELTA[fmd_a][1]+(ACTIVE_SENSOR_DELTA[fmd_a][1]))
	movlw	(06h)
	movwf	(?___bmul)
	movlb 0	; select bank0
	movf	(_fmd_a),w
	fcall	___bmul
	movwf	(??_DataProcessing+0)+0
	incf	0+(??_DataProcessing+0)+0,w
	addlw	low(_ACTIVE_SENSOR_DELTA|8000h)
	movwf	fsr0l
	movlw	high(_ACTIVE_SENSOR_DELTA|8000h)
	skipnc
	addlw	1
	movwf	fsr0h
	movf	indf0,w ;code access
	movwf	(??_DataProcessing+1)+0
	movlw	(0x0/2)
	movwf	(??_DataProcessing+1)+0+1
	lslf	(??_DataProcessing+1)+0,f
	rlf	(??_DataProcessing+1)+1,f
	movf	1+(??_DataProcessing+1)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u3995
	movf	0+(??_DataProcessing+1)+0,w
	subwf	0+(_fmd_KeyDValue_Key)+01h,w
u3995:

	skipc
	goto	u3991
	goto	u3990
u3991:
	goto	l13345
u3990:
	goto	l13309
	line	1244
	
l13345:	
;TOUCH.C: 1238: }
;TOUCH.C: 1239: }
;TOUCH.C: 1240: }
;TOUCH.C: 1241: }
;TOUCH.C: 1242: }
;TOUCH.C: 1244: if(fmd_f_keydown_flag)
	movlb 0	; select bank0
	btfss	(_fmd_f_keydown_flag/8),(_fmd_f_keydown_flag)&7
	goto	u4001
	goto	u4000
u4001:
	goto	l13407
u4000:
	line	1246
	
l13347:	
;TOUCH.C: 1245: {
;TOUCH.C: 1246: fmd_f_keydown_flag=0;
	bcf	(_fmd_f_keydown_flag/8),(_fmd_f_keydown_flag)&7
	line	1248
;TOUCH.C: 1248: if(!fmd_f_firstdown)
	btfsc	(_fmd_f_firstdown/8),(_fmd_f_firstdown)&7
	goto	u4011
	goto	u4010
u4011:
	goto	l13369
u4010:
	line	1250
	
l13349:	
;TOUCH.C: 1249: {
;TOUCH.C: 1250: fmd_f_firstdown=1;
	bsf	(_fmd_f_firstdown/8),(_fmd_f_firstdown)&7
	line	1251
;TOUCH.C: 1251: fmd_f_firstloop = 1;
	bsf	(_fmd_f_firstloop/8),(_fmd_f_firstloop)&7
	line	1253
	
l13351:	
;TOUCH.C: 1253: fmd_a3= fmd_theUsedChannel[fmd_a2];
	movf	(_fmd_a2),w
	addlw	_fmd_theUsedChannel&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(_fmd_a3)	;volatile
	line	1263
	
l13353:	
;TOUCH.C: 1263: for(fmd_u=0;fmd_u<2;fmd_u++)
	clrf	(_fmd_u)	;volatile
	
l13355:	
	movlw	(02h)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u4021
	goto	u4020
u4021:
	goto	l13359
u4020:
	goto	l13407
	line	1265
	
l13359:	
;TOUCH.C: 1264: {
;TOUCH.C: 1265: fmd_OriginalData=fmd_KeyDValue_Key[fmd_u];
	movf	(_fmd_u),w
	addlw	_fmd_KeyDValue_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(81)
	clrf	(81+1)
	line	1266
;TOUCH.C: 1266: fmd_ReferenceData = fmd_nodownavrdata_Key[fmd_a][fmd_u];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 8960
	movwf	(??_DataProcessing+0)+0
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	((??_DataProcessing+0)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+0)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+0)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	moviw	[0]fsr1
	movwf	(85)
	moviw	[1]fsr1
	movwf	(85+1)
	line	1267
	
l13361:	
;TOUCH.C: 1267: DIV();
	fcall	_DIV
	line	1268
	
l13363:	
;TOUCH.C: 1268: fmd_KeyDValue_Key_base[fmd_u]=fmd_ResultData;
	movlb 0	; select bank0
	lslf	(_fmd_u),w	;volatile
	addlw	_fmd_KeyDValue_Key_base&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(87),w
	movwi	[0]fsr1
	movf	(87+1),w
	movwi	[1]fsr1
	line	1263
	
l13365:	
	incf	(_fmd_u),f	;volatile
	goto	l13355
	line	1273
	
l13369:	
;TOUCH.C: 1271: else
;TOUCH.C: 1272: {
;TOUCH.C: 1273: fmd_currentCount=0;
	clrf	(_fmd_currentCount)
	line	1274
;TOUCH.C: 1274: for(fmd_u=0;fmd_u<2;fmd_u++)
	clrf	(_fmd_u)	;volatile
	
l13371:	
	movlw	(02h)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u4031
	goto	u4030
u4031:
	goto	l13375
u4030:
	goto	l13387
	line	1276
	
l13375:	
;TOUCH.C: 1275: {
;TOUCH.C: 1276: fmd_OriginalData = fmd_KeyDValue_Key[fmd_u];
	movf	(_fmd_u),w
	addlw	_fmd_KeyDValue_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movwf	(81)
	clrf	(81+1)
	line	1277
;TOUCH.C: 1277: fmd_ReferenceData = fmd_nodownavrdata_Key[fmd_a][fmd_u];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	low 8960
	movwf	(??_DataProcessing+0)+0
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	((??_DataProcessing+0)+0)+1
	lslf	(_fmd_u),w	;volatile
	addwf	0+(??_DataProcessing+0)+0,w
	movwf	fsr1l
	movf	1+(??_DataProcessing+0)+0,w
	skipnc
	incf	wreg,f
	movwf	1+fsr1l
	moviw	[0]fsr1
	movwf	(85)
	moviw	[1]fsr1
	movwf	(85+1)
	line	1278
	
l13377:	
;TOUCH.C: 1278: DIV();
	fcall	_DIV
	line	1279
	
l13379:	
;TOUCH.C: 1279: fmd_KeyDValue_Key_baseBuff[fmd_u]=fmd_ResultData;
	movlb 0	; select bank0
	lslf	(_fmd_u),w	;volatile
	addlw	_fmd_KeyDValue_Key_baseBuff&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(87),w
	movwi	[0]fsr1
	movf	(87+1),w
	movwi	[1]fsr1
	line	1281
	
l13381:	
;TOUCH.C: 1281: if(fmd_KeyDValue_Key_baseBuff[fmd_u]>fmd_KeyDValue_Key_base[fmd_u])
	lslf	(_fmd_u),w	;volatile
	addlw	_fmd_KeyDValue_Key_baseBuff&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	moviw	[0]fsr1
	movwf	(??_DataProcessing+0)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+0)+0+1
	lslf	(_fmd_u),w	;volatile
	addlw	_fmd_KeyDValue_Key_base&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	moviw	[0]fsr1
	movwf	(??_DataProcessing+2)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+2)+0+1
	movf	1+(??_DataProcessing+0)+0,w
	subwf	1+(??_DataProcessing+2)+0,w
	skipz
	goto	u4045
	movf	0+(??_DataProcessing+0)+0,w
	subwf	0+(??_DataProcessing+2)+0,w
u4045:
	skipnc
	goto	u4041
	goto	u4040
u4041:
	goto	l7511
u4040:
	line	1283
	
l13383:	
;TOUCH.C: 1282: {
;TOUCH.C: 1283: fmd_currentCount++;
	incf	(_fmd_currentCount),f
	line	1284
	
l7511:	
	line	1274
	incf	(_fmd_u),f	;volatile
	goto	l13371
	line	1287
	
l13387:	
;TOUCH.C: 1284: }
;TOUCH.C: 1285: }
;TOUCH.C: 1287: if(fmd_currentCount==2)
	movf	(_fmd_currentCount),w
	xorlw	02h&0ffh
	skipz
	goto	u4051
	goto	u4050
u4051:
	goto	l13405
u4050:
	line	1289
	
l13389:	
;TOUCH.C: 1288: {
;TOUCH.C: 1289: fmd_Keystatus = (1 << fmd_a);
	clrf	(_fmd_Keystatus)
	incf	(_fmd_Keystatus),f
	clrf	(_fmd_Keystatus+1)
	
l13391:	
	incf	(_fmd_a),w	;volatile
	goto	u4060
u4065:
	lslf	(_fmd_Keystatus),f
	rlf	(_fmd_Keystatus+1),f
u4060:
	decfsz	wreg,f
	goto	u4065
	line	1291
	
l13393:	
;TOUCH.C: 1291: for(fmd_u=0;fmd_u<2;fmd_u++)
	clrf	(_fmd_u)	;volatile
	
l13395:	
	movlw	(02h)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u4071
	goto	u4070
u4071:
	goto	l13399
u4070:
	goto	l13407
	line	1293
	
l13399:	
;TOUCH.C: 1292: {
;TOUCH.C: 1293: fmd_KeyDValue_Key_base[fmd_u]=fmd_KeyDValue_Key_baseBuff[fmd_u];
	lslf	(_fmd_u),w	;volatile
	addlw	_fmd_KeyDValue_Key_baseBuff&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	moviw	[0]fsr1
	movwf	(??_DataProcessing+0)+0
	moviw	[1]fsr1
	movwf	(??_DataProcessing+0)+0+1
	lslf	(_fmd_u),w	;volatile
	addlw	_fmd_KeyDValue_Key_base&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	0+(??_DataProcessing+0)+0,w
	movwi	[0]fsr1
	movf	1+(??_DataProcessing+0)+0,w
	movwi	[1]fsr1
	line	1291
	
l13401:	
	incf	(_fmd_u),f	;volatile
	goto	l13395
	line	1298
	
l13405:	
;TOUCH.C: 1296: else
;TOUCH.C: 1297: {
;TOUCH.C: 1298: fmd_Keystatus &= ~(1 << fmd_a);
	movlw	low(01h)
	movwf	(??_DataProcessing+0)+0
	movlw	high(01h)
	movwf	(??_DataProcessing+0)+0+1
	incf	(_fmd_a),w	;volatile
	goto	u4084
u4085:
	lslf	(??_DataProcessing+0)+0,f
	rlf	(??_DataProcessing+0)+1,f
u4084:
	decfsz	wreg,f
	goto	u4085
	comf	(??_DataProcessing+0)+0,f
	comf	(??_DataProcessing+0)+1,f
	movf	0+(??_DataProcessing+0)+0,w
	andwf	(_fmd_Keystatus),f	;volatile
	movf	1+(??_DataProcessing+0)+0,w
	andwf	(_fmd_Keystatus+1),f	;volatile
	line	1310
	
l13407:	
;TOUCH.C: 1299: }
;TOUCH.C: 1300: }
;TOUCH.C: 1301: }
;TOUCH.C: 1310: if(fmd_Keystatus==0)
	movf	((_fmd_Keystatus+1)),w	;volatile
	iorwf	((_fmd_Keystatus)),w	;volatile
	skipz
	goto	u4091
	goto	u4090
u4091:
	goto	l7519
u4090:
	line	1312
	
l13409:	
;TOUCH.C: 1311: {
;TOUCH.C: 1312: fmd_PressOff = 1;
	clrf	(_fmd_PressOff)
	incf	(_fmd_PressOff),f
	line	1313
	
l13411:	
;TOUCH.C: 1313: for(fmd_u=0;fmd_u<2;fmd_u++)
	clrf	(_fmd_u)	;volatile
	
l13413:	
	movlw	(02h)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u4101
	goto	u4100
u4101:
	goto	l13417
u4100:
	goto	l7519
	line	1315
	
l13417:	
;TOUCH.C: 1314: {
;TOUCH.C: 1315: fmd_KeyDValue_Key_base[fmd_u]=0;
	lslf	(_fmd_u),w	;volatile
	addlw	_fmd_KeyDValue_Key_base&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	clrf	indf1
	addfsr	fsr1,1
	clrf	indf1
	line	1313
	
l13419:	
	incf	(_fmd_u),f	;volatile
	goto	l13413
	line	1318
	
l7519:	
	return
	opt stack 0
GLOBAL	__end_of_DataProcessing
	__end_of_DataProcessing:
;; =============== function _DataProcessing ends ============

	signat	_DataProcessing,88
	global	_DelayMs
psect	text626,local,class=CODE,delta=2
global __ptext626
__ptext626:

;; *************** function _DelayMs *****************
;; Defined at:
;;		line 69 in file "TEST_62F08X_UART.C"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    2[COMMON] unsigned char 
;;  b               1    4[COMMON] unsigned char 
;;  a               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/4
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DelayUs
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text626
	file	"TEST_62F08X_UART.C"
	line	69
	global	__size_of_DelayMs
	__size_of_DelayMs	equ	__end_of_DelayMs-_DelayMs
	
_DelayMs:	
	opt	stack 13
; Regs used in _DelayMs: [wreg+status,2+status,0+pclath+cstack]
;DelayMs@Time stored from wreg
	line	71
	movwf	(DelayMs@Time)
	
l13127:	
;TEST_62F08X_UART.C: 70: unsigned char a,b;
;TEST_62F08X_UART.C: 71: for(a=0;a<Time;a++)
	clrf	(DelayMs@a)
	goto	l13143
	line	73
	
l13129:	
;TEST_62F08X_UART.C: 72: {
;TEST_62F08X_UART.C: 73: for(b=0;b<5;b++)
	clrf	(DelayMs@b)
	line	75
	
l13135:	
;TEST_62F08X_UART.C: 74: {
;TEST_62F08X_UART.C: 75: DelayUs(197);
	movlw	(0C5h)
	fcall	_DelayUs
	line	73
	
l13137:	
	incf	(DelayMs@b),f
	
l13139:	
	movlw	(05h)
	subwf	(DelayMs@b),w
	skipc
	goto	u3561
	goto	u3560
u3561:
	goto	l13135
u3560:
	line	71
	
l13141:	
	incf	(DelayMs@a),f
	
l13143:	
	movf	(DelayMs@Time),w
	subwf	(DelayMs@a),w
	skipc
	goto	u3571
	goto	u3570
u3571:
	goto	l13129
u3570:
	line	78
	
l4784:	
	return
	opt stack 0
GLOBAL	__end_of_DelayMs
	__end_of_DelayMs:
;; =============== function _DelayMs ends ============

	signat	_DelayMs,4216
	global	_StartHigeFreq
psect	text627,local,class=CODE,delta=2
global __ptext627
__ptext627:

;; *************** function _StartHigeFreq *****************
;; Defined at:
;;		line 303 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  a               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1E/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_TouchInit
;;		_DIV
;; This function is called by:
;;		_ReadTouchData
;;		_DataProcessing
;; This function uses a non-reentrant model
;;
psect	text627
	file	"TOUCH.C"
	line	303
	global	__size_of_StartHigeFreq
	__size_of_StartHigeFreq	equ	__end_of_StartHigeFreq-_StartHigeFreq
	
_StartHigeFreq:	
	opt	stack 10
; Regs used in _StartHigeFreq: [wreg+fsr1l-status,0+pclath+cstack]
;StartHigeFreq@a stored from wreg
	movwf	(StartHigeFreq@a)
	line	304
	
l12903:	
;TOUCH.C: 304: WPROOF1 = 0;
	movlb 7	; select bank7
	clrf	(911)^0380h	;volatile
	line	305
;TOUCH.C: 305: WPROOF2 = 0;
	clrf	(912)^0380h	;volatile
	line	306
;TOUCH.C: 306: WPROOF3 = 0;
	clrf	(913)^0380h	;volatile
	line	307
	
l12905:	
;TOUCH.C: 307: if(a<4)
	movlw	(04h)
	subwf	(StartHigeFreq@a),w
	skipnc
	goto	u3291
	goto	u3290
u3291:
	goto	l12961
u3290:
	line	309
	
l12907:	
;TOUCH.C: 308: {
;TOUCH.C: 309: TouchInit(1);
	movlw	(01h)
	fcall	_TouchInit
	line	310
	
l12909:	
;TOUCH.C: 310: M0ANALOG = 0B00000100;
	movlw	(04h)
	movlb 7	; select bank7
	movwf	(914)^0380h	;volatile
	line	311
	
l12911:	
;TOUCH.C: 311: TKM0C0 = 0x03 | (a<<6);
	movf	(StartHigeFreq@a),w
	movwf	(??_StartHigeFreq+0)+0
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,w
	andlw	0c0h
	iorlw	03h
	movwf	(918)^0380h	;volatile
	line	312
	
l12913:	
;TOUCH.C: 312: TKM0C1 = 0x10 | (0x01 << a);
	movlw	(01h)
	movwf	(??_StartHigeFreq+0)+0
	incf	(StartHigeFreq@a),w
	goto	u3304
u3305:
	lslf	(??_StartHigeFreq+0)+0,f
u3304:
	decfsz	wreg,f
	goto	u3305
	movf	0+(??_StartHigeFreq+0)+0,w
	iorlw	010h
	movwf	(919)^0380h	;volatile
	line	313
	
l12915:	
;TOUCH.C: 313: M3ANALOG = 0B00000100;
	movlw	(04h)
	movwf	(917)^0380h	;volatile
	line	314
	
l12917:	
;TOUCH.C: 314: TKM3C0 = 0xC3;
	movlw	(0C3h)
	movwf	(924)^0380h	;volatile
	line	315
	
l12919:	
;TOUCH.C: 315: TKM3C1 = 0x18;
	movlw	(018h)
	movwf	(925)^0380h	;volatile
	line	316
	
l12921:	
;TOUCH.C: 316: if(fmd_HfreqOn == 1)
	movlb 0	; select bank0
	decf	(_fmd_HfreqOn),w
	skipz
	goto	u3311
	goto	u3310
u3311:
	goto	l12933
u3310:
	line	318
	
l12923:	
;TOUCH.C: 317: {
;TOUCH.C: 318: TKST = 1;
	movlb 7	; select bank7
	bsf	(7277/8)^0380h,(7277)&7
	line	319
;TOUCH.C: 319: while(TKRCOV==0);
	
l7292:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u3321
	goto	u3320
u3321:
	goto	l7292
u3320:
	line	320
	
l12925:	
;TOUCH.C: 320: fmd_OriginalData = (TKM016DH << 8) +TKM016DL;
	movlb 31	; select bank31
	movf	(3989)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(3988)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	321
;TOUCH.C: 321: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	322
	
l12927:	
;TOUCH.C: 322: DIV();
	fcall	_DIV
	line	323
	
l12929:	
;TOUCH.C: 323: fmd_TouchDataBuff_Key[3] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	1+(_fmd_TouchDataBuff_Key)+06h
	movf	(87),w
	movwf	0+(_fmd_TouchDataBuff_Key)+06h
	line	324
	
l12931:	
;TOUCH.C: 324: fmd_nodownsum_Key[fmd_a][3] = fmd_TouchDataBuff_Key[3];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	06h
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+06h,w
	movwi	[0]fsr1
	movf	1+(_fmd_TouchDataBuff_Key)+06h,w
	movwi	[1]fsr1
	line	328
	
l12933:	
;TOUCH.C: 325: }
;TOUCH.C: 328: TouchInit(2);
	movlw	(02h)
	fcall	_TouchInit
	line	329
	
l12935:	
;TOUCH.C: 329: M0ANALOG = 0B00000100;
	movlw	(04h)
	movlb 7	; select bank7
	movwf	(914)^0380h	;volatile
	line	330
	
l12937:	
;TOUCH.C: 330: TKM0C0 = 0x00 | (a<<6);
	movf	(StartHigeFreq@a),w
	movwf	(??_StartHigeFreq+0)+0
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,w
	andlw	0c0h
	movwf	(918)^0380h	;volatile
	line	331
	
l12939:	
;TOUCH.C: 331: TKM0C1 = 0x10 | (0x01 << a);
	movlw	(01h)
	movwf	(??_StartHigeFreq+0)+0
	incf	(StartHigeFreq@a),w
	goto	u3334
u3335:
	lslf	(??_StartHigeFreq+0)+0,f
u3334:
	decfsz	wreg,f
	goto	u3335
	movf	0+(??_StartHigeFreq+0)+0,w
	iorlw	010h
	movwf	(919)^0380h	;volatile
	line	332
	
l12941:	
;TOUCH.C: 332: M3ANALOG = 0B00000100;
	movlw	(04h)
	movwf	(917)^0380h	;volatile
	line	333
	
l12943:	
;TOUCH.C: 333: TKM3C0 = 0xC0;
	movlw	(0C0h)
	movwf	(924)^0380h	;volatile
	line	334
	
l12945:	
;TOUCH.C: 334: TKM3C1 = 0x18;
	movlw	(018h)
	movwf	(925)^0380h	;volatile
	line	335
	
l12947:	
;TOUCH.C: 335: if(fmd_HfreqOn == 1)
	movlb 0	; select bank0
	decf	(_fmd_HfreqOn),w
	skipz
	goto	u3341
	goto	u3340
u3341:
	goto	l12959
u3340:
	line	337
	
l12949:	
;TOUCH.C: 336: {
;TOUCH.C: 337: TKST = 1;
	movlb 7	; select bank7
	bsf	(7277/8)^0380h,(7277)&7
	line	338
;TOUCH.C: 338: while(TKRCOV==0);
	
l7296:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u3351
	goto	u3350
u3351:
	goto	l7296
u3350:
	line	339
	
l12951:	
;TOUCH.C: 339: fmd_OriginalData = (TKM016DH << 8) +TKM016DL;
	movlb 31	; select bank31
	movf	(3989)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(3988)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	340
;TOUCH.C: 340: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	341
	
l12953:	
;TOUCH.C: 341: DIV();
	fcall	_DIV
	line	342
	
l12955:	
;TOUCH.C: 342: fmd_TouchDataBuff_Key[2] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	1+(_fmd_TouchDataBuff_Key)+04h
	movf	(87),w
	movwf	0+(_fmd_TouchDataBuff_Key)+04h
	line	343
	
l12957:	
;TOUCH.C: 343: fmd_nodownsum_Key[fmd_a][2] = fmd_TouchDataBuff_Key[2];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	04h
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+04h,w
	movwi	[0]fsr1
	movf	1+(_fmd_TouchDataBuff_Key)+04h,w
	movwi	[1]fsr1
	line	344
;TOUCH.C: 344: }
	goto	l7332
	line	347
	
l12959:	
;TOUCH.C: 345: else
;TOUCH.C: 346: {
;TOUCH.C: 347: TouchInit(0);
	movlw	(0)
	fcall	_TouchInit
	goto	l7332
	line	350
	
l12961:	
;TOUCH.C: 350: else if(a<8)
	movlw	(08h)
	subwf	(StartHigeFreq@a),w
	skipnc
	goto	u3361
	goto	u3360
u3361:
	goto	l13017
u3360:
	line	353
	
l12963:	
;TOUCH.C: 351: {
;TOUCH.C: 353: TouchInit(1);
	movlw	(01h)
	fcall	_TouchInit
	line	354
	
l12965:	
;TOUCH.C: 354: M1ANALOG = 0B00000100;
	movlw	(04h)
	movlb 7	; select bank7
	movwf	(915)^0380h	;volatile
	line	355
	
l12967:	
;TOUCH.C: 355: TKM1C0 = 0x03 | ((a-4)<<6);
	movf	(StartHigeFreq@a),w
	movwf	(??_StartHigeFreq+0)+0
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,w
	andlw	0c0h
	iorlw	03h
	movwf	(920)^0380h	;volatile
	line	356
	
l12969:	
;TOUCH.C: 356: TKM1C1 = 0x10 | (0x01 << (a-4));
	movlw	(01h)
	movwf	(??_StartHigeFreq+0)+0
	movf	(StartHigeFreq@a),w
	addlw	-4
	incf	wreg,f
	goto	u3374
u3375:
	lslf	(??_StartHigeFreq+0)+0,f
u3374:
	decfsz	wreg,f
	goto	u3375
	movf	0+(??_StartHigeFreq+0)+0,w
	iorlw	010h
	movwf	(921)^0380h	;volatile
	line	357
	
l12971:	
;TOUCH.C: 357: M3ANALOG = 0B00000100;
	movlw	(04h)
	movwf	(917)^0380h	;volatile
	line	358
	
l12973:	
;TOUCH.C: 358: TKM3C0 = 0xC3;
	movlw	(0C3h)
	movwf	(924)^0380h	;volatile
	line	359
	
l12975:	
;TOUCH.C: 359: TKM3C1 = 0x18;
	movlw	(018h)
	movwf	(925)^0380h	;volatile
	line	360
	
l12977:	
;TOUCH.C: 360: if(fmd_HfreqOn == 1)
	movlb 0	; select bank0
	decf	(_fmd_HfreqOn),w
	skipz
	goto	u3381
	goto	u3380
u3381:
	goto	l12989
u3380:
	line	363
	
l12979:	
;TOUCH.C: 361: {
;TOUCH.C: 363: TKST = 1;
	movlb 7	; select bank7
	bsf	(7277/8)^0380h,(7277)&7
	line	364
;TOUCH.C: 364: while(TKRCOV==0);
	
l7303:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u3391
	goto	u3390
u3391:
	goto	l7303
u3390:
	line	365
	
l12981:	
;TOUCH.C: 365: fmd_OriginalData = (TKM116DH << 8) +TKM116DL;
	movlb 31	; select bank31
	movf	(3997)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(3996)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	366
;TOUCH.C: 366: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	367
	
l12983:	
;TOUCH.C: 367: DIV();
	fcall	_DIV
	line	369
	
l12985:	
;TOUCH.C: 369: fmd_TouchDataBuff_Key[3] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	1+(_fmd_TouchDataBuff_Key)+06h
	movf	(87),w
	movwf	0+(_fmd_TouchDataBuff_Key)+06h
	line	370
	
l12987:	
;TOUCH.C: 370: fmd_nodownsum_Key[fmd_a][3] = fmd_TouchDataBuff_Key[3];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	06h
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+06h,w
	movwi	[0]fsr1
	movf	1+(_fmd_TouchDataBuff_Key)+06h,w
	movwi	[1]fsr1
	line	373
	
l12989:	
;TOUCH.C: 371: }
;TOUCH.C: 373: TouchInit(2);
	movlw	(02h)
	fcall	_TouchInit
	line	374
	
l12991:	
;TOUCH.C: 374: M1ANALOG = 0B00000100;
	movlw	(04h)
	movlb 7	; select bank7
	movwf	(915)^0380h	;volatile
	line	375
	
l12993:	
;TOUCH.C: 375: TKM1C0 = 0x00 | ((a-4)<<6);
	movf	(StartHigeFreq@a),w
	movwf	(??_StartHigeFreq+0)+0
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,w
	andlw	0c0h
	movwf	(920)^0380h	;volatile
	line	376
	
l12995:	
;TOUCH.C: 376: TKM1C1 = 0x10 | (0x01 << (a-4));
	movlw	(01h)
	movwf	(??_StartHigeFreq+0)+0
	movf	(StartHigeFreq@a),w
	addlw	-4
	incf	wreg,f
	goto	u3404
u3405:
	lslf	(??_StartHigeFreq+0)+0,f
u3404:
	decfsz	wreg,f
	goto	u3405
	movf	0+(??_StartHigeFreq+0)+0,w
	iorlw	010h
	movwf	(921)^0380h	;volatile
	line	377
	
l12997:	
;TOUCH.C: 377: M3ANALOG = 0B00000100;
	movlw	(04h)
	movwf	(917)^0380h	;volatile
	line	378
	
l12999:	
;TOUCH.C: 378: TKM3C0 = 0xC0;
	movlw	(0C0h)
	movwf	(924)^0380h	;volatile
	line	379
	
l13001:	
;TOUCH.C: 379: TKM3C1 = 0x18;
	movlw	(018h)
	movwf	(925)^0380h	;volatile
	line	380
	
l13003:	
;TOUCH.C: 380: if(fmd_HfreqOn == 1)
	movlb 0	; select bank0
	decf	(_fmd_HfreqOn),w
	skipz
	goto	u3411
	goto	u3410
u3411:
	goto	l13015
u3410:
	line	383
	
l13005:	
;TOUCH.C: 381: {
;TOUCH.C: 383: TKST = 1;
	movlb 7	; select bank7
	bsf	(7277/8)^0380h,(7277)&7
	line	384
;TOUCH.C: 384: while(TKRCOV==0);
	
l7307:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u3421
	goto	u3420
u3421:
	goto	l7307
u3420:
	line	385
	
l13007:	
;TOUCH.C: 385: fmd_OriginalData = (TKM116DH << 8) +TKM116DL;
	movlb 31	; select bank31
	movf	(3997)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(3996)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	386
;TOUCH.C: 386: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	goto	l12953
	line	394
	
l13015:	
;TOUCH.C: 392: else
;TOUCH.C: 393: {
;TOUCH.C: 394: TouchInit(0);
	movlw	(0)
	fcall	_TouchInit
	goto	l7332
	line	397
	
l13017:	
;TOUCH.C: 397: else if(a<12)
	movlw	(0Ch)
	subwf	(StartHigeFreq@a),w
	skipnc
	goto	u3431
	goto	u3430
u3431:
	goto	l13073
u3430:
	line	399
	
l13019:	
;TOUCH.C: 398: {
;TOUCH.C: 399: TouchInit(1);
	movlw	(01h)
	fcall	_TouchInit
	line	400
	
l13021:	
;TOUCH.C: 400: M2ANALOG = 0B00000100;
	movlw	(04h)
	movlb 7	; select bank7
	movwf	(916)^0380h	;volatile
	line	401
	
l13023:	
;TOUCH.C: 401: TKM2C0 = 0x03| ((a-8)<<6);
	movf	(StartHigeFreq@a),w
	movwf	(??_StartHigeFreq+0)+0
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,w
	andlw	0c0h
	iorlw	03h
	movwf	(922)^0380h	;volatile
	line	402
	
l13025:	
;TOUCH.C: 402: TKM2C1 = 0x10 | (0x01 << (a-8));
	movlw	(01h)
	movwf	(??_StartHigeFreq+0)+0
	movf	(StartHigeFreq@a),w
	addlw	-8
	incf	wreg,f
	goto	u3444
u3445:
	lslf	(??_StartHigeFreq+0)+0,f
u3444:
	decfsz	wreg,f
	goto	u3445
	movf	0+(??_StartHigeFreq+0)+0,w
	iorlw	010h
	movwf	(923)^0380h	;volatile
	line	404
	
l13027:	
;TOUCH.C: 404: M3ANALOG = 0B00000100;
	movlw	(04h)
	movwf	(917)^0380h	;volatile
	line	405
	
l13029:	
;TOUCH.C: 405: TKM3C0 = 0xC3;
	movlw	(0C3h)
	movwf	(924)^0380h	;volatile
	line	406
	
l13031:	
;TOUCH.C: 406: TKM3C1 = 0x18;
	movlw	(018h)
	movwf	(925)^0380h	;volatile
	line	407
	
l13033:	
;TOUCH.C: 407: if(fmd_HfreqOn == 1)
	movlb 0	; select bank0
	decf	(_fmd_HfreqOn),w
	skipz
	goto	u3451
	goto	u3450
u3451:
	goto	l13045
u3450:
	line	409
	
l13035:	
;TOUCH.C: 408: {
;TOUCH.C: 409: TKST = 1;
	movlb 7	; select bank7
	bsf	(7277/8)^0380h,(7277)&7
	line	410
;TOUCH.C: 410: while(TKRCOV==0);
	
l7314:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u3461
	goto	u3460
u3461:
	goto	l7314
u3460:
	line	411
	
l13037:	
;TOUCH.C: 411: fmd_OriginalData = (TKM216DH << 8) +TKM216DL;
	movlb 31	; select bank31
	movf	(4005)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(4004)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	412
;TOUCH.C: 412: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	413
	
l13039:	
;TOUCH.C: 413: DIV();
	fcall	_DIV
	line	415
	
l13041:	
;TOUCH.C: 415: fmd_TouchDataBuff_Key[3] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	1+(_fmd_TouchDataBuff_Key)+06h
	movf	(87),w
	movwf	0+(_fmd_TouchDataBuff_Key)+06h
	line	416
	
l13043:	
;TOUCH.C: 416: fmd_nodownsum_Key[fmd_a][3] = fmd_TouchDataBuff_Key[3];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	06h
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+06h,w
	movwi	[0]fsr1
	movf	1+(_fmd_TouchDataBuff_Key)+06h,w
	movwi	[1]fsr1
	line	419
	
l13045:	
;TOUCH.C: 417: }
;TOUCH.C: 419: TouchInit(2);
	movlw	(02h)
	fcall	_TouchInit
	line	420
	
l13047:	
;TOUCH.C: 420: M2ANALOG = 0B00000100;
	movlw	(04h)
	movlb 7	; select bank7
	movwf	(916)^0380h	;volatile
	line	421
	
l13049:	
;TOUCH.C: 421: TKM2C0 = 0x00 | ((a-8)<<6);
	movf	(StartHigeFreq@a),w
	movwf	(??_StartHigeFreq+0)+0
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,w
	andlw	0c0h
	movwf	(922)^0380h	;volatile
	line	422
	
l13051:	
;TOUCH.C: 422: TKM2C1 = 0x10 | (0x01 << (a-8));
	movlw	(01h)
	movwf	(??_StartHigeFreq+0)+0
	movf	(StartHigeFreq@a),w
	addlw	-8
	incf	wreg,f
	goto	u3474
u3475:
	lslf	(??_StartHigeFreq+0)+0,f
u3474:
	decfsz	wreg,f
	goto	u3475
	movf	0+(??_StartHigeFreq+0)+0,w
	iorlw	010h
	movwf	(923)^0380h	;volatile
	line	423
	
l13053:	
;TOUCH.C: 423: M3ANALOG = 0B00000100;
	movlw	(04h)
	movwf	(917)^0380h	;volatile
	line	424
	
l13055:	
;TOUCH.C: 424: TKM3C0 = 0xC0;
	movlw	(0C0h)
	movwf	(924)^0380h	;volatile
	line	425
	
l13057:	
;TOUCH.C: 425: TKM3C1 = 0x18;
	movlw	(018h)
	movwf	(925)^0380h	;volatile
	line	426
	
l13059:	
;TOUCH.C: 426: if(fmd_HfreqOn == 1)
	movlb 0	; select bank0
	decf	(_fmd_HfreqOn),w
	skipz
	goto	u3481
	goto	u3480
u3481:
	goto	l13071
u3480:
	line	428
	
l13061:	
;TOUCH.C: 427: {
;TOUCH.C: 428: TKST = 1;
	movlb 7	; select bank7
	bsf	(7277/8)^0380h,(7277)&7
	line	429
;TOUCH.C: 429: while(TKRCOV==0);
	
l7318:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u3491
	goto	u3490
u3491:
	goto	l7318
u3490:
	line	430
	
l13063:	
;TOUCH.C: 430: fmd_OriginalData = (TKM216DH << 8) +TKM216DL;
	movlb 31	; select bank31
	movf	(4005)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(4004)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	431
;TOUCH.C: 431: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	goto	l12953
	line	439
	
l13071:	
;TOUCH.C: 437: else
;TOUCH.C: 438: {
;TOUCH.C: 439: TouchInit(0);
	movlw	(0)
	fcall	_TouchInit
	goto	l7332
	line	444
	
l13073:	
;TOUCH.C: 442: else
;TOUCH.C: 443: {
;TOUCH.C: 444: TouchInit(1);
	movlw	(01h)
	fcall	_TouchInit
	line	445
	
l13075:	
;TOUCH.C: 445: M2ANALOG = 0B00000100;
	movlw	(04h)
	movlb 7	; select bank7
	movwf	(916)^0380h	;volatile
	line	446
	
l13077:	
;TOUCH.C: 446: TKM2C0 = 0x03 ;
	movlw	(03h)
	movwf	(922)^0380h	;volatile
	line	447
	
l13079:	
;TOUCH.C: 447: TKM2C1 = 0x90;
	movlw	(090h)
	movwf	(923)^0380h	;volatile
	line	448
	
l13081:	
;TOUCH.C: 448: M3ANALOG = 0B00000100;
	movlw	(04h)
	movwf	(917)^0380h	;volatile
	line	449
	
l13083:	
;TOUCH.C: 449: TKM3C0 = 0x03 | ((a-12)<<6);
	movf	(StartHigeFreq@a),w
	movwf	(??_StartHigeFreq+0)+0
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,w
	andlw	0c0h
	iorlw	03h
	movwf	(924)^0380h	;volatile
	line	450
	
l13085:	
;TOUCH.C: 450: TKM3C1 = 0x98 | (0x01 << (a-12));
	movlw	(01h)
	movwf	(??_StartHigeFreq+0)+0
	movf	(StartHigeFreq@a),w
	addlw	-12
	incf	wreg,f
	goto	u3504
u3505:
	lslf	(??_StartHigeFreq+0)+0,f
u3504:
	decfsz	wreg,f
	goto	u3505
	movf	0+(??_StartHigeFreq+0)+0,w
	iorlw	098h
	movwf	(925)^0380h	;volatile
	line	451
	
l13087:	
;TOUCH.C: 451: if(fmd_HfreqOn == 1)
	movlb 0	; select bank0
	decf	(_fmd_HfreqOn),w
	skipz
	goto	u3511
	goto	u3510
u3511:
	goto	l13099
u3510:
	line	453
	
l13089:	
;TOUCH.C: 452: {
;TOUCH.C: 453: TKST = 1;
	movlb 7	; select bank7
	bsf	(7277/8)^0380h,(7277)&7
	line	454
;TOUCH.C: 454: while(TKRCOV==0);
	
l7324:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u3521
	goto	u3520
u3521:
	goto	l7324
u3520:
	line	455
	
l13091:	
;TOUCH.C: 455: fmd_OriginalData = (TKM216DH << 8) +TKM216DL;
	movlb 31	; select bank31
	movf	(4005)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(81+1)
	clrf	(81)
	movlb 31	; select bank31
	movf	(4004)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(81),f
	skipnc
	incf	(81+1),f
	line	456
;TOUCH.C: 456: fmd_ReferenceData = (TKM316DH << 8) +TKM316DL;
	movlb 31	; select bank31
	movf	(4013)^0F80h,w	;volatile
	movlb 0	; select bank0
	movwf	(85+1)
	clrf	(85)
	movlb 31	; select bank31
	movf	(4012)^0F80h,w	;volatile
	movlb 0	; select bank0
	addwf	(85),f
	skipnc
	incf	(85+1),f
	line	457
	
l13093:	
;TOUCH.C: 457: DIV();
	fcall	_DIV
	line	459
	
l13095:	
;TOUCH.C: 459: fmd_TouchDataBuff_Key[3] =fmd_ResultData;
	movlb 0	; select bank0
	movf	(87+1),w
	movwf	1+(_fmd_TouchDataBuff_Key)+06h
	movf	(87),w
	movwf	0+(_fmd_TouchDataBuff_Key)+06h
	line	460
	
l13097:	
;TOUCH.C: 460: fmd_nodownsum_Key[fmd_a][3] = fmd_TouchDataBuff_Key[3];
	movf	(_fmd_a),w	;volatile
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	06h
	addlw	low 9080
	movwf	fsr1l
	movlw	high 9080
	skipnc
	movlw	high (9080)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+06h,w
	movwi	[0]fsr1
	movf	1+(_fmd_TouchDataBuff_Key)+06h,w
	movwi	[1]fsr1
	line	463
	
l13099:	
;TOUCH.C: 461: }
;TOUCH.C: 463: TouchInit(2);
	movlw	(02h)
	fcall	_TouchInit
	line	464
	
l13101:	
;TOUCH.C: 464: M2ANALOG = 0B00000100;
	movlw	(04h)
	movlb 7	; select bank7
	movwf	(916)^0380h	;volatile
	line	465
	
l13103:	
;TOUCH.C: 465: TKM2C0 = 0x00 ;
	clrf	(922)^0380h	;volatile
	line	466
	
l13105:	
;TOUCH.C: 466: TKM2C1 = 0x90;
	movlw	(090h)
	movwf	(923)^0380h	;volatile
	line	467
	
l13107:	
;TOUCH.C: 467: M3ANALOG = 0B00000100;
	movlw	(04h)
	movwf	(917)^0380h	;volatile
	line	468
	
l13109:	
;TOUCH.C: 468: TKM3C0 = 0x00 | ((a-12)<<6);
	movf	(StartHigeFreq@a),w
	movwf	(??_StartHigeFreq+0)+0
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,f
	rrf	(??_StartHigeFreq+0)+0,w
	andlw	0c0h
	movwf	(924)^0380h	;volatile
	line	469
	
l13111:	
;TOUCH.C: 469: TKM3C1 = 0x98 | (0x01 << (a-12));
	movlw	(01h)
	movwf	(??_StartHigeFreq+0)+0
	movf	(StartHigeFreq@a),w
	addlw	-12
	incf	wreg,f
	goto	u3534
u3535:
	lslf	(??_StartHigeFreq+0)+0,f
u3534:
	decfsz	wreg,f
	goto	u3535
	movf	0+(??_StartHigeFreq+0)+0,w
	iorlw	098h
	movwf	(925)^0380h	;volatile
	line	470
	
l13113:	
;TOUCH.C: 470: if(fmd_HfreqOn == 1)
	movlb 0	; select bank0
	decf	(_fmd_HfreqOn),w
	skipz
	goto	u3541
	goto	u3540
u3541:
	goto	l13125
u3540:
	line	472
	
l13115:	
;TOUCH.C: 471: {
;TOUCH.C: 472: TKST = 1;
	movlb 7	; select bank7
	bsf	(7277/8)^0380h,(7277)&7
	line	473
;TOUCH.C: 473: while(TKRCOV==0);
	
l7328:	
	btfss	(7278/8)^0380h,(7278)&7
	goto	u3551
	goto	u3550
u3551:
	goto	l7328
u3550:
	goto	l13063
	line	482
	
l13125:	
;TOUCH.C: 480: else
;TOUCH.C: 481: {
;TOUCH.C: 482: TouchInit(0);
	movlw	(0)
	fcall	_TouchInit
	line	485
	
l7332:	
	return
	opt stack 0
GLOBAL	__end_of_StartHigeFreq
	__end_of_StartHigeFreq:
;; =============== function _StartHigeFreq ends ============

	signat	_StartHigeFreq,4216
	global	_DelayUs
psect	text628,local,class=CODE,delta=2
global __ptext628
__ptext628:

;; *************** function _DelayUs *****************
;; Defined at:
;;		line 55 in file "TEST_62F08X_UART.C"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    0[COMMON] unsigned char 
;;  a               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/4
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DelayMs
;; This function uses a non-reentrant model
;;
psect	text628
	file	"TEST_62F08X_UART.C"
	line	55
	global	__size_of_DelayUs
	__size_of_DelayUs	equ	__end_of_DelayUs-_DelayUs
	
_DelayUs:	
	opt	stack 13
; Regs used in _DelayUs: [wreg+status,2+status,0]
;DelayUs@Time stored from wreg
	line	57
	movwf	(DelayUs@Time)
	
l12897:	
;TEST_62F08X_UART.C: 56: unsigned char a;
;TEST_62F08X_UART.C: 57: for(a=0;a<Time;a++)
	clrf	(DelayUs@a)
	goto	l12901
	line	58
	
l4774:	
	line	59
;TEST_62F08X_UART.C: 58: {
;TEST_62F08X_UART.C: 59: _nop();
	nop
	line	57
	
l12899:	
	incf	(DelayUs@a),f
	
l12901:	
	movf	(DelayUs@Time),w
	subwf	(DelayUs@a),w
	skipc
	goto	u3281
	goto	u3280
u3281:
	goto	l4774
u3280:
	line	61
	
l4776:	
	return
	opt stack 0
GLOBAL	__end_of_DelayUs
	__end_of_DelayUs:
;; =============== function _DelayUs ends ============

	signat	_DelayUs,4216
	global	_TouchInital
psect	text629,local,class=CODE,delta=2
global __ptext629
__ptext629:

;; *************** function _TouchInital *****************
;; Defined at:
;;		line 225 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 1F/2
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___awdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text629
	file	"TOUCH.C"
	line	225
	global	__size_of_TouchInital
	__size_of_TouchInital	equ	__end_of_TouchInital-_TouchInital
	
_TouchInital:	
	opt	stack 13
; Regs used in _TouchInital: [wreg+fsr1l-status,0+pclath+cstack]
	line	227
	
l12841:	
;TOUCH.C: 227: TRISA4 =1;
	movlb 1	; select bank1
	bsf	(1124/8)^080h,(1124)&7
	
l7266:	
	line	229
;TOUCH.C: 229: TRISA5 =1;
	bsf	(1125/8)^080h,(1125)&7
	
l7267:	
	line	231
;TOUCH.C: 231: TRISA6 =1;
	bsf	(1126/8)^080h,(1126)&7
	
l7268:	
	line	233
;TOUCH.C: 233: TRISA7 =1;
	bsf	(1127/8)^080h,(1127)&7
	
l7269:	
	line	235
;TOUCH.C: 235: TRISD5 =1;
	bsf	(1149/8)^080h,(1149)&7
	
l7270:	
	line	237
;TOUCH.C: 237: TRISC0 =1;
	bsf	(1136/8)^080h,(1136)&7
	
l7271:	
	line	239
;TOUCH.C: 239: TRISC1 =1;
	bsf	(1137/8)^080h,(1137)&7
	
l7272:	
	line	241
;TOUCH.C: 241: TRISB7 =1;
	bsf	(1135/8)^080h,(1135)&7
	line	255
	
l7280:	
	line	256
;TOUCH.C: 256: TRISC7 =1;
	bsf	(1143/8)^080h,(1143)&7
	line	258
	
l12857:	
;TOUCH.C: 258: fmd_Startgx = 0;
	movlb 0	; select bank0
	clrf	(_fmd_Startgx)
	line	259
	
l12859:	
;TOUCH.C: 259: fmd_updataFlag = 2;
	movlw	(02h)
	movwf	(_fmd_updataFlag)
	line	260
	
l12861:	
;TOUCH.C: 260: fmd_UpTouchCount = 400;
	movlw	low(0190h)
	movlb 1	; select bank1
	movwf	(_fmd_UpTouchCount)^080h
	movlw	high(0190h)
	movwf	((_fmd_UpTouchCount)^080h)+1
	line	261
	
l12863:	
;TOUCH.C: 261: fmd_DownTouchCount = 600;
	movlw	low(0258h)
	movlb 0	; select bank0
	movwf	(_fmd_DownTouchCount)
	movlw	high(0258h)
	movwf	((_fmd_DownTouchCount))+1
	line	262
	
l12865:	
;TOUCH.C: 262: fmd_TestCount = 0;
	clrf	(_fmd_TestCount)
	file	"touch.h"
	line	306
	
l12867:	
	clrf	(_fmd_u)	;volatile
	file	"TOUCH.C"
	line	268
	
l12869:	
;TOUCH.C: 268: fmd_u=fmd_thedeathcount;
	movlb 1	; select bank1
	movf	(_fmd_thedeathcount)^080h,w
	movlb 0	; select bank0
	movwf	(_fmd_u)	;volatile
	line	269
	
l12871:	
;TOUCH.C: 269: fmd_u=fmd_thedeathcount1;
	movlb 1	; select bank1
	movf	(_fmd_thedeathcount1)^080h,w
	movlb 0	; select bank0
	movwf	(_fmd_u)	;volatile
	file	"touch.h"
	line	302
	
l12873:	
	movlw	01Eh
	movlb 1	; select bank1
	movwf	(_fmd_thedeathcount2)^080h
	clrf	(_fmd_thedeathcount2+1)^080h
	file	"TOUCH.C"
	line	273
;TOUCH.C: 273: fmd_a=0;
	movlb 0	; select bank0
	clrf	(_fmd_a)	;volatile
	line	274
;TOUCH.C: 274: fmd_a2=0;
	clrf	(_fmd_a2)	;volatile
	line	276
;TOUCH.C: 276: for(fmd_u=0;fmd_u<15;fmd_u++)
	clrf	(_fmd_u)	;volatile
	
l12875:	
	movlw	(0Fh)
	subwf	(_fmd_u),w	;volatile
	skipc
	goto	u3251
	goto	u3250
u3251:
	goto	l12879
u3250:
	goto	l12891
	line	278
	
l12879:	
	movlw	low(0FFh)
	movwf	(??_TouchInital+0)+0
	movlw	high(0FFh)
	movwf	(??_TouchInital+0)+0+1
	incf	(_fmd_u),w	;volatile
	goto	u3264
u3265:
	lsrf	(??_TouchInital+0)+1,f
	rrf	(??_TouchInital+0)+0,f
u3264:
	decfsz	wreg,f
	goto	u3265
	btfss	0+(??_TouchInital+0)+0,(0)&7
	goto	u3271
	goto	u3270
u3271:
	goto	l12887
u3270:
	line	280
	
l12881:	
;TOUCH.C: 279: {
;TOUCH.C: 280: fmd_channels =fmd_a;
	movf	(_fmd_a),w	;volatile
	movwf	(_fmd_channels)
	line	281
	
l12883:	
;TOUCH.C: 281: fmd_theUsedChannel[fmd_a++]=fmd_u;
	movf	(_fmd_a),w
	addlw	_fmd_theUsedChannel&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(_fmd_u),w	;volatile
	movwf	indf1
	
l12885:	
	incf	(_fmd_a),f	;volatile
	line	276
	
l12887:	
	incf	(_fmd_u),f	;volatile
	goto	l12875
	line	285
	
l12891:	
;TOUCH.C: 282: }
;TOUCH.C: 283: }
;TOUCH.C: 285: fmd_a=fmd_theUsedChannel[0];
	movlb 1	; select bank1
	movf	(_fmd_theUsedChannel)^080h,w
	movlb 0	; select bank0
	movwf	(_fmd_a)	;volatile
	line	287
	
l12893:	
	movf	(_fmd_channels),w
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	incf	(?___awdiv),f
	skipnz
	incf	(?___awdiv+1),f
	movlw	042h
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(?___awdiv+1)
	movf	(0+(?___awdiv)),w
	movwf	(?___awdiv)
	movlw	low(01F4h)
	movwf	0+(?___awdiv)+02h
	movlw	high(01F4h)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movlb 1	; select bank1
	movwf	(_fmd_UpDataTime+1)^080h
	movf	(0+(?___awdiv)),w
	movwf	(_fmd_UpDataTime)^080h
	line	288
	
l12895:	
	movlb 0	; select bank0
	movf	(_fmd_channels),w
	movwf	(?___awdiv)
	clrf	(?___awdiv+1)
	incf	(?___awdiv),f
	skipnz
	incf	(?___awdiv+1),f
	movlw	042h
	movwf	0+(?___awdiv)+02h
	clrf	1+(?___awdiv)+02h
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(?___awdiv+1)
	movf	(0+(?___awdiv)),w
	movwf	(?___awdiv)
	movlw	low(0FA0h)
	movwf	0+(?___awdiv)+02h
	movlw	high(0FA0h)
	movwf	(0+(?___awdiv)+02h)+1
	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	movwf	(_fmd_DownDataTime+1)
	movf	(0+(?___awdiv)),w
	movwf	(_fmd_DownDataTime)
	line	289
	
l7284:	
	return
	opt stack 0
GLOBAL	__end_of_TouchInital
	__end_of_TouchInital:
;; =============== function _TouchInital ends ============

	signat	_TouchInital,88
	global	___awdiv
psect	text630,local,class=CODE,delta=2
global __ptext630
__ptext630:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "c:\users\dengjiang\desktop\fmd\fmdide\data\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    6[COMMON] int 
;;  sign            1    5[COMMON] unsigned char 
;;  counter         1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         4       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         8       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_TouchInital
;; This function uses a non-reentrant model
;;
psect	text630
	file	"c:\users\dengjiang\desktop\fmd\fmdide\data\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 13
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l12797:	
	clrf	(___awdiv@sign)
	line	10
	
l12799:	
	btfss	(___awdiv@divisor+1),7
	goto	u3181
	goto	u3180
u3181:
	goto	l12805
u3180:
	line	11
	
l12801:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	
l12803:	
	clrf	(___awdiv@sign)
	incf	(___awdiv@sign),f
	line	14
	
l12805:	
	btfss	(___awdiv@dividend+1),7
	goto	u3191
	goto	u3190
u3191:
	goto	l12811
u3190:
	line	15
	
l12807:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l12809:	
	movlw	(01h)
	xorwf	(___awdiv@sign),f
	line	18
	
l12811:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l12813:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u3201
	goto	u3200
u3201:
	goto	l12833
u3200:
	line	20
	
l12815:	
	clrf	(___awdiv@counter)
	incf	(___awdiv@counter),f
	line	21
	goto	l12819
	line	22
	
l12817:	
	lslf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	line	23
	incf	(___awdiv@counter),f
	line	21
	
l12819:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u3211
	goto	u3210
u3211:
	goto	l12817
u3210:
	line	26
	
l12821:	
	lslf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	line	27
	
l12823:	
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u3225
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u3225:
	skipc
	goto	u3221
	goto	u3220
u3221:
	goto	l12829
u3220:
	line	28
	
l12825:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	subwfb	(___awdiv@dividend+1),f
	line	29
	
l12827:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	line	31
	
l12829:	
	lsrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	line	32
	
l12831:	
	decfsz	(___awdiv@counter),f
	goto	u3231
	goto	u3230
u3231:
	goto	l12821
u3230:
	line	34
	
l12833:	
	movf	(___awdiv@sign),w
	skipz
	goto	u3240
	goto	l12837
u3240:
	line	35
	
l12835:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	line	36
	
l12837:	
	movf	(___awdiv@quotient+1),w
	movwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	movwf	(?___awdiv)
	line	37
	
l9353:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___bmul
psect	text631,local,class=CODE,delta=2
global __ptext631
__ptext631:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "c:\users\dengjiang\desktop\fmd\fmdide\data\sources\bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1    2[COMMON] unsigned char 
;;  product         1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DataProcessing
;; This function uses a non-reentrant model
;;
psect	text631
	file	"c:\users\dengjiang\desktop\fmd\fmdide\data\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 11
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	movwf	(___bmul@multiplier)
	line	4
	
l12765:	
	clrf	(___bmul@product)
	line	7
	
l12767:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u3141
	goto	u3140
u3141:
	goto	l12771
u3140:
	line	8
	
l12769:	
	movf	(___bmul@multiplicand),w
	addwf	(___bmul@product),f
	line	9
	
l12771:	
	lslf	(___bmul@multiplicand),f
	line	10
	
l12773:	
	lsrf	(___bmul@multiplier),f
	line	11
	
l12775:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u3151
	goto	u3150
u3151:
	goto	l12767
u3150:
	line	12
	
l12777:	
	movf	(___bmul@product),w
	line	13
	
l9200:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_HighFreqCo
psect	text632,local,class=CODE,delta=2
global __ptext632
__ptext632:

;; *************** function _HighFreqCo *****************
;; Defined at:
;;		line 1016 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  a               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DataProcessing
;; This function uses a non-reentrant model
;;
psect	text632
	file	"TOUCH.C"
	line	1016
	global	__size_of_HighFreqCo
	__size_of_HighFreqCo	equ	__end_of_HighFreqCo-_HighFreqCo
	
_HighFreqCo:	
	opt	stack 11
; Regs used in _HighFreqCo: [wreg-status,0]
;HighFreqCo@a stored from wreg
	movwf	(HighFreqCo@a)
	line	1017
	
l12745:	
;TOUCH.C: 1017: if((fmd_nodownavrdata_Key[a][3]>=fmd_TouchDataBuff_Key[3]))
	movf	(HighFreqCo@a),w
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	06h
	addlw	low 8960
	movwf	fsr1l
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	(fsr1l)+1
	moviw	[0]fsr1
	movwf	(??_HighFreqCo+0)+0
	moviw	[1]fsr1
	movwf	(??_HighFreqCo+0)+0+1
	movf	1+(_fmd_TouchDataBuff_Key)+06h,w
	subwf	1+(??_HighFreqCo+0)+0,w
	skipz
	goto	u3105
	movf	0+(_fmd_TouchDataBuff_Key)+06h,w
	subwf	0+(??_HighFreqCo+0)+0,w
u3105:
	skipc
	goto	u3101
	goto	u3100
u3101:
	goto	l12753
u3100:
	line	1019
	
l12747:	
;TOUCH.C: 1018: {
;TOUCH.C: 1019: if((fmd_nodownavrdata_Key[a][3] - fmd_TouchDataBuff_Key[3])<255)
	movlw	(06h)
	addlw	_fmd_TouchDataBuff_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(HighFreqCo@a),w
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	06h
	addlw	low 8960
	movwf	fsr0l
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	(fsr0l)+1
	moviw	[0]fsr1
	subwf	indf0,w
	movwf	(??_HighFreqCo+0)+0
	addfsr	fsr0,1
	moviw	[1]fsr1
	subwfb	indf0,w
	movwf	(??_HighFreqCo+0)+0+1
	movlw	high(0FFh)
	subwf	1+(??_HighFreqCo+0)+0,w
	movlw	low(0FFh)
	skipnz
	subwf	0+(??_HighFreqCo+0)+0,w
	skipnc
	goto	u3111
	goto	u3110
u3111:
	goto	l12751
u3110:
	line	1021
	
l12749:	
;TOUCH.C: 1020: {
;TOUCH.C: 1021: fmd_KeyDValue_Key[3]= fmd_nodownavrdata_Key[a][3] - fmd_TouchDataBuff_Key[3];
	movf	(HighFreqCo@a),w
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	06h
	addlw	low 8960
	movwf	fsr1l
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+06h,w
	subwf	indf1,w
	movwf	0+(_fmd_KeyDValue_Key)+03h
	line	1022
;TOUCH.C: 1022: }
	goto	l12755
	line	1025
	
l12751:	
;TOUCH.C: 1023: else
;TOUCH.C: 1024: {
;TOUCH.C: 1025: fmd_KeyDValue_Key[3]=255;
	movlw	(0FFh)
	movwf	0+(_fmd_KeyDValue_Key)+03h
	goto	l12755
	line	1030
	
l12753:	
;TOUCH.C: 1028: else
;TOUCH.C: 1029: {
;TOUCH.C: 1030: fmd_KeyDValue_Key[3]=0;
	clrf	0+(_fmd_KeyDValue_Key)+03h
	line	1033
	
l12755:	
;TOUCH.C: 1031: }
;TOUCH.C: 1033: if((fmd_nodownavrdata_Key[a][2]>=fmd_TouchDataBuff_Key[2]))
	movf	(HighFreqCo@a),w
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	04h
	addlw	low 8960
	movwf	fsr1l
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	(fsr1l)+1
	moviw	[0]fsr1
	movwf	(??_HighFreqCo+0)+0
	moviw	[1]fsr1
	movwf	(??_HighFreqCo+0)+0+1
	movf	1+(_fmd_TouchDataBuff_Key)+04h,w
	subwf	1+(??_HighFreqCo+0)+0,w
	skipz
	goto	u3125
	movf	0+(_fmd_TouchDataBuff_Key)+04h,w
	subwf	0+(??_HighFreqCo+0)+0,w
u3125:
	skipc
	goto	u3121
	goto	u3120
u3121:
	goto	l12763
u3120:
	line	1035
	
l12757:	
;TOUCH.C: 1034: {
;TOUCH.C: 1035: if((fmd_nodownavrdata_Key[a][2] - fmd_TouchDataBuff_Key[2])<255)
	movlw	(04h)
	addlw	_fmd_TouchDataBuff_Key&0ffh
	movwf	fsr1l
	clrf fsr1h	
	
	movf	(HighFreqCo@a),w
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	04h
	addlw	low 8960
	movwf	fsr0l
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	(fsr0l)+1
	moviw	[0]fsr1
	subwf	indf0,w
	movwf	(??_HighFreqCo+0)+0
	addfsr	fsr0,1
	moviw	[1]fsr1
	subwfb	indf0,w
	movwf	(??_HighFreqCo+0)+0+1
	movlw	high(0FFh)
	subwf	1+(??_HighFreqCo+0)+0,w
	movlw	low(0FFh)
	skipnz
	subwf	0+(??_HighFreqCo+0)+0,w
	skipnc
	goto	u3131
	goto	u3130
u3131:
	goto	l12761
u3130:
	line	1037
	
l12759:	
;TOUCH.C: 1036: {
;TOUCH.C: 1037: fmd_KeyDValue_Key[2]= fmd_nodownavrdata_Key[a][2] - fmd_TouchDataBuff_Key[2];
	movf	(HighFreqCo@a),w
	addwf	wreg,w
	addwf	wreg,w
	addwf	wreg,w
	addlw	04h
	addlw	low 8960
	movwf	fsr1l
	movlw	high 8960
	skipnc
	movlw	high (8960)+1
	movwf	(fsr1l)+1
	movf	0+(_fmd_TouchDataBuff_Key)+04h,w
	subwf	indf1,w
	movwf	0+(_fmd_KeyDValue_Key)+02h
	line	1038
;TOUCH.C: 1038: }
	goto	l7449
	line	1041
	
l12761:	
;TOUCH.C: 1039: else
;TOUCH.C: 1040: {
;TOUCH.C: 1041: fmd_KeyDValue_Key[2]=255;
	movlw	(0FFh)
	movwf	0+(_fmd_KeyDValue_Key)+02h
	goto	l7449
	line	1046
	
l12763:	
;TOUCH.C: 1044: else
;TOUCH.C: 1045: {
;TOUCH.C: 1046: fmd_KeyDValue_Key[2]=0;
	clrf	0+(_fmd_KeyDValue_Key)+02h
	line	1048
	
l7449:	
	return
	opt stack 0
GLOBAL	__end_of_HighFreqCo
	__end_of_HighFreqCo:
;; =============== function _HighFreqCo ends ============

	signat	_HighFreqCo,4216
	global	_MxSet013
psect	text633,local,class=CODE,delta=2
global __ptext633
__ptext633:

;; *************** function _MxSet013 *****************
;; Defined at:
;;		line 291 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;  a               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  a               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 1F/7
;;		On exit  : 1F/7
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ReadTouchData
;; This function uses a non-reentrant model
;;
psect	text633
	file	"TOUCH.C"
	line	291
	global	__size_of_MxSet013
	__size_of_MxSet013	equ	__end_of_MxSet013-_MxSet013
	
_MxSet013:	
	opt	stack 12
; Regs used in _MxSet013: [wreg]
;MxSet013@a stored from wreg
	movwf	(MxSet013@a)
	line	292
	
l12743:	
;TOUCH.C: 292: M0ANALOG = a;
	movf	(MxSet013@a),w
	movwf	(914)^0380h	;volatile
	line	293
;TOUCH.C: 293: M1ANALOG = a;
	movf	(MxSet013@a),w
	movwf	(915)^0380h	;volatile
	line	294
;TOUCH.C: 294: M3ANALOG = a;
	movf	(MxSet013@a),w
	movwf	(917)^0380h	;volatile
	line	295
	movlw	(01Fh)
	movwf	(919)^0380h	;volatile
	line	296
	movlw	(01Fh)
	movwf	(921)^0380h	;volatile
	line	297
;TOUCH.C: 297: TKM3C1 = 0x18;
	movlw	(018h)
	movwf	(925)^0380h	;volatile
	line	298
	
l7287:	
	return
	opt stack 0
GLOBAL	__end_of_MxSet013
	__end_of_MxSet013:
;; =============== function _MxSet013 ends ============

	signat	_MxSet013,4216
	global	_TouchInit
psect	text634,local,class=CODE,delta=2
global __ptext634
__ptext634:

;; *************** function _TouchInit *****************
;; Defined at:
;;		line 198 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;  Time            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Time            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 18/7
;;		On exit  : 1F/1
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         1       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_StartHigeFreq
;;		_ReadTouchData
;; This function uses a non-reentrant model
;;
psect	text634
	file	"TOUCH.C"
	line	198
	global	__size_of_TouchInit
	__size_of_TouchInit	equ	__end_of_TouchInit-_TouchInit
	
_TouchInit:	
	opt	stack 10
; Regs used in _TouchInit: [wreg+status,2]
;TouchInit@Time stored from wreg
	movwf	(TouchInit@Time)
	line	199
	
l12713:	
;TOUCH.C: 199: TKTMR = 255 - Time;
	comf	(TouchInit@Time),w
	movlb 7	; select bank7
	movwf	(908)^0380h	;volatile
	line	202
	
l12715:	
;TOUCH.C: 202: TKC0 = 0x00;
	clrf	(909)^0380h	;volatile
	line	207
;TOUCH.C: 207: TKC1 = 0x03;
	movlw	(03h)
	movwf	(910)^0380h	;volatile
	line	209
	
l12717:	
;TOUCH.C: 209: M0ANALOG = 0;
	clrf	(914)^0380h	;volatile
	line	210
	
l12719:	
;TOUCH.C: 210: TKM0C0 = 0;
	clrf	(918)^0380h	;volatile
	line	211
	
l12721:	
;TOUCH.C: 211: TKM0C1 = 0;
	clrf	(919)^0380h	;volatile
	line	212
	
l12723:	
;TOUCH.C: 212: M1ANALOG = 0;
	clrf	(915)^0380h	;volatile
	line	213
	
l12725:	
;TOUCH.C: 213: TKM1C0 = 0;
	clrf	(920)^0380h	;volatile
	line	214
	
l12727:	
;TOUCH.C: 214: TKM1C1 = 0;
	clrf	(921)^0380h	;volatile
	line	215
	
l12729:	
;TOUCH.C: 215: M2ANALOG = 0;
	clrf	(916)^0380h	;volatile
	line	216
	
l12731:	
;TOUCH.C: 216: TKM2C0 = 0;
	clrf	(922)^0380h	;volatile
	line	217
	
l12733:	
;TOUCH.C: 217: TKM2C1 = 0;
	clrf	(923)^0380h	;volatile
	line	218
	
l12735:	
;TOUCH.C: 218: M3ANALOG = 0;
	clrf	(917)^0380h	;volatile
	line	219
	
l12737:	
;TOUCH.C: 219: TKM3C0 = 0;
	clrf	(924)^0380h	;volatile
	line	220
	
l12739:	
;TOUCH.C: 220: TKM3C1 = 0;
	clrf	(925)^0380h	;volatile
	line	221
	
l12741:	
;TOUCH.C: 221: PCKEN = PCKEN | 0x80;
	movlb 1	; select bank1
	bsf	(154)^080h+(7/8),(7)&7	;volatile
	line	222
	
l7263:	
	return
	opt stack 0
GLOBAL	__end_of_TouchInit
	__end_of_TouchInit:
;; =============== function _TouchInit ends ============

	signat	_TouchInit,4216
	global	_DIV
psect	text635,local,class=CODE,delta=2
global __ptext635
__ptext635:

;; *************** function _DIV *****************
;; Defined at:
;;		line 109 in file "TOUCH.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_StartHigeFreq
;;		_ReadTouchData
;;		_DataProcessing
;; This function uses a non-reentrant model
;;
psect	text635
	file	"TOUCH.C"
	line	109
	global	__size_of_DIV
	__size_of_DIV	equ	__end_of_DIV-_DIV
	
_DIV:	
	opt	stack 11
; Regs used in _DIV: []
	line	113
	
l12711:	
# 113 "TOUCH.C"
   CLRF M10 ;#
	line	114
# 114 "TOUCH.C"
  CLRF SUML ;#
	line	115
# 115 "TOUCH.C"
  CLRF SUMM ;#
	line	116
# 116 "TOUCH.C"
  CLRF SUMH ;#
	line	117
# 117 "TOUCH.C"
  CLRF M00 ;#
	line	118
# 118 "TOUCH.C"
  BCF _STATUS,0 ;#
	line	119
# 119 "TOUCH.C"
  RLF M00,f ;#
	line	120
# 120 "TOUCH.C"
  RLF M01,f ;#
	line	121
# 121 "TOUCH.C"
  RLF M02,f ;#
	line	123
# 123 "TOUCH.C"
  BCF _STATUS,0 ;#
	line	124
# 124 "TOUCH.C"
  RLF M00,f ;#
	line	125
# 125 "TOUCH.C"
  RLF M01,f ;#
	line	126
# 126 "TOUCH.C"
  RLF M02,f ;#
	line	128
# 128 "TOUCH.C"
  BCF _STATUS,0 ;#
	line	129
# 129 "TOUCH.C"
  RLF M00,f ;#
	line	130
# 130 "TOUCH.C"
  RLF M01,f ;#
	line	131
# 131 "TOUCH.C"
  RLF M02,f ;#
	line	133
# 133 "TOUCH.C"
        MOVF M11,w ;#
	line	134
# 134 "TOUCH.C"
  IORWF M12,w ;#
	line	135
# 135 "TOUCH.C"
  BTFSC _STATUS,2 ;#
	line	136
# 136 "TOUCH.C"
        GOTO ENDDIV ;#
	line	137
# 137 "TOUCH.C"
  MOVLW 08H ;#
	line	138
# 138 "TOUCH.C"
  MOVWF COUNT ;#
	line	140
# 140 "TOUCH.C"
  Div_02: ;#
	line	141
# 141 "TOUCH.C"
  INCF COUNT,f ;#
	line	142
# 142 "TOUCH.C"
     BTFSC M12,7 ;#
	line	143
# 143 "TOUCH.C"
  GOTO Div_03 ;#
	line	144
# 144 "TOUCH.C"
  BCF _STATUS,0 ;#
	line	145
# 145 "TOUCH.C"
  RLF M10,f ;#
	line	146
# 146 "TOUCH.C"
  RLF M11,f ;#
	line	147
# 147 "TOUCH.C"
  RLF M12,f ;#
	line	148
# 148 "TOUCH.C"
  GOTO Div_02 ;#
	line	150
# 150 "TOUCH.C"
  Div_03: ;#
	line	151
# 151 "TOUCH.C"
  BCF _STATUS,0 ;#
	line	152
# 152 "TOUCH.C"
  RLF SUML,f ;#
	line	153
# 153 "TOUCH.C"
  RLF SUMM,f ;#
	line	154
# 154 "TOUCH.C"
  RLF SUMH,f ;#
	line	156
# 156 "TOUCH.C"
  MOVF M12,w ;#
	line	157
# 157 "TOUCH.C"
  SUBWF M02,w ;#
	line	158
# 158 "TOUCH.C"
  BTFSS _STATUS,2 ;#
	line	159
# 159 "TOUCH.C"
  GOTO Div_04 ; ;#
	line	160
# 160 "TOUCH.C"
  MOVF M11,w ;#
	line	161
# 161 "TOUCH.C"
  SUBWF M01,w ;#
	line	162
# 162 "TOUCH.C"
  BTFSS _STATUS,2 ;#
	line	163
# 163 "TOUCH.C"
  GOTO Div_04 ;#
	line	164
# 164 "TOUCH.C"
  MOVF M10,w ;#
	line	165
# 165 "TOUCH.C"
  SUBWF M00,w ;#
	line	167
# 167 "TOUCH.C"
    Div_04: ;#
	line	168
# 168 "TOUCH.C"
  BTFSS _STATUS,0 ;#
	line	169
# 169 "TOUCH.C"
  GOTO Div_05 ;#
	line	171
# 171 "TOUCH.C"
  MOVF M10,w ;#
	line	172
# 172 "TOUCH.C"
  SUBWF M00,f ;#
	line	173
# 173 "TOUCH.C"
  MOVF M11,w ;#
	line	174
# 174 "TOUCH.C"
  BTFSS _STATUS,0 ;#
	line	175
# 175 "TOUCH.C"
  INCFSZ M11,w ;#
	line	176
# 176 "TOUCH.C"
  SUBWF M01,f ;#
	line	177
# 177 "TOUCH.C"
  MOVF M12,w ;#
	line	178
# 178 "TOUCH.C"
  BTFSS _STATUS,0 ;#
	line	179
# 179 "TOUCH.C"
  INCFSZ M12,w ;#
	line	180
# 180 "TOUCH.C"
  SUBWF M02,f ;#
	line	182
# 182 "TOUCH.C"
  BSF SUML,0 ;#
	line	184
# 184 "TOUCH.C"
    Div_05: ;#
	line	185
# 185 "TOUCH.C"
  BCF _STATUS,0 ;#
	line	187
# 187 "TOUCH.C"
    RRF M12,f ;#
	line	188
# 188 "TOUCH.C"
  RRF M11,f ;#
	line	189
# 189 "TOUCH.C"
  RRF M10,f ;#
	line	190
# 190 "TOUCH.C"
  DECfSZ COUNT,f ;#
	line	191
# 191 "TOUCH.C"
  GOTO Div_03 ;#
	line	193
# 193 "TOUCH.C"
          ENDDIV: ;#
psect	text635
	line	195
	
l7260:	
	return
	opt stack 0
GLOBAL	__end_of_DIV
	__end_of_DIV:
;; =============== function _DIV ends ============

	signat	_DIV,88
	global	_uart_data_send
psect	text636,local,class=CODE,delta=2
global __ptext636
__ptext636:

;; *************** function _uart_data_send *****************
;; Defined at:
;;		line 105 in file "TEST_62F08X_UART.C"
;; Parameters:    Size  Location     Type
;;  buff            1    wreg     PTR unsigned char 
;;		 -> main@data(6), 
;; Auto vars:     Size  Location     Type
;;  buff            1    1[COMMON] PTR unsigned char 
;;		 -> main@data(6), 
;;  i               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr1l, fsr1h, status,2, status,0
;; Tracked objects:
;;		On entry : 1F/0
;;		On exit  : 1F/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         2       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          1       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         3       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text636
	file	"TEST_62F08X_UART.C"
	line	105
	global	__size_of_uart_data_send
	__size_of_uart_data_send	equ	__end_of_uart_data_send-_uart_data_send
	
_uart_data_send:	
	opt	stack 14
; Regs used in _uart_data_send: [wreg+fsr1l-status,0]
;uart_data_send@buff stored from wreg
	movwf	(uart_data_send@buff)
	line	112
	
l12691:	
	line	113
	
l12693:	
;TEST_62F08X_UART.C: 113: flag=1;
	clrf	(_flag)
	incf	(_flag),f
	line	114
	
l12695:	
;TEST_62F08X_UART.C: 114: if(flag==1)
	decf	(_flag),w
	skipz
	goto	u3081
	goto	u3080
u3081:
	goto	l4798
u3080:
	line	116
	
l12697:	
;TEST_62F08X_UART.C: 115: {
;TEST_62F08X_UART.C: 116: for(i = 0;i<1;i++)
	clrf	(uart_data_send@i)
	line	119
	
l12703:	
;TEST_62F08X_UART.C: 117: {
;TEST_62F08X_UART.C: 119: URDATAL =buff[i];
	movf	(uart_data_send@i),w
	addwf	(uart_data_send@buff),w
	movwf	(??_uart_data_send+0)+0
	movf	0+(??_uart_data_send+0)+0,w
	movwf	fsr1l
	clrf fsr1h	
	
	movf	indf1,w
	movlb 9	; select bank9
	movwf	(1164)^0480h	;volatile
	line	116
	
l12705:	
	incf	(uart_data_send@i),f
	
l12707:	
	movf	(uart_data_send@i),w
	skipz
	goto	u3090
	goto	l12703
u3090:
	line	121
	
l12709:	
;TEST_62F08X_UART.C: 120: }
;TEST_62F08X_UART.C: 121: flag=0;
	movlb 0	; select bank0
	clrf	(_flag)
	line	122
	
l4798:	
	line	123
;TEST_62F08X_UART.C: 122: }
;TEST_62F08X_UART.C: 123: flag=0;
	clrf	(_flag)
	line	133
	
l4801:	
	return
	opt stack 0
GLOBAL	__end_of_uart_data_send
	__end_of_uart_data_send:
;; =============== function _uart_data_send ends ============

	signat	_uart_data_send,4216
	global	_UART_INITIAL
psect	text637,local,class=CODE,delta=2
global __ptext637
__ptext637:

;; *************** function _UART_INITIAL *****************
;; Defined at:
;;		line 28 in file "TEST_62F08X_UART.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/3
;;		On exit  : 17F/4
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text637
	file	"TEST_62F08X_UART.C"
	line	28
	global	__size_of_UART_INITIAL
	__size_of_UART_INITIAL	equ	__end_of_UART_INITIAL-_UART_INITIAL
	
_UART_INITIAL:	
	opt	stack 14
; Regs used in _UART_INITIAL: [wreg+status,2+status,0]
	line	29
	
l12671:	
;TEST_62F08X_UART.C: 29: PCKEN |=0B00100000;
	movlb 1	; select bank1
	bsf	(154)^080h+(5/8),(5)&7	;volatile
	line	32
	
l12673:	
;TEST_62F08X_UART.C: 32: AFP2 |=0B00000011;
	movlw	(03h)
	movlb 2	; select bank2
	iorwf	(285)^0100h,f	;volatile
	line	34
	
l12675:	
;TEST_62F08X_UART.C: 34: URIER =0B00100001;
	movlw	(021h)
	movlb 9	; select bank9
	movwf	(1166)^0480h	;volatile
	line	35
	
l12677:	
;TEST_62F08X_UART.C: 35: URLCR =0B00000001;
	movlw	(01h)
	movwf	(1167)^0480h	;volatile
	line	36
	
l12679:	
;TEST_62F08X_UART.C: 36: URMCR =0B00011000;
	movlw	(018h)
	movwf	(1169)^0480h	;volatile
	line	38
	
l12681:	
;TEST_62F08X_UART.C: 38: URDLL =104;
	movlw	(068h)
	movwf	(1172)^0480h	;volatile
	line	39
	
l12683:	
;TEST_62F08X_UART.C: 39: URDLH =0;
	clrf	(1173)^0480h	;volatile
	line	40
	
l12685:	
;TEST_62F08X_UART.C: 40: TCF=1;
	bsf	(9440/8)^0480h,(9440)&7
	line	41
	
l12687:	
;TEST_62F08X_UART.C: 41: INTCON=0B11000000;
	movlw	(0C0h)
	movwf	(11)	;volatile
	line	42
	
l12689:	
;TEST_62F08X_UART.C: 42: UROD=1;
	movlb 4	; select bank4
	bsf	(4344/8)^0200h,(4344)&7
	line	47
	
l4770:	
	return
	opt stack 0
GLOBAL	__end_of_UART_INITIAL
	__end_of_UART_INITIAL:
;; =============== function _UART_INITIAL ends ============

	signat	_UART_INITIAL,88
	global	_Time4Initial
psect	text638,local,class=CODE,delta=2
global __ptext638
__ptext638:

;; *************** function _Time4Initial *****************
;; Defined at:
;;		line 206 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/4
;;		On exit  : 1F/2
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text638
	file	"main.c"
	line	206
	global	__size_of_Time4Initial
	__size_of_Time4Initial	equ	__end_of_Time4Initial-_Time4Initial
	
_Time4Initial:	
	opt	stack 14
; Regs used in _Time4Initial: [wreg+status,2+status,0]
	line	207
	
l12655:	
;main.c: 207: PCKEN |=0B00001000;
	movlb 1	; select bank1
	bsf	(154)^080h+(3/8),(3)&7	;volatile
	line	211
	
l12657:	
;main.c: 211: TIM4CR1 =0B00000101;
	movlw	(05h)
	movlb 2	; select bank2
	movwf	(273)^0100h	;volatile
	line	241
;main.c: 241: TIM4IER =0B00000001;
	movlw	(01h)
	movwf	(274)^0100h	;volatile
	line	244
	
l12659:	
;main.c: 244: TIM4SR =0B00000000;
	clrf	(275)^0100h	;volatile
	line	253
	
l12661:	
;main.c: 253: TIM4EGR =0B00000000;
	clrf	(276)^0100h	;volatile
	line	258
	
l12663:	
;main.c: 258: TIM4CNTR=0;
	clrf	(277)^0100h	;volatile
	line	261
	
l12665:	
;main.c: 261: TIM4PSCR=0B00000111;
	movlw	(07h)
	movwf	(278)^0100h	;volatile
	line	262
	
l12667:	
;main.c: 262: TIM4ARR =249;
	movlw	(0F9h)
	movwf	(279)^0100h	;volatile
	line	268
	
l12669:	
;main.c: 268: INTCON |= 0B11000000;
	movlw	(0C0h)
	iorwf	(11),f	;volatile
	line	269
	
l2408:	
	return
	opt stack 0
GLOBAL	__end_of_Time4Initial
	__end_of_Time4Initial:
;; =============== function _Time4Initial ends ============

	signat	_Time4Initial,88
	global	_SysInit
psect	text639,local,class=CODE,delta=2
global __ptext639
__ptext639:

;; *************** function _SysInit *****************
;; Defined at:
;;		line 130 in file "main.c"
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
;;		On exit  : 17F/3
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text639
	file	"main.c"
	line	130
	global	__size_of_SysInit
	__size_of_SysInit	equ	__end_of_SysInit-_SysInit
	
_SysInit:	
	opt	stack 14
; Regs used in _SysInit: [wreg+status,2]
	line	131
	
l12607:	
;main.c: 131: OSCCON = 0B01110001;
	movlw	(071h)
	movlb 1	; select bank1
	movwf	(153)^080h	;volatile
	line	164
	
l12609:	
;main.c: 164: PORTA = 0x00;
	movlb 0	; select bank0
	clrf	(12)	;volatile
	line	165
	
l12611:	
;main.c: 165: PORTB = 0x00;
	clrf	(13)	;volatile
	line	166
	
l12613:	
;main.c: 166: PORTC = 0x00;
	clrf	(14)	;volatile
	line	167
	
l12615:	
;main.c: 167: PORTD = 0x00;
	clrf	(15)	;volatile
	line	169
;main.c: 169: TRISA = 0B11110100;
	movlw	(0F4h)
	movlb 1	; select bank1
	movwf	(140)^080h	;volatile
	line	170
	
l12617:	
;main.c: 170: TRISB = 0x10000000;
	clrf	(141)^080h	;volatile
	line	174
	
l12619:	
;main.c: 174: TRISC = 0B00000011;
	movlw	(03h)
	movwf	(142)^080h	;volatile
	line	175
	
l12621:	
;main.c: 175: TRISD = 0B00100000;
	movlw	(020h)
	movwf	(143)^080h	;volatile
	line	177
	
l12623:	
;main.c: 177: PSRC0 = 0B11111111;
	movlw	(0FFh)
	movlb 2	; select bank2
	movwf	(282)^0100h	;volatile
	line	179
	
l12625:	
;main.c: 179: PSRC1 = 0B11111111;
	movlw	(0FFh)
	movwf	(283)^0100h	;volatile
	line	181
	
l12627:	
;main.c: 181: PSINK0= 0B11111111;
	movlw	(0FFh)
	movlb 3	; select bank3
	movwf	(410)^0180h	;volatile
	line	182
	
l12629:	
;main.c: 182: PSINK1= 0B11111111;
	movlw	(0FFh)
	movwf	(411)^0180h	;volatile
	line	183
	
l12631:	
;main.c: 183: PSINK2= 0B11111111;
	movlw	(0FFh)
	movwf	(412)^0180h	;volatile
	line	184
	
l12633:	
;main.c: 184: PSINK3= 0B11111111;
	movlw	(0FFh)
	movwf	(413)^0180h	;volatile
	line	186
	
l12635:	
;main.c: 186: WPUA = 0x00;
	clrf	(396)^0180h	;volatile
	line	187
	
l12637:	
;main.c: 187: WPUB = 0x00;
	clrf	(397)^0180h	;volatile
	line	188
	
l12639:	
;main.c: 188: WPUC = 0x00;
	clrf	(398)^0180h	;volatile
	line	189
	
l12641:	
;main.c: 189: WPUD = 0x00;
	clrf	(399)^0180h	;volatile
	line	190
	
l12643:	
;main.c: 190: WPDA = 0x00;
	movlb 4	; select bank4
	clrf	(524)^0200h	;volatile
	line	191
	
l12645:	
;main.c: 191: WPDB = 0x00;
	clrf	(525)^0200h	;volatile
	line	192
	
l12647:	
;main.c: 192: WPDC = 0x00;
	clrf	(526)^0200h	;volatile
	line	193
	
l12649:	
;main.c: 193: WPDD = 0x00;
	clrf	(527)^0200h	;volatile
	line	195
	
l12651:	
;main.c: 195: ANSELA = 0B00000000;
	movlb 3	; select bank3
	clrf	(407)^0180h	;volatile
	line	197
	
l12653:	
;main.c: 197: INTCON = 0;
	clrf	(11)	;volatile
	line	198
	
l2405:	
	return
	opt stack 0
GLOBAL	__end_of_SysInit
	__end_of_SysInit:
;; =============== function _SysInit ends ============

	signat	_SysInit,88
	global	_ISR
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:

;; *************** function _ISR *****************
;; Defined at:
;;		line 92 in file "main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 1D/0
;;		Unchanged: FFFE0/0
;; Data sizes:     COMMON BANK0hh  BANK0l   BANK1   BANK2   BANK3   BANK4   BANK5   BANK6   BANK7   BANK8   BANK9  BANK10  BANK11  BANK12
;;      Params:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Locals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Temps:          0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;      Totals:         0       0       0       0       0       0       0       0       0       0       0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	intentry
	file	"main.c"
	line	92
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 10
; Regs used in _ISR: [wreg]
psect	intentry
	pagesel	$
	line	93
	
i1l12599:	
;main.c: 93: if(T4UIE && T4UIF)
	movlb 2	; select bank2
	btfss	(2192/8)^0100h,(2192)&7
	goto	u306_21
	goto	u306_20
u306_21:
	goto	i1l2402
u306_20:
	
i1l12601:	
	btfss	(2200/8)^0100h,(2200)&7
	goto	u307_21
	goto	u307_20
u307_21:
	goto	i1l2402
u307_20:
	line	95
	
i1l12603:	
;main.c: 94: {
;main.c: 95: T4UIF = 1;
	bsf	(2200/8)^0100h,(2200)&7
	line	97
	
i1l12605:	
;main.c: 97: RA3 = ~RA3;
	movlw	1<<((99)&7)
	movlb 0	; select bank0
	xorwf	((99)/8),f
	line	98
;main.c: 100: TouchTimeCount++;
	movlw	(0FFh)
	movwf	(_unionAllTimeFlag)
	line	128
	
i1l2402:	
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	intentry
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
global __pbssBIGRAM
__pbssBIGRAM	equ	8960
	end
