
//more keys version

#include "common.h"
#include "syscfg.h"
#include "touch.h" 
#include  "stdio.h"

#define __TEST_LONG_TK_PUSH__  
#define  unchar     unsigned char 
#define  unint      unsigned int
#define  unlong     unsigned long

#ifdef __TEST_LONG_TK_PUSH__

#define ioLEDseg1				RD1
#define ioLEDseg2				RD0
#define ioLEDseg3				RC6
#define ioLEDcom5				RB4
#define ioLEDcom4				RA0
#define ioLEDcom3				RD3
#define ioLEDcom2				RB1
#define ioLEDcom1				RB0

#define CST_KEY_PUSH_60MS			15
#define CST_KEY_PUSH_2S5			625


#define macroLED1on()		ioLEDseg1=1
#define macroLED2on()		ioLEDseg2=1
#define macroLED3on()		ioLEDseg3=1
#define macroLED1off()	ioLEDseg1=0
#define macroLED2off()	ioLEDseg2=0
#define macroLED3off()	ioLEDseg3=0


#define macroCOMon()		ioLEDcom5=0
#define macroLEDshut()	ioLEDseg1=0;ioLEDseg3=0;ioLEDcom5=0;ioLEDseg2=0
#define macroTUBEshut()	ioLEDcom1=1;ioLEDcom3=1;ioLEDcom4=1;ioLEDcom2=1


typedef union
{
	unsigned char varCharData;
	struct
	{
			unsigned char B0:1;
			unsigned char B1:1;
			unsigned char B2:1;
			unsigned char B3:1;
			unsigned char B4:1;
			unsigned char B5:1;
			unsigned char B6:1;
			unsigned char B7:1;
	}bitData;
}unionByteAndBit;										//�������λ�������ֽڱ����������������

unionByteAndBit		unionAllKeyFlag;
	#define	varAllKeyFlag			    unionAllKeyFlag.varCharData
	#define	bitKEY5flag					unionAllKeyFlag.bitData.B0
	#define	bitKEY6flag					unionAllKeyFlag.bitData.B1		
	#define	bitKEY4flag					unionAllKeyFlag.bitData.B2		
	#define	bitKEY3flag					unionAllKeyFlag.bitData.B3		
	#define	bitKEY2flag					unionAllKeyFlag.bitData.B4		
	#define	bitKEY1flag					unionAllKeyFlag.bitData.B5		
	#define	bitKEY7flag					unionAllKeyFlag.bitData.B6		
	#define	bitKEY8flag					unionAllKeyFlag.bitData.B7		

unionByteAndBit		unionAllTimeFlag;
	#define	varAllTimeFlag	unionAllTimeFlag.varCharData
	#define	bitNeedFeedDog			unionAllTimeFlag.bitData.B0
	#define	bitNeedKeyScan			unionAllTimeFlag.bitData.B1

unsigned int varKeyPushCnt;

#endif
//volatile  unchar receivedata[10] =0;	 
volatile uint16_t 	readKeyNum;    		//���صļ�ֵ  bit0~bit14��Ӧkey1~key15  0û�а��£�1����
volatile  unchar    toSend[11]={0x11,0x22,0x33,0x44,0x55,0x66,0x77,0x88,0x99,0xaa};
uint16_t  lastkey=0;
uint16_t  TouchTimeCount;
extern uint8_t    fmd_channels;  			//��������
//extern uint8_t    flag;  
extern uint8_t    key_flag; 
volatile  unchar receivedata[10] =0;
volatile  unchar senddata	=0;
uint16_t  key_status;
unchar    i=0;
volatile unchar    k=0;
////----------------------------------------------------- 
void interrupt ISR(void)
{
    if(T4UIE && T4UIF)                	
		{		//TIM4ÿ4ms�ж�һ��
				T4UIF = 1;  
			#ifdef __TEST_LONG_TK_PUSH__	                          
      	RA3 = ~RA3;
      	varAllTimeFlag = 0xFF;
    	#endif  
				TouchTimeCount++;
		} 
     //  	//�жϴ���**********************
//	if(URRXNE && RXNEF)       //�����ж�         	
//	{
//    	receivedata[k++] =URDATAL; 
//        
//        if(k>=10)
//        {
//        	k=0;
//        } 
//        NOP();
//	} 
//    //----------------------------
//    if(TCEN && TCF)          //�����ж�
//    {	
//        TCF=1;       //д1��0
//        
//    	if(i<10)
//        {
//    		URDATAL =toSend[i++];
//        }
//        else
//        {
//          i=0;
//        }
//		NOP();
//     } 
}
void SysInit(void)
{
		OSCCON = 0B01110001;	//WDT 32KHZ IRCF=110=8MHz
													//Bit0=1,ϵͳʱ��Ϊ�ڲ�����
													//Bit0=0,ʱ��Դ��FOSC<2��0>����������ѡ��ʱѡ��							
	
	//PORTA = 0B00000000;		
//	TRISA = 0B10111111;		//PA������� 0-��� 1-����
//	WPUA = 0B00000000;     	//PA�˿��������� 1-������ 0-������
//    WPDA = 0B00000000;     	//PA�˿��������� 1-������ 0-������
//  
//PSRC0  = 0B11111111;  	//PORTA,PORTBԴ�����������
//    //BIT7~BIT6:PORTB[7:4]Դ������������,BIT5~BIT4:PORTB[3:0]Դ������������ 
//    //BIT3~BIT2:PORTA[7:4]Դ������������,BIT1~BIT0:PORTA[3:0]Դ������������
//    
//    PSRC1  = 0B11111111;    //PORTC,PORTDԴ�����������    
//    //BIT7~BIT6:PORTD[7:4]Դ������������,BIT5~BIT4:PORTD[3:0]Դ������������ 
//    //BIT3~BIT2:PORTC[7:4]Դ������������,BIT1~BIT0:PORTC[3:0]Դ������������
//    
//    PSINK0 = 0B11111111;  	//PORTA������������ 0:��С��1:���
//    PSINK1 = 0B11111111; 	//PORTB������������ 0:��С��1:���
//    PSINK2 = 0B11111111;	//PORTC������������ 0:��С��1:���
//    PSINK3 = 0B11111111;	//PORTD������������ 0:��С��1:���
//	
//    ANSELA = 0B00000000;    //ȫΪ���ֹ�?
//PCKEN |=0B00100000;	//��UARTʱ��
//    
//    URIER =0B00100001;  //ʹ�ܷ��ͽ�������ж�
//    URLCR =0B00000001;  //8λ���ݣ�ֹͣλ1������żУ��
//    URMCR =0B00011000;
//    
//    URDLL =104;         //9600������ = Fosc/16*[URDLH:URDLL]
//    URDLH =0;
//    TCF=1;
//	INTCON=0B11000000;
	   PORTA = 0x00;
		PORTB = 0x00;
		PORTC = 0x00;
		PORTD = 0x00;
		
	    TRISA = 0B11110100;	//PA������� 0-��� 1-���� ��
		TRISB = 0x10000000;  //��
        
    // TRISA = 0B10111111;		//PA������� 0-��� 1-���� ����
//  TRISB = 0B11110111;		//PB������� 0-��� 1-����	����
		TRISC = 0B00000011;	
		TRISD = 0B00100000;	
    
		PSRC0 = 0B11111111;  	 //PORTA,PORTBԴ�����������
    
    PSRC1 = 0B11111111;    //PORTC,PORTDԴ�����������
    
    PSINK0= 0B11111111;
    PSINK1= 0B11111111;
    PSINK2= 0B11111111;
    PSINK3= 0B11111111;		//PORTD������������ 0:��С��1:���
    											
	  WPUA = 0x00;
	  WPUB = 0x00;
	  WPUC = 0x00;
	  WPUD = 0x00;
	  WPDA = 0x00;
	  WPDB = 0x00;
	  WPDC = 0x00;
	  WPDD = 0x00;
        
	  ANSELA = 0B00000000;    //ȫΪ���ֹܽ�
          
	  INTCON = 0;  					//�ݽ�ֹ�����ж�
}
/*-------------------------------------------------
 *	�������ƣ�Time4Initial
 *	���ܣ�  
 *	���������
 *	���ز������� 
 -------------------------------------------------*/
void Time4Initial(void)
{
		PCKEN |=0B00001000;      //TIME4ģ��ʱ��ʹ��
    //CKOCON=0B00110000;
    //TCKSRC=0B00000011;		
    
    TIM4CR1	=0B00000101;
    //BIT7: 0��TIM1_ARR�Ĵ���û�л��壬�����Ա�ֱ��д��; 1��TIM1_ARR�Ĵ�����Ԥװ�ػ��������塣
    //BIT6:����
    //BIT5~BIT4:timer4ʱ��ѡ��λ��
        //00��ϵͳʱ��/��ʱ��
				//01���ڲ���ʱ��HIRC
				//10��LPʱ�ӣ�ֻ�е�FOSCѡ��LPģʽʱ��������
				//11��XTʱ�ӣ�ֻ�е�FOSCѡ��XTģʽʱ��������

    //BIT3:
    //			0���ڷ��������¼�ʱ����������ֹͣ��
		//			1���ڷ�����һ�θ����¼�(���CENλ)ʱ��������ֹͣ��

    //BIT2:
   	// 		0�����UDIS������������¼�����������һ�¼�����һ�������жϣ�
				//�Ĵ���������(����������/����)
				//�������UGλ
				//ʱ��/���������������ĸ���
		//		1�����UDIS������������¼�����ֻ�е������¼�����ʱ�Ų��������жϣ���UIF��1��
				//�Ĵ���������(����������/����)

    //BIT1:
    //		0��һ�������¼���������������(UEV)�¼���
				//���������/����
				//������������¼�
				//ʱ��/����ģʽ������������Ӳ����λ������ļĴ�����װ�����ǵ�Ԥװ��ֵ��
		//		1�������������¼���Ӱ�ӼĴ���(ARR��PSC��CCRx)�������ǵ�ֵ�����������UGλ��ʱ��/����������������һ��Ӳ����λ�����������Ԥ��Ƶ�������³�ʼ����

    // BIT0: 0����ֹ��������1��ʹ�ܼ�������

    TIM4IER	=0B00000001;
    //BIT0:  0����ֹ�����жϣ�1����������жϡ�

    TIM4SR	=0B00000000;
    //BIT0:�����������¼�ʱ��λ��Ӳ����1���������д1��0
			//0���޸����¼�������
			//1�������¼��ȴ���Ӧ�����Ĵ���������ʱ��λ��Ӳ����1��
			//��TIM4_CR1�Ĵ�����UDIS=0�������������������ʱ��
			//��TIM4_CR1�Ĵ�����UDIS=0��URS=0��������TIM4_EGR�Ĵ�����UGλ����Լ�����
			//CNT���³�ʼ��ʱ��
			//��TIM4_CR1�Ĵ�����UDIS=0��URS=0����������CNT�������¼����³�ʼ��ʱ��

    TIM4EGR	=0B00000000;
    //BIT0:��λ�������1����Ӳ���Զ���0��
	//0���޶�����
	//1�����³�ʼ����������������һ�������¼���ע��Ԥ��Ƶ���ļ�����Ҳ����0(����Ԥ��Ƶϵ������)���������ĶԳ�ģʽ�»�DIR=0(���ϼ���)�����������0����DIR=1(���¼���)�������ȡTIM1_ARR��ֵ��

    TIM4CNTR=0; //TIM4 8λ������
    
	#ifdef __TEST_LONG_TK_PUSH__    
    TIM4PSCR=0B00000111;
    TIM4ARR	=249;	//����ÿ4ms�ж�һ��
	#else
    TIM4PSCR=0B00000110;
    TIM4ARR	=124;	//����ÿ1ms�ж�һ��
	#endif
	
    INTCON |= 0B11000000;    //�����жϺ������ж�
  }
  
void main(void)
{  
	SysInit();
   uint16_t  data[3];
    UART_INITIAL();
    DelayMs(100);
   //while(1)
//		{ 
//            URDATAL =0X55;
//             DelayMs(500);
//         // data[0]=0X55;
////          uart_data_send(data);
//        }
    Time4Initial();
    TouchInital();
   
  #ifdef __TEST_LONG_TK_PUSH__  
    varKeyPushCnt = 0;
    macroTUBEshut();
  #endif
    
		while(1)
		{ 
         //data[0]=key_status;
//uart_data_send(data);
//URDATAL = data[0];
			#ifndef __TEST_LONG_TK_PUSH__
        if(TouchTimeCount>=(1000/SCANNINGTIME/(fmd_channels+1)))  	//�������tool�����������ú�����ĳ���:����ɨ��Ƶ��
        {
      #else
      	if(bitNeedKeyScan)  
        {		//ÿ4msɨ��һ��TK
						bitNeedKeyScan = 0;
      #endif  
            TouchTimeCount = 0;
            readKeyNum = 0;
						readKeyNum = TouchKeyScan(); 
					#ifdef __TEST_LONG_TK_PUSH__	 
						varAllKeyFlag = (unsigned char)readKeyNum;
						macroCOMon();
						if(bitKEY1flag)
						{		//KEY1����,LED1��
								macroLED1on();
								++varKeyPushCnt;
								if(varKeyPushCnt >= CST_KEY_PUSH_2S5)
								{		//KEY1�̰��жϳɹ�,LED2Ҳ��
										macroLED3on();
										varKeyPushCnt = CST_KEY_PUSH_2S5;
                                         key_status=1;
                                      // data[0]=key_status;
//                                   URDATAL = data[0];
        								}
								else if(varKeyPushCnt >= CST_KEY_PUSH_60MS)
								{
										macroLED2on();
										macroLED3off();
                                      key_status=0;
                                      //data[0]=key_status;
//                                      URDATAL = data[0];
								}		  
								else
								{
										macroLED2off();
										macroLED3off();
								}
                                data[0]=key_status;
                                flag=1;
                                uart_data_send(data);
								bitKEY1flag = 0;
						}
						else
						{
                                 //  flag=1;
//                               data[0]=key_status;
//                              uart_data_send(data);
                              key_status=0;
								macroLEDshut();	
								varKeyPushCnt = 0;
						}
					#endif	
        }
		}
}


