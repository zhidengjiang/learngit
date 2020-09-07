//********************************************************* 
/*  文件名: TEST_62F08x_UART.c
*	功能：  FT62F08x-UART功能演示
*   IC:    FT62F088 LQFP32
*   内部：  16M
*	empno: 500                                
*   说明：  串口上电发送10个字符，然后等待接收10个字节数据（通过串口助手发送接收）
*		   
*		   
* 
*
*   参考原理图 TEST_62F08x_sch.pdf
*/
//*********************************************************
#include "SYSCFG.h"
#include  "stdio.h"
//*********************************************************
//***********************宏定义*****************************
#define  unchar     unsigned char 
#define  unint      unsigned int
#define  unlong     unsigned long

#define  DemoPortOut	RB3   
#define  DemoPortIn		RC3

//volatile  unchar mydata; 			//全局查看变量定义
void UART_INITIAL(void)
{
	PCKEN |=0B00100000;	//打开UART时钟
   // TRISA2=1;//UART_RX
   // TRISB6=0;//UART_TX
    AFP2 |=0B00000011;

    URIER =0B00100001;  //使能发送接收完成中断
    URLCR =0B00000001;  //8位数据，停止位1，无奇偶校验
    URMCR =0B00011000;
    
    URDLL =104;         //9600波特率 = Fosc/16*[URDLH:URDLL]
    URDLH =0;
    TCF=1;
	INTCON=0B11000000;//开全局中断和外设中断0关1开
    UROD=1;//UART_TX管脚的开漏输出设置，高有效
    
    //TCF: 发送完成标志
    //TXEF:1发送寄存器为空
    //RXNEF:1按收寄存器非空
}
/*------------------------------------------------- 
 *	函数名称：DelayUs
 *	功能：   短延时函数 --16M-2T--大概快1%左右.
 *	输入参数：Time延时时间长度 延时时长Time Us
 *	返回参数：无 
 -------------------------------------------------*/
void DelayUs(unsigned char Time)
{
	unsigned char a;
	for(a=0;a<Time;a++)
	{
		NOP();
	}
}                  
/*-------------------------------------------------
 *	函数名称：DelayMs
 *	功能：   短延时函数
 *	输入参数：Time延时时间长度 延时时长Time ms
 *	返回参数：无 
 -------------------------------------------------*/
void DelayMs(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<5;b++)
		{
		 	DelayUs(197); //快1%
		}
	}
}
/*-------------------------------------------------
 *	函数名称：DelayS
 *	功能：   短延时函数
 *	输入参数：Time延时时间长度 延时时长Time S
 *	返回参数：无 
 -------------------------------------------------*/
void DelayS(unsigned char Time)
{
	unsigned char a,b;
	for(a=0;a<Time;a++)
	{
		for(b=0;b<10;b++)
		{
		 	DelayMs(100); 
		}
	}
}
volatile  unchar receivedata[] =0;
unchar    m=0;
volatile unchar    k;
void uasrt_recv_handle(void)
{ 
   receivedata[k++] =URDATAL; 
}
unchar    i=0;
void  uart_data_send(char * buff)//, unchar  len)
{
//    if(TCEN && TCF)          //发送
//    {	
//        TCF=1;       //写1清0
//        
//    	if(i<1)
//        {
            unchar    i=0;
            flag=1;
				if(flag==1)
					{
                        for(i = 0;i<1;i++)
                          {  
						    //URDATAL =buff[i];
					      URDATAL =buff[i];  
						   }
                             flag=0; 
                     }
                      flag=0; 
              //       flag=0; 
			//	URDATAL =buff[i++];
////}
//        else
//        {
//          i=0;
//        }
//		NOP();
//     }
}   
    

