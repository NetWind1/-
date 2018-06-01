#include<pic.h>
#define uchar unsigned char
#define uint  unsigned int
extern void Timer_init();										//定时器初始化
extern void AD_INIT();			    							//AD初始化
extern uint get_adc(uchar CH);									//AD转换
extern void w_eeprom(uchar ee_addr,uchar ee_data);				//EEPROM写一个字节往某一个地址
extern uchar r_eeprom(uchar ee_addr);							//EEPROM 从某一地址读取一个字节
extern void EEPROM_INIT();										//EEPROM初始化
extern void Output(uchar i_data);								//74HC164数据输出函数
/*数码管位未定义*/
#define  WEI1 RB4						//74HC164数据管脚
#define  WEI2 RC2						//74HC164数据管脚
#define  WEI3 RC1						//74HC164数据管脚
#define  WEI4 RC0						//74HC164数据管脚
/*******************按键处理变量定义************************/
#define KEY_PROT  PORTC
uchar   KEY_Short;
uchar   KEY_Long;
uchar   key_time;
uchar 	key_num2;
uchar	old_key;

/*******************显示相关变量******************************/

volatile uchar  Buff[5];				//数码显示缓冲区
uchar  dight[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};//数码管编码 0-9  -  P  L
uchar SCAN_NUM;
/***************AD变量***************/
uint AD_data;
/****************显示闪烁控制变量****************/
volatile union
    {
    struct
        {
            volatile unsigned    T0:1;                       
            volatile unsigned    T1:1;                        
            volatile unsigned    T2:1;
            volatile unsigned    T3:1;
            volatile unsigned    T4:1;
            volatile unsigned    T5:1;
            volatile unsigned    T6:1;
            volatile unsigned    T7:1;         
        }oneBit;
        volatile unsigned char allBits;
     }FLAG_ON;                 
#define  KEY_MODE         		FLAG_ON.oneBit.T0					//模式按键有效标志
#define  KEY_STOP_ON     		FLAG_ON.oneBit.T1					//启停按键有效标志
#define  KEY_UP       			FLAG_ON.oneBit.T2					//上调按键有效标志
#define  KEY_DOWN     			FLAG_ON.oneBit.T3					//下调按键有效标志
#define  KEY_MAX_HZ   			FLAG_ON.oneBit.T4					//长按双按键调节最大频率有效标志
#define  Blower_Flashing_ON_OFF FLAG_ON.oneBit.T5					//
#define  BL_Timing_ON_OFF       FLAG_ON.oneBit.T6					//
#define  flag_feng         	 	FLAG_ON.oneBit.T7					//

/*****************************************************
函数功能：延时1ms
(3j+2)*i=(3×33+2)×10=1010(微秒)，可以认为是1毫秒
***************************************************/
void delay1ms()
{
   uchar i,j;	
	 for(i=0;i<10;i++)
	  for(j=0;j<33;j++)
	   ;		 
}
/*****************************************************
函数功能：延时若干毫秒
入口参数：n
***************************************************/
void delaynms(uchar n)
{
   uchar i;
	for(i=0;i<n;i++)
	   delay1ms();
}
