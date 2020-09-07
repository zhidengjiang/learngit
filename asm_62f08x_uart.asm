//********************************************************* 
/*  文件名: ASM_62F08x_UART.ASM
*	功能：  FT62F08x-UART功能演示
*   IC:    FT62F088 LQFP32
*   内部：  16M
*	empno: 500                                
*   说明：  串口上电一直发送，同时也可以接收（通过串口助手发送接收）
*		   
*		   
* 
*
*   电路参考原理图 TEST_62F08x_sch.pdf
*/
;===========================================================
;===========================================================
 #INCLUDE  <FT62F08X.inc>;
;==========================================================================
;RAM DEFINE
;==========================================================================
TEMP           	 	EQU     0X20
TEMP1           	EQU     0X21
TEMP2           	EQU     0X22
UARTDATTEMP			EQU		0X25
buff          		EQU     0X26 
//#DEFINE RXFLAG		buff,0
count				EQU		0x27
READPIN				EQU		0x28
UR_DATA				EQU		0X29

W_TMP           	EQU     0X70  
S_TMP          		EQU     0X71 
;==========================================================================
;CONSTANT DEFINE
;==========================================================================
OSCCON_DEF          EQU     B'01110001'     ;	//16MHZ 1:1
	//BIT7~BIT4:主时钟（系统时钟）分频比选择。0111(1:1),0110(1:2),0101(1:4),0100(1:8),0011(1:16),0010,(1:32),0001(1:64),1xxx(1:128),0000(32kHz LIRC)
	//BIT3:振荡器起振超时状态位。1：器件运行在FOSC<2:0>指定的外部时钟之下；0：器件运行在内部振荡器之下
	//BIT2:高速内部时钟状态。 1：HIRC is ready；0：HIRC is not ready
	//Bit1：低速内部时钟状态。1：LIRC is ready；0：LIRC is not ready
	//Bit0:系统时钟选择位。1：系统时钟选择为内部振荡器；0：时钟源由FOSC<2:0>决定
    
WPUA_DEF            EQU     B'10000000'     ;PA端口上拉控制 1-开上拉 0-关上拉
WPUB_DEF            EQU     B'00000000'     ;PB端口上拉控制 1-开上拉 0-关上拉
WPUC_DEF            EQU     B'00000000'     ;PC端口上拉控制 1-开上拉 0-关上拉
WPUD_DEF            EQU     B'00000000'     ;PD端口上拉控制 1-开上拉 0-关上拉

WPDA_DEF            EQU     B'00000000'     ;PA端口下拉控制 1-开下拉 0-关下拉
WPDB_DEF            EQU     B'00000000'     ;PB端口下拉控制 1-开下拉 0-关下拉
WPDC_DEF            EQU     B'00000000'     ;PC端口下拉控制 1-开下拉 0-关下拉
WPDD_DEF            EQU     B'00000000'     ;PD端口下拉控制 1-开下拉 0-关下拉  
 
TRISA_DEF			EQU     B'10111111'     ;PA输入输出 0-输出 1-输入  
TRISB_DEF			EQU     B'11111111' 	;PB输入输出 0-输出 1-输入
TRISC_DEF			EQU     B'11111111' 	;PC输入输出 0-输出 1-输入
TRISD_DEF			EQU     B'11111111' 	;PD输入输出 0-输出 1-输入    

   
PSRC0_DEF			EQU		B'11111111'		;源电流设置最大
PSRC1_DEF			EQU		B'11111111'		

PSINK0_DEF			EQU		B'11111111'		;灌电流设置最大
PSINK1_DEF			EQU		B'11111111'	
PSINK2_DEF			EQU		B'11111111'
PSINK3_DEF			EQU		B'11111111'

ANSELA_DEF			EQU		B'00000000'		;控制IO的数模输入，1：对应的IO为模拟管脚
											;0：对应的IO为数字IO
                                            
PCKEN_DEF			EQU		B'00100000'		;打开UART时钟
URIER_DEF			EQU		B'00100001'		;使能发送接收完成中断
URLCR_DEF			EQU		B'00000001'		;8位数据，停止位1，无奇偶校验
URMCR_DEF			EQU		B'00011000'
    
URDLL_DEF			EQU		104         	;9600波特率 = Fosc/16*[URDLH:URDLL]
URDLH_DEF			EQU		0
                                           

;==========================================================================
;USER DEFINE
;==========================================================================   
#DEFINE  TXIO			PORTA,6   // 串口的发送脚
#DEFINE  RXIO			PORTA,7   // 串口的接收脚

;==========================================================================
;PROGRAM START
;==========================================================================
    ORG         0000H
    LJUMP       RESTART
    ORG         0004H
    LJUMP       interrupt  
;==========================================================================
;SYSTEM START
;==========================================================================
RESTART:
    BANKSEL     PORTA
    LCALL       INITIAL
    LCALL       UART_INITIAL
   
   	BANKSEL		URTC
    BSR			URTC,TCF
    
    BANKSEL		INTCON
    BSR			INTCON,GIE	;全局中断使能
    BSR			INTCON,PEIE ;外设使能中断

	BANKSEL		URLSR
    BTSS		URLSR,TXEF
    LJUMP		MAIN_LOOP
    BANKSEL		URDATAL
    LDWI		0XAA
    STR			URDATAL    
MAIN_LOOP:
	NOP
    
    LJUMP		MAIN_LOOP
;***************************************************************
;		中断程序
;***************************************************************
interrupt:
    STR         W_TMP       ;W 保护	
    SWAPR       STATUS,W
    STR         S_TMP		;状态寄存器保护

	BANKSEL		URLSR
	BTSC		URLSR,RXNEF
	LJUMP		URRXInterrupt
    BANKSEL		URTC
	BTSC		URTC,TCF
	LJUMP		URTXInterrupt
	LJUMP		INT_RET
    
 URRXInterrupt: 
 	BANKSEL		URDATAL
    LDR			URDATAL,0
    BANKSEL		UR_DATA
    STR			UR_DATA
 	LJUMP		INT_RET
   
URTXInterrupt:
 	BANKSEL		URTC
    BSR			URTC,TCF
	
    BANKSEL		UR_DATA
    LDR			UR_DATA,0
    BANKSEL		URDATAL
    STR			URDATAL
  	LJUMP		INT_RET       
INT_RET:
	SWAPR   	S_TMP,0     ;S_TMP->W
	STR    	 	STATUS		;W->STATUS
	SWAPR   	W_TMP,1		;
	SWAPR   	W_TMP,0		;W_TMP->W
	RETI


    //TCF: 发送完成标志
    //TXEF:1发送寄存器为空
    //RXNEF:1按收寄存器非空
;==========================================================================
;SYSTEM INITIAL
;==========================================================================
INITIAL:
    BANKSEL		OSCCON   
    LDWI        OSCCON_DEF
    STR         OSCCON      ;SET OSCCON
    
    BANKSEL     PORTA
    LDWI	    0X00
    STR         PORTA       ;Clear PortA
    STR			PORTB
    STR         PORTC
    STR			PORTD       
    
    BANKSEL     TRISA     
    LDWI        TRISA_DEF   ;PA0-OUT
    STR         TRISA       ;SET IO Direction
    LDWI        TRISB_DEF   
    STR         TRISB
    LDWI        TRISC_DEF   
    STR         TRISC 
    LDWI        TRISD_DEF   
    STR         TRISD 
    
    BANKSEL		WPUA   
   	LDWI    	WPUA_DEF	
    STR         WPUA
   	LDWI    	WPUB_DEF	
    STR         WPUB
    LDWI    	WPUC_DEF	
    STR         WPUC
    LDWI    	WPUD_DEF	
    STR         WPUD 
    
    BANKSEL		WPDA
   	LDWI    	WPDA_DEF	
    STR         WPDA
   	LDWI    	WPDB_DEF	
    STR         WPDB
    LDWI    	WPDC_DEF	
    STR         WPDC
    LDWI    	WPDD_DEF	
    STR         WPDD 
    
    
    BANKSEL		PSRC0
    LDWI		PSRC0_DEF
    STR			PSRC0
    LDWI		PSRC1_DEF
    STR			PSRC1
    
    BANKSEL		PSINK0
    LDWI		PSINK0_DEF
    STR			PSINK0
    LDWI		PSINK1_DEF
    STR			PSINK1
    LDWI		PSINK2_DEF
    STR			PSINK2
    LDWI		PSINK3_DEF
    STR			PSINK3

    
	BANKSEL		ANSELA
    LDWI		ANSELA_DEF
    STR			ANSELA
;***Clear  BANK0 SRAM(20H~7FH)**************************************
    BANKSEL		0
CLEAR_RAM:                   
    LDWI        20H
    STR         FSR0L
CLEAR_RAM_LOOP:
    CLRR        INDF0
    INCR        FSR0L,F
    LDWI        80H
    XORWR       FSR0L,W
    BTSS        STATUS,Z
    LJUMP       CLEAR_RAM_LOOP
    RET

/*==========================================================================
 *  函数名：UART_INITIAL
 *	功能：  主函数
 *  输入：  无
 *  输出：  无
==========================================================================*/
UART_INITIAL:
	BANKSEL		PCKEN
	LDWI		PCKEN_DEF
    STR			PCKEN	
    
    BANKSEL		URIER		
	LDWI		URIER_DEF
    STR			URIER
    LDWI		URLCR_DEF
    STR			URLCR
    LDWI		URMCR_DEF
    STR			URMCR
    
    BANKSEL		URDLL
    LDWI		URDLL_DEF
    STR			URDLL
    LDWI		URDLH_DEF
    STR			URDLH
    
	RET    

;=========================================================================
    
    END
