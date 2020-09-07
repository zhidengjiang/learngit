
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
}unionByteAndBit;										//定义各种位变量跟字节变量相关联的联合体

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
volatile uint16_t 	readKeyNum;    		//返回的键值  bit0~bit14对应key1~key15  0没有按下，1按下
volatile  unchar    toSend[11]={0x11,0x22,0x33,0x44,0x55,0x66,0x77,0x88,0x99,0xaa};
uint16_t  lastkey=0;
uint16_t  TouchTimeCount;
extern uint8_t    fmd_channels;  			//按键总数
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
		{		//TIM4每4ms中断一次
				T4UIF = 1;  
			#ifdef __TEST_LONG_TK_PUSH__	                          
      	RA3 = ~RA3;
      	varAllTimeFlag = 0xFF;
    	#endif  
				TouchTimeCount++;
		} 
     //  	//中断处理**********************
//	if(URRXNE && RXNEF)       //接收中断         	
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
//    if(TCEN && TCF)          //发送中断
//    {	
//        TCF=1;       //写1清0
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
													//Bit0=1,系统时钟为内部振荡器
													//Bit0=0,时钟源由FOSC<2：0>决定即编译选项时选择							
	
	//PORTA = 0B00000000;		
//	TRISA = 0B10111111;		//PA输入输出 0-输出 1-输入
//	WPUA = 0B00000000;     	//PA端口上拉控制 1-开上拉 0-关上拉
//    WPDA = 0B00000000;     	//PA端口上拉控制 1-开下拉 0-关下拉
//  
//PSRC0  = 0B11111111;  	//PORTA,PORTB源电流设置最大
//    //BIT7~BIT6:PORTB[7:4]源电流能力控制,BIT5~BIT4:PORTB[3:0]源电流能力控制 
//    //BIT3~BIT2:PORTA[7:4]源电流能力控制,BIT1~BIT0:PORTA[3:0]源电流能力控制
//    
//    PSRC1  = 0B11111111;    //PORTC,PORTD源电流设置最大    
//    //BIT7~BIT6:PORTD[7:4]源电流能力控制,BIT5~BIT4:PORTD[3:0]源电流能力控制 
//    //BIT3~BIT2:PORTC[7:4]源电流能力控制,BIT1~BIT0:PORTC[3:0]源电流能力控制
//    
//    PSINK0 = 0B11111111;  	//PORTA灌电流设置最大 0:最小，1:最大
//    PSINK1 = 0B11111111; 	//PORTB灌电流设置最大 0:最小，1:最大
//    PSINK2 = 0B11111111;	//PORTC灌电流设置最大 0:最小，1:最大
//    PSINK3 = 0B11111111;	//PORTD灌电流设置最大 0:最小，1:最大
//	
//    ANSELA = 0B00000000;    //全为数字管?
//PCKEN |=0B00100000;	//打开UART时钟
//    
//    URIER =0B00100001;  //使能发送接收完成中断
//    URLCR =0B00000001;  //8位数据，停止位1，无奇偶校验
//    URMCR =0B00011000;
//    
//    URDLL =104;         //9600波特率 = Fosc/16*[URDLH:URDLL]
//    URDLH =0;
//    TCF=1;
//	INTCON=0B11000000;
	   PORTA = 0x00;
		PORTB = 0x00;
		PORTC = 0x00;
		PORTD = 0x00;
		
	    TRISA = 0B11110100;	//PA输入输出 0-输出 1-输入 改
		TRISB = 0x10000000;  //改
        
    // TRISA = 0B10111111;		//PA输入输出 0-输出 1-输入 例程
//  TRISB = 0B11110111;		//PB输入输出 0-输出 1-输入	例程
		TRISC = 0B00000011;	
		TRISD = 0B00100000;	
    
		PSRC0 = 0B11111111;  	 //PORTA,PORTB源电流设置最大
    
    PSRC1 = 0B11111111;    //PORTC,PORTD源电流设置最大
    
    PSINK0= 0B11111111;
    PSINK1= 0B11111111;
    PSINK2= 0B11111111;
    PSINK3= 0B11111111;		//PORTD灌电流设置最大 0:最小，1:最大
    											
	  WPUA = 0x00;
	  WPUB = 0x00;
	  WPUC = 0x00;
	  WPUD = 0x00;
	  WPDA = 0x00;
	  WPDB = 0x00;
	  WPDC = 0x00;
	  WPDD = 0x00;
        
	  ANSELA = 0B00000000;    //全为数字管脚
          
	  INTCON = 0;  					//暂禁止所有中断
}
/*-------------------------------------------------
 *	函数名称：Time4Initial
 *	功能：  
 *	输入参数：
 *	返回参数：无 
 -------------------------------------------------*/
void Time4Initial(void)
{
		PCKEN |=0B00001000;      //TIME4模块时钟使能
    //CKOCON=0B00110000;
    //TCKSRC=0B00000011;		
    
    TIM4CR1	=0B00000101;
    //BIT7: 0：TIM1_ARR寄存器没有缓冲，它可以被直接写入; 1：TIM1_ARR寄存器由预装载缓冲器缓冲。
    //BIT6:保留
    //BIT5~BIT4:timer4时钟选择位。
        //00：系统时钟/主时钟
				//01：内部快时钟HIRC
				//10：LP时钟，只有当FOSC选择LP模式时才有意义
				//11：XT时钟，只有当FOSC选择XT模式时才有意义

    //BIT3:
    //			0：在发生更新事件时，计数器不停止；
		//			1：在发生下一次更新事件(清除CEN位)时，计数器停止。

    //BIT2:
   	// 		0：如果UDIS允许产生更新事件，则下述任一事件产生一个更新中断：
				//寄存器被更新(计数器上溢/下溢)
				//软件设置UG位
				//时钟/触发控制器产生的更新
		//		1：如果UDIS允许产生更新事件，则只有当下列事件发生时才产生更新中断，并UIF置1：
				//寄存器被更新(计数器上溢/下溢)

    //BIT1:
    //		0：一旦下列事件发生，产生更新(UEV)事件：
				//计数器溢出/下溢
				//产生软件更新事件
				//时钟/触发模式控制器产生的硬件复位被缓存的寄存器被装入它们的预装载值。
		//		1：不产生更新事件，影子寄存器(ARR、PSC、CCRx)保持它们的值。如果设置了UG位或时钟/触发控制器发出了一个硬件复位，则计数器和预分频器被重新初始化。

    // BIT0: 0：禁止计数器；1：使能计数器。

    TIM4IER	=0B00000001;
    //BIT0:  0：禁止更新中断；1：允许更新中断。

    TIM4SR	=0B00000000;
    //BIT0:当产生更新事件时该位由硬件置1。它由软件写1清0
			//0：无更新事件产生；
			//1：更新事件等待响应。当寄存器被更新时该位由硬件置1：
			//若TIM4_CR1寄存器的UDIS=0，当计数器上溢或下溢时；
			//若TIM4_CR1寄存器的UDIS=0、URS=0，当设置TIM4_EGR寄存器的UG位软件对计数器
			//CNT重新初始化时；
			//若TIM4_CR1寄存器的UDIS=0、URS=0，当计数器CNT被触发事件重新初始化时。

    TIM4EGR	=0B00000000;
    //BIT0:该位由软件置1，由硬件自动清0。
	//0：无动作；
	//1：重新初始化计数器，并产生一个更新事件。注意预分频器的计数器也被清0(但是预分频系数不变)。若在中心对称模式下或DIR=0(向上计数)则计数器被清0；若DIR=1(向下计数)则计数器取TIM1_ARR的值。

    TIM4CNTR=0; //TIM4 8位计数器
    
	#ifdef __TEST_LONG_TK_PUSH__    
    TIM4PSCR=0B00000111;
    TIM4ARR	=249;	//定义每4ms中断一次
	#else
    TIM4PSCR=0B00000110;
    TIM4ARR	=124;	//定义每1ms中断一次
	#endif
	
    INTCON |= 0B11000000;    //开总中断和外设中断
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
        if(TouchTimeCount>=(1000/SCANNINGTIME/(fmd_channels+1)))  	//本语句是tool界面里面配置后产生的程序:按键扫描频率
        {
      #else
      	if(bitNeedKeyScan)  
        {		//每4ms扫描一次TK
						bitNeedKeyScan = 0;
      #endif  
            TouchTimeCount = 0;
            readKeyNum = 0;
						readKeyNum = TouchKeyScan(); 
					#ifdef __TEST_LONG_TK_PUSH__	 
						varAllKeyFlag = (unsigned char)readKeyNum;
						macroCOMon();
						if(bitKEY1flag)
						{		//KEY1按下,LED1亮
								macroLED1on();
								++varKeyPushCnt;
								if(varKeyPushCnt >= CST_KEY_PUSH_2S5)
								{		//KEY1短按判断成功,LED2也亮
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


