//********************************************************* 
/*  �ļ���: ASM_62F08x_UART.ASM
*	���ܣ�  FT62F08x-UART������ʾ
*   IC:    FT62F088 LQFP32
*   �ڲ���  16M
*	empno: 500                                
*   ˵����  �����ϵ�һֱ���ͣ�ͬʱҲ���Խ��գ�ͨ���������ַ��ͽ��գ�
*		   
*		   
* 
*
*   ��·�ο�ԭ��ͼ TEST_62F08x_sch.pdf
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
	//BIT7~BIT4:��ʱ�ӣ�ϵͳʱ�ӣ���Ƶ��ѡ��0111(1:1),0110(1:2),0101(1:4),0100(1:8),0011(1:16),0010,(1:32),0001(1:64),1xxx(1:128),0000(32kHz LIRC)
	//BIT3:��������ʱ״̬λ��1������������FOSC<2:0>ָ�����ⲿʱ��֮�£�0�������������ڲ�����֮��
	//BIT2:�����ڲ�ʱ��״̬�� 1��HIRC is ready��0��HIRC is not ready
	//Bit1�������ڲ�ʱ��״̬��1��LIRC is ready��0��LIRC is not ready
	//Bit0:ϵͳʱ��ѡ��λ��1��ϵͳʱ��ѡ��Ϊ�ڲ�������0��ʱ��Դ��FOSC<2:0>����
    
WPUA_DEF            EQU     B'10000000'     ;PA�˿��������� 1-������ 0-������
WPUB_DEF            EQU     B'00000000'     ;PB�˿��������� 1-������ 0-������
WPUC_DEF            EQU     B'00000000'     ;PC�˿��������� 1-������ 0-������
WPUD_DEF            EQU     B'00000000'     ;PD�˿��������� 1-������ 0-������

WPDA_DEF            EQU     B'00000000'     ;PA�˿��������� 1-������ 0-������
WPDB_DEF            EQU     B'00000000'     ;PB�˿��������� 1-������ 0-������
WPDC_DEF            EQU     B'00000000'     ;PC�˿��������� 1-������ 0-������
WPDD_DEF            EQU     B'00000000'     ;PD�˿��������� 1-������ 0-������  
 
TRISA_DEF			EQU     B'10111111'     ;PA������� 0-��� 1-����  
TRISB_DEF			EQU     B'11111111' 	;PB������� 0-��� 1-����
TRISC_DEF			EQU     B'11111111' 	;PC������� 0-��� 1-����
TRISD_DEF			EQU     B'11111111' 	;PD������� 0-��� 1-����    

   
PSRC0_DEF			EQU		B'11111111'		;Դ�����������
PSRC1_DEF			EQU		B'11111111'		

PSINK0_DEF			EQU		B'11111111'		;������������
PSINK1_DEF			EQU		B'11111111'	
PSINK2_DEF			EQU		B'11111111'
PSINK3_DEF			EQU		B'11111111'

ANSELA_DEF			EQU		B'00000000'		;����IO����ģ���룬1����Ӧ��IOΪģ��ܽ�
											;0����Ӧ��IOΪ����IO
                                            
PCKEN_DEF			EQU		B'00100000'		;��UARTʱ��
URIER_DEF			EQU		B'00100001'		;ʹ�ܷ��ͽ�������ж�
URLCR_DEF			EQU		B'00000001'		;8λ���ݣ�ֹͣλ1������żУ��
URMCR_DEF			EQU		B'00011000'
    
URDLL_DEF			EQU		104         	;9600������ = Fosc/16*[URDLH:URDLL]
URDLH_DEF			EQU		0
                                           

;==========================================================================
;USER DEFINE
;==========================================================================   
#DEFINE  TXIO			PORTA,6   // ���ڵķ��ͽ�
#DEFINE  RXIO			PORTA,7   // ���ڵĽ��ս�

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
    BSR			INTCON,GIE	;ȫ���ж�ʹ��
    BSR			INTCON,PEIE ;����ʹ���ж�

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
;		�жϳ���
;***************************************************************
interrupt:
    STR         W_TMP       ;W ����	
    SWAPR       STATUS,W
    STR         S_TMP		;״̬�Ĵ�������

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


    //TCF: ������ɱ�־
    //TXEF:1���ͼĴ���Ϊ��
    //RXNEF:1���ռĴ����ǿ�
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
 *  ��������UART_INITIAL
 *	���ܣ�  ������
 *  ���룺  ��
 *  �����  ��
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
